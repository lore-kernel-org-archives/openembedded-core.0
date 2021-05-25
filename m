Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web08.6655.1621929338391669789
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 00:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bAIJuYU2;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id u188so15601195vsu.8
        for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 00:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kO687HbpVKzr4pmGpeCaAnkh+TLnM77QSBVN1VUYmA8=;
        b=bAIJuYU2sjkSZMVe+lG/Mafl9D9wCDg73MVZrlCN8qv5Kia7aZyhnluH1H6ExetApo
         uv8l8gUD5SCKU0o9K6uHYVmSQkmsyImkFpcR1xPJIkXUmDH0qzvcQBVGNsGyE/hOBAEy
         BVPf7V3aAZZpYBLy20FMzoQiNatp3+v+O0+dMwu0AJWbaYWEW7m7CUUGFRsTCZmIAgCs
         L2jnDClDQdIEf5kigmzBoWLe/fLcNJgs+yTPR6ABOOZ8/Pu/3+g4I3ikTdFiPKWtGaJh
         i7PnZnag5j3bFvpRl0oKjX+xtCskbqjU2stnSU3bpMbvruOhRDVbLEcsE/AEfY+EofVB
         1E4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kO687HbpVKzr4pmGpeCaAnkh+TLnM77QSBVN1VUYmA8=;
        b=F+E73zyHgxyK82apsGooFiUS8hvWxcfdjyRXcLSwoskh9XDYH5FgoFQlPtAXlJsnzx
         J8ug7H8+F13q/2lowvl8v/qoh8OeyxQz0HsWtrX9e1az9vVfZcPQSznz3wFB32JYjeY1
         I9ZnEaGS2VLekYS3LfPqWt9jXqHxHfbMl2bNXgbljokCgW+nhmECJUKzEkSQTWTUKFtm
         jdcC4cMVVXERA/q04P+k0kXxltlaoODzeGGOim3sElQmZ69EKWfJUxHJL2+01ywaODpp
         W4/Bw2Obq1PenJOczxrP5Ffr8nvL3GqNtFoV+a/M8oTye4/i3XJ6cKMwI22vPO4/VSJw
         HoHw==
X-Gm-Message-State: AOAM533XOE96ytmlkeU2ZIS1AeqNHSk7nSMR3r2G8E1EgY2SZKOfpgPV
	lrSYdGWcJS4EsM/sKbuI3Z5Jw8avKJQ7Fvgm3Yz2Aada
X-Google-Smtp-Source: ABdhPJwMF/Ke5iIpUUiwy7QMv5DvORhqtFHfNBisAuPoJmVxVWAXVDe0yEhGhiBFMbL3TAPzbmn0TebyMuZniq7EqKg=
X-Received: by 2002:a67:d715:: with SMTP id p21mr24030407vsj.31.1621929336960;
 Tue, 25 May 2021 00:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210524091347.419253-1-alex.kanavin@gmail.com>
 <20210524091347.419253-2-alex.kanavin@gmail.com> <CAMKF1sq9mwdOOPFebQ1xXHXEJOLrx_-3jgHCb_6VhBd5yoZh8A@mail.gmail.com>
 <CAMKF1sp3yeZV3VW7i0MHhaj0e8LvMpXd4yb5SUKXRf-WArDkPA@mail.gmail.com>
In-Reply-To: <CAMKF1sp3yeZV3VW7i0MHhaj0e8LvMpXd4yb5SUKXRf-WArDkPA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 25 May 2021 09:55:24 +0200
Message-ID: <CANNYZj9V6e9+uqA=PPF06SKop4mp-UGfsoZ21mZF7spVsm21Aw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/21] systemd: update 247.6 -> 248.3
To: Khem Raj <raj.khem@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fafdc905c322d93e"

--000000000000fafdc905c322d93e
Content-Type: text/plain; charset="UTF-8"

I have to ask: should musl patches for systemd be maintained separately?
It's a big pile, they aren't accepted by upstream, they aren't tested on
the AB (hence I didn't even notice the breakage), and they cause rebase
problems at every version upgrade.

I would propose that a separate recipe is made that takes the sources from
a repo, rather than carry the patches in oe-core.

Alex

On Tue, 25 May 2021 at 03:41, Khem Raj <raj.khem@gmail.com> wrote:

> since master-next broke my CI, I have sent a fix on top of this.
> Please include that
>
> On Mon, May 24, 2021 at 5:18 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Fails to compile for musl
> >
> > https://errors.yoctoproject.org/Errors/Details/585507/
> >
> > src/basic/percent-util.c source file needs to include
> >
> > #include "missing_stdlib.h"
> >
> > like other files in
> 0005-src-basic-missing.h-check-for-missing-strndupa.patch
> >
> > On Mon, May 24, 2021 at 2:14 AM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > Drop backports:
> > > 48fff0a2af3f62acd446ebec8081b039b72caad8.patch
> > > 7c5fd25119a495009ea62f79e5daec34cc464628.patch
> > > 0001-analyze-resolve-executable-path-if-it-is-relative.patch
> > > 0001-analyze-resolve-executable-path-if-it-is-relative.patch
> > >
> > > Drop 0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch
> > > as difficult to rebase; please resend if you feel strongly that
> > > it is needed.
> > >
> > > Rebase the big pile of musl patches.
> > >
> > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > ---
> > >  ...f0a2af3f62acd446ebec8081b039b72caad8.patch | 179 --------------
> > >  ...d25119a495009ea62f79e5daec34cc464628.patch |  53 ----
> > >  ...md-boot_247.6.bb => systemd-boot_248.3.bb} |   0
> > >  meta/recipes-core/systemd/systemd.inc         |   6 +-
> > >  ...ve-executable-path-if-it-is-relative.patch |  39 ---
> > >  ...chvt-as-non-root-user-without-polkit.patch | 227 ------------------
> > >  ...002-don-t-use-glibc-specific-qsort_r.patch |  29 ++-
> > >  ...dd-__compare_fn_t-and-comparison_fn_.patch |  26 +-
> > >  ...k-parse_printf_format-implementation.patch |  46 ++--
> > >  ...missing.h-check-for-missing-strndupa.patch | 204 ++++++++++++----
> > >  .../0006-Include-netinet-if_ether.h.patch     |  56 +++--
> > >  ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |  17 +-
> > >  ...008-add-missing-FTW_-macros-for-musl.patch |   8 +-
> > >  ..._register_atfork-for-non-glibc-build.patch |  12 +-
> > >  ...10-Use-uintmax_t-for-handling-rlim_t.patch |  18 +-
> > >  ...sable-tests-for-missing-typedefs-in-.patch |   9 +-
> > >  ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  19 +-
> > >  ...patible-basename-for-non-glibc-syste.patch |  11 +-
> > >  ...uffering-when-writing-to-oom_score_a.patch |  12 +-
> > >  ...compliant-strerror_r-from-GNU-specif.patch |  46 ++--
> > >  ...S_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch |   8 +-
> > >  ...ype.h-add-__compar_d_fn_t-definition.patch |   8 +-
> > >  ...definition-of-prctl_mm_map-structure.patch |   8 +-
> > >  .../systemd/0019-Handle-missing-LOCK_EX.patch |  10 +-
> > >  ...ible-pointer-type-struct-sockaddr_un.patch |  12 +-
> > >  .../0021-test-json.c-define-M_PIl.patch       |   8 +-
> > >  ...-not-disable-buffer-in-writing-files.patch | 116 ++++-----
> > >  .../0025-Handle-__cpu_mask-usage.patch        |   8 +-
> > >  .../systemd/0026-Handle-missing-gshadow.patch |  20 +-
> > >  ...r-mount-error-with-invalid-options-o.patch |  97 --------
> > >  ...l.h-Define-MIPS-ABI-defines-for-musl.patch |  16 +-
> > >  .../{systemd_247.6.bb => systemd_248.3.bb}    |  11 +-
> > >  32 files changed, 388 insertions(+), 951 deletions(-)
> > >  delete mode 100644
> meta/recipes-core/systemd/files/48fff0a2af3f62acd446ebec8081b039b72caad8.patch
> > >  delete mode 100644
> meta/recipes-core/systemd/files/7c5fd25119a495009ea62f79e5daec34cc464628.patch
> > >  rename meta/recipes-core/systemd/{systemd-boot_247.6.bb =>
> systemd-boot_248.3.bb} (100%)
> > >  delete mode 100644
> meta/recipes-core/systemd/systemd/0001-analyze-resolve-executable-path-if-it-is-relative.patch
> > >  delete mode 100644
> meta/recipes-core/systemd/systemd/0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch
> > >  delete mode 100644
> meta/recipes-core/systemd/systemd/0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch
> > >  rename meta/recipes-core/systemd/{systemd_247.6.bb =>
> systemd_248.3.bb} (99%)
> > >
> > > diff --git
> a/meta/recipes-core/systemd/files/48fff0a2af3f62acd446ebec8081b039b72caad8.patch
> b/meta/recipes-core/systemd/files/48fff0a2af3f62acd446ebec8081b039b72caad8.patch
> > > deleted file mode 100644
> > > index e3ce296741..0000000000
> > > ---
> a/meta/recipes-core/systemd/files/48fff0a2af3f62acd446ebec8081b039b72caad8.patch
> > > +++ /dev/null
> > > @@ -1,179 +0,0 @@
> > > -From 48fff0a2af3f62acd446ebec8081b039b72caad8 Mon Sep 17 00:00:00 2001
> > > -From: Daan De Meyer <daan.j.demeyer@gmail.com>
> > > -Date: Fri, 12 Mar 2021 22:09:44 +0000
> > > -Subject: [PATCH] boot: Move console declarations to missing_efi.h
> > > -
> > > -These were added to eficonex.h in gnu-efi 3.0.13. Let's move them
> > > -to missing_efi.h behind an appropriate guard to fix the build with
> > > -recent versions of gnu-efi.
> > > -
> > > -(cherry picked from commit 95ba433a5f34baf92921fb58051bc8241f908c0e)
> > > -
> > > -Upstream-Status: Backport
> > > -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > ----
> > > - src/boot/efi/console.c     | 57 --------------------------------
> > > - src/boot/efi/console.h     |  6 +---
> > > - src/boot/efi/missing_efi.h | 67
> ++++++++++++++++++++++++++++++++++++++
> > > - 3 files changed, 68 insertions(+), 62 deletions(-)
> > > -
> > > -diff --git a/src/boot/efi/console.c b/src/boot/efi/console.c
> > > -index 2dd4543d51..1d6dfeeea2 100644
> > > ---- a/src/boot/efi/console.c
> > > -+++ b/src/boot/efi/console.c
> > > -@@ -9,63 +9,6 @@
> > > - #define SYSTEM_FONT_WIDTH 8
> > > - #define SYSTEM_FONT_HEIGHT 19
> > > -
> > > --#define EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL_GUID \
> > > --        { 0xdd9e7534, 0x7762, 0x4698, { 0x8c, 0x14, 0xf5, 0x85,
> 0x17, 0xa6, 0x25, 0xaa } }
> > > --
> > > --struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL;
> > > --
> > > --typedef EFI_STATUS (EFIAPI *EFI_INPUT_RESET_EX)(
> > > --        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
> > > --        BOOLEAN ExtendedVerification
> > > --);
> > > --
> > > --typedef UINT8 EFI_KEY_TOGGLE_STATE;
> > > --
> > > --typedef struct {
> > > --        UINT32 KeyShiftState;
> > > --        EFI_KEY_TOGGLE_STATE KeyToggleState;
> > > --} EFI_KEY_STATE;
> > > --
> > > --typedef struct {
> > > --        EFI_INPUT_KEY Key;
> > > --        EFI_KEY_STATE KeyState;
> > > --} EFI_KEY_DATA;
> > > --
> > > --typedef EFI_STATUS (EFIAPI *EFI_INPUT_READ_KEY_EX)(
> > > --        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
> > > --        EFI_KEY_DATA *KeyData
> > > --);
> > > --
> > > --typedef EFI_STATUS (EFIAPI *EFI_SET_STATE)(
> > > --        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
> > > --        EFI_KEY_TOGGLE_STATE *KeyToggleState
> > > --);
> > > --
> > > --typedef EFI_STATUS (EFIAPI *EFI_KEY_NOTIFY_FUNCTION)(
> > > --        EFI_KEY_DATA *KeyData
> > > --);
> > > --
> > > --typedef EFI_STATUS (EFIAPI *EFI_REGISTER_KEYSTROKE_NOTIFY)(
> > > --        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
> > > --        EFI_KEY_DATA KeyData,
> > > --        EFI_KEY_NOTIFY_FUNCTION KeyNotificationFunction,
> > > --        VOID **NotifyHandle
> > > --);
> > > --
> > > --typedef EFI_STATUS (EFIAPI *EFI_UNREGISTER_KEYSTROKE_NOTIFY)(
> > > --        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
> > > --        VOID *NotificationHandle
> > > --);
> > > --
> > > --typedef struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL {
> > > --        EFI_INPUT_RESET_EX Reset;
> > > --        EFI_INPUT_READ_KEY_EX ReadKeyStrokeEx;
> > > --        EFI_EVENT WaitForKeyEx;
> > > --        EFI_SET_STATE SetState;
> > > --        EFI_REGISTER_KEYSTROKE_NOTIFY RegisterKeyNotify;
> > > --        EFI_UNREGISTER_KEYSTROKE_NOTIFY UnregisterKeyNotify;
> > > --} EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL;
> > > --
> > > - EFI_STATUS console_key_read(UINT64 *key, BOOLEAN wait) {
> > > -         EFI_GUID EfiSimpleTextInputExProtocolGuid =
> EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL_GUID;
> > > -         static EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *TextInputEx;
> > > -diff --git a/src/boot/efi/console.h b/src/boot/efi/console.h
> > > -index 41df3a406e..2c69af552a 100644
> > > ---- a/src/boot/efi/console.h
> > > -+++ b/src/boot/efi/console.h
> > > -@@ -1,11 +1,7 @@
> > > - /* SPDX-License-Identifier: LGPL-2.1-or-later */
> > > - #pragma once
> > > -
> > > --#define EFI_SHIFT_STATE_VALID           0x80000000
> > > --#define EFI_RIGHT_CONTROL_PRESSED       0x00000004
> > > --#define EFI_LEFT_CONTROL_PRESSED        0x00000008
> > > --#define EFI_RIGHT_ALT_PRESSED           0x00000010
> > > --#define EFI_LEFT_ALT_PRESSED            0x00000020
> > > -+#include "missing_efi.h"
> > > -
> > > - #define EFI_CONTROL_PRESSED
>  (EFI_RIGHT_CONTROL_PRESSED|EFI_LEFT_CONTROL_PRESSED)
> > > - #define EFI_ALT_PRESSED
>  (EFI_RIGHT_ALT_PRESSED|EFI_LEFT_ALT_PRESSED)
> > > -diff --git a/src/boot/efi/missing_efi.h b/src/boot/efi/missing_efi.h
> > > -index 1b838af2a4..b6aae1eb5b 100644
> > > ---- a/src/boot/efi/missing_efi.h
> > > -+++ b/src/boot/efi/missing_efi.h
> > > -@@ -53,3 +53,70 @@ typedef struct _EFI_RNG_PROTOCOL {
> > > - } EFI_RNG_PROTOCOL;
> > > -
> > > - #endif
> > > -+
> > > -+#ifndef EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL_GUID
> > > -+
> > > -+#define EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL_GUID \
> > > -+        { 0xdd9e7534, 0x7762, 0x4698, { 0x8c, 0x14, 0xf5, 0x85,
> 0x17, 0xa6, 0x25, 0xaa } }
> > > -+
> > > -+#define EFI_SHIFT_STATE_VALID           0x80000000
> > > -+#define EFI_RIGHT_CONTROL_PRESSED       0x00000004
> > > -+#define EFI_LEFT_CONTROL_PRESSED        0x00000008
> > > -+#define EFI_RIGHT_ALT_PRESSED           0x00000010
> > > -+#define EFI_LEFT_ALT_PRESSED            0x00000020
> > > -+
> > > -+struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL;
> > > -+
> > > -+typedef EFI_STATUS (EFIAPI *EFI_INPUT_RESET_EX)(
> > > -+        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
> > > -+        BOOLEAN ExtendedVerification
> > > -+);
> > > -+
> > > -+typedef UINT8 EFI_KEY_TOGGLE_STATE;
> > > -+
> > > -+typedef struct {
> > > -+        UINT32 KeyShiftState;
> > > -+        EFI_KEY_TOGGLE_STATE KeyToggleState;
> > > -+} EFI_KEY_STATE;
> > > -+
> > > -+typedef struct {
> > > -+        EFI_INPUT_KEY Key;
> > > -+        EFI_KEY_STATE KeyState;
> > > -+} EFI_KEY_DATA;
> > > -+
> > > -+typedef EFI_STATUS (EFIAPI *EFI_INPUT_READ_KEY_EX)(
> > > -+        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
> > > -+        EFI_KEY_DATA *KeyData
> > > -+);
> > > -+
> > > -+typedef EFI_STATUS (EFIAPI *EFI_SET_STATE)(
> > > -+        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
> > > -+        EFI_KEY_TOGGLE_STATE *KeyToggleState
> > > -+);
> > > -+
> > > -+typedef EFI_STATUS (EFIAPI *EFI_KEY_NOTIFY_FUNCTION)(
> > > -+        EFI_KEY_DATA *KeyData
> > > -+);
> > > -+
> > > -+typedef EFI_STATUS (EFIAPI *EFI_REGISTER_KEYSTROKE_NOTIFY)(
> > > -+        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
> > > -+        EFI_KEY_DATA KeyData,
> > > -+        EFI_KEY_NOTIFY_FUNCTION KeyNotificationFunction,
> > > -+        VOID **NotifyHandle
> > > -+);
> > > -+
> > > -+typedef EFI_STATUS (EFIAPI *EFI_UNREGISTER_KEYSTROKE_NOTIFY)(
> > > -+        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
> > > -+        VOID *NotificationHandle
> > > -+);
> > > -+
> > > -+typedef struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL {
> > > -+        EFI_INPUT_RESET_EX Reset;
> > > -+        EFI_INPUT_READ_KEY_EX ReadKeyStrokeEx;
> > > -+        EFI_EVENT WaitForKeyEx;
> > > -+        EFI_SET_STATE SetState;
> > > -+        EFI_REGISTER_KEYSTROKE_NOTIFY RegisterKeyNotify;
> > > -+        EFI_UNREGISTER_KEYSTROKE_NOTIFY UnregisterKeyNotify;
> > > -+} EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL;
> > > -+
> > > -+#endif
> > > diff --git
> a/meta/recipes-core/systemd/files/7c5fd25119a495009ea62f79e5daec34cc464628.patch
> b/meta/recipes-core/systemd/files/7c5fd25119a495009ea62f79e5daec34cc464628.patch
> > > deleted file mode 100644
> > > index ae449791f1..0000000000
> > > ---
> a/meta/recipes-core/systemd/files/7c5fd25119a495009ea62f79e5daec34cc464628.patch
> > > +++ /dev/null
> > > @@ -1,53 +0,0 @@
> > > -From 7c5fd25119a495009ea62f79e5daec34cc464628 Mon Sep 17 00:00:00 2001
> > > -From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <
> zbyszek@in.waw.pl>
> > > -Date: Mon, 12 Apr 2021 14:03:32 +0200
> > > -Subject: [PATCH] meson: do not fail if rsync is not installed with
> meson
> > > - 0.57.2
> > > -
> > > -https://github.com/mesonbuild/meson/issues/8641
> > > -
> > > -Our CI started to fail. Even if the change is reverted in meson,
> > > -we need a quick workaround here.
> > > -
> > > -Upstream-Status: Backport
> > > -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > ----
> > > - man/meson.build | 25 ++++++++++++++-----------
> > > - 1 file changed, 14 insertions(+), 11 deletions(-)
> > > -
> > > -diff --git a/man/meson.build b/man/meson.build
> > > -index 3cae8446cda..f9c4b83dc81 100644
> > > ---- a/man/meson.build
> > > -+++ b/man/meson.build
> > > -@@ -184,17 +184,20 @@ html = custom_target(
> > > -         depends : html_pages,
> > > -         command : ['echo'])
> > > -
> > > --run_target(
> > > --        'doc-sync',
> > > --        depends : man_pages + html_pages,
> > > --        command : ['rsync', '-rlv',
> > > --                   '--delete-excluded',
> > > --                   '--include=man',
> > > --                   '--include=*.html',
> > > --                   '--exclude=*',
> > > --                   '--omit-dir-times',
> > > --                   meson.current_build_dir(),
> > > --                   get_option('www-target')])
> > > -+rsync = find_program('rsync', required : false)
> > > -+if rsync.found()
> > > -+        run_target(
> > > -+                'doc-sync',
> > > -+                depends : man_pages + html_pages,
> > > -+                command : [rsync, '-rlv',
> > > -+                           '--delete-excluded',
> > > -+                           '--include=man',
> > > -+                           '--include=*.html',
> > > -+                           '--exclude=*',
> > > -+                           '--omit-dir-times',
> > > -+                           meson.current_build_dir(),
> > > -+                           get_option('www-target')])
> > > -+endif
> > > -
> > > - ############################################################
> > > -
> > > diff --git a/meta/recipes-core/systemd/systemd-boot_247.6.bb
> b/meta/recipes-core/systemd/systemd-boot_248.3.bb
> > > similarity index 100%
> > > rename from meta/recipes-core/systemd/systemd-boot_247.6.bb
> > > rename to meta/recipes-core/systemd/systemd-boot_248.3.bb
> > > diff --git a/meta/recipes-core/systemd/systemd.inc
> b/meta/recipes-core/systemd/systemd.inc
> > > index 88dddb309c..0524a25008 100644
> > > --- a/meta/recipes-core/systemd/systemd.inc
> > > +++ b/meta/recipes-core/systemd/systemd.inc
> > > @@ -14,11 +14,9 @@ LICENSE = "GPLv2 & LGPLv2.1"
> > >  LIC_FILES_CHKSUM =
> "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
> > >
> file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
> > >
> > > -SRCREV = "17472dca0160cbe7b807ca648475fd70d0d62fe5"
> > > -SRCBRANCH = "v247-stable"
> > > +SRCREV = "37c4cfde0ce613f0f00544d3f4e2e72bf93d9c76"
> > > +SRCBRANCH = "v248-stable"
> > >  SRC_URI = "git://
> github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}
> <http://github.com/systemd/systemd-stable.git;protocol=git;branch=$%7BSRCBRANCH%7D>
> \
> > > -           file://7c5fd25119a495009ea62f79e5daec34cc464628.patch \
> > > -           file://48fff0a2af3f62acd446ebec8081b039b72caad8.patch \
> > >  "
> > >
> > >  S = "${WORKDIR}/git"
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0001-analyze-resolve-executable-path-if-it-is-relative.patch
> b/meta/recipes-core/systemd/systemd/0001-analyze-resolve-executable-path-if-it-is-relative.patch
> > > deleted file mode 100644
> > > index fd7f94a61d..0000000000
> > > ---
> a/meta/recipes-core/systemd/systemd/0001-analyze-resolve-executable-path-if-it-is-relative.patch
> > > +++ /dev/null
> > > @@ -1,39 +0,0 @@
> > > -From b9b7a8e3825f0433e120f7a6d7d5d635a839cab9 Mon Sep 17 00:00:00 2001
> > > -From: Mingli Yu <mingli.yu@windriver.com>
> > > -Date: Thu, 21 Jan 2021 06:19:44 +0000
> > > -Subject: [PATCH] analyze: resolve executable path if it is relative
> > > -
> > > -Upstream-Status: Backport [
> https://github.com/systemd/systemd/commit/f1fb046a985521f7d4a662f02546686ff20b7e5d
> ]
> > > -
> > > -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > > ----
> > > - src/analyze/analyze-verify.c | 7 +++++--
> > > - 1 file changed, 5 insertions(+), 2 deletions(-)
> > > -
> > > -diff --git a/src/analyze/analyze-verify.c
> b/src/analyze/analyze-verify.c
> > > -index a9c89173bf..969523df18 100644
> > > ---- a/src/analyze/analyze-verify.c
> > > -+++ b/src/analyze/analyze-verify.c
> > > -@@ -115,14 +115,17 @@ static int verify_socket(Unit *u) {
> > > - }
> > > -
> > > - int verify_executable(Unit *u, const ExecCommand *exec) {
> > > -+        int r;
> > > -+
> > > -         if (!exec)
> > > -                 return 0;
> > > -
> > > -         if (exec->flags & EXEC_COMMAND_IGNORE_FAILURE)
> > > -                 return 0;
> > > -
> > > --        if (access(exec->path, X_OK) < 0)
> > > --                return log_unit_error_errno(u, errno, "Command %s is
> not executable: %m", exec->path);
> > > -+        r = find_executable_full(exec->path, false, NULL);
> > > -+        if (r < 0)
> > > -+                return log_unit_error_errno(u, r, "Command %s is not
> executable: %m", exec->path);
> > > -
> > > -         return 0;
> > > - }
> > > ---
> > > -2.26.2
> > > -
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch
> b/meta/recipes-core/systemd/systemd/0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch
> > > deleted file mode 100644
> > > index 89ef39bc3e..0000000000
> > > ---
> a/meta/recipes-core/systemd/systemd/0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch
> > > +++ /dev/null
> > > @@ -1,227 +0,0 @@
> > > -From 150d9cade6d475570395cb418b824524dead9577 Mon Sep 17 00:00:00 2001
> > > -From: Joshua Watt <JPEWhacker@gmail.com>
> > > -Date: Fri, 30 Oct 2020 08:15:43 -0500
> > > -Subject: [PATCH] logind: Restore chvt as non-root user without polkit
> > > -
> > > -4acf0cfd2f ("logind: check PolicyKit before allowing VT switch") broke
> > > -the ability to write user sessions that run graphical sessions (e.g.
> > > -weston/X11). This was partially amended in 19bb87fbfa ("login: allow
> > > -non-console sessions to change vt") by changing the default PolicyKit
> > > -policy so that non-root users are again allowed to switch the VT. This
> > > -makes the policy when PolKit is not enabled (as on many embedded
> > > -systems) match the default PolKit policy and allows launching
> graphical
> > > -sessions as a non-root user.
> > > -
> > > -Closes #17473
> > > ----
> > > - src/login/logind-dbus.c         | 11 ++-------
> > > - src/login/logind-polkit.c       | 26 +++++++++++++++++++++
> > > - src/login/logind-polkit.h       | 10 ++++++++
> > > - src/login/logind-seat-dbus.c    | 41
> ++++-----------------------------
> > > - src/login/logind-session-dbus.c | 11 ++-------
> > > - src/login/meson.build           |  1 +
> > > - 6 files changed, 46 insertions(+), 54 deletions(-)
> > > - create mode 100644 src/login/logind-polkit.c
> > > - create mode 100644 src/login/logind-polkit.h
> > > -
> > > -diff --git a/src/login/logind-dbus.c b/src/login/logind-dbus.c
> > > -index 0f83ed99bc..a3765d88ba 100644
> > > ---- a/src/login/logind-dbus.c
> > > -+++ b/src/login/logind-dbus.c
> > > -@@ -30,6 +30,7 @@
> > > - #include "format-util.h"
> > > - #include "fs-util.h"
> > > - #include "logind-dbus.h"
> > > -+#include "logind-polkit.h"
> > > - #include "logind-seat-dbus.h"
> > > - #include "logind-session-dbus.h"
> > > - #include "logind-user-dbus.h"
> > > -@@ -1047,15 +1048,7 @@ static int
> method_activate_session_on_seat(sd_bus_message *message, void *userda
> > > -                 return sd_bus_error_setf(error,
> BUS_ERROR_SESSION_NOT_ON_SEAT,
> > > -                                          "Session %s not on seat
> %s", session_name, seat_name);
> > > -
> > > --        r = bus_verify_polkit_async(
> > > --                        message,
> > > --                        CAP_SYS_ADMIN,
> > > --                        "org.freedesktop.login1.chvt",
> > > --                        NULL,
> > > --                        false,
> > > --                        UID_INVALID,
> > > --                        &m->polkit_registry,
> > > --                        error);
> > > -+        r = check_polkit_chvt(message, m, error);
> > > -         if (r < 0)
> > > -                 return r;
> > > -         if (r == 0)
> > > -diff --git a/src/login/logind-polkit.c b/src/login/logind-polkit.c
> > > -new file mode 100644
> > > -index 0000000000..9072570cc6
> > > ---- /dev/null
> > > -+++ b/src/login/logind-polkit.c
> > > -@@ -0,0 +1,26 @@
> > > -+/* SPDX-License-Identifier: LGPL-2.1+ */
> > > -+
> > > -+#include "bus-polkit.h"
> > > -+#include "logind-polkit.h"
> > > -+#include "missing_capability.h"
> > > -+#include "user-util.h"
> > > -+
> > > -+int check_polkit_chvt(sd_bus_message *message, Manager *manager,
> sd_bus_error *error) {
> > > -+#if ENABLE_POLKIT
> > > -+        return bus_verify_polkit_async(
> > > -+                        message,
> > > -+                        CAP_SYS_ADMIN,
> > > -+                        "org.freedesktop.login1.chvt",
> > > -+                        NULL,
> > > -+                        false,
> > > -+                        UID_INVALID,
> > > -+                        &manager->polkit_registry,
> > > -+                        error);
> > > -+#else
> > > -+        /* Allow chvt when polkit is not present. This allows a
> service to start a graphical session as a
> > > -+         * non-root user when polkit is not compiled in, matching
> the default polkit policy */
> > > -+        return 1;
> > > -+#endif
> > > -+}
> > > -+
> > > -+
> > > -diff --git a/src/login/logind-polkit.h b/src/login/logind-polkit.h
> > > -new file mode 100644
> > > -index 0000000000..476c077a8a
> > > ---- /dev/null
> > > -+++ b/src/login/logind-polkit.h
> > > -@@ -0,0 +1,10 @@
> > > -+/* SPDX-License-Identifier: LGPL-2.1+ */
> > > -+#pragma once
> > > -+
> > > -+#include "sd-bus.h"
> > > -+
> > > -+#include "bus-object.h"
> > > -+#include "logind.h"
> > > -+
> > > -+int check_polkit_chvt(sd_bus_message *message, Manager *manager,
> sd_bus_error *error);
> > > -+
> > > -diff --git a/src/login/logind-seat-dbus.c
> b/src/login/logind-seat-dbus.c
> > > -index a945132284..f22e9e2734 100644
> > > ---- a/src/login/logind-seat-dbus.c
> > > -+++ b/src/login/logind-seat-dbus.c
> > > -@@ -9,6 +9,7 @@
> > > - #include "bus-polkit.h"
> > > - #include "bus-util.h"
> > > - #include "logind-dbus.h"
> > > -+#include "logind-polkit.h"
> > > - #include "logind-seat-dbus.h"
> > > - #include "logind-seat.h"
> > > - #include "logind-session-dbus.h"
> > > -@@ -179,15 +180,7 @@ static int
> method_activate_session(sd_bus_message *message, void *userdata, sd_b
> > > -         if (session->seat != s)
> > > -                 return sd_bus_error_setf(error,
> BUS_ERROR_SESSION_NOT_ON_SEAT, "Session %s not on seat %s", name, s->id);
> > > -
> > > --        r = bus_verify_polkit_async(
> > > --                        message,
> > > --                        CAP_SYS_ADMIN,
> > > --                        "org.freedesktop.login1.chvt",
> > > --                        NULL,
> > > --                        false,
> > > --                        UID_INVALID,
> > > --                        &s->manager->polkit_registry,
> > > --                        error);
> > > -+        r = check_polkit_chvt(message, s->manager, error);
> > > -         if (r < 0)
> > > -                 return r;
> > > -         if (r == 0)
> > > -@@ -215,15 +208,7 @@ static int method_switch_to(sd_bus_message
> *message, void *userdata, sd_bus_erro
> > > -         if (to <= 0)
> > > -                 return sd_bus_error_setf(error,
> SD_BUS_ERROR_INVALID_ARGS, "Invalid virtual terminal");
> > > -
> > > --        r = bus_verify_polkit_async(
> > > --                        message,
> > > --                        CAP_SYS_ADMIN,
> > > --                        "org.freedesktop.login1.chvt",
> > > --                        NULL,
> > > --                        false,
> > > --                        UID_INVALID,
> > > --                        &s->manager->polkit_registry,
> > > --                        error);
> > > -+        r = check_polkit_chvt(message, s->manager, error);
> > > -         if (r < 0)
> > > -                 return r;
> > > -         if (r == 0)
> > > -@@ -243,15 +228,7 @@ static int method_switch_to_next(sd_bus_message
> *message, void *userdata, sd_bus
> > > -         assert(message);
> > > -         assert(s);
> > > -
> > > --        r = bus_verify_polkit_async(
> > > --                        message,
> > > --                        CAP_SYS_ADMIN,
> > > --                        "org.freedesktop.login1.chvt",
> > > --                        NULL,
> > > --                        false,
> > > --                        UID_INVALID,
> > > --                        &s->manager->polkit_registry,
> > > --                        error);
> > > -+        r = check_polkit_chvt(message, s->manager, error);
> > > -         if (r < 0)
> > > -                 return r;
> > > -         if (r == 0)
> > > -@@ -271,15 +248,7 @@ static int
> method_switch_to_previous(sd_bus_message *message, void *userdata, sd
> > > -         assert(message);
> > > -         assert(s);
> > > -
> > > --        r = bus_verify_polkit_async(
> > > --                        message,
> > > --                        CAP_SYS_ADMIN,
> > > --                        "org.freedesktop.login1.chvt",
> > > --                        NULL,
> > > --                        false,
> > > --                        UID_INVALID,
> > > --                        &s->manager->polkit_registry,
> > > --                        error);
> > > -+        r = check_polkit_chvt(message, s->manager, error);
> > > -         if (r < 0)
> > > -                 return r;
> > > -         if (r == 0)
> > > -diff --git a/src/login/logind-session-dbus.c
> b/src/login/logind-session-dbus.c
> > > -index ccc5ac8df2..57c8a4e900 100644
> > > ---- a/src/login/logind-session-dbus.c
> > > -+++ b/src/login/logind-session-dbus.c
> > > -@@ -11,6 +11,7 @@
> > > - #include "fd-util.h"
> > > - #include "logind-brightness.h"
> > > - #include "logind-dbus.h"
> > > -+#include "logind-polkit.h"
> > > - #include "logind-seat-dbus.h"
> > > - #include "logind-session-dbus.h"
> > > - #include "logind-session-device.h"
> > > -@@ -192,15 +193,7 @@ int bus_session_method_activate(sd_bus_message
> *message, void *userdata, sd_bus_
> > > -         assert(message);
> > > -         assert(s);
> > > -
> > > --        r = bus_verify_polkit_async(
> > > --                        message,
> > > --                        CAP_SYS_ADMIN,
> > > --                        "org.freedesktop.login1.chvt",
> > > --                        NULL,
> > > --                        false,
> > > --                        UID_INVALID,
> > > --                        &s->manager->polkit_registry,
> > > --                        error);
> > > -+        r = check_polkit_chvt(message, s->manager, error);
> > > -         if (r < 0)
> > > -                 return r;
> > > -         if (r == 0)
> > > -diff --git a/src/login/meson.build b/src/login/meson.build
> > > -index 0a7d3d5440..7e46be2add 100644
> > > ---- a/src/login/meson.build
> > > -+++ b/src/login/meson.build
> > > -@@ -26,6 +26,7 @@ liblogind_core_sources = files('''
> > > -         logind-device.h
> > > -         logind-inhibit.c
> > > -         logind-inhibit.h
> > > -+        logind-polkit.c
> > > -         logind-seat-dbus.c
> > > -         logind-seat-dbus.h
> > > -         logind-seat.c
> > > ---
> > > -2.28.0
> > > -
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
> b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
> > > index d856bcb583..4cdf66e767 100644
> > > ---
> a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
> > > +++
> b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
> > > @@ -1,7 +1,7 @@
> > > -From 66ece0b870b3a34fdabc48b88437e6cc354e9fce Mon Sep 17 00:00:00 2001
> > > +From 159c53612444ec1df492bae528a5a88a275b93bf Mon Sep 17 00:00:00 2001
> > >  From: Chen Qi <Qi.Chen@windriver.com>
> > >  Date: Mon, 25 Feb 2019 13:41:41 +0800
> > > -Subject: [PATCH 02/26] don't use glibc-specific qsort_r
> > > +Subject: [PATCH] don't use glibc-specific qsort_r
> > >
> > >  Upstream-Status: Inappropriate [musl specific]
> > >
> > > @@ -12,6 +12,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > >  Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > >  [Rebased for v247]
> > >  Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > +
> > >  ---
> > >   src/basic/sort-util.h              | 14 ------------
> > >   src/libsystemd/sd-hwdb/hwdb-util.c | 19 +++++++++++-----
> > > @@ -19,14 +20,13 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >   3 files changed, 38 insertions(+), 31 deletions(-)
> > >
> > >  diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
> > > -index 1d194a1f04..3394c9eb72 100644
> > > +index 49586a4a24..d92a5ab0ed 100644
> > >  --- a/src/basic/sort-util.h
> > >  +++ b/src/basic/sort-util.h
> > > -@@ -54,17 +54,3 @@ static inline void _qsort_safe(void *base, size_t
> nmemb, size_t size, __compar_f
> > > -                 int (*_func_)(const typeof(p[0])*, const
> typeof(p[0])*) = func; \
> > > +@@ -55,18 +55,4 @@ static inline void _qsort_safe(void *base, size_t
> nmemb, size_t size, __compar_f
> > >                   _qsort_safe((p), (n), sizeof((p)[0]),
> (__compar_fn_t) _func_); \
> > >           })
> > > --
> > > +
> > >  -static inline void qsort_r_safe(void *base, size_t nmemb, size_t
> size, __compar_d_fn_t compar, void *userdata) {
> > >  -        if (nmemb <= 1)
> > >  -                return;
> > > @@ -40,11 +40,13 @@ index 1d194a1f04..3394c9eb72 100644
> > >  -                int (*_func_)(const typeof(p[0])*, const
> typeof(p[0])*, typeof(userdata)) = func; \
> > >  -                qsort_r_safe((p), (n), sizeof((p)[0]),
> (__compar_d_fn_t) _func_, userdata); \
> > >  -        })
> > > +-
> > > + int cmp_int(const int *a, const int *b);
> > >  diff --git a/src/libsystemd/sd-hwdb/hwdb-util.c
> b/src/libsystemd/sd-hwdb/hwdb-util.c
> > > -index 4c94ba9c88..95495dba6d 100644
> > > +index fd45ff0f54..ac4b63c49b 100644
> > >  --- a/src/libsystemd/sd-hwdb/hwdb-util.c
> > >  +++ b/src/libsystemd/sd-hwdb/hwdb-util.c
> > > -@@ -126,9 +126,13 @@ static void trie_free(struct trie *trie) {
> > > +@@ -126,9 +126,13 @@ static struct trie* trie_free(struct trie *trie)
> {
> > >
> > >   DEFINE_TRIVIAL_CLEANUP_FUNC(struct trie*, trie_free);
> > >
> > > @@ -85,10 +87,10 @@ index 4c94ba9c88..95495dba6d 100644
> > >   }
> > >
> > >  diff --git a/src/shared/format-table.c b/src/shared/format-table.c
> > > -index a13a198b7a..bce10bc607 100644
> > > +index dccb796b26..c3ab8ac296 100644
> > >  --- a/src/shared/format-table.c
> > >  +++ b/src/shared/format-table.c
> > > -@@ -1243,30 +1243,32 @@ static int cell_data_compare(TableData *a,
> size_t index_a, TableData *b, size_t
> > > +@@ -1290,30 +1290,32 @@ static int cell_data_compare(TableData *a,
> size_t index_a, TableData *b, size_t
> > >           return CMP(index_a, index_b);
> > >   }
> > >
> > > @@ -131,7 +133,7 @@ index a13a198b7a..bce10bc607 100644
> > >           }
> > >
> > >           /* Order identical lines by the order there were originally
> added in */
> > > -@@ -1844,7 +1846,12 @@ int table_print(Table *t, FILE *f) {
> > > +@@ -1952,7 +1954,12 @@ int table_print(Table *t, FILE *f) {
> > >                   for (size_t i = 0; i < n_rows; i++)
> > >                           sorted[i] = i * t->n_columns;
> > >
> > > @@ -145,7 +147,7 @@ index a13a198b7a..bce10bc607 100644
> > >           }
> > >
> > >           if (t->display_map)
> > > -@@ -2440,7 +2447,12 @@ int table_to_json(Table *t, JsonVariant **ret)
> {
> > > +@@ -2580,7 +2587,12 @@ int table_to_json(Table *t, JsonVariant **ret)
> {
> > >                   for (size_t i = 0; i < n_rows; i++)
> > >                           sorted[i] = i * t->n_columns;
> > >
> > > @@ -159,6 +161,3 @@ index a13a198b7a..bce10bc607 100644
> > >           }
> > >
> > >           if (t->display_map)
> > > ---
> > > -2.27.0
> > > -
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
> b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
> > > index f43a22aa8b..9b1768d9ca 100644
> > > ---
> a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
> > > +++
> b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
> > > @@ -1,7 +1,7 @@
> > > -From 9f0d5996bbb2db3679a4075fa8301750b786c03b Mon Sep 17 00:00:00 2001
> > > +From 4afb8adc83348bf75964fc10af7902e04dd62637 Mon Sep 17 00:00:00 2001
> > >  From: Chen Qi <Qi.Chen@windriver.com>
> > >  Date: Mon, 25 Feb 2019 13:55:12 +0800
> > > -Subject: [PATCH 03/26] missing_type.h: add __compare_fn_t and
> comparison_fn_t
> > > +Subject: [PATCH] missing_type.h: add __compare_fn_t and
> comparison_fn_t
> > >
> > >  Make it work with musl where comparison_fn_t and __compare_fn_t
> > >  is not provided.
> > > @@ -13,11 +13,12 @@ Signed-off-by: Alex Kiernan <
> alex.kiernan@gmail.com>
> > >  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > >  [Rebased for v242]
> > >  Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > > +
> > >  ---
> > > - src/basic/missing_type.h | 9 +++++++++
> > > - src/basic/sort-util.h    | 1 +
> > > - src/core/kmod-setup.c    | 1 +
> > > - src/journal/catalog.c    | 1 +
> > > + src/basic/missing_type.h            | 9 +++++++++
> > > + src/basic/sort-util.h               | 1 +
> > > + src/core/kmod-setup.c               | 1 +
> > > + src/libsystemd/sd-journal/catalog.c | 1 +
> > >   4 files changed, 12 insertions(+)
> > >
> > >  diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
> > > @@ -38,7 +39,7 @@ index f6233090a9..aeaf6ad5ec 100644
> > >  +typedef int (*__compar_fn_t)(const void *, const void *);
> > >  +#endif
> > >  diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
> > > -index 3394c9eb72..d9cb2aecb6 100644
> > > +index d92a5ab0ed..a63867c716 100644
> > >  --- a/src/basic/sort-util.h
> > >  +++ b/src/basic/sort-util.h
> > >  @@ -4,6 +4,7 @@
> > > @@ -61,10 +62,10 @@ index 8a7f82812a..a56f12f47f 100644
> > >
> > >   #if HAVE_KMOD
> > >   #include "module-util.h"
> > > -diff --git a/src/journal/catalog.c b/src/journal/catalog.c
> > > -index 0f6ad8a29e..4e1077ade4 100644
> > > ---- a/src/journal/catalog.c
> > > -+++ b/src/journal/catalog.c
> > > +diff --git a/src/libsystemd/sd-journal/catalog.c
> b/src/libsystemd/sd-journal/catalog.c
> > > +index aea3241d18..75e6c56a28 100644
> > > +--- a/src/libsystemd/sd-journal/catalog.c
> > > ++++ b/src/libsystemd/sd-journal/catalog.c
> > >  @@ -28,6 +28,7 @@
> > >   #include "string-util.h"
> > >   #include "strv.h"
> > > @@ -73,6 +74,3 @@ index 0f6ad8a29e..4e1077ade4 100644
> > >
> > >   const char * const catalog_file_dirs[] = {
> > >           "/usr/local/lib/systemd/catalog/",
> > > ---
> > > -2.27.0
> > > -
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
> b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
> > > index bdd64a0252..dc40a2fe8d 100644
> > > ---
> a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
> > > +++
> b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
> > > @@ -1,7 +1,7 @@
> > > -From f3dbe29f7620a063af4d8eb3ea7c48ecd410200d Mon Sep 17 00:00:00 2001
> > > -From: Chen Qi <Qi.Chen@windriver.com>
> > > -Date: Mon, 25 Feb 2019 14:04:21 +0800
> > > -Subject: [PATCH 04/26] add fallback parse_printf_format implementation
> > > +From 6c18e5f9373da3e3b38f2c5727e2aefe07fcbbd9 Mon Sep 17 00:00:00 2001
> > > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > +Date: Sat, 22 May 2021 20:26:24 +0200
> > > +Subject: [PATCH] [PATCH] add fallback parse_printf_format
> implementation
> > >
> > >  Upstream-Status: Inappropriate [musl specific]
> > >
> > > @@ -11,21 +11,21 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > >  [rebased for systemd 243]
> > >  Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> > >  ---
> > > - meson.build                     |   1 +
> > > - src/basic/meson.build           |   5 +
> > > - src/basic/parse-printf-format.c | 273
> ++++++++++++++++++++++++++++++++
> > > - src/basic/parse-printf-format.h |  57 +++++++
> > > - src/basic/stdio-util.h          |   2 +-
> > > - src/journal/journal-send.c      |   2 +-
> > > + meson.build                              |   1 +
> > > + src/basic/meson.build                    |   5 +
> > > + src/basic/parse-printf-format.c          | 273
> +++++++++++++++++++++++
> > > + src/basic/parse-printf-format.h          |  57 +++++
> > > + src/basic/stdio-util.h                   |   2 +-
> > > + src/libsystemd/sd-journal/journal-send.c |   2 +-
> > >   6 files changed, 338 insertions(+), 2 deletions(-)
> > >   create mode 100644 src/basic/parse-printf-format.c
> > >   create mode 100644 src/basic/parse-printf-format.h
> > >
> > >  diff --git a/meson.build b/meson.build
> > > -index f406d595e6..6aa47fc755 100644
> > > +index 27186d63a3..2abb7b3188 100644
> > >  --- a/meson.build
> > >  +++ b/meson.build
> > > -@@ -646,6 +646,7 @@ endif
> > > +@@ -675,6 +675,7 @@ endif
> > >   foreach header : ['crypt.h',
> > >                     'linux/memfd.h',
> > >                     'linux/vm_sockets.h',
> > > @@ -34,21 +34,21 @@ index f406d595e6..6aa47fc755 100644
> > >                     'valgrind/memcheck.h',
> > >                     'valgrind/valgrind.h',
> > >  diff --git a/src/basic/meson.build b/src/basic/meson.build
> > > -index 1183ea83ad..aa5c958850 100644
> > > +index 60ef801a25..aba2172edd 100644
> > >  --- a/src/basic/meson.build
> > >  +++ b/src/basic/meson.build
> > > -@@ -322,6 +322,11 @@ foreach item : [['af',     af_list_txt,
>  'af',         ''],
> > > - endforeach
> > > +@@ -341,6 +341,11 @@ endforeach
> > >
> > >   basic_sources += generated_gperf_headers
> > > -+
> > > +
> > >  +if conf.get('HAVE_PRINTF_H') != 1
> > >  +        basic_sources += [files('parse-printf-format.c')]
> > >  +endif
> > >  +
> > > - basic_gcrypt_sources = files(
> > > -         'gcrypt-util.c',
> > > -         'gcrypt-util.h')
> > > ++
> > > + ############################################################
> > > +
> > > + arch_list = [
> > >  diff --git a/src/basic/parse-printf-format.c
> b/src/basic/parse-printf-format.c
> > >  new file mode 100644
> > >  index 0000000000..49437e5445
> > > @@ -410,10 +410,10 @@ index 6dc1e72312..cea76b36cf 100644
> > >
> > >   #define snprintf_ok(buf, len, fmt, ...) \
> > >           ((size_t) snprintf(buf, len, fmt, __VA_ARGS__) < (len))
> > > -diff --git a/src/journal/journal-send.c b/src/journal/journal-send.c
> > > +diff --git a/src/libsystemd/sd-journal/journal-send.c
> b/src/libsystemd/sd-journal/journal-send.c
> > >  index fd3fd7ef9c..e8e6ad555b 100644
> > > ---- a/src/journal/journal-send.c
> > > -+++ b/src/journal/journal-send.c
> > > +--- a/src/libsystemd/sd-journal/journal-send.c
> > > ++++ b/src/libsystemd/sd-journal/journal-send.c
> > >  @@ -2,7 +2,6 @@
> > >
> > >   #include <errno.h>
> > > @@ -431,5 +431,5 @@ index fd3fd7ef9c..e8e6ad555b 100644
> > >   #define SNDBUF_SIZE (8*1024*1024)
> > >
> > >  --
> > > -2.27.0
> > > +2.24.0
> > >
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
> b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
> > > index d63e3c0d09..a0d757b3f3 100644
> > > ---
> a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
> > > +++
> b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
> > > @@ -1,7 +1,7 @@
> > > -From 5aeae0ea89f5af74ed5d95bed1d87a03b3801ff0 Mon Sep 17 00:00:00 2001
> > > +From 6b0732ac7164914ce16e231e35980b849bdfc4c8 Mon Sep 17 00:00:00 2001
> > >  From: Chen Qi <Qi.Chen@windriver.com>
> > >  Date: Mon, 25 Feb 2019 14:18:21 +0800
> > > -Subject: [PATCH 05/26] src/basic/missing.h: check for missing strndupa
> > > +Subject: [PATCH] src/basic/missing.h: check for missing strndupa
> > >
> > >  include missing.h  for definition of strndupa
> > >
> > > @@ -17,6 +17,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > >  [rebased for systemd 244]
> > >  [Rebased for v247]
> > >  Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > +
> > >  ---
> > >   meson.build                                |  1 +
> > >   src/backlight/backlight.c                  |  1 +
> > > @@ -25,6 +26,7 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >   src/basic/log.c                            |  1 +
> > >   src/basic/missing_stdlib.h                 | 12 ++++++++++++
> > >   src/basic/mkdir.c                          |  1 +
> > > + src/basic/mountpoint-util.c                |  1 +
> > >   src/basic/parse-util.c                     |  1 +
> > >   src/basic/path-lookup.c                    |  1 +
> > >   src/basic/proc-cmdline.c                   |  1 +
> > > @@ -41,12 +43,12 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >   src/coredump/coredump-vacuum.c             |  1 +
> > >   src/journal-remote/journal-remote-main.c   |  1 +
> > >   src/journal/journalctl.c                   |  1 +
> > > - src/journal/sd-journal.c                   |  1 +
> > >   src/libsystemd/sd-bus/bus-message.c        |  1 +
> > >   src/libsystemd/sd-bus/bus-objects.c        |  1 +
> > >   src/libsystemd/sd-bus/bus-socket.c         |  1 +
> > >   src/libsystemd/sd-bus/sd-bus.c             |  1 +
> > >   src/libsystemd/sd-bus/test-bus-benchmark.c |  1 +
> > > + src/libsystemd/sd-journal/sd-journal.c     |  1 +
> > >   src/locale/keymap-util.c                   |  1 +
> > >   src/login/pam_systemd.c                    |  1 +
> > >   src/network/generator/network-generator.c  |  1 +
> > > @@ -68,18 +70,22 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >   src/udev/udev-builtin-path_id.c            |  1 +
> > >   src/udev/udev-event.c                      |  1 +
> > >   src/udev/udev-rules.c                      |  1 +
> > > - 50 files changed, 61 insertions(+)
> > > + 51 files changed, 62 insertions(+)
> > >
> > > +diff --git a/meson.build b/meson.build
> > > +index 2abb7b3188..c97f09062b 100644
> > >  --- a/meson.build
> > >  +++ b/meson.build
> > > -@@ -535,6 +535,7 @@ foreach ident : [
> > > -                                  #include <sys/wait.h>'''],
> > > -         ['mallinfo',          '''#include <malloc.h>'''],
> > > +@@ -550,6 +550,7 @@ foreach ident : [
> > > +         ['execveat',          '''#include <unistd.h>'''],
> > >           ['close_range',       '''#include <unistd.h>'''],
> > > +         ['epoll_pwait2',      '''#include <sys/epoll.h>'''],
> > >  +        ['strndupa' ,         '''#include <string.h>'''],
> > >   ]
> > >
> > >           have = cc.has_function(ident[0], prefix : ident[1], args :
> '-D_GNU_SOURCE')
> > > +diff --git a/src/backlight/backlight.c b/src/backlight/backlight.c
> > > +index 86927be62e..a34be158a0 100644
> > >  --- a/src/backlight/backlight.c
> > >  +++ b/src/backlight/backlight.c
> > >  @@ -19,6 +19,7 @@
> > > @@ -90,6 +96,8 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   static int help(void) {
> > >           _cleanup_free_ char *link = NULL;
> > > +diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
> > > +index 8dd3f8cd95..50c1ae1b2b 100644
> > >  --- a/src/basic/cgroup-util.c
> > >  +++ b/src/basic/cgroup-util.c
> > >  @@ -38,6 +38,7 @@
> > > @@ -100,9 +108,11 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   static int cg_enumerate_items(const char *controller, const char
> *path, FILE **_f, const char *item) {
> > >           _cleanup_free_ char *fs = NULL;
> > > +diff --git a/src/basic/env-util.c b/src/basic/env-util.c
> > > +index c110a750a5..e1f091b01e 100644
> > >  --- a/src/basic/env-util.c
> > >  +++ b/src/basic/env-util.c
> > > -@@ -15,6 +15,7 @@
> > > +@@ -18,6 +18,7 @@
> > >   #include "string-util.h"
> > >   #include "strv.h"
> > >   #include "utf8.h"
> > > @@ -110,6 +120,8 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   /* We follow bash for the character set. Different shells have
> different rules. */
> > >   #define VALID_BASH_ENV_NAME_CHARS               \
> > > +diff --git a/src/basic/log.c b/src/basic/log.c
> > > +index 595db0c395..daff8eb68a 100644
> > >  --- a/src/basic/log.c
> > >  +++ b/src/basic/log.c
> > >  @@ -36,6 +36,7 @@
> > > @@ -120,6 +132,8 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   #define SNDBUF_SIZE (8*1024*1024)
> > >
> > > +diff --git a/src/basic/missing_stdlib.h b/src/basic/missing_stdlib.h
> > > +index 8c76f93eb2..9068bfb4f0 100644
> > >  --- a/src/basic/missing_stdlib.h
> > >  +++ b/src/basic/missing_stdlib.h
> > >  @@ -11,3 +11,15 @@
> > > @@ -138,6 +152,8 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >  +    (char *)memcpy(__new, __old, __len); \
> > >  +  })
> > >  +#endif
> > > +diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
> > > +index f91f8f7a08..fb31596216 100644
> > >  --- a/src/basic/mkdir.c
> > >  +++ b/src/basic/mkdir.c
> > >  @@ -14,6 +14,7 @@
> > > @@ -148,9 +164,23 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   int mkdir_safe_internal(
> > >                   const char *path,
> > > +diff --git a/src/basic/mountpoint-util.c b/src/basic/mountpoint-util.c
> > > +index 1d617e87b2..346f9a47d7 100644
> > > +--- a/src/basic/mountpoint-util.c
> > > ++++ b/src/basic/mountpoint-util.c
> > > +@@ -12,6 +12,7 @@
> > > + #include "missing_stat.h"
> > > + #include "missing_syscall.h"
> > > + #include "mkdir.h"
> > > ++#include "missing_stdlib.h"
> > > + #include "mountpoint-util.h"
> > > + #include "parse-util.h"
> > > + #include "path-util.h"
> > > +diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
> > > +index b79c885dfd..6dabda5691 100644
> > >  --- a/src/basic/parse-util.c
> > >  +++ b/src/basic/parse-util.c
> > > -@@ -22,6 +22,7 @@
> > > +@@ -19,6 +19,7 @@
> > >   #include "stat-util.h"
> > >   #include "string-util.h"
> > >   #include "strv.h"
> > > @@ -158,6 +188,8 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   int parse_boolean(const char *v) {
> > >           if (!v)
> > > +diff --git a/src/basic/path-lookup.c b/src/basic/path-lookup.c
> > > +index e53c2302b1..ca1d40ccbe 100644
> > >  --- a/src/basic/path-lookup.c
> > >  +++ b/src/basic/path-lookup.c
> > >  @@ -15,6 +15,7 @@
> > > @@ -168,6 +200,8 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   int xdg_user_runtime_dir(char **ret, const char *suffix) {
> > >           const char *e;
> > > +diff --git a/src/basic/proc-cmdline.c b/src/basic/proc-cmdline.c
> > > +index 410b8a3eb5..f2c4355609 100644
> > >  --- a/src/basic/proc-cmdline.c
> > >  +++ b/src/basic/proc-cmdline.c
> > >  @@ -15,6 +15,7 @@
> > > @@ -178,6 +212,8 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   int proc_cmdline(char **ret) {
> > >           const char *e;
> > > +diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
> > > +index ccab71f7d2..8f9eee8d36 100644
> > >  --- a/src/basic/procfs-util.c
> > >  +++ b/src/basic/procfs-util.c
> > >  @@ -11,6 +11,7 @@
> > > @@ -188,6 +224,8 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   int procfs_tasks_get_limit(uint64_t *ret) {
> > >           _cleanup_free_ char *value = NULL;
> > > +diff --git a/src/basic/selinux-util.c b/src/basic/selinux-util.c
> > > +index ee9e34ed47..96c1e9362d 100644
> > >  --- a/src/basic/selinux-util.c
> > >  +++ b/src/basic/selinux-util.c
> > >  @@ -27,6 +27,7 @@
> > > @@ -197,7 +235,9 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >  +#include "missing_stdlib.h"
> > >
> > >   #if HAVE_SELINUX
> > > - DEFINE_TRIVIAL_CLEANUP_FUNC(context_t, context_free);
> > > + DEFINE_TRIVIAL_CLEANUP_FUNC_FULL(context_t, context_free, NULL);
> > > +diff --git a/src/basic/time-util.c b/src/basic/time-util.c
> > > +index 78d0390a00..47c38ca691 100644
> > >  --- a/src/basic/time-util.c
> > >  +++ b/src/basic/time-util.c
> > >  @@ -27,6 +27,7 @@
> > > @@ -208,6 +248,8 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   static clockid_t map_clock_id(clockid_t c) {
> > >
> > > +diff --git a/src/boot/bless-boot.c b/src/boot/bless-boot.c
> > > +index 97ad1e0cb5..9d60f3cc79 100644
> > >  --- a/src/boot/bless-boot.c
> > >  +++ b/src/boot/bless-boot.c
> > >  @@ -18,6 +18,7 @@
> > > @@ -218,16 +260,20 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   static char **arg_path = NULL;
> > >
> > > +diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-cgroup.c
> > > +index 04d2ba34f3..651ca9412e 100644
> > >  --- a/src/core/dbus-cgroup.c
> > >  +++ b/src/core/dbus-cgroup.c
> > > -@@ -16,6 +16,7 @@
> > > - #include "fileio.h"
> > > +@@ -17,6 +17,7 @@
> > >   #include "limits-util.h"
> > >   #include "path-util.h"
> > > + #include "percent-util.h"
> > >  +#include "missing_stdlib.h"
> > >
> > >   BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", TasksMax,
> tasks_max_resolve);
> > >
> > > +diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
> > > +index 5239c41d67..0f604efe98 100644
> > >  --- a/src/core/dbus-execute.c
> > >  +++ b/src/core/dbus-execute.c
> > >  @@ -41,6 +41,7 @@
> > > @@ -238,9 +284,11 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   BUS_DEFINE_PROPERTY_GET_ENUM(bus_property_get_exec_output,
> exec_output, ExecOutput);
> > >   static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_exec_input,
> exec_input, ExecInput);
> > > +diff --git a/src/core/dbus-util.c b/src/core/dbus-util.c
> > > +index 44a2ccfca0..3926ccfa4a 100644
> > >  --- a/src/core/dbus-util.c
> > >  +++ b/src/core/dbus-util.c
> > > -@@ -7,6 +7,7 @@
> > > +@@ -9,6 +9,7 @@
> > >   #include "unit-printf.h"
> > >   #include "user-util.h"
> > >   #include "unit.h"
> > > @@ -248,16 +296,20 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   int bus_property_get_triggered_unit(
> > >                   sd_bus *bus,
> > > +diff --git a/src/core/execute.c b/src/core/execute.c
> > > +index 922913e7af..f82fc294c0 100644
> > >  --- a/src/core/execute.c
> > >  +++ b/src/core/execute.c
> > >  @@ -96,6 +96,7 @@
> > > - #include "unit.h"
> > > + #include "unit-serialize.h"
> > >   #include "user-util.h"
> > >   #include "utmp-wtmp.h"
> > >  +#include "missing_stdlib.h"
> > >
> > >   #define IDLE_TIMEOUT_USEC (5*USEC_PER_SEC)
> > >   #define IDLE_TIMEOUT2_USEC (1*USEC_PER_SEC)
> > > +diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
> > > +index a56f12f47f..6b8729ef67 100644
> > >  --- a/src/core/kmod-setup.c
> > >  +++ b/src/core/kmod-setup.c
> > >  @@ -11,6 +11,7 @@
> > > @@ -268,6 +320,8 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   #if HAVE_KMOD
> > >   #include "module-util.h"
> > > +diff --git a/src/core/service.c b/src/core/service.c
> > > +index 4c5bfb17fb..8c05f36119 100644
> > >  --- a/src/core/service.c
> > >  +++ b/src/core/service.c
> > >  @@ -41,6 +41,7 @@
> > > @@ -278,6 +332,8 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   static const UnitActiveState
> state_translation_table[_SERVICE_STATE_MAX] = {
> > >           [SERVICE_DEAD] = UNIT_INACTIVE,
> > > +diff --git a/src/coredump/coredump-vacuum.c
> b/src/coredump/coredump-vacuum.c
> > > +index 95c3fca661..d4a9f27b08 100644
> > >  --- a/src/coredump/coredump-vacuum.c
> > >  +++ b/src/coredump/coredump-vacuum.c
> > >  @@ -16,6 +16,7 @@
> > > @@ -288,9 +344,11 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   #define DEFAULT_MAX_USE_LOWER (uint64_t) (1ULL*1024ULL*1024ULL)
>      /* 1 MiB */
> > >   #define DEFAULT_MAX_USE_UPPER (uint64_t)
> (4ULL*1024ULL*1024ULL*1024ULL)   /* 4 GiB */
> > > +diff --git a/src/journal-remote/journal-remote-main.c
> b/src/journal-remote/journal-remote-main.c
> > > +index ae1d43756a..24de98c9f3 100644
> > >  --- a/src/journal-remote/journal-remote-main.c
> > >  +++ b/src/journal-remote/journal-remote-main.c
> > > -@@ -22,6 +22,7 @@
> > > +@@ -24,6 +24,7 @@
> > >   #include "stat-util.h"
> > >   #include "string-table.h"
> > >   #include "strv.h"
> > > @@ -298,9 +356,11 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   #define PRIV_KEY_FILE CERTIFICATE_ROOT "/private/journal-remote.pem"
> > >   #define CERT_FILE     CERTIFICATE_ROOT "/certs/journal-remote.pem"
> > > +diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
> > > +index 76d05c1eee..0beb77b2e5 100644
> > >  --- a/src/journal/journalctl.c
> > >  +++ b/src/journal/journalctl.c
> > > -@@ -73,6 +73,7 @@
> > > +@@ -72,6 +72,7 @@
> > >   #include "unit-name.h"
> > >   #include "user-util.h"
> > >   #include "varlink.h"
> > > @@ -308,19 +368,11 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   #define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUTE)
> > >   #define PROCESS_INOTIFY_INTERVAL 1024   /* Every 1,024 messages
> processed */
> > > ---- a/src/journal/sd-journal.c
> > > -+++ b/src/journal/sd-journal.c
> > > -@@ -40,6 +40,7 @@
> > > - #include "string-util.h"
> > > - #include "strv.h"
> > > - #include "syslog-util.h"
> > > -+#include "missing_stdlib.h"
> > > -
> > > - #define JOURNAL_FILES_MAX 7168
> > > -
> > > +diff --git a/src/libsystemd/sd-bus/bus-message.c
> b/src/libsystemd/sd-bus/bus-message.c
> > > +index b25064b672..b3bbe63a91 100644
> > >  --- a/src/libsystemd/sd-bus/bus-message.c
> > >  +++ b/src/libsystemd/sd-bus/bus-message.c
> > > -@@ -21,6 +21,7 @@
> > > +@@ -20,6 +20,7 @@
> > >   #include "strv.h"
> > >   #include "time-util.h"
> > >   #include "utf8.h"
> > > @@ -328,9 +380,11 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   static int message_append_basic(sd_bus_message *m, char type, const
> void *p, const void **stored);
> > >
> > > +diff --git a/src/libsystemd/sd-bus/bus-objects.c
> b/src/libsystemd/sd-bus/bus-objects.c
> > > +index bfd42aea7d..daefc56e3e 100644
> > >  --- a/src/libsystemd/sd-bus/bus-objects.c
> > >  +++ b/src/libsystemd/sd-bus/bus-objects.c
> > > -@@ -13,6 +13,7 @@
> > > +@@ -12,6 +12,7 @@
> > >   #include "set.h"
> > >   #include "string-util.h"
> > >   #include "strv.h"
> > > @@ -338,6 +392,8 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   static int node_vtable_get_userdata(
> > >                   sd_bus *bus,
> > > +diff --git a/src/libsystemd/sd-bus/bus-socket.c
> b/src/libsystemd/sd-bus/bus-socket.c
> > > +index 832526cc1b..7bff701806 100644
> > >  --- a/src/libsystemd/sd-bus/bus-socket.c
> > >  +++ b/src/libsystemd/sd-bus/bus-socket.c
> > >  @@ -28,6 +28,7 @@
> > > @@ -348,29 +404,47 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   #define SNDBUF_SIZE (8*1024*1024)
> > >
> > > +diff --git a/src/libsystemd/sd-bus/sd-bus.c
> b/src/libsystemd/sd-bus/sd-bus.c
> > > +index e719c74370..ac2a605680 100644
> > >  --- a/src/libsystemd/sd-bus/sd-bus.c
> > >  +++ b/src/libsystemd/sd-bus/sd-bus.c
> > >  @@ -41,6 +41,7 @@
> > > - #include "process-util.h"
> > >   #include "string-util.h"
> > >   #include "strv.h"
> > > + #include "user-util.h"
> > >  +#include "missing_stdlib.h"
> > >
> > >   #define log_debug_bus_message(m)
>      \
> > >           do {
>      \
> > > +diff --git a/src/libsystemd/sd-bus/test-bus-benchmark.c
> b/src/libsystemd/sd-bus/test-bus-benchmark.c
> > > +index 13c08fe295..9aae83486e 100644
> > >  --- a/src/libsystemd/sd-bus/test-bus-benchmark.c
> > >  +++ b/src/libsystemd/sd-bus/test-bus-benchmark.c
> > >  @@ -14,6 +14,7 @@
> > > - #include "missing_resource.h"
> > > + #include "string-util.h"
> > >   #include "time-util.h"
> > >   #include "util.h"
> > >  +#include "missing_stdlib.h"
> > >
> > >   #define MAX_SIZE (2*1024*1024)
> > >
> > > +diff --git a/src/libsystemd/sd-journal/sd-journal.c
> b/src/libsystemd/sd-journal/sd-journal.c
> > > +index c90b4c926e..0efdccff5d 100644
> > > +--- a/src/libsystemd/sd-journal/sd-journal.c
> > > ++++ b/src/libsystemd/sd-journal/sd-journal.c
> > > +@@ -40,6 +40,7 @@
> > > + #include "string-util.h"
> > > + #include "strv.h"
> > > + #include "syslog-util.h"
> > > ++#include "missing_stdlib.h"
> > > +
> > > + #define JOURNAL_FILES_MAX 7168
> > > +
> > > +diff --git a/src/locale/keymap-util.c b/src/locale/keymap-util.c
> > > +index d2f0566dbc..3b7746557e 100644
> > >  --- a/src/locale/keymap-util.c
> > >  +++ b/src/locale/keymap-util.c
> > > -@@ -21,6 +21,7 @@
> > > +@@ -24,6 +24,7 @@
> > >   #include "string-util.h"
> > >   #include "strv.h"
> > >   #include "tmpfile-util.h"
> > > @@ -378,6 +452,8 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   static bool startswith_comma(const char *s, const char *prefix) {
> > >           s = startswith(s, prefix);
> > > +diff --git a/src/login/pam_systemd.c b/src/login/pam_systemd.c
> > > +index 2021c31bd5..58eb09808d 100644
> > >  --- a/src/login/pam_systemd.c
> > >  +++ b/src/login/pam_systemd.c
> > >  @@ -31,6 +31,7 @@
> > > @@ -388,6 +464,8 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >   #include "pam-util.h"
> > >   #include "parse-util.h"
> > >   #include "path-util.h"
> > > +diff --git a/src/network/generator/network-generator.c
> b/src/network/generator/network-generator.c
> > > +index ae673ddf5b..a79e5114ca 100644
> > >  --- a/src/network/generator/network-generator.c
> > >  +++ b/src/network/generator/network-generator.c
> > >  @@ -13,6 +13,7 @@
> > > @@ -398,6 +476,8 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   /*
> > >     # .network
> > > +diff --git a/src/nspawn/nspawn-settings.c
> b/src/nspawn/nspawn-settings.c
> > > +index d4619bead5..0e832fd994 100644
> > >  --- a/src/nspawn/nspawn-settings.c
> > >  +++ b/src/nspawn/nspawn-settings.c
> > >  @@ -16,6 +16,7 @@
> > > @@ -408,19 +488,23 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   Settings *settings_new(void) {
> > >           Settings *s;
> > > +diff --git a/src/nss-mymachines/nss-mymachines.c
> b/src/nss-mymachines/nss-mymachines.c
> > > +index 44715bb3e5..bc1e688b5e 100644
> > >  --- a/src/nss-mymachines/nss-mymachines.c
> > >  +++ b/src/nss-mymachines/nss-mymachines.c
> > > -@@ -19,6 +19,7 @@
> > > +@@ -21,6 +21,7 @@
> > >   #include "nss-util.h"
> > >   #include "signal-util.h"
> > >   #include "string-util.h"
> > >  +#include "missing_stdlib.h"
> > >
> > > - NSS_GETHOSTBYNAME_PROTOTYPES(mymachines);
> > > - NSS_GETPW_PROTOTYPES(mymachines);
> > > + static void setup_logging(void) {
> > > +         /* We need a dummy function because log_parse_environment is
> a macro. */
> > > +diff --git a/src/portable/portable.c b/src/portable/portable.c
> > > +index f201f52531..c78ad0f471 100644
> > >  --- a/src/portable/portable.c
> > >  +++ b/src/portable/portable.c
> > > -@@ -31,6 +31,7 @@
> > > +@@ -32,6 +32,7 @@
> > >   #include "strv.h"
> > >   #include "tmpfile-util.h"
> > >   #include "user-util.h"
> > > @@ -428,9 +512,11 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   static const char profile_dirs[] =
> CONF_PATHS_NULSTR("systemd/portable/profile");
> > >
> > > +diff --git a/src/resolve/resolvectl.c b/src/resolve/resolvectl.c
> > > +index 52bbae3293..4ccbae09c4 100644
> > >  --- a/src/resolve/resolvectl.c
> > >  +++ b/src/resolve/resolvectl.c
> > > -@@ -37,6 +37,7 @@
> > > +@@ -41,6 +41,7 @@
> > >   #include "terminal-util.h"
> > >   #include "utf8.h"
> > >   #include "verbs.h"
> > > @@ -438,6 +524,8 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   static int arg_family = AF_UNSPEC;
> > >   static int arg_ifindex = 0;
> > > +diff --git a/src/shared/bus-get-properties.c
> b/src/shared/bus-get-properties.c
> > > +index feb6d3807f..eb11d29e50 100644
> > >  --- a/src/shared/bus-get-properties.c
> > >  +++ b/src/shared/bus-get-properties.c
> > >  @@ -4,6 +4,7 @@
> > > @@ -448,6 +536,8 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   int bus_property_get_bool(
> > >                   sd_bus *bus,
> > > +diff --git a/src/shared/bus-unit-procs.c b/src/shared/bus-unit-procs.c
> > > +index b76125e551..2e0892242f 100644
> > >  --- a/src/shared/bus-unit-procs.c
> > >  +++ b/src/shared/bus-unit-procs.c
> > >  @@ -10,6 +10,7 @@
> > > @@ -458,9 +548,11 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   struct CGroupInfo {
> > >           char *cgroup_path;
> > > +diff --git a/src/shared/bus-unit-util.c b/src/shared/bus-unit-util.c
> > > +index a75178068b..3de06e2bd5 100644
> > >  --- a/src/shared/bus-unit-util.c
> > >  +++ b/src/shared/bus-unit-util.c
> > > -@@ -44,6 +44,7 @@
> > > +@@ -45,6 +45,7 @@
> > >   #include "unit-def.h"
> > >   #include "user-util.h"
> > >   #include "utf8.h"
> > > @@ -468,6 +560,8 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   int bus_parse_unit_info(sd_bus_message *message, UnitInfo *u) {
> > >           assert(message);
> > > +diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c
> > > +index 64ca67993c..31e3d148ea 100644
> > >  --- a/src/shared/bus-util.c
> > >  +++ b/src/shared/bus-util.c
> > >  @@ -21,6 +21,7 @@
> > > @@ -478,6 +572,8 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   static int name_owner_change_callback(sd_bus_message *m, void
> *userdata, sd_bus_error *ret_error) {
> > >           sd_event *e = userdata;
> > > +diff --git a/src/shared/dns-domain.c b/src/shared/dns-domain.c
> > > +index e43aa12882..cec9b413c1 100644
> > >  --- a/src/shared/dns-domain.c
> > >  +++ b/src/shared/dns-domain.c
> > >  @@ -17,6 +17,7 @@
> > > @@ -488,6 +584,8 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   int dns_label_unescape(const char **name, char *dest, size_t sz,
> DNSLabelFlags flags) {
> > >           const char *n;
> > > +diff --git a/src/shared/journal-importer.c
> b/src/shared/journal-importer.c
> > > +index b2785f0552..5f00902882 100644
> > >  --- a/src/shared/journal-importer.c
> > >  +++ b/src/shared/journal-importer.c
> > >  @@ -14,6 +14,7 @@
> > > @@ -498,6 +596,8 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   enum {
> > >           IMPORTER_STATE_LINE = 0,    /* waiting to read, or reading
> line */
> > > +diff --git a/src/shared/logs-show.c b/src/shared/logs-show.c
> > > +index e63c59bd94..dd9773c009 100644
> > >  --- a/src/shared/logs-show.c
> > >  +++ b/src/shared/logs-show.c
> > >  @@ -41,6 +41,7 @@
> > > @@ -508,6 +608,8 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   /* up to three lines (each up to 100 characters) or 300 characters,
> whichever is less */
> > >   #define PRINT_LINE_THRESHOLD 3
> > > +diff --git a/src/shared/pager.c b/src/shared/pager.c
> > > +index 4bbad7e37b..eefcdd068c 100644
> > >  --- a/src/shared/pager.c
> > >  +++ b/src/shared/pager.c
> > >  @@ -26,6 +26,7 @@
> > > @@ -518,6 +620,8 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   static pid_t pager_pid = 0;
> > >
> > > +diff --git a/src/shared/uid-range.c b/src/shared/uid-range.c
> > > +index 5d5bf7f21d..f1002ffa6c 100644
> > >  --- a/src/shared/uid-range.c
> > >  +++ b/src/shared/uid-range.c
> > >  @@ -9,6 +9,7 @@
> > > @@ -528,6 +632,8 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   static bool uid_range_intersect(UidRange *range, uid_t start, uid_t
> nr) {
> > >           assert(range);
> > > +diff --git a/src/socket-proxy/socket-proxyd.c
> b/src/socket-proxy/socket-proxyd.c
> > > +index 6e3ee0d76b..7727e33d95 100644
> > >  --- a/src/socket-proxy/socket-proxyd.c
> > >  +++ b/src/socket-proxy/socket-proxyd.c
> > >  @@ -26,6 +26,7 @@
> > > @@ -538,6 +644,8 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   #define BUFFER_SIZE (256 * 1024)
> > >
> > > +diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
> > > +index c9d318b8d1..fcb8d40805 100644
> > >  --- a/src/test/test-hexdecoct.c
> > >  +++ b/src/test/test-hexdecoct.c
> > >  @@ -6,6 +6,7 @@
> > > @@ -548,19 +656,23 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   static void test_hexchar(void) {
> > >           assert_se(hexchar(0xa) == 'a');
> > > +diff --git a/src/udev/udev-builtin-path_id.c
> b/src/udev/udev-builtin-path_id.c
> > > +index 09cc1c3bd8..8a7d3152a7 100644
> > >  --- a/src/udev/udev-builtin-path_id.c
> > >  +++ b/src/udev/udev-builtin-path_id.c
> > >  @@ -22,6 +22,7 @@
> > > - #include "strv.h"
> > >   #include "sysexits.h"
> > >   #include "udev-builtin.h"
> > > + #include "udev-util.h"
> > >  +#include "missing_stdlib.h"
> > >
> > >   _printf_(2,3)
> > >   static void path_prepend(char **path, const char *fmt, ...) {
> > > +diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
> > > +index 12597194a9..208b2458b5 100644
> > >  --- a/src/udev/udev-event.c
> > >  +++ b/src/udev/udev-event.c
> > > -@@ -34,6 +34,7 @@
> > > +@@ -33,6 +33,7 @@
> > >   #include "udev-util.h"
> > >   #include "udev-watch.h"
> > >   #include "user-util.h"
> > > @@ -568,9 +680,11 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   typedef struct Spawn {
> > >           sd_device *device;
> > > +diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
> > > +index 57ede6a197..dc59857765 100644
> > >  --- a/src/udev/udev-rules.c
> > >  +++ b/src/udev/udev-rules.c
> > > -@@ -30,6 +30,7 @@
> > > +@@ -31,6 +31,7 @@
> > >   #include "udev-rules.h"
> > >   #include "user-util.h"
> > >   #include "virt.h"
> > > @@ -578,13 +692,3 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   #define RULES_DIRS (const char* const*)
> CONF_PATHS_STRV("udev/rules.d")
> > >
> > > ---- a/src/basic/mountpoint-util.c
> > > -+++ b/src/basic/mountpoint-util.c
> > > -@@ -10,6 +10,7 @@
> > > - #include "fs-util.h"
> > > - #include "missing_stat.h"
> > > - #include "missing_syscall.h"
> > > -+#include "missing_stdlib.h"
> > > - #include "mountpoint-util.h"
> > > - #include "parse-util.h"
> > > - #include "path-util.h"
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
> b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
> > > index a978558b42..54d714266e 100644
> > > ---
> a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
> > > +++
> b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
> > > @@ -1,7 +1,7 @@
> > > -From d3ed0da271738fd0fc3d3e4d82d6f5810334b05e Mon Sep 17 00:00:00 2001
> > > +From 2069f0b0d5ab8f869aeba635a347e0b11d362b30 Mon Sep 17 00:00:00 2001
> > >  From: Khem Raj <raj.khem@gmail.com>
> > >  Date: Thu, 26 Oct 2017 22:10:42 -0700
> > > -Subject: [PATCH 06/26] Include netinet/if_ether.h
> > > +Subject: [PATCH] Include netinet/if_ether.h
> > >
> > >  Fixes
> > >  /path/to/systemd/recipe-sysroot/usr/include/netinet/if_ether.h:101:8:
> error: redefinition of 'struct ethhdr'
> > > @@ -31,6 +31,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > >  Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> > >  [rebased for systemd 247]
> > >  Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > +
> > >  ---
> > >   src/libsystemd-network/sd-dhcp6-client.c  | 1 -
> > >   src/libsystemd/sd-netlink/netlink-types.c | 1 +
> > > @@ -56,7 +57,7 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >   21 files changed, 26 insertions(+), 8 deletions(-)
> > >
> > >  diff --git a/src/libsystemd-network/sd-dhcp6-client.c
> b/src/libsystemd-network/sd-dhcp6-client.c
> > > -index 66f87c4b95..de1264ae46 100644
> > > +index 410bfda10e..e70ed8be92 100644
> > >  --- a/src/libsystemd-network/sd-dhcp6-client.c
> > >  +++ b/src/libsystemd-network/sd-dhcp6-client.c
> > >  @@ -5,7 +5,6 @@
> > > @@ -68,7 +69,7 @@ index 66f87c4b95..de1264ae46 100644
> > >
> > >   #include "sd-dhcp6-client.h"
> > >  diff --git a/src/libsystemd/sd-netlink/netlink-types.c
> b/src/libsystemd/sd-netlink/netlink-types.c
> > > -index 6fb6c147d9..8eda02d202 100644
> > > +index ed7b9a8cd1..112c0b09e4 100644
> > >  --- a/src/libsystemd/sd-netlink/netlink-types.c
> > >  +++ b/src/libsystemd/sd-netlink/netlink-types.c
> > >  @@ -3,6 +3,7 @@
> > > @@ -80,7 +81,7 @@ index 6fb6c147d9..8eda02d202 100644
> > >   #include <linux/netlink.h>
> > >   #include <linux/rtnetlink.h>
> > >  diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
> > > -index bb67beb665..f5780f1aec 100644
> > > +index e7c4ed3c7c..3a1e4f9072 100644
> > >  --- a/src/machine/machine-dbus.c
> > >  +++ b/src/machine/machine-dbus.c
> > >  @@ -3,6 +3,7 @@
> > > @@ -92,7 +93,7 @@ index bb67beb665..f5780f1aec 100644
> > >   /* When we include libgen.h because we need dirname() we immediately
> > >    * undefine basename() since libgen.h defines it as a macro to the
> POSIX
> > >  diff --git a/src/network/netdev/bond.c b/src/network/netdev/bond.c
> > > -index e27f36067b..8868f1da5d 100644
> > > +index cf7ca88d6f..34ab468191 100644
> > >  --- a/src/network/netdev/bond.c
> > >  +++ b/src/network/netdev/bond.c
> > >  @@ -1,5 +1,6 @@
> > > @@ -103,7 +104,7 @@ index e27f36067b..8868f1da5d 100644
> > >   #include "bond.h"
> > >   #include "bond-util.h"
> > >  diff --git a/src/network/netdev/bridge.c b/src/network/netdev/bridge.c
> > > -index 1f59cd8b42..5fdbae7e99 100644
> > > +index 38432f1578..79ccfe578e 100644
> > >  --- a/src/network/netdev/bridge.c
> > >  +++ b/src/network/netdev/bridge.c
> > >  @@ -1,5 +1,6 @@
> > > @@ -114,7 +115,7 @@ index 1f59cd8b42..5fdbae7e99 100644
> > >
> > >   #include "bridge.h"
> > >  diff --git a/src/network/netdev/macsec.c b/src/network/netdev/macsec.c
> > > -index 82e71c3920..fbae86e216 100644
> > > +index 77c5f8c4e7..04be1b4ab2 100644
> > >  --- a/src/network/netdev/macsec.c
> > >  +++ b/src/network/netdev/macsec.c
> > >  @@ -1,5 +1,6 @@
> > > @@ -125,19 +126,19 @@ index 82e71c3920..fbae86e216 100644
> > >   #include <linux/if_ether.h>
> > >   #include <linux/if_macsec.h>
> > >  diff --git a/src/network/netdev/netdev-gperf.gperf
> b/src/network/netdev/netdev-gperf.gperf
> > > -index 4e89761f2c..91251fa6ec 100644
> > > +index 8abe044890..3c54c58928 100644
> > >  --- a/src/network/netdev/netdev-gperf.gperf
> > >  +++ b/src/network/netdev/netdev-gperf.gperf
> > > -@@ -2,6 +2,7 @@
> > > +@@ -3,6 +3,7 @@
> > >   #if __GNUC__ >= 7
> > >   _Pragma("GCC diagnostic ignored \"-Wimplicit-fallthrough\"")
> > >   #endif
> > >  +#include <netinet/if_ether.h>
> > >   #include <stddef.h>
> > >   #include "bareudp.h"
> > > - #include "bond.h"
> > > + #include "batadv.h"
> > >  diff --git a/src/network/netdev/netdev.c b/src/network/netdev/netdev.c
> > > -index 9f390b5781..62aeafb1e4 100644
> > > +index b31f0fa81a..c80e1ff537 100644
> > >  --- a/src/network/netdev/netdev.c
> > >  +++ b/src/network/netdev/netdev.c
> > >  @@ -1,5 +1,6 @@
> > > @@ -148,7 +149,7 @@ index 9f390b5781..62aeafb1e4 100644
> > >   #include <netinet/in.h>
> > >   #include <unistd.h>
> > >  diff --git a/src/network/networkd-brvlan.c
> b/src/network/networkd-brvlan.c
> > > -index e53c73c30c..9bf0771b84 100644
> > > +index 2847b336c9..4d6af8c642 100644
> > >  --- a/src/network/networkd-brvlan.c
> > >  +++ b/src/network/networkd-brvlan.c
> > >  @@ -4,6 +4,7 @@
> > > @@ -160,7 +161,7 @@ index e53c73c30c..9bf0771b84 100644
> > >   #include <stdbool.h>
> > >
> > >  diff --git a/src/network/networkd-dhcp-common.c
> b/src/network/networkd-dhcp-common.c
> > > -index 9f58121350..554d006cb8 100644
> > > +index 00d055cf8d..65821c1d31 100644
> > >  --- a/src/network/networkd-dhcp-common.c
> > >  +++ b/src/network/networkd-dhcp-common.c
> > >  @@ -1,7 +1,8 @@
> > > @@ -171,9 +172,9 @@ index 9f58121350..554d006cb8 100644
> > >  +#include <net/if_arp.h>
> > >  +#include <net/if.h>
> > >
> > > + #include "bus-error.h"
> > >   #include "dhcp-internal.h"
> > > - #include "dhcp6-internal.h"
> > > -@@ -10,6 +11,7 @@
> > > +@@ -11,6 +12,7 @@
> > >   #include "networkd-dhcp-common.h"
> > >   #include "networkd-link.h"
> > >   #include "networkd-manager.h"
> > > @@ -182,7 +183,7 @@ index 9f58121350..554d006cb8 100644
> > >   #include "parse-util.h"
> > >   #include "socket-util.h"
> > >  diff --git a/src/network/networkd-dhcp-server.c
> b/src/network/networkd-dhcp-server.c
> > > -index cf279c640d..bae541029b 100644
> > > +index 5cdf432c27..93cffb9863 100644
> > >  --- a/src/network/networkd-dhcp-server.c
> > >  +++ b/src/network/networkd-dhcp-server.c
> > >  @@ -1,8 +1,8 @@
> > > @@ -197,7 +198,7 @@ index cf279c640d..bae541029b 100644
> > >   #include "sd-dhcp-server.h"
> > >
> > >  diff --git a/src/network/networkd-dhcp4.c
> b/src/network/networkd-dhcp4.c
> > > -index f3c1e5f609..e4ef6eca63 100644
> > > +index 23dc3a45db..7ae6c2467a 100644
> > >  --- a/src/network/networkd-dhcp4.c
> > >  +++ b/src/network/networkd-dhcp4.c
> > >  @@ -1,9 +1,9 @@
> > > @@ -212,7 +213,7 @@ index f3c1e5f609..e4ef6eca63 100644
> > >   #include "escape.h"
> > >   #include "alloc-util.h"
> > >  diff --git a/src/network/networkd-dhcp6.c
> b/src/network/networkd-dhcp6.c
> > > -index 5c077c1ec8..fa98042aa5 100644
> > > +index aa077d6219..4f6ce22059 100644
> > >  --- a/src/network/networkd-dhcp6.c
> > >  +++ b/src/network/networkd-dhcp6.c
> > >  @@ -3,9 +3,9 @@
> > > @@ -227,7 +228,7 @@ index 5c077c1ec8..fa98042aa5 100644
> > >   #include "sd-dhcp6-client.h"
> > >
> > >  diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
> > > -index 3bfe636691..e0c68c8ad3 100644
> > > +index 8219d95b0d..c92230453b 100644
> > >  --- a/src/network/networkd-link.c
> > >  +++ b/src/network/networkd-link.c
> > >  @@ -1,8 +1,8 @@
> > > @@ -241,7 +242,7 @@ index 3bfe636691..e0c68c8ad3 100644
> > >   #include <unistd.h>
> > >
> > >  diff --git a/src/network/networkd-network.c
> b/src/network/networkd-network.c
> > > -index 3254641461..f0ada419fd 100644
> > > +index e5ffd35b6f..871ebb32c6 100644
> > >  --- a/src/network/networkd-network.c
> > >  +++ b/src/network/networkd-network.c
> > >  @@ -1,5 +1,6 @@
> > > @@ -252,7 +253,7 @@ index 3254641461..f0ada419fd 100644
> > >   #include <netinet/in.h>
> > >   #include <linux/netdevice.h>
> > >  diff --git a/src/network/networkd-route.c
> b/src/network/networkd-route.c
> > > -index 0ed89584ef..e7e157c201 100644
> > > +index a74541a6c9..a10549b336 100644
> > >  --- a/src/network/networkd-route.c
> > >  +++ b/src/network/networkd-route.c
> > >  @@ -1,7 +1,10 @@
> > > @@ -268,7 +269,7 @@ index 0ed89584ef..e7e157c201 100644
> > >   #include "alloc-util.h"
> > >   #include "netlink-util.h"
> > >  diff --git a/src/network/test-network-tables.c
> b/src/network/test-network-tables.c
> > > -index 475cac7527..9bae6eda16 100644
> > > +index ce34449554..0b5dc01182 100644
> > >  --- a/src/network/test-network-tables.c
> > >  +++ b/src/network/test-network-tables.c
> > >  @@ -1,5 +1,6 @@
> > > @@ -279,7 +280,7 @@ index 475cac7527..9bae6eda16 100644
> > >   #include "dhcp6-internal.h"
> > >   #include "dhcp6-protocol.h"
> > >  diff --git a/src/shared/ethtool-util.c b/src/shared/ethtool-util.c
> > > -index e6fab262f2..41dd3d7df7 100644
> > > +index 654d36a83a..f4ed42d543 100644
> > >  --- a/src/shared/ethtool-util.c
> > >  +++ b/src/shared/ethtool-util.c
> > >  @@ -1,5 +1,6 @@
> > > @@ -290,7 +291,7 @@ index e6fab262f2..41dd3d7df7 100644
> > >   #include <sys/ioctl.h>
> > >   #include <linux/ethtool.h>
> > >  diff --git a/src/shared/ethtool-util.h b/src/shared/ethtool-util.h
> > > -index f94b3e15bf..08a7e4fa09 100644
> > > +index 11e2906681..a171df0737 100644
> > >  --- a/src/shared/ethtool-util.h
> > >  +++ b/src/shared/ethtool-util.h
> > >  @@ -3,6 +3,7 @@
> > > @@ -302,7 +303,7 @@ index f94b3e15bf..08a7e4fa09 100644
> > >
> > >   #include "conf-parser.h"
> > >  diff --git a/src/udev/net/link-config.c b/src/udev/net/link-config.c
> > > -index d12fd0e299..636806dc23 100644
> > > +index 31e5d0cd67..f25f821364 100644
> > >  --- a/src/udev/net/link-config.c
> > >  +++ b/src/udev/net/link-config.c
> > >  @@ -1,5 +1,6 @@
> > > @@ -323,6 +324,3 @@ index 87e1fb133e..13876029d0 100644
> > >   #include "alloc-util.h"
> > >   #include "device-util.h"
> > >   #include "errno-util.h"
> > > ---
> > > -2.25.1
> > > -
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
> b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
> > > index 6865421586..2ff08c7fae 100644
> > > ---
> a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
> > > +++
> b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
> > > @@ -1,8 +1,7 @@
> > > -From 87a14dde13c8fa68239a4ab62914a093062b3b29 Mon Sep 17 00:00:00 2001
> > > +From bca73ff2fbff2dc311040a87a4f536f89af07ad6 Mon Sep 17 00:00:00 2001
> > >  From: Chen Qi <Qi.Chen@windriver.com>
> > >  Date: Mon, 25 Feb 2019 14:56:21 +0800
> > > -Subject: [PATCH 07/26] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC
> is not
> > > - defined
> > > +Subject: [PATCH] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not
> defined
> > >
> > >  If the standard library doesn't provide brace
> > >  expansion users just won't get it.
> > > @@ -17,6 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > >  [rebased for systemd 243]
> > >  Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> > > +
> > >  ---
> > >   src/basic/glob-util.c     | 12 ++++++++++++
> > >   src/test/test-glob-util.c | 16 ++++++++++++++++
> > > @@ -115,10 +115,10 @@ index df6444c433..79a692046e 100644
> > >
> > >           (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
> > >  diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
> > > -index 9906c70eef..5eb63b1d57 100644
> > > +index 6b73d1e6d5..26b3b74275 100644
> > >  --- a/src/tmpfiles/tmpfiles.c
> > >  +++ b/src/tmpfiles/tmpfiles.c
> > > -@@ -63,6 +63,12 @@
> > > +@@ -66,6 +66,12 @@
> > >   #include "umask-util.h"
> > >   #include "user-util.h"
> > >
> > > @@ -131,7 +131,7 @@ index 9906c70eef..5eb63b1d57 100644
> > >   /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
> > >    * them in the file system. This is intended to be used to create
> > >    * properly owned directories beneath /tmp, /var/tmp, /run, which are
> > > -@@ -1936,7 +1942,9 @@ finish:
> > > +@@ -1947,7 +1953,9 @@ finish:
> > >
> > >   static int glob_item(Item *i, action_t action) {
> > >           _cleanup_globfree_ glob_t g = {
> > > @@ -141,7 +141,7 @@ index 9906c70eef..5eb63b1d57 100644
> > >           };
> > >           int r = 0, k;
> > >           char **fn;
> > > -@@ -1956,7 +1964,9 @@ static int glob_item(Item *i, action_t action) {
> > > +@@ -1967,7 +1975,9 @@ static int glob_item(Item *i, action_t action) {
> > >
> > >   static int glob_item_recursively(Item *i, fdaction_t action) {
> > >           _cleanup_globfree_ glob_t g = {
> > > @@ -151,6 +151,3 @@ index 9906c70eef..5eb63b1d57 100644
> > >           };
> > >           int r = 0, k;
> > >           char **fn;
> > > ---
> > > -2.27.0
> > > -
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
> b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
> > > index 94cdc2efde..142ca01345 100644
> > > ---
> a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
> > > +++
> b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
> > > @@ -1,7 +1,7 @@
> > > -From 8caea3fe87d55fd16de7d1b8266239fa954cb498 Mon Sep 17 00:00:00 2001
> > > +From e0d1912f0246c97e5e7b4177691363d2d077e11d Mon Sep 17 00:00:00 2001
> > >  From: Chen Qi <Qi.Chen@windriver.com>
> > >  Date: Mon, 25 Feb 2019 15:00:06 +0800
> > > -Subject: [PATCH 08/26] add missing FTW_ macros for musl
> > > +Subject: [PATCH] add missing FTW_ macros for musl
> > >
> > >  This is to avoid build failures like below for musl.
> > >
> > > @@ -10,6 +10,7 @@ This is to avoid build failures like below for musl.
> > >  Upstream-Status: Inappropriate [musl specific]
> > >
> > >  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > +
> > >  ---
> > >   src/basic/missing_type.h | 20 ++++++++++++++++++++
> > >   1 file changed, 20 insertions(+)
> > > @@ -42,6 +43,3 @@ index aeaf6ad5ec..3df1084ef2 100644
> > >  +#ifndef FTW_SKIP_SIBLINGS
> > >  +#define FTW_SKIP_SIBLINGS 3
> > >  +#endif
> > > ---
> > > -2.27.0
> > > -
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
> b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
> > > index 76cc75cf6a..53f0a1ba62 100644
> > > ---
> a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
> > > +++
> b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
> > > @@ -1,17 +1,18 @@
> > > -From d8e4f0aa1760e4c7bb8476beecd35025c9cbb95a Mon Sep 17 00:00:00 2001
> > > +From bb41fe773881a8f1d9615d388320b9c6fc47bfe5 Mon Sep 17 00:00:00 2001
> > >  From: Chen Qi <Qi.Chen@windriver.com>
> > >  Date: Mon, 25 Feb 2019 15:03:47 +0800
> > > -Subject: [PATCH 09/26] fix missing of __register_atfork for non-glibc
> builds
> > > +Subject: [PATCH] fix missing of __register_atfork for non-glibc builds
> > >
> > >  Upstream-Status: Inappropriate [musl specific]
> > >
> > >  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > +
> > >  ---
> > >   src/basic/process-util.c | 7 +++++++
> > >   1 file changed, 7 insertions(+)
> > >
> > >  diff --git a/src/basic/process-util.c b/src/basic/process-util.c
> > > -index 0851613fc9..4417101569 100644
> > > +index 7d4301eadb..caa9dfe3a3 100644
> > >  --- a/src/basic/process-util.c
> > >  +++ b/src/basic/process-util.c
> > >  @@ -18,6 +18,9 @@
> > > @@ -24,7 +25,7 @@ index 0851613fc9..4417101569 100644
> > >
> > >   #include "alloc-util.h"
> > >   #include "architecture.h"
> > > -@@ -1143,11 +1146,15 @@ void reset_cached_pid(void) {
> > > +@@ -1121,11 +1124,15 @@ void reset_cached_pid(void) {
> > >           cached_pid = CACHED_PID_UNSET;
> > >   }
> > >
> > > @@ -40,6 +41,3 @@ index 0851613fc9..4417101569 100644
> > >
> > >   pid_t getpid_cached(void) {
> > >           static bool installed = false;
> > > ---
> > > -2.27.0
> > > -
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
> b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
> > > index aeacd865ae..af1a6bb053 100644
> > > ---
> a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
> > > +++
> b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
> > > @@ -1,7 +1,7 @@
> > > -From e45bb02174812e4935214f42a18725be320770d5 Mon Sep 17 00:00:00 2001
> > > +From dc40487e0ac26e3ca317429b9c3e8f01772de60a Mon Sep 17 00:00:00 2001
> > >  From: Chen Qi <Qi.Chen@windriver.com>
> > >  Date: Mon, 25 Feb 2019 15:12:41 +0800
> > > -Subject: [PATCH 10/26] Use uintmax_t for handling rlim_t
> > > +Subject: [PATCH] Use uintmax_t for handling rlim_t
> > >
> > >  PRIu{32,64} is not right format to represent rlim_t type
> > >  therefore use %ju and typecast the rlim_t variables to
> > > @@ -20,6 +20,7 @@ Upstream-Status: Denied [
> https://github.com/systemd/systemd/pull/7199]
> > >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >  [Rebased for v241]
> > >  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > +
> > >  ---
> > >   src/basic/format-util.h |  8 +-------
> > >   src/basic/rlimit-util.c | 10 +++++-----
> > > @@ -46,10 +47,10 @@ index b7e18768e3..3195ab205d 100644
> > >   #if SIZEOF_DEV_T == 8
> > >   #  define DEV_FMT "%" PRIu64
> > >  diff --git a/src/basic/rlimit-util.c b/src/basic/rlimit-util.c
> > > -index 880976312c..9e1b61cd4a 100644
> > > +index 23d108d5df..94373c9422 100644
> > >  --- a/src/basic/rlimit-util.c
> > >  +++ b/src/basic/rlimit-util.c
> > > -@@ -306,13 +306,13 @@ int rlimit_format(const struct rlimit *rl, char
> **ret) {
> > > +@@ -308,13 +308,13 @@ int rlimit_format(const struct rlimit *rl, char
> **ret) {
> > >           if (rl->rlim_cur >= RLIM_INFINITY && rl->rlim_max >=
> RLIM_INFINITY)
> > >                   s = strdup("infinity");
> > >           else if (rl->rlim_cur >= RLIM_INFINITY)
> > > @@ -67,7 +68,7 @@ index 880976312c..9e1b61cd4a 100644
> > >
> > >           if (!s)
> > >                   return -ENOMEM;
> > > -@@ -403,7 +403,7 @@ int rlimit_nofile_safe(void) {
> > > +@@ -405,7 +405,7 @@ int rlimit_nofile_safe(void) {
> > >
> > >           rl.rlim_cur = FD_SETSIZE;
> > >           if (setrlimit(RLIMIT_NOFILE, &rl) < 0)
> > > @@ -77,10 +78,10 @@ index 880976312c..9e1b61cd4a 100644
> > >           return 1;
> > >   }
> > >  diff --git a/src/core/execute.c b/src/core/execute.c
> > > -index 89632e0582..335283776c 100644
> > > +index f82fc294c0..4696d055a8 100644
> > >  --- a/src/core/execute.c
> > >  +++ b/src/core/execute.c
> > > -@@ -5288,9 +5288,9 @@ void exec_context_dump(const ExecContext *c,
> FILE* f, const char *prefix) {
> > > +@@ -5370,9 +5370,9 @@ void exec_context_dump(const ExecContext *c,
> FILE* f, const char *prefix) {
> > >           for (unsigned i = 0; i < RLIM_NLIMITS; i++)
> > >                   if (c->rlimit[i]) {
> > >                           fprintf(f, "%sLimit%s: " RLIM_FMT "\n",
> > > @@ -92,6 +93,3 @@ index 89632e0582..335283776c 100644
> > >                   }
> > >
> > >           if (c->ioprio_set) {
> > > ---
> > > -2.27.0
> > > -
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
> b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
> > > index 6d7fdbcb64..b1d782719c 100644
> > > ---
> a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
> > > +++
> b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
> > > @@ -1,13 +1,13 @@
> > > -From d1db531ddd3bbf94d5e764b7917bcc8684ff6357 Mon Sep 17 00:00:00 2001
> > > +From f8be7b283309e4332eedc088774daac637afef7b Mon Sep 17 00:00:00 2001
> > >  From: Chen Qi <Qi.Chen@windriver.com>
> > >  Date: Wed, 28 Feb 2018 21:25:22 -0800
> > > -Subject: [PATCH 11/26] test-sizeof.c: Disable tests for missing
> typedefs in
> > > - musl
> > > +Subject: [PATCH] test-sizeof.c: Disable tests for missing typedefs in
> musl
> > >
> > >  Upstream-Status: Inappropriate [musl specific]
> > >
> > >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > +
> > >  ---
> > >   src/test/test-sizeof.c | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > @@ -37,6 +37,3 @@ index 3c9dc180fa..e1a59d408c 100644
> > >           info(pid_t);
> > >           info(uid_t);
> > >           info(gid_t);
> > > ---
> > > -2.27.0
> > > -
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
> b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
> > > index c15b6e7d82..5f2178734d 100644
> > > ---
> a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
> > > +++
> b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
> > > @@ -1,7 +1,7 @@
> > > -From 03e89da266edf70121a19ffc32a78cc3b97585ef Mon Sep 17 00:00:00 2001
> > > +From 06915b70735caa66987af758ebdc4207757ae758 Mon Sep 17 00:00:00 2001
> > >  From: Andre McCurdy <armccurdy@gmail.com>
> > >  Date: Tue, 10 Oct 2017 14:33:30 -0700
> > > -Subject: [PATCH 12/26] don't pass AT_SYMLINK_NOFOLLOW flag to
> faccessat()
> > > +Subject: [PATCH] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
> > >
> > >  Avoid using AT_SYMLINK_NOFOLLOW flag. It doesn't seem like the right
> > >  thing to do and it's not portable (not supported by musl). See:
> > > @@ -25,20 +25,22 @@ just historical and not actually necessary or
> desired behaviour?
> > >  Upstream-Status: Inappropriate [musl specific]
> > >
> > >  Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> > > +
> > >  ---
> > > - src/basic/fs-util.h          | 22 +++++++++++++++++++++-
> > > + src/basic/fs-util.h          | 23 +++++++++++++++++++++--
> > >   src/shared/base-filesystem.c |  6 +++---
> > > - 2 files changed, 24 insertions(+), 4 deletions(-)
> > > + 2 files changed, 24 insertions(+), 5 deletions(-)
> > >
> > >  diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
> > > -index 5dc8853eac..0491b3dae2 100644
> > > +index 027037f7a7..16eb379caf 100644
> > >  --- a/src/basic/fs-util.h
> > >  +++ b/src/basic/fs-util.h
> > > -@@ -43,7 +43,27 @@ int futimens_opath(int fd, const struct timespec
> ts[2]);
> > > +@@ -44,8 +44,27 @@ int futimens_opath(int fd, const struct timespec
> ts[2]);
> > >   int fd_warn_permissions(const char *path, int fd);
> > >   int stat_warn_permissions(const char *path, const struct stat *st);
> > >
> > > --#define laccess(path, mode) faccessat(AT_FDCWD, (path), (mode),
> AT_SYMLINK_NOFOLLOW)
> > > +-#define laccess(path, mode)
>    \
> > > +-        (faccessat(AT_FDCWD, (path), (mode), AT_SYMLINK_NOFOLLOW) <
> 0 ? -errno : 0)
> > >  +/*
> > >  +   Avoid using AT_SYMLINK_NOFOLLOW flag. It doesn't seem like the
> right thing to
> > >  +   do and it's not portable (not supported by musl). See:
> > > @@ -94,6 +96,3 @@ index 1d05409086..1ed06c31ab 100644
> > >                                                   continue;
> > >                                   }
> > >
> > > ---
> > > -2.27.0
> > > -
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
> b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
> > > index 89736bcfde..51b145729d 100644
> > > ---
> a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
> > > +++
> b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
> > > @@ -1,8 +1,7 @@
> > > -From dd134880e9a16595ab473934577e873c748e9c7a Mon Sep 17 00:00:00 2001
> > > +From 0c44af262cfa07c57db4b32de1f7610af47797f4 Mon Sep 17 00:00:00 2001
> > >  From: Khem Raj <raj.khem@gmail.com>
> > >  Date: Sun, 27 May 2018 08:36:44 -0700
> > > -Subject: [PATCH 13/26] Define glibc compatible basename() for
> non-glibc
> > > - systems
> > > +Subject: [PATCH] Define glibc compatible basename() for non-glibc
> systems
> > >
> > >  Fixes builds with musl, even though systemd is adamant about
> > >  using non-posix basename implementation, we have a way out
> > > @@ -10,12 +9,13 @@ using non-posix basename implementation, we have a
> way out
> > >  Upstream-Status: Inappropriate [musl specific]
> > >
> > >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > +
> > >  ---
> > >   src/machine/machine-dbus.c | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > >
> > >  diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
> > > -index f5780f1aec..aec5825b3e 100644
> > > +index 3a1e4f9072..ab87b9882c 100644
> > >  --- a/src/machine/machine-dbus.c
> > >  +++ b/src/machine/machine-dbus.c
> > >  @@ -11,6 +11,11 @@
> > > @@ -30,6 +30,3 @@ index f5780f1aec..aec5825b3e 100644
> > >   #include "alloc-util.h"
> > >   #include "bus-common-errors.h"
> > >   #include "bus-get-properties.h"
> > > ---
> > > -2.27.0
> > > -
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
> b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
> > > index e95d2ae078..7444d4375f 100644
> > > ---
> a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
> > > +++
> b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
> > > @@ -1,7 +1,7 @@
> > > -From 55af446156da863b5b36a1109845858956a4c274 Mon Sep 17 00:00:00 2001
> > > +From 0f4b60e34a806055c678eb97a7ec7e21291bcf48 Mon Sep 17 00:00:00 2001
> > >  From: Chen Qi <Qi.Chen@windriver.com>
> > >  Date: Wed, 4 Jul 2018 15:00:44 +0800
> > > -Subject: [PATCH 14/26] Do not disable buffering when writing to
> oom_score_adj
> > > +Subject: [PATCH] Do not disable buffering when writing to
> oom_score_adj
> > >
> > >  On musl, disabling buffering when writing to oom_score_adj will
> > >  cause the following error.
> > > @@ -19,15 +19,16 @@ Upstream-Status: Inappropriate [musl specific]
> > >  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > >  [rebased for systemd 243]
> > >  Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> > > +
> > >  ---
> > >   src/basic/process-util.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > >  diff --git a/src/basic/process-util.c b/src/basic/process-util.c
> > > -index 4417101569..556dab8ebf 100644
> > > +index caa9dfe3a3..6101f43db5 100644
> > >  --- a/src/basic/process-util.c
> > >  +++ b/src/basic/process-util.c
> > > -@@ -1536,7 +1536,7 @@ int set_oom_score_adjust(int value) {
> > > +@@ -1523,7 +1523,7 @@ int set_oom_score_adjust(int value) {
> > >           sprintf(t, "%i", value);
> > >
> > >           return write_string_file("/proc/self/oom_score_adj", t,
> > > @@ -36,6 +37,3 @@ index 4417101569..556dab8ebf 100644
> > >   }
> > >
> > >   int pidfd_get_pid(int fd, pid_t *ret) {
> > > ---
> > > -2.27.0
> > > -
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
> b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
> > > index 5cdcf84dc1..90cc70d216 100644
> > > ---
> a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
> > > +++
> b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
> > > @@ -1,7 +1,7 @@
> > > -From e382845aed90cfe4496a8351d57d4466dd2e9a9c Mon Sep 17 00:00:00 2001
> > > +From c30ab62d18ce88187f5eb6c236e0977c9337f68d Mon Sep 17 00:00:00 2001
> > >  From: Chen Qi <Qi.Chen@windriver.com>
> > >  Date: Tue, 10 Jul 2018 15:40:17 +0800
> > > -Subject: [PATCH 15/26] distinguish XSI-compliant strerror_r from
> GNU-specifi
> > > +Subject: [PATCH] distinguish XSI-compliant strerror_r from GNU-specifi
> > >   strerror_r
> > >
> > >  XSI-compliant strerror_r and GNU-specifi strerror_r are different.
> > > @@ -18,28 +18,12 @@ assigned to (char *) variable, resulting in
> segment fault.
> > >  Upstream-Status: Inappropriate [musl specific]
> > >
> > >  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > +
> > >  ---
> > > - src/journal/journal-send.c        | 5 +++++
> > > - src/libsystemd/sd-bus/bus-error.c | 5 +++++
> > > + src/libsystemd/sd-bus/bus-error.c        | 5 +++++
> > > + src/libsystemd/sd-journal/journal-send.c | 5 +++++
> > >   2 files changed, 10 insertions(+)
> > >
> > > -diff --git a/src/journal/journal-send.c b/src/journal/journal-send.c
> > > -index e8e6ad555b..8ca5271d02 100644
> > > ---- a/src/journal/journal-send.c
> > > -+++ b/src/journal/journal-send.c
> > > -@@ -348,7 +348,12 @@ static int fill_iovec_perror_and_send(const char
> *message, int skip, struct iove
> > > -                 char* j;
> > > -
> > > -                 errno = 0;
> > > -+#ifndef __GLIBC__
> > > -+                strerror_r(_saved_errno_, buffer + 8 + k, n - 8 - k);
> > > -+                j = buffer + 8 + k;
> > > -+#else
> > > -                 j = strerror_r(_saved_errno_, buffer + 8 + k, n - 8
> - k);
> > > -+#endif
> > > -                 if (errno == 0) {
> > > -                         char error[STRLEN("ERRNO=") +
> DECIMAL_STR_MAX(int) + 1];
> > > -
> > >  diff --git a/src/libsystemd/sd-bus/bus-error.c
> b/src/libsystemd/sd-bus/bus-error.c
> > >  index 8da2024a50..9605a9b869 100644
> > >  --- a/src/libsystemd/sd-bus/bus-error.c
> > > @@ -57,6 +41,20 @@ index 8da2024a50..9605a9b869 100644
> > >                   if (errno == ERANGE || strlen(x) >= k - 1) {
> > >                           free(m);
> > >                           k *= 2;
> > > ---
> > > -2.27.0
> > > -
> > > +diff --git a/src/libsystemd/sd-journal/journal-send.c
> b/src/libsystemd/sd-journal/journal-send.c
> > > +index e8e6ad555b..8ca5271d02 100644
> > > +--- a/src/libsystemd/sd-journal/journal-send.c
> > > ++++ b/src/libsystemd/sd-journal/journal-send.c
> > > +@@ -348,7 +348,12 @@ static int fill_iovec_perror_and_send(const char
> *message, int skip, struct iove
> > > +                 char* j;
> > > +
> > > +                 errno = 0;
> > > ++#ifndef __GLIBC__
> > > ++                strerror_r(_saved_errno_, buffer + 8 + k, n - 8 - k);
> > > ++                j = buffer + 8 + k;
> > > ++#else
> > > +                 j = strerror_r(_saved_errno_, buffer + 8 + k, n - 8
> - k);
> > > ++#endif
> > > +                 if (errno == 0) {
> > > +                         char error[STRLEN("ERRNO=") +
> DECIMAL_STR_MAX(int) + 1];
> > > +
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
> b/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
> > > index 9a125de638..de7f9ecfa2 100644
> > > ---
> a/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
> > > +++
> b/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
> > > @@ -1,7 +1,7 @@
> > > -From 0c7af5f288231a8c0545e169e01ba5ee173cafe7 Mon Sep 17 00:00:00 2001
> > > +From fa86e5578256dddb296fd30128929ea7c4b792a4 Mon Sep 17 00:00:00 2001
> > >  From: Chen Qi <Qi.Chen@windriver.com>
> > >  Date: Mon, 25 Feb 2019 15:18:00 +0800
> > > -Subject: [PATCH 16/26] Hide __start_BUS_ERROR_MAP and
> __stop_BUS_ERROR_MAP
> > > +Subject: [PATCH] Hide __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
> > >
> > >  for currently unknown reasons they get exported to the shared libries
> > >  even without being listed in the sym file
> > > @@ -11,6 +11,7 @@ Upstream-Status: Pending
> > >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >  [Rebased for v241]
> > >  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > +
> > >  ---
> > >   src/libsystemd/sd-bus/bus-error.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > @@ -30,6 +31,3 @@ index 9605a9b869..38b6cf90c3 100644
> > >
> > >   /* Additional maps registered with sd_bus_error_add_map() are in this
> > >    * NULL terminated array */
> > > ---
> > > -2.27.0
> > > -
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
> b/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
> > > index 31747c6b40..d9ef2b8a47 100644
> > > ---
> a/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
> > > +++
> b/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
> > > @@ -1,7 +1,7 @@
> > > -From 32dd7a47b87793cd836ab4bb776d1524f24c2d58 Mon Sep 17 00:00:00 2001
> > > +From 11e730694706fa354a0e43c588ef66677a777d9a Mon Sep 17 00:00:00 2001
> > >  From: Chen Qi <Qi.Chen@windriver.com>
> > >  Date: Mon, 25 Feb 2019 15:27:54 +0800
> > > -Subject: [PATCH 17/26] missing_type.h: add __compar_d_fn_t definition
> > > +Subject: [PATCH] missing_type.h: add __compar_d_fn_t definition
> > >
> > >  Fix the following compile failure:
> > >  src/basic/util.h:71:18: error: unknown type name '__compar_d_fn_t';
> did you mean '__compar_fn_t'?
> > > @@ -9,6 +9,7 @@ src/basic/util.h:71:18: error: unknown type name
> '__compar_d_fn_t'; did you mean
> > >  Upstream-Status: Inappropriate [musl specific]
> > >
> > >  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > +
> > >  ---
> > >   src/basic/missing_type.h | 1 +
> > >   1 file changed, 1 insertion(+)
> > > @@ -25,6 +26,3 @@ index 3df1084ef2..697aa7f58a 100644
> > >   #endif
> > >
> > >   #ifndef __COMPAR_FN_T
> > > ---
> > > -2.27.0
> > > -
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
> b/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
> > > index 56d361a213..3b60854233 100644
> > > ---
> a/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
> > > +++
> b/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
> > > @@ -1,7 +1,7 @@
> > > -From bfc3416edeb69082ac9b9c9e844f12d7b45bb006 Mon Sep 17 00:00:00 2001
> > > +From 45bae28d3da6607d33d54f4b30a500f5249aadde Mon Sep 17 00:00:00 2001
> > >  From: Chen Qi <Qi.Chen@windriver.com>
> > >  Date: Mon, 25 Feb 2019 15:44:54 +0800
> > > -Subject: [PATCH 18/26] avoid redefinition of prctl_mm_map structure
> > > +Subject: [PATCH] avoid redefinition of prctl_mm_map structure
> > >
> > >  Fix the following compile failure:
> > >  error: redefinition of 'struct prctl_mm_map'
> > > @@ -9,6 +9,7 @@ error: redefinition of 'struct prctl_mm_map'
> > >  Upstream-Status: Inappropriate [musl specific]
> > >
> > >  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > +
> > >  ---
> > >   src/basic/missing_prctl.h | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > @@ -27,6 +28,3 @@ index ab851306ba..5547cad875 100644
> > >
> > >   /* 58319057b7847667f0c9585b9de0e8932b0fdb08 (4.3) */
> > >   #ifndef PR_CAP_AMBIENT
> > > ---
> > > -2.27.0
> > > -
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
> b/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
> > > index 6ca196489b..7d6433f317 100644
> > > ---
> a/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
> > > +++
> b/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
> > > @@ -1,16 +1,17 @@
> > > -From e427f03de2c56e868bb0f24aa231315b2dae1b71 Mon Sep 17 00:00:00 2001
> > > +From 6e593ff2afbe4bfe15eee2ec34e51490a38462f5 Mon Sep 17 00:00:00 2001
> > >  From: Alex Kiernan <alex.kiernan@gmail.com>
> > >  Date: Fri, 7 Aug 2020 15:19:27 +0000
> > > -Subject: [PATCH 19/26] Handle missing LOCK_EX
> > > +Subject: [PATCH] Handle missing LOCK_EX
> > >
> > >  Upstream-Status: Inappropriate [musl specific]
> > >  Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > +
> > >  ---
> > >   src/partition/makefs.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > >
> > >  diff --git a/src/partition/makefs.c b/src/partition/makefs.c
> > > -index fd924d2231..b97580fdcc 100644
> > > +index 7c94fbfedb..42f966722d 100644
> > >  --- a/src/partition/makefs.c
> > >  +++ b/src/partition/makefs.c
> > >  @@ -6,6 +6,7 @@
> > > @@ -21,6 +22,3 @@ index fd924d2231..b97580fdcc 100644
> > >
> > >   #include "alloc-util.h"
> > >   #include "blockdev-util.h"
> > > ---
> > > -2.27.0
> > > -
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
> b/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
> > > index f74de43849..1faee1c055 100644
> > > ---
> a/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
> > > +++
> b/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
> > > @@ -1,7 +1,7 @@
> > > -From 9abbc5e69e21aef0d4d4567e69302fa660b76c53 Mon Sep 17 00:00:00 2001
> > > +From ac579b296aa29c2f1dad9425c6d795e154ec8f7c Mon Sep 17 00:00:00 2001
> > >  From: Alex Kiernan <alex.kiernan@gmail.com>
> > >  Date: Fri, 7 Aug 2020 15:20:17 +0000
> > > -Subject: [PATCH 20/26] Fix incompatible pointer type struct
> sockaddr_un *
> > > +Subject: [PATCH] Fix incompatible pointer type struct sockaddr_un *
> > >
> > >  | ../../../../../../workspace/sources/systemd/src/nspawn/nspawn.c: In
> function 'cant_be_in_netns':
> > >  |
> ../../../../../../workspace/sources/systemd/src/nspawn/nspawn.c:4893:25:
> error: passing argument 2 of 'connect' from incompatible pointer type
> [-Werror=incompatible-pointer-types]
> > > @@ -18,15 +18,16 @@ Subject: [PATCH 20/26] Fix incompatible pointer
> type struct sockaddr_un *
> > >
> > >  Upstream-Status: Inappropriate [musl specific]
> > >  Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > +
> > >  ---
> > >   src/nspawn/nspawn.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > >  diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
> > > -index 0842731c18..3528b7ff14 100644
> > > +index a4ac8ed2bb..0c41a48d4b 100644
> > >  --- a/src/nspawn/nspawn.c
> > >  +++ b/src/nspawn/nspawn.c
> > > -@@ -5084,7 +5084,7 @@ static int cant_be_in_netns(void) {
> > > +@@ -5125,7 +5125,7 @@ static int cant_be_in_netns(void) {
> > >           if (fd < 0)
> > >                   return log_error_errno(errno, "Failed to allocate
> udev control socket: %m");
> > >
> > > @@ -35,6 +36,3 @@ index 0842731c18..3528b7ff14 100644
> > >
> > >                   if (errno == ENOENT || ERRNO_IS_DISCONNECT(errno))
> > >                           return
> log_error_errno(SYNTHETIC_ERRNO(EOPNOTSUPP),
> > > ---
> > > -2.27.0
> > > -
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
> b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
> > > index fa6652a5bf..14c8ff73a0 100644
> > > ---
> a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
> > > +++
> b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
> > > @@ -1,7 +1,7 @@
> > > -From 1f5bc54bed0b365e7e448c26f6c792dbe8b3b198 Mon Sep 17 00:00:00 2001
> > > +From 6bc78df50adb48d24a2abfdf65b44b932cc5a571 Mon Sep 17 00:00:00 2001
> > >  From: Chen Qi <Qi.Chen@windriver.com>
> > >  Date: Mon, 25 Feb 2019 16:53:06 +0800
> > > -Subject: [PATCH 21/26] test-json.c: define M_PIl
> > > +Subject: [PATCH] test-json.c: define M_PIl
> > >
> > >  Fix the following compile failure:
> > >  src/test/test-json.c:305:50: error: 'M_PIl' undeclared (first use in
> this function); did you mean 'M_PI'?
> > > @@ -9,6 +9,7 @@ src/test/test-json.c:305:50: error: 'M_PIl' undeclared
> (first use in this functi
> > >  Upstream-Status: Inappropriate [musl specific]
> > >
> > >  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > +
> > >  ---
> > >   src/test/test-json.c | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > @@ -28,6 +29,3 @@ index 1d4b11945e..572c8cf9d0 100644
> > >   static void test_tokenizer(const char *data, ...) {
> > >           unsigned line = 0, column = 0;
> > >           void *state = NULL;
> > > ---
> > > -2.27.0
> > > -
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
> b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
> > > index 675fd20f11..bd627c51e9 100644
> > > ---
> a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
> > > +++
> b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
> > > @@ -1,7 +1,7 @@
> > > -From 564dba5ad0cd884e3f69fa19ca64095413578ea5 Mon Sep 17 00:00:00 2001
> > > +From 7cb6579572b50ef44bc0a321a4c73cce55b0c2f2 Mon Sep 17 00:00:00 2001
> > >  From: Chen Qi <Qi.Chen@windriver.com>
> > >  Date: Fri, 1 Mar 2019 15:22:15 +0800
> > > -Subject: [PATCH 22/26] do not disable buffer in writing files
> > > +Subject: [PATCH] do not disable buffer in writing files
> > >
> > >  Do not disable buffer in writing files, otherwise we get
> > >  failure at boot for musl like below.
> > > @@ -18,10 +18,12 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > >  Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > >  [rebased for systemd 243]
> > >  Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> > > +
> > >  ---
> > >   src/basic/cgroup-util.c                 | 10 +++++-----
> > >   src/basic/procfs-util.c                 |  4 ++--
> > >   src/basic/smack-util.c                  |  2 +-
> > > + src/basic/sysctl-util.c                 |  2 +-
> > >   src/basic/util.c                        |  2 +-
> > >   src/binfmt/binfmt.c                     |  6 +++---
> > >   src/core/main.c                         |  4 ++--
> > > @@ -32,18 +34,15 @@ Signed-off-by: Scott Murray <
> scott.murray@konsulko.com>
> > >   src/nspawn/nspawn-cgroup.c              |  2 +-
> > >   src/nspawn/nspawn.c                     |  6 +++---
> > >   src/shared/cgroup-setup.c               |  4 ++--
> > > - src/shared/sysctl-util.c                |  2 +-
> > >   src/sleep/sleep.c                       |  8 ++++----
> > > - src/udev/udevadm-trigger.c              |  2 +-
> > > - src/udev/udevd.c                        |  2 +-
> > >   src/vconsole/vconsole-setup.c           |  2 +-
> > > - 18 files changed, 35 insertions(+), 35 deletions(-)
> > > + 16 files changed, 33 insertions(+), 33 deletions(-)
> > >
> > >  diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
> > > -index bb960f183c..cb804c5f4b 100644
> > > +index 50c1ae1b2b..5b40e92163 100644
> > >  --- a/src/basic/cgroup-util.c
> > >  +++ b/src/basic/cgroup-util.c
> > > -@@ -759,7 +759,7 @@ int cg_install_release_agent(const char
> *controller, const char *agent) {
> > > +@@ -765,7 +765,7 @@ int cg_install_release_agent(const char
> *controller, const char *agent) {
> > >
> > >           sc = strstrip(contents);
> > >           if (isempty(sc)) {
> > > @@ -52,7 +51,7 @@ index bb960f183c..cb804c5f4b 100644
> > >                   if (r < 0)
> > >                           return r;
> > >           } else if (!path_equal(sc, agent))
> > > -@@ -777,7 +777,7 @@ int cg_install_release_agent(const char
> *controller, const char *agent) {
> > > +@@ -783,7 +783,7 @@ int cg_install_release_agent(const char
> *controller, const char *agent) {
> > >
> > >           sc = strstrip(contents);
> > >           if (streq(sc, "0")) {
> > > @@ -61,7 +60,7 @@ index bb960f183c..cb804c5f4b 100644
> > >                   if (r < 0)
> > >                           return r;
> > >
> > > -@@ -804,7 +804,7 @@ int cg_uninstall_release_agent(const char
> *controller) {
> > > +@@ -810,7 +810,7 @@ int cg_uninstall_release_agent(const char
> *controller) {
> > >           if (r < 0)
> > >                   return r;
> > >
> > > @@ -70,7 +69,7 @@ index bb960f183c..cb804c5f4b 100644
> > >           if (r < 0)
> > >                   return r;
> > >
> > > -@@ -814,7 +814,7 @@ int cg_uninstall_release_agent(const char
> *controller) {
> > > +@@ -820,7 +820,7 @@ int cg_uninstall_release_agent(const char
> *controller) {
> > >           if (r < 0)
> > >                   return r;
> > >
> > > @@ -79,7 +78,7 @@ index bb960f183c..cb804c5f4b 100644
> > >           if (r < 0)
> > >                   return r;
> > >
> > > -@@ -1646,7 +1646,7 @@ int cg_set_attribute(const char *controller,
> const char *path, const char *attri
> > > +@@ -1650,7 +1650,7 @@ int cg_set_attribute(const char *controller,
> const char *path, const char *attri
> > >           if (r < 0)
> > >                   return r;
> > >
> > > @@ -121,11 +120,24 @@ index 3362ee3924..80c0f2a52e 100644
> > >           if (r < 0)
> > >                   return r;
> > >
> > > +diff --git a/src/basic/sysctl-util.c b/src/basic/sysctl-util.c
> > > +index c96b5cd77f..d2476d9665 100644
> > > +--- a/src/basic/sysctl-util.c
> > > ++++ b/src/basic/sysctl-util.c
> > > +@@ -93,7 +93,7 @@ int sysctl_write_ip_property(int af, const char
> *ifname, const char *property, c
> > > +
> > > +         log_debug("Setting '%s' to '%s'", p, value);
> > > +
> > > +-        return write_string_file(p, value,
> WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER);
> > > ++        return write_string_file(p, value,
> WRITE_STRING_FILE_VERIFY_ON_FAILURE | 0);
> > > + }
> > > +
> > > + int sysctl_read(const char *property, char **ret) {
> > >  diff --git a/src/basic/util.c b/src/basic/util.c
> > > -index f98ecf3858..13e0f7431f 100644
> > > +index 955b18bd2a..6d89c90176 100644
> > >  --- a/src/basic/util.c
> > >  +++ b/src/basic/util.c
> > > -@@ -267,7 +267,7 @@ void disable_coredumps(void) {
> > > +@@ -234,7 +234,7 @@ void disable_coredumps(void) {
> > >           if (detect_container() > 0)
> > >                   return;
> > >
> > > @@ -135,7 +147,7 @@ index f98ecf3858..13e0f7431f 100644
> > >                   log_debug_errno(r, "Failed to turn off coredumps,
> ignoring: %m");
> > >   }
> > >  diff --git a/src/binfmt/binfmt.c b/src/binfmt/binfmt.c
> > > -index 43ed2f385b..37a6f578f7 100644
> > > +index f6b72e0bae..e9fd4d06be 100644
> > >  --- a/src/binfmt/binfmt.c
> > >  +++ b/src/binfmt/binfmt.c
> > >  @@ -48,7 +48,7 @@ static int delete_rule(const char *rule) {
> > > @@ -156,7 +168,7 @@ index 43ed2f385b..37a6f578f7 100644
> > >           if (r < 0)
> > >                   return log_error_errno(r, "Failed to add binary
> format: %m");
> > >
> > > -@@ -223,7 +223,7 @@ static int run(int argc, char *argv[]) {
> > > +@@ -222,7 +222,7 @@ static int run(int argc, char *argv[]) {
> > >                   }
> > >
> > >                   /* Flush out all rules */
> > > @@ -166,10 +178,10 @@ index 43ed2f385b..37a6f578f7 100644
> > >                   STRV_FOREACH(f, files) {
> > >                           k = apply_file(*f, true);
> > >  diff --git a/src/core/main.c b/src/core/main.c
> > > -index a280b756ff..334532cd42 100644
> > > +index 3ee8d0a869..ec36e3e80f 100644
> > >  --- a/src/core/main.c
> > >  +++ b/src/core/main.c
> > > -@@ -1382,7 +1382,7 @@ static int bump_unix_max_dgram_qlen(void) {
> > > +@@ -1401,7 +1401,7 @@ static int bump_unix_max_dgram_qlen(void) {
> > >           if (v >= DEFAULT_UNIX_MAX_DGRAM_QLEN)
> > >                   return 0;
> > >
> > > @@ -178,7 +190,7 @@ index a280b756ff..334532cd42 100644
> > >           if (r < 0)
> > >                   return log_full_errno(IN_SET(r, -EROFS, -EPERM,
> -EACCES) ? LOG_DEBUG : LOG_WARNING, r,
> > >                                         "Failed to bump AF_UNIX
> datagram queue length, ignoring: %m");
> > > -@@ -1666,7 +1666,7 @@ static void initialize_core_pattern(bool
> skip_setup) {
> > > +@@ -1678,7 +1678,7 @@ static void initialize_core_pattern(bool
> skip_setup) {
> > >           if (getpid_cached() != 1)
> > >                   return;
> > >
> > > @@ -188,7 +200,7 @@ index a280b756ff..334532cd42 100644
> > >                   log_warning_errno(r, "Failed to write '%s' to
> /proc/sys/kernel/core_pattern, ignoring: %m", arg_early_core_pattern);
> > >   }
> > >  diff --git a/src/core/smack-setup.c b/src/core/smack-setup.c
> > > -index 1fe592af70..603942a000 100644
> > > +index 8cc1696a4f..ab7b4ba2c3 100644
> > >  --- a/src/core/smack-setup.c
> > >  +++ b/src/core/smack-setup.c
> > >  @@ -325,17 +325,17 @@ int mac_smack_setup(bool *loaded_policy) {
> > > @@ -214,7 +226,7 @@ index 1fe592af70..603942a000 100644
> > >                   log_warning_errno(r, "Failed to set SMACK netlabel
> rule \"127.0.0.1 -CIPSO\": %m");
> > >   #endif
> > >  diff --git a/src/hibernate-resume/hibernate-resume.c
> b/src/hibernate-resume/hibernate-resume.c
> > > -index d8f91f4e66..a088e6e2d8 100644
> > > +index 58e35e403e..1d0beb4008 100644
> > >  --- a/src/hibernate-resume/hibernate-resume.c
> > >  +++ b/src/hibernate-resume/hibernate-resume.c
> > >  @@ -45,7 +45,7 @@ int main(int argc, char *argv[]) {
> > > @@ -227,20 +239,20 @@ index d8f91f4e66..a088e6e2d8 100644
> > >                   log_error_errno(r, "Failed to write '%s' to
> /sys/power/resume: %m", major_minor);
> > >                   return EXIT_FAILURE;
> > >  diff --git a/src/libsystemd/sd-device/sd-device.c
> b/src/libsystemd/sd-device/sd-device.c
> > > -index d06f90ce1d..43d0a58750 100644
> > > +index d82f01a164..b8fd63346c 100644
> > >  --- a/src/libsystemd/sd-device/sd-device.c
> > >  +++ b/src/libsystemd/sd-device/sd-device.c
> > > -@@ -1976,7 +1976,7 @@ _public_ int
> sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
> > > +@@ -1987,7 +1987,7 @@ _public_ int
> sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
> > >           if (!value)
> > >                   return -ENOMEM;
> > >
> > >  -        r = write_string_file(path, value,
> WRITE_STRING_FILE_DISABLE_BUFFER | WRITE_STRING_FILE_NOFOLLOW);
> > >  +        r = write_string_file(path, value, 0 |
> WRITE_STRING_FILE_NOFOLLOW);
> > >           if (r < 0) {
> > > -                 if (r == -ELOOP)
> > > -                         return -EINVAL;
> > > +                 /* On failure, clear cache entry, as we do not know
> how it fails. */
> > > +                 device_remove_cached_sysattr_value(device, sysattr);
> > >  diff --git a/src/login/logind-dbus.c b/src/login/logind-dbus.c
> > > -index 7d757aa286..a5d9da5b7e 100644
> > > +index 3bc424b83b..5f5eef0843 100644
> > >  --- a/src/login/logind-dbus.c
> > >  +++ b/src/login/logind-dbus.c
> > >  @@ -1330,7 +1330,7 @@ static int trigger_device(Manager *m, sd_device
> *d) {
> > > @@ -266,10 +278,10 @@ index cb01b25bc6..e92051268b 100644
> > >                   log_error_errno(r, "Failed to move process: %m");
> > >                   goto finish;
> > >  diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
> > > -index 3528b7ff14..11b0c20f95 100644
> > > +index 0c41a48d4b..9c893b18e4 100644
> > >  --- a/src/nspawn/nspawn.c
> > >  +++ b/src/nspawn/nspawn.c
> > > -@@ -2667,7 +2667,7 @@ static int reset_audit_loginuid(void) {
> > > +@@ -2695,7 +2695,7 @@ static int reset_audit_loginuid(void) {
> > >           if (streq(p, "4294967295"))
> > >                   return 0;
> > >
> > > @@ -278,7 +290,7 @@ index 3528b7ff14..11b0c20f95 100644
> > >           if (r < 0) {
> > >                   log_error_errno(r,
> > >                                   "Failed to reset audit login UID.
> This probably means that your kernel is too\n"
> > > -@@ -3920,13 +3920,13 @@ static int setup_uid_map(pid_t pid) {
> > > +@@ -3948,13 +3948,13 @@ static int setup_uid_map(pid_t pid) {
> > >
> > >           xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
> > >           xsprintf(line, UID_FMT " " UID_FMT " " UID_FMT "\n", 0,
> arg_uid_shift, arg_uid_range);
> > > @@ -316,21 +328,8 @@ index f197f715c7..077f893177 100644
> > >                           if (r < 0) {
> > >                                   log_debug_errno(r, "Failed to %s
> controller %s for %s (%s): %m",
> > >                                                   FLAGS_SET(mask, bit)
> ? "enable" : "disable", n, p, fs);
> > > -diff --git a/src/shared/sysctl-util.c b/src/shared/sysctl-util.c
> > > -index 670c33108b..7c7c3dcfb6 100644
> > > ---- a/src/shared/sysctl-util.c
> > > -+++ b/src/shared/sysctl-util.c
> > > -@@ -93,7 +93,7 @@ int sysctl_write_ip_property(int af, const char
> *ifname, const char *property, c
> > > -
> > > -         log_debug("Setting '%s' to '%s'", p, value);
> > > -
> > > --        return write_string_file(p, value,
> WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER);
> > > -+        return write_string_file(p, value,
> WRITE_STRING_FILE_VERIFY_ON_FAILURE | 0);
> > > - }
> > > -
> > > - int sysctl_read(const char *property, char **content) {
> > >  diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
> > > -index 39ab554290..d0e566645d 100644
> > > +index 262d4cea66..0523e8dc9b 100644
> > >  --- a/src/sleep/sleep.c
> > >  +++ b/src/sleep/sleep.c
> > >  @@ -48,7 +48,7 @@ static int write_hibernate_location_info(const
> HibernateLocation *hibernate_loca
> > > @@ -369,34 +368,8 @@ index 39ab554290..d0e566645d 100644
> > >                   if (k >= 0)
> > >                           return 0;
> > >                   log_debug_errno(k, "Failed to write '%s' to
> /sys/power/state: %m", *state);
> > > -diff --git a/src/udev/udevadm-trigger.c b/src/udev/udevadm-trigger.c
> > > -index 5c74184c33..65f528314e 100644
> > > ---- a/src/udev/udevadm-trigger.c
> > > -+++ b/src/udev/udevadm-trigger.c
> > > -@@ -43,7 +43,7 @@ static int exec_list(sd_device_enumerator *e, const
> char *action, Set **settle_s
> > > -                 if (!filename)
> > > -                         return log_oom();
> > > -
> > > --                r = write_string_file(filename, action,
> WRITE_STRING_FILE_DISABLE_BUFFER);
> > > -+                r = write_string_file(filename, action, 0);
> > > -                 if (r < 0) {
> > > -                         bool ignore = IN_SET(r, -ENOENT, -ENODEV);
> > > -
> > > -diff --git a/src/udev/udevd.c b/src/udev/udevd.c
> > > -index d24b8d4398..d123a43904 100644
> > > ---- a/src/udev/udevd.c
> > > -+++ b/src/udev/udevd.c
> > > -@@ -1192,7 +1192,7 @@ static int synthesize_change_one(sd_device
> *dev, const char *syspath) {
> > > -
> > > -         filename = strjoina(syspath, "/uevent");
> > > -         log_device_debug(dev, "device is closed, synthesising
> 'change' on %s", syspath);
> > > --        r = write_string_file(filename, "change",
> WRITE_STRING_FILE_DISABLE_BUFFER);
> > > -+        r = write_string_file(filename, "change", 0);
> > > -         if (r < 0)
> > > -                 return log_device_debug_errno(dev, r, "Failed to
> write 'change' to %s: %m", filename);
> > > -         return 0;
> > >  diff --git a/src/vconsole/vconsole-setup.c
> b/src/vconsole/vconsole-setup.c
> > > -index b28e2853e1..115b7233a0 100644
> > > +index d1c3febdd5..1cc68694d1 100644
> > >  --- a/src/vconsole/vconsole-setup.c
> > >  +++ b/src/vconsole/vconsole-setup.c
> > >  @@ -116,7 +116,7 @@ static int toggle_utf8_vc(const char *name, int
> fd, bool utf8) {
> > > @@ -408,6 +381,3 @@ index b28e2853e1..115b7233a0 100644
> > >           if (r < 0)
> > >                   return log_warning_errno(r, "Failed to %s sysfs
> UTF-8 flag: %m", enable_disable(utf8));
> > >
> > > ---
> > > -2.27.0
> > > -
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
> b/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
> > > index 1cc3985d12..7d1bd60255 100644
> > > ---
> a/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
> > > +++
> b/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
> > > @@ -1,7 +1,7 @@
> > > -From bbda4a48a34662393117fc677c3a678d4ce4c2ec Mon Sep 17 00:00:00 2001
> > > +From d73755cc60f401f0f20f357752e45aeeeef8e83f Mon Sep 17 00:00:00 2001
> > >  From: Scott Murray <scott.murray@konsulko.com>
> > >  Date: Fri, 13 Sep 2019 19:26:27 -0400
> > > -Subject: [PATCH 25/26] Handle __cpu_mask usage
> > > +Subject: [PATCH] Handle __cpu_mask usage
> > >
> > >  Fixes errors:
> > >
> > > @@ -18,6 +18,7 @@ add a typedef to cpu-set-util.h defining __cpu_mask
> appropriately.
> > >  Upstream-Status: Inappropriate [musl specific]
> > >
> > >  Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> > > +
> > >  ---
> > >   src/shared/cpu-set-util.h | 2 ++
> > >   src/test/test-sizeof.c    | 2 +-
> > > @@ -55,6 +56,3 @@ index e1a59d408c..c269ea6e8c 100644
> > >
> > >   /* Print information about various types. Useful when diagnosing
> > >    * gcc diagnostics on an unfamiliar architecture. */
> > > ---
> > > -2.27.0
> > > -
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
> b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
> > > index 4180afb08e..068600fa44 100644
> > > ---
> a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
> > > +++
> b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
> > > @@ -1,7 +1,7 @@
> > > -From 47bf88f74717b417e4adbcc04256334b2335c873 Mon Sep 17 00:00:00 2001
> > > +From 04e94f9a15101daa8f65a9af269d26cda2a24056 Mon Sep 17 00:00:00 2001
> > >  From: Alex Kiernan <alex.kiernan@gmail.com>
> > >  Date: Tue, 10 Mar 2020 11:05:20 +0000
> > > -Subject: [PATCH 26/26] Handle missing gshadow
> > > +Subject: [PATCH] Handle missing gshadow
> > >
> > >  gshadow usage is now present in the userdb code. Mask all uses of it
> to
> > >  allow compilation on musl
> > > @@ -10,6 +10,7 @@ Upstream-Status: Inappropriate [musl specific]
> > >  Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > >  [Rebased for v247]
> > >  Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > +
> > >  ---
> > >   src/shared/user-record-nss.c | 20 ++++++++++++++++++++
> > >   src/shared/user-record-nss.h |  4 ++++
> > > @@ -138,10 +139,10 @@ index 22ab04d6ee..4e52e7a911 100644
> > >   #include <shadow.h>
> > >
> > >  diff --git a/src/shared/userdb.c b/src/shared/userdb.c
> > > -index 2d480283d1..0d19764f2e 100644
> > > +index 613350bd46..5c821d28cd 100644
> > >  --- a/src/shared/userdb.c
> > >  +++ b/src/shared/userdb.c
> > > -@@ -929,13 +929,16 @@ int groupdb_iterator_get(UserDBIterator
> *iterator, GroupRecord **ret) {
> > > +@@ -938,13 +938,16 @@ int groupdb_iterator_get(UserDBIterator
> *iterator, GroupRecord **ret) {
> > >                   if (gr) {
> > >                           _cleanup_free_ char *buffer = NULL;
> > >                           bool incomplete = false;
> > > @@ -155,10 +156,10 @@ index 2d480283d1..0d19764f2e 100644
> > >                                   iterator->synthesize_nobody = false;
> > >
> > >  +#if ENABLE_GSHADOW
> > > -                         r = nss_sgrp_for_group(gr, &sgrp, &buffer);
> > > -                         if (r < 0) {
> > > -                                 log_debug_errno(r, "Failed to
> acquire shadow entry for group %s, ignoring: %m", gr->gr_name);
> > > -@@ -943,6 +946,9 @@ int groupdb_iterator_get(UserDBIterator
> *iterator, GroupRecord **ret) {
> > > +                         if (!FLAGS_SET(iterator->flags,
> USERDB_AVOID_SHADOW)) {
> > > +                                 r = nss_sgrp_for_group(gr, &sgrp,
> &buffer);
> > > +                                 if (r < 0) {
> > > +@@ -957,6 +960,9 @@ int groupdb_iterator_get(UserDBIterator
> *iterator, GroupRecord **ret) {
> > >                           }
> > >
> > >                           r = nss_group_to_group_record(gr, r >= 0 ?
> &sgrp : NULL, ret);
> > > @@ -168,6 +169,3 @@ index 2d480283d1..0d19764f2e 100644
> > >                           if (r < 0)
> > >                                   return r;
> > >
> > > ---
> > > -2.27.0
> > > -
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch
> b/meta/recipes-core/systemd/systemd/0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch
> > > deleted file mode 100644
> > > index 94a4c307b5..0000000000
> > > ---
> a/meta/recipes-core/systemd/systemd/0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch
> > > +++ /dev/null
> > > @@ -1,97 +0,0 @@
> > > -From 297aba739cd689e4dc9f43bb1422ec88d481099a Mon Sep 17 00:00:00 2001
> > > -From: Paul Gortmaker <paul.gortmaker@windriver.com>
> > > -Date: Wed, 13 Jan 2021 21:09:33 +0000
> > > -Subject: [PATCH] proc: dont trigger mount error with invalid options
> on old
> > > - kernels
> > > -
> > > -As of commit 4e39995371738b04d98d27b0d34ea8fe09ec9fab ("core:
> introduce
> > > -ProtectProc= and ProcSubset= to expose hidepid= and subset= procfs
> > > -mount options") kernels older than v5.8 generate multple warnings at
> > > -boot, as seen in this Yocto build from today:
> > > -
> > > -     qemux86-64 login: root
> > > -     [   65.829009] proc: Bad value for 'hidepid'
> > > -     root@qemux86-64:~# dmesg|grep proc:
> > > -     [   16.990706] proc: Bad value for 'hidepid'
> > > -     [   28.060178] proc: Bad value for 'hidepid'
> > > -     [   28.874229] proc: Bad value for 'hidepid'
> > > -     [   32.685107] proc: Bad value for 'hidepid'
> > > -     [   65.829009] proc: Bad value for 'hidepid'
> > > -     root@qemux86-64:~#
> > > -
> > > -The systemd maintainer has dismissed this as something people should
> > > -simply ignore[1] and has no interest in trying to avoid it by
> > > -proactively checking the kernel version, so people can safely assume
> > > -that they will never see this version check commit upstream.
> > > -
> > > -However, as can be seen above, telling people to just ignore it is not
> > > -an option, as we'll end up answering the same question and dealing
> with
> > > -the same bug over and over again.
> > > -
> > > -The commit that triggers this is systemd v247-rc1~378^2~3 -- so any
> > > -systemd 247 and above plus kernel v5.7 or older will need this.
> > > -
> > > -[1] https://github.com/systemd/systemd/issues/16896
> > > -
> > > -Upstream-Status: Denied [
> https://github.com/systemd/systemd/issues/16896]
> > > -Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> > > -
> > > -Index: git/src/core/namespace.c
> > > -===================================================================
> > > ---- git.orig/src/core/namespace.c
> > > -+++ git/src/core/namespace.c
> > > -@@ -4,7 +4,9 @@
> > > - #include <linux/loop.h>
> > > - #include <sched.h>
> > > - #include <stdio.h>
> > > -+#include <stdlib.h>
> > > - #include <sys/mount.h>
> > > -+#include <sys/utsname.h>
> > > - #include <unistd.h>
> > > - #include <linux/fs.h>
> > > -
> > > -@@ -860,13 +862,32 @@ static int mount_sysfs(const MountEntry
> > > -
> > > - static int mount_procfs(const MountEntry *m, const NamespaceInfo
> *ns_info) {
> > > -         const char *entry_path;
> > > --        int r;
> > > -+        int r, major, minor;
> > > -+        struct utsname uts;
> > > -+        bool old = false;
> > > -
> > > -         assert(m);
> > > -         assert(ns_info);
> > > -
> > > -         entry_path = mount_entry_path(m);
> > > -
> > > -+        /* If uname says that the system is older than v5.8, then
> the textual hidepid= stuff is not
> > > -+         * supported by the kernel, and thus the per-instance
> hidepid= neither, which means we
> > > -+         * really don't want to use it, since it would affect our
> host's /proc * mount. Hence let's
> > > -+         * gracefully fallback to a classic, unrestricted version. */
> > > -+
> > > -+        r = uname(&uts);
> > > -+        if (r < 0)
> > > -+               return errno;
> > > -+
> > > -+        major = atoi(uts.release);
> > > -+        minor = atoi(strchr(uts.release, '.') + 1);
> > > -+
> > > -+        if (major < 5 || (major == 5 && minor < 8)) {
> > > -+                log_debug("Pre v5.8 kernel detected [v%d.%d] -
> skipping hidepid=", major, minor);
> > > -+                old = true;
> > > -+        }
> > > -+
> > > -         /* Mount a new instance, so that we get the one that matches
> our user namespace, if we are running in
> > > -          * one. i.e we don't reuse existing mounts here under any
> condition, we want a new instance owned by
> > > -          * our user namespace and with our hidepid= settings
> applied. Hence, let's get rid of everything
> > > -@@ -875,8 +896,8 @@ static int mount_procfs(const MountEntry
> > > -         (void) mkdir_p_label(entry_path, 0755);
> > > -         (void) umount_recursive(entry_path, 0);
> > > -
> > > --        if (ns_info->protect_proc != PROTECT_PROC_DEFAULT ||
> > > --            ns_info->proc_subset != PROC_SUBSET_ALL) {
> > > -+        if (!old && (ns_info->protect_proc != PROTECT_PROC_DEFAULT ||
> > > -+            ns_info->proc_subset != PROC_SUBSET_ALL)) {
> > > -                 _cleanup_free_ char *opts = NULL;
> > > -
> > > -                 /* Starting with kernel 5.8 procfs' hidepid= logic
> is truly per-instance (previously it
> > > diff --git
> a/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
> b/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
> > > index bbee6e6b28..2289404d8d 100644
> > > ---
> a/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
> > > +++
> b/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
> > > @@ -1,4 +1,4 @@
> > > -From 7b32582c066549fea0f7180a6c575e7fa37a867f Mon Sep 17 00:00:00 2001
> > > +From 366cd28f5f93ba7c861cd32a718251770d74830e Mon Sep 17 00:00:00 2001
> > >  From: Khem Raj <raj.khem@gmail.com>
> > >  Date: Mon, 12 Apr 2021 23:44:53 -0700
> > >  Subject: [PATCH] missing_syscall.h: Define MIPS ABI defines for musl
> > > @@ -10,15 +10,16 @@ them here in case they are undefined
> > >  Upstream-Status: Pending
> > >
> > >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > +
> > >  ---
> > >   src/basic/missing_syscall.h | 6 ++++++
> > >   1 file changed, 6 insertions(+)
> > >
> > >  diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
> > > -index 0594a1b930..495d161334 100644
> > > +index 1384324804..0202d00372 100644
> > >  --- a/src/basic/missing_syscall.h
> > >  +++ b/src/basic/missing_syscall.h
> > > -@@ -15,6 +15,12 @@
> > > +@@ -20,6 +20,12 @@
> > >   #include <asm/sgidefs.h>
> > >   #endif
> > >
> > > @@ -28,9 +29,6 @@ index 0594a1b930..495d161334 100644
> > >  +#define _MIPS_SIM_ABI64               3
> > >  +#endif
> > >  +
> > > - #if defined(__x86_64__) && defined(__ILP32__)
> > > - #  define systemd_SC_arch_bias(x) ((x) | /* __X32_SYSCALL_BIT */
> 0x40000000)
> > > - #elif defined(__ia64__)
> > > ---
> > > -2.31.1
> > > -
> > > + #include "missing_keyctl.h"
> > > + #include "missing_stat.h"
> > > + #include "missing_syscall_def.h"
> > > diff --git a/meta/recipes-core/systemd/systemd_247.6.bb
> b/meta/recipes-core/systemd/systemd_248.3.bb
> > > similarity index 99%
> > > rename from meta/recipes-core/systemd/systemd_247.6.bb
> > > rename to meta/recipes-core/systemd/systemd_248.3.bb
> > > index ce6ac7ebaa..b241330d96 100644
> > > --- a/meta/recipes-core/systemd/systemd_247.6.bb
> > > +++ b/meta/recipes-core/systemd/systemd_248.3.bb
> > > @@ -14,7 +14,8 @@ inherit useradd pkgconfig meson perlnative
> update-rc.d update-alternatives qemu
> > >  # that we don't build both udev and systemd in world builds.
> > >  REQUIRED_DISTRO_FEATURES = "systemd"
> > >
> > > -SRC_URI += "file://touchscreen.rules \
> > > +SRC_URI += " \
> > > +           file://touchscreen.rules \
> > >             file://00-create-volatile.conf \
> > >             ${@bb.utils.contains('PACKAGECONFIG',
> 'polkit_hostnamed_fallback',
> 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
> > >             ${@bb.utils.contains('PACKAGECONFIG',
> 'polkit_hostnamed_fallback', 'file://00-hostnamed-network-user.conf', '',
> d)} \
> > > @@ -24,9 +25,6 @@ SRC_URI += "file://touchscreen.rules \
> > >
>  file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
> > >             file://0003-implment-systemd-sysv-install-for-OE.patch \
> > >
>  file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
> > > -
>  file://0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch \
> > > -
>  file://0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch \
> > > -
>  file://0001-analyze-resolve-executable-path-if-it-is-relative.patch \
> > >             "
> > >
> > >  # patches needed by musl
> > > @@ -474,6 +472,7 @@ FILES_${PN}-container =
> "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
> > >                           ${rootlibexecdir}/systemd/systemd-machined \
> > >                           ${rootlibexecdir}/systemd/systemd-pull \
> > >
>  ${exec_prefix}/lib/tmpfiles.d/systemd-nspawn.conf \
> > > +                         ${exec_prefix}/lib/tmpfiles.d/README \
> > >                           ${systemd_system_unitdir}/systemd-nspawn@.service
> \
> > >                           ${libdir}/libnss_mymachines.so.2 \
> > >
>  ${datadir}/dbus-1/system-services/org.freedesktop.import1.service \
> > > @@ -605,6 +604,7 @@ FILES_${PN} = " ${base_bindir}/* \
> > >                  ${exec_prefix}/lib/environment.d \
> > >                  ${localstatedir} \
> > >                  ${rootlibexecdir}/modprobe.d/systemd.conf \
> > > +                ${rootlibexecdir}/modprobe.d/README \
> > >
> ${datadir}/dbus-1/system.d/org.freedesktop.timedate1.conf \
> > >
> ${datadir}/dbus-1/system.d/org.freedesktop.locale1.conf \
> > >
> ${datadir}/dbus-1/system.d/org.freedesktop.network1.conf \
> > > @@ -647,6 +647,7 @@ FILES_udev += "${base_sbindir}/udevd \
> > >                 ${rootlibexecdir}/udev/ata_id \
> > >                 ${rootlibexecdir}/udev/cdrom_id \
> > >                 ${rootlibexecdir}/udev/collect \
> > > +               ${rootlibexecdir}/udev/dmi_memory_id \
> > >                 ${rootlibexecdir}/udev/fido_id \
> > >                 ${rootlibexecdir}/udev/findkeyboards \
> > >                 ${rootlibexecdir}/udev/keyboard-force-release.sh \
> > > @@ -674,6 +675,7 @@ FILES_udev += "${base_sbindir}/udevd \
> > >
>  ${rootlibexecdir}/udev/rules.d/61-autosuspend-manual.rules \
> > >                 ${rootlibexecdir}/udev/rules.d/64-btrfs.rules \
> > >                 ${rootlibexecdir}/udev/rules.d/70-joystick.rules \
> > > +               ${rootlibexecdir}/udev/rules.d/70-memory.rules \
> > >                 ${rootlibexecdir}/udev/rules.d/70-mouse.rules \
> > >                 ${rootlibexecdir}/udev/rules.d/70-power-switch.rules \
> > >                 ${rootlibexecdir}/udev/rules.d/70-touchpad.rules \
> > > @@ -683,6 +685,7 @@ FILES_udev += "${base_sbindir}/udevd \
> > >                 ${rootlibexecdir}/udev/rules.d/80-drivers.rules \
> > >                 ${rootlibexecdir}/udev/rules.d/80-net-setup-link.rules
> \
> > >                 ${rootlibexecdir}/udev/rules.d/90-vconsole.rules \
> > > +               ${rootlibexecdir}/udev/rules.d/README \
> > >                 ${sysconfdir}/udev \
> > >                 ${sysconfdir}/init.d/systemd-udevd \
> > >                 ${systemd_unitdir}/system/*udev* \
> > > --
> > > 2.31.1
> > >
> > >
> > > 
> > >
>

--000000000000fafdc905c322d93e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have to ask: should musl patches for systemd be mai=
ntained separately? It&#39;s a big pile, they aren&#39;t accepted by upstre=
am, they aren&#39;t tested on the AB (hence I didn&#39;t even notice the br=
eakage), and they cause rebase problems at every version upgrade.</div><div=
><br></div><div>I would propose that a separate recipe is made that takes t=
he sources from a repo, rather than carry the patches in oe-core.</div><div=
><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=
=3D"ltr" class=3D"gmail_attr">On Tue, 25 May 2021 at 03:41, Khem Raj &lt;<=
a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">since master-next br=
oke my CI, I have sent a fix on top of this.<br>
Please include that<br>
<br>
On Mon, May 24, 2021 at 5:18 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Fails to compile for musl<br>
&gt;<br>
&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/585507/" re=
l=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/D=
etails/585507/</a><br>
&gt;<br>
&gt; src/basic/percent-util.c source file needs to include<br>
&gt;<br>
&gt; #include &quot;missing_stdlib.h&quot;<br>
&gt;<br>
&gt; like other files in 0005-src-basic-missing.h-check-for-missing-strndu=
pa.patch<br>
&gt;<br>
&gt; On Mon, May 24, 2021 at 2:14 AM Alexander Kanavin<br>
&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.=
kanavin@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Drop backports:<br>
&gt; &gt; 48fff0a2af3f62acd446ebec8081b039b72caad8.patch<br>
&gt; &gt; 7c5fd25119a495009ea62f79e5daec34cc464628.patch<br>
&gt; &gt; 0001-analyze-resolve-executable-path-if-it-is-relative.patch<br>
&gt; &gt; 0001-analyze-resolve-executable-path-if-it-is-relative.patch<br>
&gt; &gt;<br>
&gt; &gt; Drop 0027-proc-dont-trigger-mount-error-with-invalid-options-o.p=
atch<br>
&gt; &gt; as difficult to rebase; please resend if you feel strongly that<=
br>
&gt; &gt; it is needed.<br>
&gt; &gt;<br>
&gt; &gt; Rebase the big pile of musl patches.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kana=
vin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 ...f0a2af3f62acd446ebec8081b039b72caad8.patch | 179 ------=
--------<br>
&gt; &gt;=C2=A0 ...d25119a495009ea62f79e5daec34cc464628.patch |=C2=A0 53 -=
---<br>
&gt; &gt;=C2=A0 ...<a href=3D"http://md-boot_247.6.bb" rel=3D"noreferrer" =
target=3D"_blank">md-boot_247.6.bb</a> =3D&gt; <a href=3D"http://systemd-bo=
ot_248.3.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_248.3.bb</a>=
} |=C2=A0 =C2=A00<br>
&gt; &gt;=C2=A0 meta/recipes-core/systemd/systemd.inc=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt; &gt;=C2=A0 ...ve-executable-path-if-it-is-relative.patch |=C2=A0 39 -=
--<br>
&gt; &gt;=C2=A0 ...chvt-as-non-root-user-without-polkit.patch | 227 ------=
------------<br>
&gt; &gt;=C2=A0 ...002-don-t-use-glibc-specific-qsort_r.patch |=C2=A0 29 +=
+-<br>
&gt; &gt;=C2=A0 ...dd-__compare_fn_t-and-comparison_fn_.patch |=C2=A0 26 +=
-<br>
&gt; &gt;=C2=A0 ...k-parse_printf_format-implementation.patch |=C2=A0 46 +=
+--<br>
&gt; &gt;=C2=A0 ...missing.h-check-for-missing-strndupa.patch | 204 ++++++=
++++++----<br>
&gt; &gt;=C2=A0 .../0006-Include-netinet-if_ether.h.patch=C2=A0 =C2=A0 =C2=
=
=A0|=C2=A0 56 +++--<br>
&gt; &gt;=C2=A0 ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |=C2=A0 17 +=
-<br>
&gt; &gt;=C2=A0 ...008-add-missing-FTW_-macros-for-musl.patch |=C2=A0 =C2=
=A08 +-<br>
&gt; &gt;=C2=A0 ..._register_atfork-for-non-glibc-build.patch |=C2=A0 12 +=
-<br>
&gt; &gt;=C2=A0 ...10-Use-uintmax_t-for-handling-rlim_t.patch |=C2=A0 18 +=
-<br>
&gt; &gt;=C2=A0 ...sable-tests-for-missing-typedefs-in-.patch |=C2=A0 =C2=
=A09 +-<br>
&gt; &gt;=C2=A0 ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |=C2=A0 19 +=
-<br>
&gt; &gt;=C2=A0 ...patible-basename-for-non-glibc-syste.patch |=C2=A0 11 +=
-<br>
&gt; &gt;=C2=A0 ...uffering-when-writing-to-oom_score_a.patch |=C2=A0 12 +=
-<br>
&gt; &gt;=C2=A0 ...compliant-strerror_r-from-GNU-specif.patch |=C2=A0 46 +=
+--<br>
&gt; &gt;=C2=A0 ...S_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch |=C2=A0 =C2=
=A08 +-<br>
&gt; &gt;=C2=A0 ...ype.h-add-__compar_d_fn_t-definition.patch |=C2=A0 =C2=
=A08 +-<br>
&gt; &gt;=C2=A0 ...definition-of-prctl_mm_map-structure.patch |=C2=A0 =C2=
=A08 +-<br>
&gt; &gt;=C2=A0 .../systemd/0019-Handle-missing-LOCK_EX.patch |=C2=A0 10 +=
-<br>
&gt; &gt;=C2=A0 ...ible-pointer-type-struct-sockaddr_un.patch |=C2=A0 12 +=
-<br>
&gt; &gt;=C2=A0 .../0021-test-json.c-define-M_PIl.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
&gt; &gt;=C2=A0 ...-not-disable-buffer-in-writing-files.patch | 116 ++++--=
---<br>
&gt; &gt;=C2=A0 .../0025-Handle-__cpu_mask-usage.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A08 +-<br>
&gt; &gt;=C2=A0 .../systemd/0026-Handle-missing-gshadow.patch |=C2=A0 20 +=
-<br>
&gt; &gt;=C2=A0 ...r-mount-error-with-invalid-options-o.patch |=C2=A0 97 -=
-------<br>
&gt; &gt;=C2=A0 ...l.h-Define-MIPS-ABI-defines-for-musl.patch |=C2=A0 16 +=
-<br>
&gt; &gt;=C2=A0 .../{<a href=3D"http://systemd_247.6.bb" rel=3D"noreferrer=
" target=3D"_blank">systemd_247.6.bb</a> =3D&gt; <a href=3D"http://systemd_=
248.3.bb" rel=3D"noreferrer" target=3D"_blank">systemd_248.3.bb</a>}=C2=A0 =
=
=C2=A0 |=C2=A0 11 +-<br>
&gt; &gt;=C2=A0 32 files changed, 388 insertions(+), 951 deletions(-)<br>
&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-core/systemd/files/48fff0a=
2af3f62acd446ebec8081b039b72caad8.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-core/systemd/files/7c5fd25=
119a495009ea62f79e5daec34cc464628.patch<br>
&gt; &gt;=C2=A0 rename meta/recipes-core/systemd/{<a href=3D"http://system=
d-boot_247.6.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_247.6.bb=
</a> =3D&gt; <a href=3D"http://systemd-boot_248.3.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">systemd-boot_248.3.bb</a>} (100%)<br>
&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-core/systemd/systemd/0001-=
analyze-resolve-executable-path-if-it-is-relative.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-core/systemd/systemd/0001-=
logind-Restore-chvt-as-non-root-user-without-polkit.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-core/systemd/systemd/0027-=
proc-dont-trigger-mount-error-with-invalid-options-o.patch<br>
&gt; &gt;=C2=A0 rename meta/recipes-core/systemd/{<a href=3D"http://system=
d_247.6.bb" rel=3D"noreferrer" target=3D"_blank">systemd_247.6.bb</a> =3D&g=
t; <a href=3D"http://systemd_248.3.bb" rel=3D"noreferrer" target=3D"_blank"=
>systemd_248.3.bb</a>} (99%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/files/48fff0a2af3f62acd44=
6ebec8081b039b72caad8.patch b/meta/recipes-core/systemd/files/48fff0a2af3f6=
2acd446ebec8081b039b72caad8.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index e3ce296741..0000000000<br>
&gt; &gt; --- a/meta/recipes-core/systemd/files/48fff0a2af3f62acd446ebec80=
81b039b72caad8.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,179 +0,0 @@<br>
&gt; &gt; -From 48fff0a2af3f62acd446ebec8081b039b72caad8 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; -From: Daan De Meyer &lt;<a href=3D"mailto:daan.j.demeyer@gmail.=
com" target=3D"_blank">daan.j.demeyer@gmail.com</a>&gt;<br>
&gt; &gt; -Date: Fri, 12 Mar 2021 22:09:44 +0000<br>
&gt; &gt; -Subject: [PATCH] boot: Move console declarations to missing_efi=
.h<br>
&gt; &gt; -<br>
&gt; &gt; -These were added to eficonex.h in gnu-efi 3.0.13. Let&#39;s mov=
e them<br>
&gt; &gt; -to missing_efi.h behind an appropriate guard to fix the build w=
ith<br>
&gt; &gt; -recent versions of gnu-efi.<br>
&gt; &gt; -<br>
&gt; &gt; -(cherry picked from commit 95ba433a5f34baf92921fb58051bc8241f90=
8c0e)<br>
&gt; &gt; -<br>
&gt; &gt; -Upstream-Status: Backport<br>
&gt; &gt; -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kan=
avin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; ----<br>
&gt; &gt; - src/boot/efi/console.c=C2=A0 =C2=A0 =C2=A0| 57 ---------------=
-----------------<br>
&gt; &gt; - src/boot/efi/console.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +---<br>
&gt; &gt; - src/boot/efi/missing_efi.h | 67 ++++++++++++++++++++++++++++++=
++++++++<br>
&gt; &gt; - 3 files changed, 68 insertions(+), 62 deletions(-)<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/src/boot/efi/console.c b/src/boot/efi/console.c<br=
>
&gt; &gt; -index 2dd4543d51..1d6dfeeea2 100644<br>
&gt; &gt; ---- a/src/boot/efi/console.c<br>
&gt; &gt; -+++ b/src/boot/efi/console.c<br>
&gt; &gt; -@@ -9,63 +9,6 @@<br>
&gt; &gt; - #define SYSTEM_FONT_WIDTH 8<br>
&gt; &gt; - #define SYSTEM_FONT_HEIGHT 19<br>
&gt; &gt; -<br>
&gt; &gt; --#define EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL_GUID \<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 { 0xdd9e7534, 0x7762, 0x4698, { 0x=
8c, 0x14, 0xf5, 0x85, 0x17, 0xa6, 0x25, 0xaa } }<br>
&gt; &gt; --<br>
&gt; &gt; --struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL;<br>
&gt; &gt; --<br>
&gt; &gt; --typedef EFI_STATUS (EFIAPI *EFI_INPUT_RESET_EX)(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct _EFI_SIMPLE_TEXT_INPUT_EX_P=
ROTOCOL *This,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 BOOLEAN ExtendedVerification<br>
&gt; &gt; --);<br>
&gt; &gt; --<br>
&gt; &gt; --typedef UINT8 EFI_KEY_TOGGLE_STATE;<br>
&gt; &gt; --<br>
&gt; &gt; --typedef struct {<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 UINT32 KeyShiftState;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_TOGGLE_STATE KeyToggleStat=
e;<br>
&gt; &gt; --} EFI_KEY_STATE;<br>
&gt; &gt; --<br>
&gt; &gt; --typedef struct {<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_INPUT_KEY Key;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_STATE KeyState;<br>
&gt; &gt; --} EFI_KEY_DATA;<br>
&gt; &gt; --<br>
&gt; &gt; --typedef EFI_STATUS (EFIAPI *EFI_INPUT_READ_KEY_EX)(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct _EFI_SIMPLE_TEXT_INPUT_EX_P=
ROTOCOL *This,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_DATA *KeyData<br>
&gt; &gt; --);<br>
&gt; &gt; --<br>
&gt; &gt; --typedef EFI_STATUS (EFIAPI *EFI_SET_STATE)(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct _EFI_SIMPLE_TEXT_INPUT_EX_P=
ROTOCOL *This,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_TOGGLE_STATE *KeyToggleSta=
te<br>
&gt; &gt; --);<br>
&gt; &gt; --<br>
&gt; &gt; --typedef EFI_STATUS (EFIAPI *EFI_KEY_NOTIFY_FUNCTION)(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_DATA *KeyData<br>
&gt; &gt; --);<br>
&gt; &gt; --<br>
&gt; &gt; --typedef EFI_STATUS (EFIAPI *EFI_REGISTER_KEYSTROKE_NOTIFY)(<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct _EFI_SIMPLE_TEXT_INPUT_EX_P=
ROTOCOL *This,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_DATA KeyData,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_NOTIFY_FUNCTION KeyNotific=
ationFunction,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 VOID **NotifyHandle<br>
&gt; &gt; --);<br>
&gt; &gt; --<br>
&gt; &gt; --typedef EFI_STATUS (EFIAPI *EFI_UNREGISTER_KEYSTROKE_NOTIFY)(<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct _EFI_SIMPLE_TEXT_INPUT_EX_P=
ROTOCOL *This,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 VOID *NotificationHandle<br>
&gt; &gt; --);<br>
&gt; &gt; --<br>
&gt; &gt; --typedef struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL {<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_INPUT_RESET_EX Reset;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_INPUT_READ_KEY_EX ReadKeyStrok=
eEx;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_EVENT WaitForKeyEx;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_SET_STATE SetState;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_REGISTER_KEYSTROKE_NOTIFY Regi=
sterKeyNotify;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_UNREGISTER_KEYSTROKE_NOTIFY Un=
registerKeyNotify;<br>
&gt; &gt; --} EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL;<br>
&gt; &gt; --<br>
&gt; &gt; - EFI_STATUS console_key_read(UINT64 *key, BOOLEAN wait) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EFI_GUID EfiSimpleTextInputEx=
ProtocolGuid =3D EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL_GUID;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static EFI_SIMPLE_TEXT_INPUT_=
EX_PROTOCOL *TextInputEx;<br>
&gt; &gt; -diff --git a/src/boot/efi/console.h b/src/boot/efi/console.h<br=
>
&gt; &gt; -index 41df3a406e..2c69af552a 100644<br>
&gt; &gt; ---- a/src/boot/efi/console.h<br>
&gt; &gt; -+++ b/src/boot/efi/console.h<br>
&gt; &gt; -@@ -1,11 +1,7 @@<br>
&gt; &gt; - /* SPDX-License-Identifier: LGPL-2.1-or-later */<br>
&gt; &gt; - #pragma once<br>
&gt; &gt; -<br>
&gt; &gt; --#define EFI_SHIFT_STATE_VALID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x80000000<br>
&gt; &gt; --#define EFI_RIGHT_CONTROL_PRESSED=C2=A0 =C2=A0 =C2=A0 =C2=A00x=
00000004<br>
&gt; &gt; --#define EFI_LEFT_CONTROL_PRESSED=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x=
00000008<br>
&gt; &gt; --#define EFI_RIGHT_ALT_PRESSED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x00000010<br>
&gt; &gt; --#define EFI_LEFT_ALT_PRESSED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0x00000020<br>
&gt; &gt; -+#include &quot;missing_efi.h&quot;<br>
&gt; &gt; -<br>
&gt; &gt; - #define EFI_CONTROL_PRESSED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0(EFI_RIGHT_CONTROL_PRESSED|EFI_LEFT_CONTROL_PRESSED)<br>
&gt; &gt; - #define EFI_ALT_PRESSED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(EFI_RIGHT_ALT_PRESSED|EFI_LEFT_ALT_PRESSED)<br>
&gt; &gt; -diff --git a/src/boot/efi/missing_efi.h b/src/boot/efi/missing_=
efi.h<br>
&gt; &gt; -index 1b838af2a4..b6aae1eb5b 100644<br>
&gt; &gt; ---- a/src/boot/efi/missing_efi.h<br>
&gt; &gt; -+++ b/src/boot/efi/missing_efi.h<br>
&gt; &gt; -@@ -53,3 +53,70 @@ typedef struct _EFI_RNG_PROTOCOL {<br>
&gt; &gt; - } EFI_RNG_PROTOCOL;<br>
&gt; &gt; -<br>
&gt; &gt; - #endif<br>
&gt; &gt; -+<br>
&gt; &gt; -+#ifndef EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL_GUID<br>
&gt; &gt; -+<br>
&gt; &gt; -+#define EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL_GUID \<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { 0xdd9e7534, 0x7762, 0x4698, { 0x=
8c, 0x14, 0xf5, 0x85, 0x17, 0xa6, 0x25, 0xaa } }<br>
&gt; &gt; -+<br>
&gt; &gt; -+#define EFI_SHIFT_STATE_VALID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x80000000<br>
&gt; &gt; -+#define EFI_RIGHT_CONTROL_PRESSED=C2=A0 =C2=A0 =C2=A0 =C2=A00x=
00000004<br>
&gt; &gt; -+#define EFI_LEFT_CONTROL_PRESSED=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x=
00000008<br>
&gt; &gt; -+#define EFI_RIGHT_ALT_PRESSED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x00000010<br>
&gt; &gt; -+#define EFI_LEFT_ALT_PRESSED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0x00000020<br>
&gt; &gt; -+<br>
&gt; &gt; -+struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL;<br>
&gt; &gt; -+<br>
&gt; &gt; -+typedef EFI_STATUS (EFIAPI *EFI_INPUT_RESET_EX)(<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct _EFI_SIMPLE_TEXT_INPUT_EX_P=
ROTOCOL *This,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BOOLEAN ExtendedVerification<br>
&gt; &gt; -+);<br>
&gt; &gt; -+<br>
&gt; &gt; -+typedef UINT8 EFI_KEY_TOGGLE_STATE;<br>
&gt; &gt; -+<br>
&gt; &gt; -+typedef struct {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 UINT32 KeyShiftState;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_TOGGLE_STATE KeyToggleStat=
e;<br>
&gt; &gt; -+} EFI_KEY_STATE;<br>
&gt; &gt; -+<br>
&gt; &gt; -+typedef struct {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_INPUT_KEY Key;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_STATE KeyState;<br>
&gt; &gt; -+} EFI_KEY_DATA;<br>
&gt; &gt; -+<br>
&gt; &gt; -+typedef EFI_STATUS (EFIAPI *EFI_INPUT_READ_KEY_EX)(<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct _EFI_SIMPLE_TEXT_INPUT_EX_P=
ROTOCOL *This,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_DATA *KeyData<br>
&gt; &gt; -+);<br>
&gt; &gt; -+<br>
&gt; &gt; -+typedef EFI_STATUS (EFIAPI *EFI_SET_STATE)(<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct _EFI_SIMPLE_TEXT_INPUT_EX_P=
ROTOCOL *This,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_TOGGLE_STATE *KeyToggleSta=
te<br>
&gt; &gt; -+);<br>
&gt; &gt; -+<br>
&gt; &gt; -+typedef EFI_STATUS (EFIAPI *EFI_KEY_NOTIFY_FUNCTION)(<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_DATA *KeyData<br>
&gt; &gt; -+);<br>
&gt; &gt; -+<br>
&gt; &gt; -+typedef EFI_STATUS (EFIAPI *EFI_REGISTER_KEYSTROKE_NOTIFY)(<br=
>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct _EFI_SIMPLE_TEXT_INPUT_EX_P=
ROTOCOL *This,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_DATA KeyData,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_NOTIFY_FUNCTION KeyNotific=
ationFunction,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VOID **NotifyHandle<br>
&gt; &gt; -+);<br>
&gt; &gt; -+<br>
&gt; &gt; -+typedef EFI_STATUS (EFIAPI *EFI_UNREGISTER_KEYSTROKE_NOTIFY)(<=
br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct _EFI_SIMPLE_TEXT_INPUT_EX_P=
ROTOCOL *This,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VOID *NotificationHandle<br>
&gt; &gt; -+);<br>
&gt; &gt; -+<br>
&gt; &gt; -+typedef struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_INPUT_RESET_EX Reset;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_INPUT_READ_KEY_EX ReadKeyStrok=
eEx;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_EVENT WaitForKeyEx;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_SET_STATE SetState;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_REGISTER_KEYSTROKE_NOTIFY Regi=
sterKeyNotify;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_UNREGISTER_KEYSTROKE_NOTIFY Un=
registerKeyNotify;<br>
&gt; &gt; -+} EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL;<br>
&gt; &gt; -+<br>
&gt; &gt; -+#endif<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/files/7c5fd25119a495009ea=
62f79e5daec34cc464628.patch b/meta/recipes-core/systemd/files/7c5fd25119a49=
5009ea62f79e5daec34cc464628.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index ae449791f1..0000000000<br>
&gt; &gt; --- a/meta/recipes-core/systemd/files/7c5fd25119a495009ea62f79e5=
daec34cc464628.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,53 +0,0 @@<br>
&gt; &gt; -From 7c5fd25119a495009ea62f79e5daec34cc464628 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; -From: =3D?UTF-8?q?Zbigniew=3D20J=3DC4=3D99drzejewski-Szmek?=3D =
&lt;<a href=3D"mailto:zbyszek@in.waw.pl" target=3D"_blank">zbyszek@in.waw.p=
l</a>&gt;<br>
&gt; &gt; -Date: Mon, 12 Apr 2021 14:03:32 +0200<br>
&gt; &gt; -Subject: [PATCH] meson: do not fail if rsync is not installed w=
ith meson<br>
&gt; &gt; - 0.57.2<br>
&gt; &gt; -<br>
&gt; &gt; -<a href=3D"https://github.com/mesonbuild/meson/issues/8641" rel=
=
=3D"noreferrer" target=3D"_blank">https://github.com/mesonbuild/meson/issu=
es/8641</a><br>
&gt; &gt; -<br>
&gt; &gt; -Our CI started to fail. Even if the change is reverted in meson=
,<br>
&gt; &gt; -we need a quick workaround here.<br>
&gt; &gt; -<br>
&gt; &gt; -Upstream-Status: Backport<br>
&gt; &gt; -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kan=
avin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; ----<br>
&gt; &gt; - man/meson.build | 25 ++++++++++++++-----------<br>
&gt; &gt; - 1 file changed, 14 insertions(+), 11 deletions(-)<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/man/meson.build b/man/meson.build<br>
&gt; &gt; -index 3cae8446cda..f9c4b83dc81 100644<br>
&gt; &gt; ---- a/man/meson.build<br>
&gt; &gt; -+++ b/man/meson.build<br>
&gt; &gt; -@@ -184,17 +184,20 @@ html =3D custom_target(<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depends : html_pages,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command : [&#39;echo&#39;])<b=
r>
&gt; &gt; -<br>
&gt; &gt; --run_target(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;doc-sync&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends : man_pages + html_pages,<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 command : [&#39;rsync&#39;, &#39;-=
rlv&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&#39;--delete-excluded&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&#39;--include=3Dman&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&#39;--include=3D*.html&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&#39;--exclude=3D*&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&#39;--omit-dir-times&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0meson.current_build_dir(),<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0get_option(&#39;www-target&#39;)])<br>
&gt; &gt; -+rsync =3D find_program(&#39;rsync&#39;, required : false)<br>
&gt; &gt; -+if rsync.found()<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 run_target(<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;d=
oc-sync&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depend=
s : man_pages + html_pages,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 comman=
d : [rsync, &#39;-rlv&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--delete-excluded&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--include=3Dman&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--include=3D*.html&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--exclude=3D*&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--omit-dir-times&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meson.current_build_dir(),<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_option(&#39;www-target&#39;)])<br>
&gt; &gt; -+endif<br>
&gt; &gt; -<br>
&gt; &gt; - ############################################################<b=
r>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd=
-boot_247.6.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_247.6.bb<=
/a> b/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_248.3.bb" re=
l=3D"noreferrer" target=3D"_blank">systemd-boot_248.3.bb</a><br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-core/systemd/<a href=3D"http://systemd-=
boot_247.6.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_247.6.bb</=
a><br>
&gt; &gt; rename to meta/recipes-core/systemd/<a href=3D"http://systemd-bo=
ot_248.3.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_248.3.bb</a>=
<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipe=
s-core/systemd/systemd.inc<br>
&gt; &gt; index 88dddb309c..0524a25008 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd.inc<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd.inc<br>
&gt; &gt; @@ -14,11 +14,9 @@ LICENSE =3D &quot;GPLv2 &amp; LGPLv2.1&quot;<=
br>
&gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE.GPL2;md5=3D75141=
9260aa954499f7abaabaa882bbe \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b364516=
c&quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRCREV =3D &quot;17472dca0160cbe7b807ca648475fd70d0d62fe5&quot;=
<br>
&gt; &gt; -SRCBRANCH =3D &quot;v247-stable&quot;<br>
&gt; &gt; +SRCREV =3D &quot;37c4cfde0ce613f0f00544d3f4e2e72bf93d9c76&quot;=
<br>
&gt; &gt; +SRCBRANCH =3D &quot;v248-stable&quot;<br>
&gt; &gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/syste=
md/systemd-stable.git;protocol=3Dgit;branch=3D$%7BSRCBRANCH%7D" rel=3D"nore=
ferrer" target=3D"_blank">github.com/systemd/systemd-stable.git;protocol=3D=
git;branch=3D${SRCBRANCH}</a> \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://7c5fd25119a4950=
09ea62f79e5daec34cc464628.patch \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://48fff0a2af3f62a=
cd446ebec8081b039b72caad8.patch \<br>
&gt; &gt;=C2=A0 &quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0001-analyze-reso=
lve-executable-path-if-it-is-relative.patch b/meta/recipes-core/systemd/sys=
temd/0001-analyze-resolve-executable-path-if-it-is-relative.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index fd7f94a61d..0000000000<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0001-analyze-resolve-exe=
cutable-path-if-it-is-relative.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,39 +0,0 @@<br>
&gt; &gt; -From b9b7a8e3825f0433e120f7a6d7d5d635a839cab9 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; -From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" =
target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt; &gt; -Date: Thu, 21 Jan 2021 06:19:44 +0000<br>
&gt; &gt; -Subject: [PATCH] analyze: resolve executable path if it is rela=
tive<br>
&gt; &gt; -<br>
&gt; &gt; -Upstream-Status: Backport [<a href=3D"https://github.com/system=
d/systemd/commit/f1fb046a985521f7d4a662f02546686ff20b7e5d" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/systemd/systemd/commit/f1fb046a9855=
21f7d4a662f02546686ff20b7e5d</a>]<br>
&gt; &gt; -<br>
&gt; &gt; -Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windri=
ver.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt; &gt; ----<br>
&gt; &gt; - src/analyze/analyze-verify.c | 7 +++++--<br>
&gt; &gt; - 1 file changed, 5 insertions(+), 2 deletions(-)<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/src/analyze/analyze-verify.c b/src/analyze/analyze=
-verify.c<br>
&gt; &gt; -index a9c89173bf..969523df18 100644<br>
&gt; &gt; ---- a/src/analyze/analyze-verify.c<br>
&gt; &gt; -+++ b/src/analyze/analyze-verify.c<br>
&gt; &gt; -@@ -115,14 +115,17 @@ static int verify_socket(Unit *u) {<br>
&gt; &gt; - }<br>
&gt; &gt; -<br>
&gt; &gt; - int verify_executable(Unit *u, const ExecCommand *exec) {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int r;<br>
&gt; &gt; -+<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!exec)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eturn 0;<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (exec-&gt;flags &amp; EXEC=
_COMMAND_IGNORE_FAILURE)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eturn 0;<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (access(exec-&gt;path, X_OK) &l=
t; 0)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
 log_unit_error_errno(u, errno, &quot;Command %s is not executable: %m&quot=
;, exec-&gt;path);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D find_executable_full(exec-&g=
t;path, false, NULL);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
 log_unit_error_errno(u, r, &quot;Command %s is not executable: %m&quot;, e=
xec-&gt;path);<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; - }<br>
&gt; &gt; ---<br>
&gt; &gt; -2.26.2<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0001-logind-Resto=
re-chvt-as-non-root-user-without-polkit.patch b/meta/recipes-core/systemd/s=
ystemd/0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 89ef39bc3e..0000000000<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0001-logind-Restore-chvt=
-as-non-root-user-without-polkit.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,227 +0,0 @@<br>
&gt; &gt; -From 150d9cade6d475570395cb418b824524dead9577 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; -From: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" t=
arget=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
&gt; &gt; -Date: Fri, 30 Oct 2020 08:15:43 -0500<br>
&gt; &gt; -Subject: [PATCH] logind: Restore chvt as non-root user without =
polkit<br>
&gt; &gt; -<br>
&gt; &gt; -4acf0cfd2f (&quot;logind: check PolicyKit before allowing VT sw=
itch&quot;) broke<br>
&gt; &gt; -the ability to write user sessions that run graphical sessions =
(e.g.<br>
&gt; &gt; -weston/X11). This was partially amended in 19bb87fbfa (&quot;lo=
gin: allow<br>
&gt; &gt; -non-console sessions to change vt&quot;) by changing the defaul=
t PolicyKit<br>
&gt; &gt; -policy so that non-root users are again allowed to switch the V=
T. This<br>
&gt; &gt; -makes the policy when PolKit is not enabled (as on many embedde=
d<br>
&gt; &gt; -systems) match the default PolKit policy and allows launching g=
raphical<br>
&gt; &gt; -sessions as a non-root user.<br>
&gt; &gt; -<br>
&gt; &gt; -Closes #17473<br>
&gt; &gt; ----<br>
&gt; &gt; - src/login/logind-dbus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 =
++-------<br>
&gt; &gt; - src/login/logind-polkit.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 26 +++++=
++++++++++++++++<br>
&gt; &gt; - src/login/logind-polkit.h=C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++=
+++<br>
&gt; &gt; - src/login/logind-seat-dbus.c=C2=A0 =C2=A0 | 41 ++++-----------=
------------------<br>
&gt; &gt; - src/login/logind-session-dbus.c | 11 ++-------<br>
&gt; &gt; - src/login/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 1 +<br>
&gt; &gt; - 6 files changed, 46 insertions(+), 54 deletions(-)<br>
&gt; &gt; - create mode 100644 src/login/logind-polkit.c<br>
&gt; &gt; - create mode 100644 src/login/logind-polkit.h<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/src/login/logind-dbus.c b/src/login/logind-dbus.c<=
br>
&gt; &gt; -index 0f83ed99bc..a3765d88ba 100644<br>
&gt; &gt; ---- a/src/login/logind-dbus.c<br>
&gt; &gt; -+++ b/src/login/logind-dbus.c<br>
&gt; &gt; -@@ -30,6 +30,7 @@<br>
&gt; &gt; - #include &quot;format-util.h&quot;<br>
&gt; &gt; - #include &quot;fs-util.h&quot;<br>
&gt; &gt; - #include &quot;logind-dbus.h&quot;<br>
&gt; &gt; -+#include &quot;logind-polkit.h&quot;<br>
&gt; &gt; - #include &quot;logind-seat-dbus.h&quot;<br>
&gt; &gt; - #include &quot;logind-session-dbus.h&quot;<br>
&gt; &gt; - #include &quot;logind-user-dbus.h&quot;<br>
&gt; &gt; -@@ -1047,15 +1048,7 @@ static int method_activate_session_on_se=
at(sd_bus_message *message, void *userda<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eturn sd_bus_error_setf(error, BUS_ERROR_SESSION_NOT_ON_SEAT,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;Session %s not on seat %s&quot;, session_name, seat_name)=
;<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D bus_verify_polkit_async(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 message,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 CAP_SYS_ADMIN,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &quot;org.freedesktop.login1.chvt&quot;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 NULL,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 false,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 UID_INVALID,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &amp;m-&gt;polkit_registry,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 error);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D check_polkit_chvt(message, m=
, error);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eturn r;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r =3D=3D 0)<br>
&gt; &gt; -diff --git a/src/login/logind-polkit.c b/src/login/logind-polki=
t.c<br>
&gt; &gt; -new file mode 100644<br>
&gt; &gt; -index 0000000000..9072570cc6<br>
&gt; &gt; ---- /dev/null<br>
&gt; &gt; -+++ b/src/login/logind-polkit.c<br>
&gt; &gt; -@@ -0,0 +1,26 @@<br>
&gt; &gt; -+/* SPDX-License-Identifier: LGPL-2.1+ */<br>
&gt; &gt; -+<br>
&gt; &gt; -+#include &quot;bus-polkit.h&quot;<br>
&gt; &gt; -+#include &quot;logind-polkit.h&quot;<br>
&gt; &gt; -+#include &quot;missing_capability.h&quot;<br>
&gt; &gt; -+#include &quot;user-util.h&quot;<br>
&gt; &gt; -+<br>
&gt; &gt; -+int check_polkit_chvt(sd_bus_message *message, Manager *manage=
r, sd_bus_error *error) {<br>
&gt; &gt; -+#if ENABLE_POLKIT<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return bus_verify_polkit_async(<br=
>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 message,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 CAP_SYS_ADMIN,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &quot;org.freedesktop.login1.chvt&quot;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 NULL,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 false,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 UID_INVALID,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &amp;manager-&gt;polkit_registry,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 error);<br>
&gt; &gt; -+#else<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Allow chvt when polkit is not p=
resent. This allows a service to start a graphical session as a<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* non-root user when polkit =
is not compiled in, matching the default polkit policy */<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
&gt; &gt; -+#endif<br>
&gt; &gt; -+}<br>
&gt; &gt; -+<br>
&gt; &gt; -+<br>
&gt; &gt; -diff --git a/src/login/logind-polkit.h b/src/login/logind-polki=
t.h<br>
&gt; &gt; -new file mode 100644<br>
&gt; &gt; -index 0000000000..476c077a8a<br>
&gt; &gt; ---- /dev/null<br>
&gt; &gt; -+++ b/src/login/logind-polkit.h<br>
&gt; &gt; -@@ -0,0 +1,10 @@<br>
&gt; &gt; -+/* SPDX-License-Identifier: LGPL-2.1+ */<br>
&gt; &gt; -+#pragma once<br>
&gt; &gt; -+<br>
&gt; &gt; -+#include &quot;sd-bus.h&quot;<br>
&gt; &gt; -+<br>
&gt; &gt; -+#include &quot;bus-object.h&quot;<br>
&gt; &gt; -+#include &quot;logind.h&quot;<br>
&gt; &gt; -+<br>
&gt; &gt; -+int check_polkit_chvt(sd_bus_message *message, Manager *manage=
r, sd_bus_error *error);<br>
&gt; &gt; -+<br>
&gt; &gt; -diff --git a/src/login/logind-seat-dbus.c b/src/login/logind-se=
at-dbus.c<br>
&gt; &gt; -index a945132284..f22e9e2734 100644<br>
&gt; &gt; ---- a/src/login/logind-seat-dbus.c<br>
&gt; &gt; -+++ b/src/login/logind-seat-dbus.c<br>
&gt; &gt; -@@ -9,6 +9,7 @@<br>
&gt; &gt; - #include &quot;bus-polkit.h&quot;<br>
&gt; &gt; - #include &quot;bus-util.h&quot;<br>
&gt; &gt; - #include &quot;logind-dbus.h&quot;<br>
&gt; &gt; -+#include &quot;logind-polkit.h&quot;<br>
&gt; &gt; - #include &quot;logind-seat-dbus.h&quot;<br>
&gt; &gt; - #include &quot;logind-seat.h&quot;<br>
&gt; &gt; - #include &quot;logind-session-dbus.h&quot;<br>
&gt; &gt; -@@ -179,15 +180,7 @@ static int method_activate_session(sd_bus_=
message *message, void *userdata, sd_b<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (session-&gt;seat !=3D s)<=
br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eturn sd_bus_error_setf(error, BUS_ERROR_SESSION_NOT_ON_SEAT, &quot;Session=
 %s not on seat %s&quot;, name, s-&gt;id);<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D bus_verify_polkit_async(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 message,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 CAP_SYS_ADMIN,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &quot;org.freedesktop.login1.chvt&quot;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 NULL,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 false,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 UID_INVALID,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &amp;s-&gt;manager-&gt;polkit_registry,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 error);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D check_polkit_chvt(message, s=
-&gt;manager, error);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eturn r;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r =3D=3D 0)<br>
&gt; &gt; -@@ -215,15 +208,7 @@ static int method_switch_to(sd_bus_message=
 *message, void *userdata, sd_bus_erro<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (to &lt;=3D 0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eturn sd_bus_error_setf(error, SD_BUS_ERROR_INVALID_ARGS, &quot;Invalid vir=
tual terminal&quot;);<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D bus_verify_polkit_async(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 message,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 CAP_SYS_ADMIN,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &quot;org.freedesktop.login1.chvt&quot;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 NULL,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 false,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 UID_INVALID,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &amp;s-&gt;manager-&gt;polkit_registry,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 error);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D check_polkit_chvt(message, s=
-&gt;manager, error);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eturn r;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r =3D=3D 0)<br>
&gt; &gt; -@@ -243,15 +228,7 @@ static int method_switch_to_next(sd_bus_me=
ssage *message, void *userdata, sd_bus<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(message);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(s);<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D bus_verify_polkit_async(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 message,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 CAP_SYS_ADMIN,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &quot;org.freedesktop.login1.chvt&quot;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 NULL,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 false,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 UID_INVALID,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &amp;s-&gt;manager-&gt;polkit_registry,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 error);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D check_polkit_chvt(message, s=
-&gt;manager, error);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eturn r;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r =3D=3D 0)<br>
&gt; &gt; -@@ -271,15 +248,7 @@ static int method_switch_to_previous(sd_bu=
s_message *message, void *userdata, sd<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(message);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(s);<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D bus_verify_polkit_async(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 message,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 CAP_SYS_ADMIN,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &quot;org.freedesktop.login1.chvt&quot;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 NULL,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 false,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 UID_INVALID,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &amp;s-&gt;manager-&gt;polkit_registry,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 error);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D check_polkit_chvt(message, s=
-&gt;manager, error);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eturn r;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r =3D=3D 0)<br>
&gt; &gt; -diff --git a/src/login/logind-session-dbus.c b/src/login/logind=
-session-dbus.c<br>
&gt; &gt; -index ccc5ac8df2..57c8a4e900 100644<br>
&gt; &gt; ---- a/src/login/logind-session-dbus.c<br>
&gt; &gt; -+++ b/src/login/logind-session-dbus.c<br>
&gt; &gt; -@@ -11,6 +11,7 @@<br>
&gt; &gt; - #include &quot;fd-util.h&quot;<br>
&gt; &gt; - #include &quot;logind-brightness.h&quot;<br>
&gt; &gt; - #include &quot;logind-dbus.h&quot;<br>
&gt; &gt; -+#include &quot;logind-polkit.h&quot;<br>
&gt; &gt; - #include &quot;logind-seat-dbus.h&quot;<br>
&gt; &gt; - #include &quot;logind-session-dbus.h&quot;<br>
&gt; &gt; - #include &quot;logind-session-device.h&quot;<br>
&gt; &gt; -@@ -192,15 +193,7 @@ int bus_session_method_activate(sd_bus_mes=
sage *message, void *userdata, sd_bus_<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(message);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(s);<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D bus_verify_polkit_async(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 message,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 CAP_SYS_ADMIN,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &quot;org.freedesktop.login1.chvt&quot;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 NULL,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 false,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 UID_INVALID,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &amp;s-&gt;manager-&gt;polkit_registry,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 error);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D check_polkit_chvt(message, s=
-&gt;manager, error);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eturn r;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r =3D=3D 0)<br>
&gt; &gt; -diff --git a/src/login/meson.build b/src/login/meson.build<br>
&gt; &gt; -index 0a7d3d5440..7e46be2add 100644<br>
&gt; &gt; ---- a/src/login/meson.build<br>
&gt; &gt; -+++ b/src/login/meson.build<br>
&gt; &gt; -@@ -26,6 +26,7 @@ liblogind_core_sources =3D files(&#39;&#39;&#=
39;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logind-device.h<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logind-inhibit.c<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logind-inhibit.h<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 logind-polkit.c<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logind-seat-dbus.c<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logind-seat-dbus.h<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logind-seat.c<br>
&gt; &gt; ---<br>
&gt; &gt; -2.28.0<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0002-don-t-use-gl=
ibc-specific-qsort_r.patch b/meta/recipes-core/systemd/systemd/0002-don-t-u=
se-glibc-specific-qsort_r.patch<br>
&gt; &gt; index d856bcb583..4cdf66e767 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-spe=
cific-qsort_r.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-spe=
cific-qsort_r.patch<br>
&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; -From 66ece0b870b3a34fdabc48b88437e6cc354e9fce Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From 159c53612444ec1df492bae528a5a88a275b93bf Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt;=C2=A0 From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com"=
 target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Mon, 25 Feb 2019 13:41:41 +0800<br>
&gt; &gt; -Subject: [PATCH 02/26] don&#39;t use glibc-specific qsort_r<br>
&gt; &gt; +Subject: [PATCH] don&#39;t use glibc-specific qsort_r<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Upstream-Status: Inappropriate [musl specific]<br>
&gt; &gt;<br>
&gt; &gt; @@ -12,6 +12,7 @@ Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Q=
i.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.v=
alek@siemens.com" target=3D"_blank">andrej.valek@siemens.com</a>&gt;<br>
&gt; &gt;=C2=A0 [Rebased for v247]<br>
&gt; &gt;=C2=A0 Signed-off-by: Luca Boccassi &lt;<a href=3D"mailto:luca.bo=
ccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsoft.com</a>&gt;=
<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/sort-util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 | 14 ------------<br>
&gt; &gt;=C2=A0 =C2=A0src/libsystemd/sd-hwdb/hwdb-util.c | 19 +++++++++++-=
----<br>
&gt; &gt; @@ -19,14 +20,13 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A03 files changed, 38 insertions(+), 31 deletions(-)<b=
r>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h=
<br>
&gt; &gt; -index 1d194a1f04..3394c9eb72 100644<br>
&gt; &gt; +index 49586a4a24..d92a5ab0ed 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/sort-util.h<br>
&gt; &gt;=C2=A0 +++ b/src/basic/sort-util.h<br>
&gt; &gt; -@@ -54,17 +54,3 @@ static inline void _qsort_safe(void *base, s=
ize_t nmemb, size_t size, __compar_f<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
nt (*_func_)(const typeof(p[0])*, const typeof(p[0])*) =3D func; \<br>
&gt; &gt; +@@ -55,18 +55,4 @@ static inline void _qsort_safe(void *base, s=
ize_t nmemb, size_t size, __compar_f<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0_qsort_safe((p), (n), sizeof((p)[0]), (__compar_fn_t) _func_); \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0})<br>
&gt; &gt; --<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 -static inline void qsort_r_safe(void *base, size_t nmemb,=
 size_t size, __compar_d_fn_t compar, void *userdata) {<br>
&gt; &gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nmemb &lt;=3D 1)<br>
&gt; &gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
eturn;<br>
&gt; &gt; @@ -40,11 +40,13 @@ index 1d194a1f04..3394c9eb72 100644<br>
&gt; &gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
nt (*_func_)(const typeof(p[0])*, const typeof(p[0])*, typeof(userdata)) =
=3D func; \<br>
&gt; &gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q=
sort_r_safe((p), (n), sizeof((p)[0]), (__compar_d_fn_t) _func_, userdata); =
\<br>
&gt; &gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 })<br>
&gt; &gt; +-<br>
&gt; &gt; + int cmp_int(const int *a, const int *b);<br>
&gt; &gt;=C2=A0 diff --git a/src/libsystemd/sd-hwdb/hwdb-util.c b/src/libs=
ystemd/sd-hwdb/hwdb-util.c<br>
&gt; &gt; -index 4c94ba9c88..95495dba6d 100644<br>
&gt; &gt; +index fd45ff0f54..ac4b63c49b 100644<br>
&gt; &gt;=C2=A0 --- a/src/libsystemd/sd-hwdb/hwdb-util.c<br>
&gt; &gt;=C2=A0 +++ b/src/libsystemd/sd-hwdb/hwdb-util.c<br>
&gt; &gt; -@@ -126,9 +126,13 @@ static void trie_free(struct trie *trie) {=
<br>
&gt; &gt; +@@ -126,9 +126,13 @@ static struct trie* trie_free(struct trie =
*trie) {<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0DEFINE_TRIVIAL_CLEANUP_FUNC(struct trie*, trie_free)=
;<br>
&gt; &gt;<br>
&gt; &gt; @@ -85,10 +87,10 @@ index 4c94ba9c88..95495dba6d 100644<br>
&gt; &gt;=C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/shared/format-table.c b/src/shared/format=
-table.c<br>
&gt; &gt; -index a13a198b7a..bce10bc607 100644<br>
&gt; &gt; +index dccb796b26..c3ab8ac296 100644<br>
&gt; &gt;=C2=A0 --- a/src/shared/format-table.c<br>
&gt; &gt;=C2=A0 +++ b/src/shared/format-table.c<br>
&gt; &gt; -@@ -1243,30 +1243,32 @@ static int cell_data_compare(TableData =
*a, size_t index_a, TableData *b, size_t<br>
&gt; &gt; +@@ -1290,30 +1290,32 @@ static int cell_data_compare(TableData =
*a, size_t index_a, TableData *b, size_t<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return CMP(index_a, inde=
x_b);<br>
&gt; &gt;=C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt; @@ -131,7 +133,7 @@ index a13a198b7a..bce10bc607 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Order identical lines=
 by the order there were originally added in */<br>
&gt; &gt; -@@ -1844,7 +1846,12 @@ int table_print(Table *t, FILE *f) {<br>
&gt; &gt; +@@ -1952,7 +1954,12 @@ int table_print(Table *t, FILE *f) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0for (size_t i =3D 0; i &lt; n_rows; i++)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sorted[i] =3D i * t-&gt;n_columns;<br>
&gt; &gt;<br>
&gt; &gt; @@ -145,7 +147,7 @@ index a13a198b7a..bce10bc607 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (t-&gt;display_map)<b=
r>
&gt; &gt; -@@ -2440,7 +2447,12 @@ int table_to_json(Table *t, JsonVariant =
**ret) {<br>
&gt; &gt; +@@ -2580,7 +2587,12 @@ int table_to_json(Table *t, JsonVariant =
**ret) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0for (size_t i =3D 0; i &lt; n_rows; i++)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sorted[i] =3D i * t-&gt;n_columns;<br>
&gt; &gt;<br>
&gt; &gt; @@ -159,6 +161,3 @@ index a13a198b7a..bce10bc607 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (t-&gt;display_map)<b=
r>
&gt; &gt; ---<br>
&gt; &gt; -2.27.0<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0003-missing_type=
.h-add-__compare_fn_t-and-comparison_fn_.patch b/meta/recipes-core/systemd/=
systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch<br>
&gt; &gt; index f43a22aa8b..9b1768d9ca 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-=
__compare_fn_t-and-comparison_fn_.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-=
__compare_fn_t-and-comparison_fn_.patch<br>
&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; -From 9f0d5996bbb2db3679a4075fa8301750b786c03b Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From 4afb8adc83348bf75964fc10af7902e04dd62637 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt;=C2=A0 From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com"=
 target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Mon, 25 Feb 2019 13:55:12 +0800<br>
&gt; &gt; -Subject: [PATCH 03/26] missing_type.h: add __compare_fn_t and c=
omparison_fn_t<br>
&gt; &gt; +Subject: [PATCH] missing_type.h: add __compare_fn_t and compari=
son_fn_t<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Make it work with musl where comparison_fn_t and __compare=
_fn_t<br>
&gt; &gt;=C2=A0 is not provided.<br>
&gt; &gt; @@ -13,11 +13,12 @@ Signed-off-by: Alex Kiernan &lt;<a href=3D"m=
ailto:alex.kiernan@gmail.com" target=3D"_blank">alex.kiernan@gmail.com</a>&=
gt;<br>
&gt; &gt;=C2=A0 Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windr=
iver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 [Rebased for v242]<br>
&gt; &gt;=C2=A0 Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.v=
alek@siemens.com" target=3D"_blank">andrej.valek@siemens.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt; - src/basic/missing_type.h | 9 +++++++++<br>
&gt; &gt; - src/basic/sort-util.h=C2=A0 =C2=A0 | 1 +<br>
&gt; &gt; - src/core/kmod-setup.c=C2=A0 =C2=A0 | 1 +<br>
&gt; &gt; - src/journal/catalog.c=C2=A0 =C2=A0 | 1 +<br>
&gt; &gt; + src/basic/missing_type.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 | 9 +++++++++<br>
&gt; &gt; + src/basic/sort-util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 1 +<br>
&gt; &gt; + src/core/kmod-setup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 1 +<br>
&gt; &gt; + src/libsystemd/sd-journal/catalog.c | 1 +<br>
&gt; &gt;=C2=A0 =C2=A04 files changed, 12 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/basic/missing_type.h b/src/basic/missing_=
type.h<br>
&gt; &gt; @@ -38,7 +39,7 @@ index f6233090a9..aeaf6ad5ec 100644<br>
&gt; &gt;=C2=A0 +typedef int (*__compar_fn_t)(const void *, const void *);=
<br>
&gt; &gt;=C2=A0 +#endif<br>
&gt; &gt;=C2=A0 diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h=
<br>
&gt; &gt; -index 3394c9eb72..d9cb2aecb6 100644<br>
&gt; &gt; +index d92a5ab0ed..a63867c716 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/sort-util.h<br>
&gt; &gt;=C2=A0 +++ b/src/basic/sort-util.h<br>
&gt; &gt;=C2=A0 @@ -4,6 +4,7 @@<br>
&gt; &gt; @@ -61,10 +62,10 @@ index 8a7f82812a..a56f12f47f 100644<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#if HAVE_KMOD<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;module-util.h&quot;<br>
&gt; &gt; -diff --git a/src/journal/catalog.c b/src/journal/catalog.c<br>
&gt; &gt; -index 0f6ad8a29e..4e1077ade4 100644<br>
&gt; &gt; ---- a/src/journal/catalog.c<br>
&gt; &gt; -+++ b/src/journal/catalog.c<br>
&gt; &gt; +diff --git a/src/libsystemd/sd-journal/catalog.c b/src/libsyste=
md/sd-journal/catalog.c<br>
&gt; &gt; +index aea3241d18..75e6c56a28 100644<br>
&gt; &gt; +--- a/src/libsystemd/sd-journal/catalog.c<br>
&gt; &gt; ++++ b/src/libsystemd/sd-journal/catalog.c<br>
&gt; &gt;=C2=A0 @@ -28,6 +28,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;string-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;strv.h&quot;<br>
&gt; &gt; @@ -73,6 +74,3 @@ index 0f6ad8a29e..4e1077ade4 100644<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0const char * const catalog_file_dirs[] =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;/usr/local/lib/sys=
temd/catalog/&quot;,<br>
&gt; &gt; ---<br>
&gt; &gt; -2.27.0<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0004-add-fallback=
-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/syste=
md/0004-add-fallback-parse_printf_format-implementation.patch<br>
&gt; &gt; index bdd64a0252..dc40a2fe8d 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_=
printf_format-implementation.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_=
printf_format-implementation.patch<br>
&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; -From f3dbe29f7620a063af4d8eb3ea7c48ecd410200d Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; -From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" targ=
et=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt; -Date: Mon, 25 Feb 2019 14:04:21 +0800<br>
&gt; &gt; -Subject: [PATCH 04/26] add fallback parse_printf_format impleme=
ntation<br>
&gt; &gt; +From 6c18e5f9373da3e3b38f2c5727e2aefe07fcbbd9 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmai=
l.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; +Date: Sat, 22 May 2021 20:26:24 +0200<br>
&gt; &gt; +Subject: [PATCH] [PATCH] add fallback parse_printf_format imple=
mentation<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Upstream-Status: Inappropriate [musl specific]<br>
&gt; &gt;<br>
&gt; &gt; @@ -11,21 +11,21 @@ Signed-off-by: Chen Qi &lt;<a href=3D"mailto=
:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 [rebased for systemd 243]<br>
&gt; &gt;=C2=A0 Signed-off-by: Scott Murray &lt;<a href=3D"mailto:scott.mu=
rray@konsulko.com" target=3D"_blank">scott.murray@konsulko.com</a>&gt;<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt; - meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt; &gt; - src/basic/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 =C2=A05 +<br>
&gt; &gt; - src/basic/parse-printf-format.c | 273 ++++++++++++++++++++++++=
++++++++<br>
&gt; &gt; - src/basic/parse-printf-format.h |=C2=A0 57 +++++++<br>
&gt; &gt; - src/basic/stdio-util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
&gt; &gt; - src/journal/journal-send.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02=
 +-<br>
&gt; &gt; + meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<=
br>
&gt; &gt; + src/basic/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +<br>
&gt; &gt; + src/basic/parse-printf-format.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 | 273 +++++++++++++++++++++++<br>
&gt; &gt; + src/basic/parse-printf-format.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 |=C2=A0 57 +++++<br>
&gt; &gt; + src/basic/stdio-util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt; &gt; + src/libsystemd/sd-journal/journal-send.c |=C2=A0 =C2=A02 +-<br=
>
&gt; &gt;=C2=A0 =C2=A06 files changed, 338 insertions(+), 2 deletions(-)<b=
r>
&gt; &gt;=C2=A0 =C2=A0create mode 100644 src/basic/parse-printf-format.c<b=
r>
&gt; &gt;=C2=A0 =C2=A0create mode 100644 src/basic/parse-printf-format.h<b=
r>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/meson.build b/meson.build<br>
&gt; &gt; -index f406d595e6..6aa47fc755 100644<br>
&gt; &gt; +index 27186d63a3..2abb7b3188 100644<br>
&gt; &gt;=C2=A0 --- a/meson.build<br>
&gt; &gt;=C2=A0 +++ b/meson.build<br>
&gt; &gt; -@@ -646,6 +646,7 @@ endif<br>
&gt; &gt; +@@ -675,6 +675,7 @@ endif<br>
&gt; &gt;=C2=A0 =C2=A0foreach header : [&#39;crypt.h&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&#39;linux/memfd.h&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&#39;linux/vm_sockets.h&#39;,<br>
&gt; &gt; @@ -34,21 +34,21 @@ index f406d595e6..6aa47fc755 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&#39;valgrind/memcheck.h&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&#39;valgrind/valgrind.h&#39;,<br>
&gt; &gt;=C2=A0 diff --git a/src/basic/meson.build b/src/basic/meson.build=
<br>
&gt; &gt; -index 1183ea83ad..aa5c958850 100644<br>
&gt; &gt; +index 60ef801a25..aba2172edd 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/meson.build<br>
&gt; &gt;=C2=A0 +++ b/src/basic/meson.build<br>
&gt; &gt; -@@ -322,6 +322,11 @@ foreach item : [[&#39;af&#39;,=C2=A0 =C2=
=A0 =C2=A0af_list_txt,=C2=A0 =C2=A0 =C2=A0&#39;af&#39;,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;&#39;],<br>
&gt; &gt; - endforeach<br>
&gt; &gt; +@@ -341,6 +341,11 @@ endforeach<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0basic_sources +=3D generated_gperf_headers<br>
&gt; &gt; -+<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 +if conf.get(&#39;HAVE_PRINTF_H&#39;) !=3D 1<br>
&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 basic_sources +=3D [files(&#3=
9;parse-printf-format.c&#39;)]<br>
&gt; &gt;=C2=A0 +endif<br>
&gt; &gt;=C2=A0 +<br>
&gt; &gt; - basic_gcrypt_sources =3D files(<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;gcrypt-util.c&#39;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;gcrypt-util.h&#39;)<br>
&gt; &gt; ++<br>
&gt; &gt; + ############################################################<b=
r>
&gt; &gt; +<br>
&gt; &gt; + arch_list =3D [<br>
&gt; &gt;=C2=A0 diff --git a/src/basic/parse-printf-format.c b/src/basic/p=
arse-printf-format.c<br>
&gt; &gt;=C2=A0 new file mode 100644<br>
&gt; &gt;=C2=A0 index 0000000000..49437e5445<br>
&gt; &gt; @@ -410,10 +410,10 @@ index 6dc1e72312..cea76b36cf 100644<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#define snprintf_ok(buf, len, fmt, ...) \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((size_t) snprintf(buf, =
len, fmt, __VA_ARGS__) &lt; (len))<br>
&gt; &gt; -diff --git a/src/journal/journal-send.c b/src/journal/journal-s=
end.c<br>
&gt; &gt; +diff --git a/src/libsystemd/sd-journal/journal-send.c b/src/lib=
systemd/sd-journal/journal-send.c<br>
&gt; &gt;=C2=A0 index fd3fd7ef9c..e8e6ad555b 100644<br>
&gt; &gt; ---- a/src/journal/journal-send.c<br>
&gt; &gt; -+++ b/src/journal/journal-send.c<br>
&gt; &gt; +--- a/src/libsystemd/sd-journal/journal-send.c<br>
&gt; &gt; ++++ b/src/libsystemd/sd-journal/journal-send.c<br>
&gt; &gt;=C2=A0 @@ -2,7 +2,6 @@<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;errno.h&gt;<br>
&gt; &gt; @@ -431,5 +431,5 @@ index fd3fd7ef9c..e8e6ad555b 100644<br>
&gt; &gt;=C2=A0 =C2=A0#define SNDBUF_SIZE (8*1024*1024)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 --<br>
&gt; &gt; -2.27.0<br>
&gt; &gt; +2.24.0<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-mi=
ssing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/system=
d/0005-src-basic-missing.h-check-for-missing-strndupa.patch<br>
&gt; &gt; index d63e3c0d09..a0d757b3f3 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h=
-check-for-missing-strndupa.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h=
-check-for-missing-strndupa.patch<br>
&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; -From 5aeae0ea89f5af74ed5d95bed1d87a03b3801ff0 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From 6b0732ac7164914ce16e231e35980b849bdfc4c8 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt;=C2=A0 From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com"=
 target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Mon, 25 Feb 2019 14:18:21 +0800<br>
&gt; &gt; -Subject: [PATCH 05/26] src/basic/missing.h: check for missing s=
trndupa<br>
&gt; &gt; +Subject: [PATCH] src/basic/missing.h: check for missing strndup=
a<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 include missing.h=C2=A0 for definition of strndupa<br>
&gt; &gt;<br>
&gt; &gt; @@ -17,6 +17,7 @@ Signed-off-by: Alex Kiernan &lt;<a href=3D"mai=
lto:alex.kiernan@gmail.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt=
;<br>
&gt; &gt;=C2=A0 [rebased for systemd 244]<br>
&gt; &gt;=C2=A0 [Rebased for v247]<br>
&gt; &gt;=C2=A0 Signed-off-by: Luca Boccassi &lt;<a href=3D"mailto:luca.bo=
ccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsoft.com</a>&gt;=
<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=
=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/backlight/backlight.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt; @@ -25,6 +26,7 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"ma=
ilto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsoft=
.com</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/log.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +=
<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/missing_stdlib.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 ++++++++++++<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/mkdir.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt; + src/basic/mountpoint-util.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/parse-util.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/path-lookup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/proc-cmdline.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt; @@ -41,12 +43,12 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0src/coredump/coredump-vacuum.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/journal-remote/journal-remote-main.c=C2=A0 =C2=
=A0|=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/journal/journalctl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt; - src/journal/sd-journal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/libsystemd/sd-bus/bus-message.c=C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/libsystemd/sd-bus/bus-objects.c=C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/libsystemd/sd-bus/bus-socket.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/libsystemd/sd-bus/sd-bus.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/libsystemd/sd-bus/test-bus-benchmark.c |=C2=A0 1=
 +<br>
&gt; &gt; + src/libsystemd/sd-journal/sd-journal.c=C2=A0 =C2=A0 =C2=A0|=C2=
=
=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/locale/keymap-util.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/login/pam_systemd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/network/generator/network-generator.c=C2=A0 |=C2=
=
=A0 1 +<br>
&gt; &gt; @@ -68,18 +70,22 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0src/udev/udev-builtin-path_id.c=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/udev/udev-event.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/udev/udev-rules.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt; - 50 files changed, 61 insertions(+)<br>
&gt; &gt; + 51 files changed, 62 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; +diff --git a/meson.build b/meson.build<br>
&gt; &gt; +index 2abb7b3188..c97f09062b 100644<br>
&gt; &gt;=C2=A0 --- a/meson.build<br>
&gt; &gt;=C2=A0 +++ b/meson.build<br>
&gt; &gt; -@@ -535,6 +535,7 @@ foreach ident : [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #include &lt;sys/w=
ait.h&gt;&#39;&#39;&#39;],<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;mallinfo&#39;,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#39;&#39;#include &lt;malloc.h&gt;&#39;&=
#39;&#39;],<br>
&gt; &gt; +@@ -550,6 +550,7 @@ foreach ident : [<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;execveat&#39;,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#39;&#39;#include &lt;unistd.h&gt;&#39;&=
#39;&#39;],<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;close_range&#39;,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&#39;&#39;#include &lt;unistd.h&gt;&#39;&#=
39;&#39;],<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;epoll_pwait2&#39;,=C2=
=A0 =C2=A0 =C2=A0 &#39;&#39;&#39;#include &lt;sys/epoll.h&gt;&#39;&#39;&#3=
9;],<br>
&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [&#39;strndupa&#39; ,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&#39;&#39;#include &lt;string.h&gt;&#39;&#=
39;&#39;],<br>
&gt; &gt;=C2=A0 =C2=A0]<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0have =3D cc.has_function=
(ident[0], prefix : ident[1], args : &#39;-D_GNU_SOURCE&#39;)<br>
&gt; &gt; +diff --git a/src/backlight/backlight.c b/src/backlight/backligh=
t.c<br>
&gt; &gt; +index 86927be62e..a34be158a0 100644<br>
&gt; &gt;=C2=A0 --- a/src/backlight/backlight.c<br>
&gt; &gt;=C2=A0 +++ b/src/backlight/backlight.c<br>
&gt; &gt;=C2=A0 @@ -19,6 +19,7 @@<br>
&gt; &gt; @@ -90,6 +96,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"ma=
ilto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsoft=
.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static int help(void) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_cleanup_free_ char *lin=
k =3D NULL;<br>
&gt; &gt; +diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c<=
br>
&gt; &gt; +index 8dd3f8cd95..50c1ae1b2b 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/cgroup-util.c<br>
&gt; &gt;=C2=A0 +++ b/src/basic/cgroup-util.c<br>
&gt; &gt;=C2=A0 @@ -38,6 +38,7 @@<br>
&gt; &gt; @@ -100,9 +108,11 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D=
"mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@micros=
oft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static int cg_enumerate_items(const char *controller=
, const char *path, FILE **_f, const char *item) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_cleanup_free_ char *fs =
=
=3D NULL;<br>
&gt; &gt; +diff --git a/src/basic/env-util.c b/src/basic/env-util.c<br>
&gt; &gt; +index c110a750a5..e1f091b01e 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/env-util.c<br>
&gt; &gt;=C2=A0 +++ b/src/basic/env-util.c<br>
&gt; &gt; -@@ -15,6 +15,7 @@<br>
&gt; &gt; +@@ -18,6 +18,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;string-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;strv.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;utf8.h&quot;<br>
&gt; &gt; @@ -110,6 +120,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0/* We follow bash for the character set. Different s=
hells have different rules. */<br>
&gt; &gt;=C2=A0 =C2=A0#define VALID_BASH_ENV_NAME_CHARS=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; &gt; +diff --git a/src/basic/log.c b/src/basic/log.c<br>
&gt; &gt; +index 595db0c395..daff8eb68a 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/log.c<br>
&gt; &gt;=C2=A0 +++ b/src/basic/log.c<br>
&gt; &gt;=C2=A0 @@ -36,6 +36,7 @@<br>
&gt; &gt; @@ -120,6 +132,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#define SNDBUF_SIZE (8*1024*1024)<br>
&gt; &gt;<br>
&gt; &gt; +diff --git a/src/basic/missing_stdlib.h b/src/basic/missing_std=
lib.h<br>
&gt; &gt; +index 8c76f93eb2..9068bfb4f0 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/missing_stdlib.h<br>
&gt; &gt;=C2=A0 +++ b/src/basic/missing_stdlib.h<br>
&gt; &gt;=C2=A0 @@ -11,3 +11,15 @@<br>
&gt; &gt; @@ -138,6 +152,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 (char *)memcpy(__new, __old, __len); \<br>
&gt; &gt;=C2=A0 +=C2=A0 })<br>
&gt; &gt;=C2=A0 +#endif<br>
&gt; &gt; +diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c<br>
&gt; &gt; +index f91f8f7a08..fb31596216 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/mkdir.c<br>
&gt; &gt;=C2=A0 +++ b/src/basic/mkdir.c<br>
&gt; &gt;=C2=A0 @@ -14,6 +14,7 @@<br>
&gt; &gt; @@ -148,9 +164,23 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D=
"mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@micros=
oft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0int mkdir_safe_internal(<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0const char *path,<br>
&gt; &gt; +diff --git a/src/basic/mountpoint-util.c b/src/basic/mountpoint=
-util.c<br>
&gt; &gt; +index 1d617e87b2..346f9a47d7 100644<br>
&gt; &gt; +--- a/src/basic/mountpoint-util.c<br>
&gt; &gt; ++++ b/src/basic/mountpoint-util.c<br>
&gt; &gt; +@@ -12,6 +12,7 @@<br>
&gt; &gt; + #include &quot;missing_stat.h&quot;<br>
&gt; &gt; + #include &quot;missing_syscall.h&quot;<br>
&gt; &gt; + #include &quot;mkdir.h&quot;<br>
&gt; &gt; ++#include &quot;missing_stdlib.h&quot;<br>
&gt; &gt; + #include &quot;mountpoint-util.h&quot;<br>
&gt; &gt; + #include &quot;parse-util.h&quot;<br>
&gt; &gt; + #include &quot;path-util.h&quot;<br>
&gt; &gt; +diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c<br=
>
&gt; &gt; +index b79c885dfd..6dabda5691 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/parse-util.c<br>
&gt; &gt;=C2=A0 +++ b/src/basic/parse-util.c<br>
&gt; &gt; -@@ -22,6 +22,7 @@<br>
&gt; &gt; +@@ -19,6 +19,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;stat-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;string-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;strv.h&quot;<br>
&gt; &gt; @@ -158,6 +188,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0int parse_boolean(const char *v) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!v)<br>
&gt; &gt; +diff --git a/src/basic/path-lookup.c b/src/basic/path-lookup.c<=
br>
&gt; &gt; +index e53c2302b1..ca1d40ccbe 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/path-lookup.c<br>
&gt; &gt;=C2=A0 +++ b/src/basic/path-lookup.c<br>
&gt; &gt;=C2=A0 @@ -15,6 +15,7 @@<br>
&gt; &gt; @@ -168,6 +200,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0int xdg_user_runtime_dir(char **ret, const char *suf=
fix) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *e;<br>
&gt; &gt; +diff --git a/src/basic/proc-cmdline.c b/src/basic/proc-cmdline.=
c<br>
&gt; &gt; +index 410b8a3eb5..f2c4355609 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/proc-cmdline.c<br>
&gt; &gt;=C2=A0 +++ b/src/basic/proc-cmdline.c<br>
&gt; &gt;=C2=A0 @@ -15,6 +15,7 @@<br>
&gt; &gt; @@ -178,6 +212,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0int proc_cmdline(char **ret) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *e;<br>
&gt; &gt; +diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c<=
br>
&gt; &gt; +index ccab71f7d2..8f9eee8d36 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/procfs-util.c<br>
&gt; &gt;=C2=A0 +++ b/src/basic/procfs-util.c<br>
&gt; &gt;=C2=A0 @@ -11,6 +11,7 @@<br>
&gt; &gt; @@ -188,6 +224,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0int procfs_tasks_get_limit(uint64_t *ret) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_cleanup_free_ char *val=
ue =3D NULL;<br>
&gt; &gt; +diff --git a/src/basic/selinux-util.c b/src/basic/selinux-util.=
c<br>
&gt; &gt; +index ee9e34ed47..96c1e9362d 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/selinux-util.c<br>
&gt; &gt;=C2=A0 +++ b/src/basic/selinux-util.c<br>
&gt; &gt;=C2=A0 @@ -27,6 +27,7 @@<br>
&gt; &gt; @@ -197,7 +235,9 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;=C2=A0 +#include &quot;missing_stdlib.h&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#if HAVE_SELINUX<br>
&gt; &gt; - DEFINE_TRIVIAL_CLEANUP_FUNC(context_t, context_free);<br>
&gt; &gt; + DEFINE_TRIVIAL_CLEANUP_FUNC_FULL(context_t, context_free, NULL=
);<br>
&gt; &gt; +diff --git a/src/basic/time-util.c b/src/basic/time-util.c<br>
&gt; &gt; +index 78d0390a00..47c38ca691 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/time-util.c<br>
&gt; &gt;=C2=A0 +++ b/src/basic/time-util.c<br>
&gt; &gt;=C2=A0 @@ -27,6 +27,7 @@<br>
&gt; &gt; @@ -208,6 +248,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static clockid_t map_clock_id(clockid_t c) {<br>
&gt; &gt;<br>
&gt; &gt; +diff --git a/src/boot/bless-boot.c b/src/boot/bless-boot.c<br>
&gt; &gt; +index 97ad1e0cb5..9d60f3cc79 100644<br>
&gt; &gt;=C2=A0 --- a/src/boot/bless-boot.c<br>
&gt; &gt;=C2=A0 +++ b/src/boot/bless-boot.c<br>
&gt; &gt;=C2=A0 @@ -18,6 +18,7 @@<br>
&gt; &gt; @@ -218,16 +260,20 @@ Signed-off-by: Luca Boccassi &lt;<a href=
=3D"mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@mi=
crosoft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static char **arg_path =3D NULL;<br>
&gt; &gt;<br>
&gt; &gt; +diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-cgroup.c<br=
>
&gt; &gt; +index 04d2ba34f3..651ca9412e 100644<br>
&gt; &gt;=C2=A0 --- a/src/core/dbus-cgroup.c<br>
&gt; &gt;=C2=A0 +++ b/src/core/dbus-cgroup.c<br>
&gt; &gt; -@@ -16,6 +16,7 @@<br>
&gt; &gt; - #include &quot;fileio.h&quot;<br>
&gt; &gt; +@@ -17,6 +17,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;limits-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;path-util.h&quot;<br>
&gt; &gt; + #include &quot;percent-util.h&quot;<br>
&gt; &gt;=C2=A0 +#include &quot;missing_stdlib.h&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, =
&quot;t&quot;, TasksMax, tasks_max_resolve);<br>
&gt; &gt;<br>
&gt; &gt; +diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c<=
br>
&gt; &gt; +index 5239c41d67..0f604efe98 100644<br>
&gt; &gt;=C2=A0 --- a/src/core/dbus-execute.c<br>
&gt; &gt;=C2=A0 +++ b/src/core/dbus-execute.c<br>
&gt; &gt;=C2=A0 @@ -41,6 +41,7 @@<br>
&gt; &gt; @@ -238,9 +284,11 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D=
"mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@micros=
oft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0BUS_DEFINE_PROPERTY_GET_ENUM(bus_property_get_exec_o=
utput, exec_output, ExecOutput);<br>
&gt; &gt;=C2=A0 =C2=A0static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_exe=
c_input, exec_input, ExecInput);<br>
&gt; &gt; +diff --git a/src/core/dbus-util.c b/src/core/dbus-util.c<br>
&gt; &gt; +index 44a2ccfca0..3926ccfa4a 100644<br>
&gt; &gt;=C2=A0 --- a/src/core/dbus-util.c<br>
&gt; &gt;=C2=A0 +++ b/src/core/dbus-util.c<br>
&gt; &gt; -@@ -7,6 +7,7 @@<br>
&gt; &gt; +@@ -9,6 +9,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;unit-printf.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;user-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;unit.h&quot;<br>
&gt; &gt; @@ -248,16 +296,20 @@ Signed-off-by: Luca Boccassi &lt;<a href=
=3D"mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@mi=
crosoft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0int bus_property_get_triggered_unit(<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0sd_bus *bus,<br>
&gt; &gt; +diff --git a/src/core/execute.c b/src/core/execute.c<br>
&gt; &gt; +index 922913e7af..f82fc294c0 100644<br>
&gt; &gt;=C2=A0 --- a/src/core/execute.c<br>
&gt; &gt;=C2=A0 +++ b/src/core/execute.c<br>
&gt; &gt;=C2=A0 @@ -96,6 +96,7 @@<br>
&gt; &gt; - #include &quot;unit.h&quot;<br>
&gt; &gt; + #include &quot;unit-serialize.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;user-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;utmp-wtmp.h&quot;<br>
&gt; &gt;=C2=A0 +#include &quot;missing_stdlib.h&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#define IDLE_TIMEOUT_USEC (5*USEC_PER_SEC)<br>
&gt; &gt;=C2=A0 =C2=A0#define IDLE_TIMEOUT2_USEC (1*USEC_PER_SEC)<br>
&gt; &gt; +diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c<br>
&gt; &gt; +index a56f12f47f..6b8729ef67 100644<br>
&gt; &gt;=C2=A0 --- a/src/core/kmod-setup.c<br>
&gt; &gt;=C2=A0 +++ b/src/core/kmod-setup.c<br>
&gt; &gt;=C2=A0 @@ -11,6 +11,7 @@<br>
&gt; &gt; @@ -268,6 +320,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#if HAVE_KMOD<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;module-util.h&quot;<br>
&gt; &gt; +diff --git a/src/core/service.c b/src/core/service.c<br>
&gt; &gt; +index 4c5bfb17fb..8c05f36119 100644<br>
&gt; &gt;=C2=A0 --- a/src/core/service.c<br>
&gt; &gt;=C2=A0 +++ b/src/core/service.c<br>
&gt; &gt;=C2=A0 @@ -41,6 +41,7 @@<br>
&gt; &gt; @@ -278,6 +332,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static const UnitActiveState state_translation_table=
[_SERVICE_STATE_MAX] =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[SERVICE_DEAD] =3D UNIT_=
INACTIVE,<br>
&gt; &gt; +diff --git a/src/coredump/coredump-vacuum.c b/src/coredump/core=
dump-vacuum.c<br>
&gt; &gt; +index 95c3fca661..d4a9f27b08 100644<br>
&gt; &gt;=C2=A0 --- a/src/coredump/coredump-vacuum.c<br>
&gt; &gt;=C2=A0 +++ b/src/coredump/coredump-vacuum.c<br>
&gt; &gt;=C2=A0 @@ -16,6 +16,7 @@<br>
&gt; &gt; @@ -288,9 +344,11 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D=
"mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@micros=
oft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#define DEFAULT_MAX_USE_LOWER (uint64_t) (1ULL*1024U=
LL*1024ULL)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 1 MiB */<br>
&gt; &gt;=C2=A0 =C2=A0#define DEFAULT_MAX_USE_UPPER (uint64_t) (4ULL*1024U=
LL*1024ULL*1024ULL)=C2=A0 =C2=A0/* 4 GiB */<br>
&gt; &gt; +diff --git a/src/journal-remote/journal-remote-main.c b/src/jou=
rnal-remote/journal-remote-main.c<br>
&gt; &gt; +index ae1d43756a..24de98c9f3 100644<br>
&gt; &gt;=C2=A0 --- a/src/journal-remote/journal-remote-main.c<br>
&gt; &gt;=C2=A0 +++ b/src/journal-remote/journal-remote-main.c<br>
&gt; &gt; -@@ -22,6 +22,7 @@<br>
&gt; &gt; +@@ -24,6 +24,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;stat-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;string-table.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;strv.h&quot;<br>
&gt; &gt; @@ -298,9 +356,11 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D=
"mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@micros=
oft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#define PRIV_KEY_FILE CERTIFICATE_ROOT &quot;/privat=
e/journal-remote.pem&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#define CERT_FILE=C2=A0 =C2=A0 =C2=A0CERTIFICATE_ROO=
T &quot;/certs/journal-remote.pem&quot;<br>
&gt; &gt; +diff --git a/src/journal/journalctl.c b/src/journal/journalctl.=
c<br>
&gt; &gt; +index 76d05c1eee..0beb77b2e5 100644<br>
&gt; &gt;=C2=A0 --- a/src/journal/journalctl.c<br>
&gt; &gt;=C2=A0 +++ b/src/journal/journalctl.c<br>
&gt; &gt; -@@ -73,6 +73,7 @@<br>
&gt; &gt; +@@ -72,6 +72,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;unit-name.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;user-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;varlink.h&quot;<br>
&gt; &gt; @@ -308,19 +368,11 @@ Signed-off-by: Luca Boccassi &lt;<a href=
=3D"mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@mi=
crosoft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUT=
E)<br>
&gt; &gt;=C2=A0 =C2=A0#define PROCESS_INOTIFY_INTERVAL 1024=C2=A0 =C2=A0/*=
 Every 1,024 messages processed */<br>
&gt; &gt; ---- a/src/journal/sd-journal.c<br>
&gt; &gt; -+++ b/src/journal/sd-journal.c<br>
&gt; &gt; -@@ -40,6 +40,7 @@<br>
&gt; &gt; - #include &quot;string-util.h&quot;<br>
&gt; &gt; - #include &quot;strv.h&quot;<br>
&gt; &gt; - #include &quot;syslog-util.h&quot;<br>
&gt; &gt; -+#include &quot;missing_stdlib.h&quot;<br>
&gt; &gt; -<br>
&gt; &gt; - #define JOURNAL_FILES_MAX 7168<br>
&gt; &gt; -<br>
&gt; &gt; +diff --git a/src/libsystemd/sd-bus/bus-message.c b/src/libsyste=
md/sd-bus/bus-message.c<br>
&gt; &gt; +index b25064b672..b3bbe63a91 100644<br>
&gt; &gt;=C2=A0 --- a/src/libsystemd/sd-bus/bus-message.c<br>
&gt; &gt;=C2=A0 +++ b/src/libsystemd/sd-bus/bus-message.c<br>
&gt; &gt; -@@ -21,6 +21,7 @@<br>
&gt; &gt; +@@ -20,6 +20,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;strv.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;time-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;utf8.h&quot;<br>
&gt; &gt; @@ -328,9 +380,11 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D=
"mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@micros=
oft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static int message_append_basic(sd_bus_message *m, c=
har type, const void *p, const void **stored);<br>
&gt; &gt;<br>
&gt; &gt; +diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsyste=
md/sd-bus/bus-objects.c<br>
&gt; &gt; +index bfd42aea7d..daefc56e3e 100644<br>
&gt; &gt;=C2=A0 --- a/src/libsystemd/sd-bus/bus-objects.c<br>
&gt; &gt;=C2=A0 +++ b/src/libsystemd/sd-bus/bus-objects.c<br>
&gt; &gt; -@@ -13,6 +13,7 @@<br>
&gt; &gt; +@@ -12,6 +12,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;set.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;string-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;strv.h&quot;<br>
&gt; &gt; @@ -338,6 +392,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static int node_vtable_get_userdata(<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0sd_bus *bus,<br>
&gt; &gt; +diff --git a/src/libsystemd/sd-bus/bus-socket.c b/src/libsystem=
d/sd-bus/bus-socket.c<br>
&gt; &gt; +index 832526cc1b..7bff701806 100644<br>
&gt; &gt;=C2=A0 --- a/src/libsystemd/sd-bus/bus-socket.c<br>
&gt; &gt;=C2=A0 +++ b/src/libsystemd/sd-bus/bus-socket.c<br>
&gt; &gt;=C2=A0 @@ -28,6 +28,7 @@<br>
&gt; &gt; @@ -348,29 +404,47 @@ Signed-off-by: Luca Boccassi &lt;<a href=
=3D"mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@mi=
crosoft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#define SNDBUF_SIZE (8*1024*1024)<br>
&gt; &gt;<br>
&gt; &gt; +diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd=
-bus/sd-bus.c<br>
&gt; &gt; +index e719c74370..ac2a605680 100644<br>
&gt; &gt;=C2=A0 --- a/src/libsystemd/sd-bus/sd-bus.c<br>
&gt; &gt;=C2=A0 +++ b/src/libsystemd/sd-bus/sd-bus.c<br>
&gt; &gt;=C2=A0 @@ -41,6 +41,7 @@<br>
&gt; &gt; - #include &quot;process-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;string-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;strv.h&quot;<br>
&gt; &gt; + #include &quot;user-util.h&quot;<br>
&gt; &gt;=C2=A0 +#include &quot;missing_stdlib.h&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#define log_debug_bus_message(m)=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do {=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; &gt; +diff --git a/src/libsystemd/sd-bus/test-bus-benchmark.c b/src/l=
ibsystemd/sd-bus/test-bus-benchmark.c<br>
&gt; &gt; +index 13c08fe295..9aae83486e 100644<br>
&gt; &gt;=C2=A0 --- a/src/libsystemd/sd-bus/test-bus-benchmark.c<br>
&gt; &gt;=C2=A0 +++ b/src/libsystemd/sd-bus/test-bus-benchmark.c<br>
&gt; &gt;=C2=A0 @@ -14,6 +14,7 @@<br>
&gt; &gt; - #include &quot;missing_resource.h&quot;<br>
&gt; &gt; + #include &quot;string-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;time-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;util.h&quot;<br>
&gt; &gt;=C2=A0 +#include &quot;missing_stdlib.h&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#define MAX_SIZE (2*1024*1024)<br>
&gt; &gt;<br>
&gt; &gt; +diff --git a/src/libsystemd/sd-journal/sd-journal.c b/src/libsy=
stemd/sd-journal/sd-journal.c<br>
&gt; &gt; +index c90b4c926e..0efdccff5d 100644<br>
&gt; &gt; +--- a/src/libsystemd/sd-journal/sd-journal.c<br>
&gt; &gt; ++++ b/src/libsystemd/sd-journal/sd-journal.c<br>
&gt; &gt; +@@ -40,6 +40,7 @@<br>
&gt; &gt; + #include &quot;string-util.h&quot;<br>
&gt; &gt; + #include &quot;strv.h&quot;<br>
&gt; &gt; + #include &quot;syslog-util.h&quot;<br>
&gt; &gt; ++#include &quot;missing_stdlib.h&quot;<br>
&gt; &gt; +<br>
&gt; &gt; + #define JOURNAL_FILES_MAX 7168<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/src/locale/keymap-util.c b/src/locale/keymap-util.=
c<br>
&gt; &gt; +index d2f0566dbc..3b7746557e 100644<br>
&gt; &gt;=C2=A0 --- a/src/locale/keymap-util.c<br>
&gt; &gt;=C2=A0 +++ b/src/locale/keymap-util.c<br>
&gt; &gt; -@@ -21,6 +21,7 @@<br>
&gt; &gt; +@@ -24,6 +24,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;string-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;strv.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;tmpfile-util.h&quot;<br>
&gt; &gt; @@ -378,6 +452,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static bool startswith_comma(const char *s, const ch=
ar *prefix) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D startswith(s, pref=
ix);<br>
&gt; &gt; +diff --git a/src/login/pam_systemd.c b/src/login/pam_systemd.c<=
br>
&gt; &gt; +index 2021c31bd5..58eb09808d 100644<br>
&gt; &gt;=C2=A0 --- a/src/login/pam_systemd.c<br>
&gt; &gt;=C2=A0 +++ b/src/login/pam_systemd.c<br>
&gt; &gt;=C2=A0 @@ -31,6 +31,7 @@<br>
&gt; &gt; @@ -388,6 +464,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;pam-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;parse-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;path-util.h&quot;<br>
&gt; &gt; +diff --git a/src/network/generator/network-generator.c b/src/ne=
twork/generator/network-generator.c<br>
&gt; &gt; +index ae673ddf5b..a79e5114ca 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/generator/network-generator.c<br>
&gt; &gt;=C2=A0 +++ b/src/network/generator/network-generator.c<br>
&gt; &gt;=C2=A0 @@ -13,6 +13,7 @@<br>
&gt; &gt; @@ -398,6 +476,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0/*<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0# .network<br>
&gt; &gt; +diff --git a/src/nspawn/nspawn-settings.c b/src/nspawn/nspawn-s=
ettings.c<br>
&gt; &gt; +index d4619bead5..0e832fd994 100644<br>
&gt; &gt;=C2=A0 --- a/src/nspawn/nspawn-settings.c<br>
&gt; &gt;=C2=A0 +++ b/src/nspawn/nspawn-settings.c<br>
&gt; &gt;=C2=A0 @@ -16,6 +16,7 @@<br>
&gt; &gt; @@ -408,19 +488,23 @@ Signed-off-by: Luca Boccassi &lt;<a href=
=3D"mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@mi=
crosoft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0Settings *settings_new(void) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Settings *s;<br>
&gt; &gt; +diff --git a/src/nss-mymachines/nss-mymachines.c b/src/nss-myma=
chines/nss-mymachines.c<br>
&gt; &gt; +index 44715bb3e5..bc1e688b5e 100644<br>
&gt; &gt;=C2=A0 --- a/src/nss-mymachines/nss-mymachines.c<br>
&gt; &gt;=C2=A0 +++ b/src/nss-mymachines/nss-mymachines.c<br>
&gt; &gt; -@@ -19,6 +19,7 @@<br>
&gt; &gt; +@@ -21,6 +21,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;nss-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;signal-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;string-util.h&quot;<br>
&gt; &gt;=C2=A0 +#include &quot;missing_stdlib.h&quot;<br>
&gt; &gt;<br>
&gt; &gt; - NSS_GETHOSTBYNAME_PROTOTYPES(mymachines);<br>
&gt; &gt; - NSS_GETPW_PROTOTYPES(mymachines);<br>
&gt; &gt; + static void setup_logging(void) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* We need a dummy function b=
ecause log_parse_environment is a macro. */<br>
&gt; &gt; +diff --git a/src/portable/portable.c b/src/portable/portable.c<=
br>
&gt; &gt; +index f201f52531..c78ad0f471 100644<br>
&gt; &gt;=C2=A0 --- a/src/portable/portable.c<br>
&gt; &gt;=C2=A0 +++ b/src/portable/portable.c<br>
&gt; &gt; -@@ -31,6 +31,7 @@<br>
&gt; &gt; +@@ -32,6 +32,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;strv.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;tmpfile-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;user-util.h&quot;<br>
&gt; &gt; @@ -428,9 +512,11 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D=
"mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@micros=
oft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static const char profile_dirs[] =3D CONF_PATHS_NULS=
TR(&quot;systemd/portable/profile&quot;);<br>
&gt; &gt;<br>
&gt; &gt; +diff --git a/src/resolve/resolvectl.c b/src/resolve/resolvectl.=
c<br>
&gt; &gt; +index 52bbae3293..4ccbae09c4 100644<br>
&gt; &gt;=C2=A0 --- a/src/resolve/resolvectl.c<br>
&gt; &gt;=C2=A0 +++ b/src/resolve/resolvectl.c<br>
&gt; &gt; -@@ -37,6 +37,7 @@<br>
&gt; &gt; +@@ -41,6 +41,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;terminal-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;utf8.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;verbs.h&quot;<br>
&gt; &gt; @@ -438,6 +524,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static int arg_family =3D AF_UNSPEC;<br>
&gt; &gt;=C2=A0 =C2=A0static int arg_ifindex =3D 0;<br>
&gt; &gt; +diff --git a/src/shared/bus-get-properties.c b/src/shared/bus-g=
et-properties.c<br>
&gt; &gt; +index feb6d3807f..eb11d29e50 100644<br>
&gt; &gt;=C2=A0 --- a/src/shared/bus-get-properties.c<br>
&gt; &gt;=C2=A0 +++ b/src/shared/bus-get-properties.c<br>
&gt; &gt;=C2=A0 @@ -4,6 +4,7 @@<br>
&gt; &gt; @@ -448,6 +536,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0int bus_property_get_bool(<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0sd_bus *bus,<br>
&gt; &gt; +diff --git a/src/shared/bus-unit-procs.c b/src/shared/bus-unit-=
procs.c<br>
&gt; &gt; +index b76125e551..2e0892242f 100644<br>
&gt; &gt;=C2=A0 --- a/src/shared/bus-unit-procs.c<br>
&gt; &gt;=C2=A0 +++ b/src/shared/bus-unit-procs.c<br>
&gt; &gt;=C2=A0 @@ -10,6 +10,7 @@<br>
&gt; &gt; @@ -458,9 +548,11 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D=
"mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@micros=
oft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0struct CGroupInfo {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *cgroup_path;<br>
&gt; &gt; +diff --git a/src/shared/bus-unit-util.c b/src/shared/bus-unit-u=
til.c<br>
&gt; &gt; +index a75178068b..3de06e2bd5 100644<br>
&gt; &gt;=C2=A0 --- a/src/shared/bus-unit-util.c<br>
&gt; &gt;=C2=A0 +++ b/src/shared/bus-unit-util.c<br>
&gt; &gt; -@@ -44,6 +44,7 @@<br>
&gt; &gt; +@@ -45,6 +45,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;unit-def.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;user-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;utf8.h&quot;<br>
&gt; &gt; @@ -468,6 +560,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0int bus_parse_unit_info(sd_bus_message *message, Uni=
tInfo *u) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(message);<br>
&gt; &gt; +diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c<br>
&gt; &gt; +index 64ca67993c..31e3d148ea 100644<br>
&gt; &gt;=C2=A0 --- a/src/shared/bus-util.c<br>
&gt; &gt;=C2=A0 +++ b/src/shared/bus-util.c<br>
&gt; &gt;=C2=A0 @@ -21,6 +21,7 @@<br>
&gt; &gt; @@ -478,6 +572,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static int name_owner_change_callback(sd_bus_message=
 *m, void *userdata, sd_bus_error *ret_error) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sd_event *e =3D userdata=
;<br>
&gt; &gt; +diff --git a/src/shared/dns-domain.c b/src/shared/dns-domain.c<=
br>
&gt; &gt; +index e43aa12882..cec9b413c1 100644<br>
&gt; &gt;=C2=A0 --- a/src/shared/dns-domain.c<br>
&gt; &gt;=C2=A0 +++ b/src/shared/dns-domain.c<br>
&gt; &gt;=C2=A0 @@ -17,6 +17,7 @@<br>
&gt; &gt; @@ -488,6 +584,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0int dns_label_unescape(const char **name, char *dest=
, size_t sz, DNSLabelFlags flags) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *n;<br>
&gt; &gt; +diff --git a/src/shared/journal-importer.c b/src/shared/journal=
-importer.c<br>
&gt; &gt; +index b2785f0552..5f00902882 100644<br>
&gt; &gt;=C2=A0 --- a/src/shared/journal-importer.c<br>
&gt; &gt;=C2=A0 +++ b/src/shared/journal-importer.c<br>
&gt; &gt;=C2=A0 @@ -14,6 +14,7 @@<br>
&gt; &gt; @@ -498,6 +596,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0enum {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMPORTER_STATE_LINE =3D =
0,=C2=A0 =C2=A0 /* waiting to read, or reading line */<br>
&gt; &gt; +diff --git a/src/shared/logs-show.c b/src/shared/logs-show.c<br=
>
&gt; &gt; +index e63c59bd94..dd9773c009 100644<br>
&gt; &gt;=C2=A0 --- a/src/shared/logs-show.c<br>
&gt; &gt;=C2=A0 +++ b/src/shared/logs-show.c<br>
&gt; &gt;=C2=A0 @@ -41,6 +41,7 @@<br>
&gt; &gt; @@ -508,6 +608,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0/* up to three lines (each up to 100 characters) or =
300 characters, whichever is less */<br>
&gt; &gt;=C2=A0 =C2=A0#define PRINT_LINE_THRESHOLD 3<br>
&gt; &gt; +diff --git a/src/shared/pager.c b/src/shared/pager.c<br>
&gt; &gt; +index 4bbad7e37b..eefcdd068c 100644<br>
&gt; &gt;=C2=A0 --- a/src/shared/pager.c<br>
&gt; &gt;=C2=A0 +++ b/src/shared/pager.c<br>
&gt; &gt;=C2=A0 @@ -26,6 +26,7 @@<br>
&gt; &gt; @@ -518,6 +620,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static pid_t pager_pid =3D 0;<br>
&gt; &gt;<br>
&gt; &gt; +diff --git a/src/shared/uid-range.c b/src/shared/uid-range.c<br=
>
&gt; &gt; +index 5d5bf7f21d..f1002ffa6c 100644<br>
&gt; &gt;=C2=A0 --- a/src/shared/uid-range.c<br>
&gt; &gt;=C2=A0 +++ b/src/shared/uid-range.c<br>
&gt; &gt;=C2=A0 @@ -9,6 +9,7 @@<br>
&gt; &gt; @@ -528,6 +632,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static bool uid_range_intersect(UidRange *range, uid=
_t start, uid_t nr) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(range);<br>
&gt; &gt; +diff --git a/src/socket-proxy/socket-proxyd.c b/src/socket-prox=
y/socket-proxyd.c<br>
&gt; &gt; +index 6e3ee0d76b..7727e33d95 100644<br>
&gt; &gt;=C2=A0 --- a/src/socket-proxy/socket-proxyd.c<br>
&gt; &gt;=C2=A0 +++ b/src/socket-proxy/socket-proxyd.c<br>
&gt; &gt;=C2=A0 @@ -26,6 +26,7 @@<br>
&gt; &gt; @@ -538,6 +644,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#define BUFFER_SIZE (256 * 1024)<br>
&gt; &gt;<br>
&gt; &gt; +diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoc=
t.c<br>
&gt; &gt; +index c9d318b8d1..fcb8d40805 100644<br>
&gt; &gt;=C2=A0 --- a/src/test/test-hexdecoct.c<br>
&gt; &gt;=C2=A0 +++ b/src/test/test-hexdecoct.c<br>
&gt; &gt;=C2=A0 @@ -6,6 +6,7 @@<br>
&gt; &gt; @@ -548,19 +656,23 @@ Signed-off-by: Luca Boccassi &lt;<a href=
=3D"mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@mi=
crosoft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static void test_hexchar(void) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert_se(hexchar(0xa) =
=3D=3D &#39;a&#39;);<br>
&gt; &gt; +diff --git a/src/udev/udev-builtin-path_id.c b/src/udev/udev-bu=
iltin-path_id.c<br>
&gt; &gt; +index 09cc1c3bd8..8a7d3152a7 100644<br>
&gt; &gt;=C2=A0 --- a/src/udev/udev-builtin-path_id.c<br>
&gt; &gt;=C2=A0 +++ b/src/udev/udev-builtin-path_id.c<br>
&gt; &gt;=C2=A0 @@ -22,6 +22,7 @@<br>
&gt; &gt; - #include &quot;strv.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;sysexits.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;udev-builtin.h&quot;<br>
&gt; &gt; + #include &quot;udev-util.h&quot;<br>
&gt; &gt;=C2=A0 +#include &quot;missing_stdlib.h&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0_printf_(2,3)<br>
&gt; &gt;=C2=A0 =C2=A0static void path_prepend(char **path, const char *fm=
t, ...) {<br>
&gt; &gt; +diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c<br>
&gt; &gt; +index 12597194a9..208b2458b5 100644<br>
&gt; &gt;=C2=A0 --- a/src/udev/udev-event.c<br>
&gt; &gt;=C2=A0 +++ b/src/udev/udev-event.c<br>
&gt; &gt; -@@ -34,6 +34,7 @@<br>
&gt; &gt; +@@ -33,6 +33,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;udev-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;udev-watch.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;user-util.h&quot;<br>
&gt; &gt; @@ -568,9 +680,11 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D=
"mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@micros=
oft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0typedef struct Spawn {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sd_device *device;<br>
&gt; &gt; +diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c<br>
&gt; &gt; +index 57ede6a197..dc59857765 100644<br>
&gt; &gt;=C2=A0 --- a/src/udev/udev-rules.c<br>
&gt; &gt;=C2=A0 +++ b/src/udev/udev-rules.c<br>
&gt; &gt; -@@ -30,6 +30,7 @@<br>
&gt; &gt; +@@ -31,6 +31,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;udev-rules.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;user-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;virt.h&quot;<br>
&gt; &gt; @@ -578,13 +692,3 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D=
"mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@micros=
oft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#define RULES_DIRS (const char* const*) CONF_PATHS_S=
TRV(&quot;udev/rules.d&quot;)<br>
&gt; &gt;<br>
&gt; &gt; ---- a/src/basic/mountpoint-util.c<br>
&gt; &gt; -+++ b/src/basic/mountpoint-util.c<br>
&gt; &gt; -@@ -10,6 +10,7 @@<br>
&gt; &gt; - #include &quot;fs-util.h&quot;<br>
&gt; &gt; - #include &quot;missing_stat.h&quot;<br>
&gt; &gt; - #include &quot;missing_syscall.h&quot;<br>
&gt; &gt; -+#include &quot;missing_stdlib.h&quot;<br>
&gt; &gt; - #include &quot;mountpoint-util.h&quot;<br>
&gt; &gt; - #include &quot;parse-util.h&quot;<br>
&gt; &gt; - #include &quot;path-util.h&quot;<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0006-Include-neti=
net-if_ether.h.patch b/meta/recipes-core/systemd/systemd/0006-Include-netin=
et-if_ether.h.patch<br>
&gt; &gt; index a978558b42..54d714266e 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_=
ether.h.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_=
ether.h.patch<br>
&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; -From d3ed0da271738fd0fc3d3e4d82d6f5810334b05e Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From 2069f0b0d5ab8f869aeba635a347e0b11d362b30 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Thu, 26 Oct 2017 22:10:42 -0700<br>
&gt; &gt; -Subject: [PATCH 06/26] Include netinet/if_ether.h<br>
&gt; &gt; +Subject: [PATCH] Include netinet/if_ether.h<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Fixes<br>
&gt; &gt;=C2=A0 /path/to/systemd/recipe-sysroot/usr/include/netinet/if_eth=
er.h:101:8: error: redefinition of &#39;struct ethhdr&#39;<br>
&gt; &gt; @@ -31,6 +31,7 @@ Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Q=
i.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 Signed-off-by: Scott Murray &lt;<a href=3D"mailto:scott.mu=
rray@konsulko.com" target=3D"_blank">scott.murray@konsulko.com</a>&gt;<br>
&gt; &gt;=C2=A0 [rebased for systemd 247]<br>
&gt; &gt;=C2=A0 Signed-off-by: Luca Boccassi &lt;<a href=3D"mailto:luca.bo=
ccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsoft.com</a>&gt;=
<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0src/libsystemd-network/sd-dhcp6-client.c=C2=A0 | 1 -=
<br>
&gt; &gt;=C2=A0 =C2=A0src/libsystemd/sd-netlink/netlink-types.c | 1 +<br>
&gt; &gt; @@ -56,7 +57,7 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"ma=
ilto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsoft=
.com</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A021 files changed, 26 insertions(+), 8 deletions(-)<b=
r>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/libsystemd-network/sd-dhcp6-client.c b/sr=
c/libsystemd-network/sd-dhcp6-client.c<br>
&gt; &gt; -index 66f87c4b95..de1264ae46 100644<br>
&gt; &gt; +index 410bfda10e..e70ed8be92 100644<br>
&gt; &gt;=C2=A0 --- a/src/libsystemd-network/sd-dhcp6-client.c<br>
&gt; &gt;=C2=A0 +++ b/src/libsystemd-network/sd-dhcp6-client.c<br>
&gt; &gt;=C2=A0 @@ -5,7 +5,6 @@<br>
&gt; &gt; @@ -68,7 +69,7 @@ index 66f87c4b95..de1264ae46 100644<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;sd-dhcp6-client.h&quot;<br>
&gt; &gt;=C2=A0 diff --git a/src/libsystemd/sd-netlink/netlink-types.c b/s=
rc/libsystemd/sd-netlink/netlink-types.c<br>
&gt; &gt; -index 6fb6c147d9..8eda02d202 100644<br>
&gt; &gt; +index ed7b9a8cd1..112c0b09e4 100644<br>
&gt; &gt;=C2=A0 --- a/src/libsystemd/sd-netlink/netlink-types.c<br>
&gt; &gt;=C2=A0 +++ b/src/libsystemd/sd-netlink/netlink-types.c<br>
&gt; &gt;=C2=A0 @@ -3,6 +3,7 @@<br>
&gt; &gt; @@ -80,7 +81,7 @@ index 6fb6c147d9..8eda02d202 100644<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;linux/netlink.h&gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;linux/rtnetlink.h&gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/machine/machine-dbus.c b/src/machine/mach=
ine-dbus.c<br>
&gt; &gt; -index bb67beb665..f5780f1aec 100644<br>
&gt; &gt; +index e7c4ed3c7c..3a1e4f9072 100644<br>
&gt; &gt;=C2=A0 --- a/src/machine/machine-dbus.c<br>
&gt; &gt;=C2=A0 +++ b/src/machine/machine-dbus.c<br>
&gt; &gt;=C2=A0 @@ -3,6 +3,7 @@<br>
&gt; &gt; @@ -92,7 +93,7 @@ index bb67beb665..f5780f1aec 100644<br>
&gt; &gt;=C2=A0 =C2=A0/* When we include libgen.h because we need dirname(=
) we immediately<br>
&gt; &gt;=C2=A0 =C2=A0 * undefine basename() since libgen.h defines it as =
a macro to the POSIX<br>
&gt; &gt;=C2=A0 diff --git a/src/network/netdev/bond.c b/src/network/netde=
v/bond.c<br>
&gt; &gt; -index e27f36067b..8868f1da5d 100644<br>
&gt; &gt; +index cf7ca88d6f..34ab468191 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/netdev/bond.c<br>
&gt; &gt;=C2=A0 +++ b/src/network/netdev/bond.c<br>
&gt; &gt;=C2=A0 @@ -1,5 +1,6 @@<br>
&gt; &gt; @@ -103,7 +104,7 @@ index e27f36067b..8868f1da5d 100644<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;bond.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;bond-util.h&quot;<br>
&gt; &gt;=C2=A0 diff --git a/src/network/netdev/bridge.c b/src/network/net=
dev/bridge.c<br>
&gt; &gt; -index 1f59cd8b42..5fdbae7e99 100644<br>
&gt; &gt; +index 38432f1578..79ccfe578e 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/netdev/bridge.c<br>
&gt; &gt;=C2=A0 +++ b/src/network/netdev/bridge.c<br>
&gt; &gt;=C2=A0 @@ -1,5 +1,6 @@<br>
&gt; &gt; @@ -114,7 +115,7 @@ index 1f59cd8b42..5fdbae7e99 100644<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;bridge.h&quot;<br>
&gt; &gt;=C2=A0 diff --git a/src/network/netdev/macsec.c b/src/network/net=
dev/macsec.c<br>
&gt; &gt; -index 82e71c3920..fbae86e216 100644<br>
&gt; &gt; +index 77c5f8c4e7..04be1b4ab2 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/netdev/macsec.c<br>
&gt; &gt;=C2=A0 +++ b/src/network/netdev/macsec.c<br>
&gt; &gt;=C2=A0 @@ -1,5 +1,6 @@<br>
&gt; &gt; @@ -125,19 +126,19 @@ index 82e71c3920..fbae86e216 100644<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;linux/if_ether.h&gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;linux/if_macsec.h&gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/network/netdev/netdev-gperf.gperf b/src/n=
etwork/netdev/netdev-gperf.gperf<br>
&gt; &gt; -index 4e89761f2c..91251fa6ec 100644<br>
&gt; &gt; +index 8abe044890..3c54c58928 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/netdev/netdev-gperf.gperf<br>
&gt; &gt;=C2=A0 +++ b/src/network/netdev/netdev-gperf.gperf<br>
&gt; &gt; -@@ -2,6 +2,7 @@<br>
&gt; &gt; +@@ -3,6 +3,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#if __GNUC__ &gt;=3D 7<br>
&gt; &gt;=C2=A0 =C2=A0_Pragma(&quot;GCC diagnostic ignored \&quot;-Wimplic=
it-fallthrough\&quot;&quot;)<br>
&gt; &gt;=C2=A0 =C2=A0#endif<br>
&gt; &gt;=C2=A0 +#include &lt;netinet/if_ether.h&gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;stddef.h&gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;bareudp.h&quot;<br>
&gt; &gt; - #include &quot;bond.h&quot;<br>
&gt; &gt; + #include &quot;batadv.h&quot;<br>
&gt; &gt;=C2=A0 diff --git a/src/network/netdev/netdev.c b/src/network/net=
dev/netdev.c<br>
&gt; &gt; -index 9f390b5781..62aeafb1e4 100644<br>
&gt; &gt; +index b31f0fa81a..c80e1ff537 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/netdev/netdev.c<br>
&gt; &gt;=C2=A0 +++ b/src/network/netdev/netdev.c<br>
&gt; &gt;=C2=A0 @@ -1,5 +1,6 @@<br>
&gt; &gt; @@ -148,7 +149,7 @@ index 9f390b5781..62aeafb1e4 100644<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;netinet/in.h&gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;unistd.h&gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/network/networkd-brvlan.c b/src/network/n=
etworkd-brvlan.c<br>
&gt; &gt; -index e53c73c30c..9bf0771b84 100644<br>
&gt; &gt; +index 2847b336c9..4d6af8c642 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/networkd-brvlan.c<br>
&gt; &gt;=C2=A0 +++ b/src/network/networkd-brvlan.c<br>
&gt; &gt;=C2=A0 @@ -4,6 +4,7 @@<br>
&gt; &gt; @@ -160,7 +161,7 @@ index e53c73c30c..9bf0771b84 100644<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;stdbool.h&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/network/networkd-dhcp-common.c b/src/netw=
ork/networkd-dhcp-common.c<br>
&gt; &gt; -index 9f58121350..554d006cb8 100644<br>
&gt; &gt; +index 00d055cf8d..65821c1d31 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/networkd-dhcp-common.c<br>
&gt; &gt;=C2=A0 +++ b/src/network/networkd-dhcp-common.c<br>
&gt; &gt;=C2=A0 @@ -1,7 +1,8 @@<br>
&gt; &gt; @@ -171,9 +172,9 @@ index 9f58121350..554d006cb8 100644<br>
&gt; &gt;=C2=A0 +#include &lt;net/if_arp.h&gt;<br>
&gt; &gt;=C2=A0 +#include &lt;net/if.h&gt;<br>
&gt; &gt;<br>
&gt; &gt; + #include &quot;bus-error.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;dhcp-internal.h&quot;<br>
&gt; &gt; - #include &quot;dhcp6-internal.h&quot;<br>
&gt; &gt; -@@ -10,6 +11,7 @@<br>
&gt; &gt; +@@ -11,6 +12,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;networkd-dhcp-common.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;networkd-link.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;networkd-manager.h&quot;<br>
&gt; &gt; @@ -182,7 +183,7 @@ index 9f58121350..554d006cb8 100644<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;parse-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;socket-util.h&quot;<br>
&gt; &gt;=C2=A0 diff --git a/src/network/networkd-dhcp-server.c b/src/netw=
ork/networkd-dhcp-server.c<br>
&gt; &gt; -index cf279c640d..bae541029b 100644<br>
&gt; &gt; +index 5cdf432c27..93cffb9863 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/networkd-dhcp-server.c<br>
&gt; &gt;=C2=A0 +++ b/src/network/networkd-dhcp-server.c<br>
&gt; &gt;=C2=A0 @@ -1,8 +1,8 @@<br>
&gt; &gt; @@ -197,7 +198,7 @@ index cf279c640d..bae541029b 100644<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;sd-dhcp-server.h&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/network/networkd-dhcp4.c b/src/network/ne=
tworkd-dhcp4.c<br>
&gt; &gt; -index f3c1e5f609..e4ef6eca63 100644<br>
&gt; &gt; +index 23dc3a45db..7ae6c2467a 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/networkd-dhcp4.c<br>
&gt; &gt;=C2=A0 +++ b/src/network/networkd-dhcp4.c<br>
&gt; &gt;=C2=A0 @@ -1,9 +1,9 @@<br>
&gt; &gt; @@ -212,7 +213,7 @@ index f3c1e5f609..e4ef6eca63 100644<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;escape.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;alloc-util.h&quot;<br>
&gt; &gt;=C2=A0 diff --git a/src/network/networkd-dhcp6.c b/src/network/ne=
tworkd-dhcp6.c<br>
&gt; &gt; -index 5c077c1ec8..fa98042aa5 100644<br>
&gt; &gt; +index aa077d6219..4f6ce22059 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/networkd-dhcp6.c<br>
&gt; &gt;=C2=A0 +++ b/src/network/networkd-dhcp6.c<br>
&gt; &gt;=C2=A0 @@ -3,9 +3,9 @@<br>
&gt; &gt; @@ -227,7 +228,7 @@ index 5c077c1ec8..fa98042aa5 100644<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;sd-dhcp6-client.h&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/network/networkd-link.c b/src/network/net=
workd-link.c<br>
&gt; &gt; -index 3bfe636691..e0c68c8ad3 100644<br>
&gt; &gt; +index 8219d95b0d..c92230453b 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/networkd-link.c<br>
&gt; &gt;=C2=A0 +++ b/src/network/networkd-link.c<br>
&gt; &gt;=C2=A0 @@ -1,8 +1,8 @@<br>
&gt; &gt; @@ -241,7 +242,7 @@ index 3bfe636691..e0c68c8ad3 100644<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;unistd.h&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/network/networkd-network.c b/src/network/=
networkd-network.c<br>
&gt; &gt; -index 3254641461..f0ada419fd 100644<br>
&gt; &gt; +index e5ffd35b6f..871ebb32c6 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/networkd-network.c<br>
&gt; &gt;=C2=A0 +++ b/src/network/networkd-network.c<br>
&gt; &gt;=C2=A0 @@ -1,5 +1,6 @@<br>
&gt; &gt; @@ -252,7 +253,7 @@ index 3254641461..f0ada419fd 100644<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;netinet/in.h&gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;linux/netdevice.h&gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/network/networkd-route.c b/src/network/ne=
tworkd-route.c<br>
&gt; &gt; -index 0ed89584ef..e7e157c201 100644<br>
&gt; &gt; +index a74541a6c9..a10549b336 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/networkd-route.c<br>
&gt; &gt;=C2=A0 +++ b/src/network/networkd-route.c<br>
&gt; &gt;=C2=A0 @@ -1,7 +1,10 @@<br>
&gt; &gt; @@ -268,7 +269,7 @@ index 0ed89584ef..e7e157c201 100644<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;alloc-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;netlink-util.h&quot;<br>
&gt; &gt;=C2=A0 diff --git a/src/network/test-network-tables.c b/src/netwo=
rk/test-network-tables.c<br>
&gt; &gt; -index 475cac7527..9bae6eda16 100644<br>
&gt; &gt; +index ce34449554..0b5dc01182 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/test-network-tables.c<br>
&gt; &gt;=C2=A0 +++ b/src/network/test-network-tables.c<br>
&gt; &gt;=C2=A0 @@ -1,5 +1,6 @@<br>
&gt; &gt; @@ -279,7 +280,7 @@ index 475cac7527..9bae6eda16 100644<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;dhcp6-internal.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;dhcp6-protocol.h&quot;<br>
&gt; &gt;=C2=A0 diff --git a/src/shared/ethtool-util.c b/src/shared/ethtoo=
l-util.c<br>
&gt; &gt; -index e6fab262f2..41dd3d7df7 100644<br>
&gt; &gt; +index 654d36a83a..f4ed42d543 100644<br>
&gt; &gt;=C2=A0 --- a/src/shared/ethtool-util.c<br>
&gt; &gt;=C2=A0 +++ b/src/shared/ethtool-util.c<br>
&gt; &gt;=C2=A0 @@ -1,5 +1,6 @@<br>
&gt; &gt; @@ -290,7 +291,7 @@ index e6fab262f2..41dd3d7df7 100644<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;sys/ioctl.h&gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;linux/ethtool.h&gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/shared/ethtool-util.h b/src/shared/ethtoo=
l-util.h<br>
&gt; &gt; -index f94b3e15bf..08a7e4fa09 100644<br>
&gt; &gt; +index 11e2906681..a171df0737 100644<br>
&gt; &gt;=C2=A0 --- a/src/shared/ethtool-util.h<br>
&gt; &gt;=C2=A0 +++ b/src/shared/ethtool-util.h<br>
&gt; &gt;=C2=A0 @@ -3,6 +3,7 @@<br>
&gt; &gt; @@ -302,7 +303,7 @@ index f94b3e15bf..08a7e4fa09 100644<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;conf-parser.h&quot;<br>
&gt; &gt;=C2=A0 diff --git a/src/udev/net/link-config.c b/src/udev/net/lin=
k-config.c<br>
&gt; &gt; -index d12fd0e299..636806dc23 100644<br>
&gt; &gt; +index 31e5d0cd67..f25f821364 100644<br>
&gt; &gt;=C2=A0 --- a/src/udev/net/link-config.c<br>
&gt; &gt;=C2=A0 +++ b/src/udev/net/link-config.c<br>
&gt; &gt;=C2=A0 @@ -1,5 +1,6 @@<br>
&gt; &gt; @@ -323,6 +324,3 @@ index 87e1fb133e..13876029d0 100644<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;alloc-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;device-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;errno-util.h&quot;<br>
&gt; &gt; ---<br>
&gt; &gt; -2.25.1<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-fail-i=
f-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/=
systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch<br>
&gt; &gt; index 6865421586..2ff08c7fae 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_=
BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_=
BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch<br>
&gt; &gt; @@ -1,8 +1,7 @@<br>
&gt; &gt; -From 87a14dde13c8fa68239a4ab62914a093062b3b29 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From bca73ff2fbff2dc311040a87a4f536f89af07ad6 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt;=C2=A0 From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com"=
 target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Mon, 25 Feb 2019 14:56:21 +0800<br>
&gt; &gt; -Subject: [PATCH 07/26] don&#39;t fail if GLOB_BRACE and GLOB_AL=
TDIRFUNC is not<br>
&gt; &gt; - defined<br>
&gt; &gt; +Subject: [PATCH] don&#39;t fail if GLOB_BRACE and GLOB_ALTDIRFU=
NC is not defined<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 If the standard library doesn&#39;t provide brace<br>
&gt; &gt;=C2=A0 expansion users just won&#39;t get it.<br>
&gt; &gt; @@ -17,6 +16,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt;=C2=A0 Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windr=
iver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 [rebased for systemd 243]<br>
&gt; &gt;=C2=A0 Signed-off-by: Scott Murray &lt;<a href=3D"mailto:scott.mu=
rray@konsulko.com" target=3D"_blank">scott.murray@konsulko.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/glob-util.c=C2=A0 =C2=A0 =C2=A0| 12 ++++++=
++++++<br>
&gt; &gt;=C2=A0 =C2=A0src/test/test-glob-util.c | 16 ++++++++++++++++<br>
&gt; &gt; @@ -115,10 +115,10 @@ index df6444c433..79a692046e 100644<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) rm_rf(template, R=
EMOVE_ROOT|REMOVE_PHYSICAL);<br>
&gt; &gt;=C2=A0 diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfil=
es.c<br>
&gt; &gt; -index 9906c70eef..5eb63b1d57 100644<br>
&gt; &gt; +index 6b73d1e6d5..26b3b74275 100644<br>
&gt; &gt;=C2=A0 --- a/src/tmpfiles/tmpfiles.c<br>
&gt; &gt;=C2=A0 +++ b/src/tmpfiles/tmpfiles.c<br>
&gt; &gt; -@@ -63,6 +63,12 @@<br>
&gt; &gt; +@@ -66,6 +66,12 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;umask-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;user-util.h&quot;<br>
&gt; &gt;<br>
&gt; &gt; @@ -131,7 +131,7 @@ index 9906c70eef..5eb63b1d57 100644<br>
&gt; &gt;=C2=A0 =C2=A0/* This reads all files listed in /etc/tmpfiles.d/?*=
.conf and creates<br>
&gt; &gt;=C2=A0 =C2=A0 * them in the file system. This is intended to be u=
sed to create<br>
&gt; &gt;=C2=A0 =C2=A0 * properly owned directories beneath /tmp, /var/tmp=
, /run, which are<br>
&gt; &gt; -@@ -1936,7 +1942,9 @@ finish:<br>
&gt; &gt; +@@ -1947,7 +1953,9 @@ finish:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static int glob_item(Item *i, action_t action) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_cleanup_globfree_ glob_=
t g =3D {<br>
&gt; &gt; @@ -141,7 +141,7 @@ index 9906c70eef..5eb63b1d57 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int r =3D 0, k;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char **fn;<br>
&gt; &gt; -@@ -1956,7 +1964,9 @@ static int glob_item(Item *i, action_t ac=
tion) {<br>
&gt; &gt; +@@ -1967,7 +1975,9 @@ static int glob_item(Item *i, action_t ac=
tion) {<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static int glob_item_recursively(Item *i, fdaction_t=
 action) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_cleanup_globfree_ glob_=
t g =3D {<br>
&gt; &gt; @@ -151,6 +151,3 @@ index 9906c70eef..5eb63b1d57 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int r =3D 0, k;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char **fn;<br>
&gt; &gt; ---<br>
&gt; &gt; -2.27.0<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0008-add-missing-=
FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0008-add-mis=
sing-FTW_-macros-for-musl.patch<br>
&gt; &gt; index 94cdc2efde..142ca01345 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-ma=
cros-for-musl.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-ma=
cros-for-musl.patch<br>
&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; -From 8caea3fe87d55fd16de7d1b8266239fa954cb498 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From e0d1912f0246c97e5e7b4177691363d2d077e11d Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt;=C2=A0 From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com"=
 target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Mon, 25 Feb 2019 15:00:06 +0800<br>
&gt; &gt; -Subject: [PATCH 08/26] add missing FTW_ macros for musl<br>
&gt; &gt; +Subject: [PATCH] add missing FTW_ macros for musl<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 This is to avoid build failures like below for musl.<br>
&gt; &gt;<br>
&gt; &gt; @@ -10,6 +10,7 @@ This is to avoid build failures like below for=
 musl.<br>
&gt; &gt;=C2=A0 Upstream-Status: Inappropriate [musl specific]<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windr=
iver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/missing_type.h | 20 ++++++++++++++++++++<b=
r>
&gt; &gt;=C2=A0 =C2=A01 file changed, 20 insertions(+)<br>
&gt; &gt; @@ -42,6 +43,3 @@ index aeaf6ad5ec..3df1084ef2 100644<br>
&gt; &gt;=C2=A0 +#ifndef FTW_SKIP_SIBLINGS<br>
&gt; &gt;=C2=A0 +#define FTW_SKIP_SIBLINGS 3<br>
&gt; &gt;=C2=A0 +#endif<br>
&gt; &gt; ---<br>
&gt; &gt; -2.27.0<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0009-fix-missing-=
of-__register_atfork-for-non-glibc-build.patch b/meta/recipes-core/systemd/=
systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch<br>
&gt; &gt; index 76cc75cf6a..53f0a1ba62 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__re=
gister_atfork-for-non-glibc-build.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__re=
gister_atfork-for-non-glibc-build.patch<br>
&gt; &gt; @@ -1,17 +1,18 @@<br>
&gt; &gt; -From d8e4f0aa1760e4c7bb8476beecd35025c9cbb95a Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From bb41fe773881a8f1d9615d388320b9c6fc47bfe5 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt;=C2=A0 From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com"=
 target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Mon, 25 Feb 2019 15:03:47 +0800<br>
&gt; &gt; -Subject: [PATCH 09/26] fix missing of __register_atfork for non=
-glibc builds<br>
&gt; &gt; +Subject: [PATCH] fix missing of __register_atfork for non-glibc=
 builds<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Upstream-Status: Inappropriate [musl specific]<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windr=
iver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/process-util.c | 7 +++++++<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 7 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/basic/process-util.c b/src/basic/process-=
util.c<br>
&gt; &gt; -index 0851613fc9..4417101569 100644<br>
&gt; &gt; +index 7d4301eadb..caa9dfe3a3 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/process-util.c<br>
&gt; &gt;=C2=A0 +++ b/src/basic/process-util.c<br>
&gt; &gt;=C2=A0 @@ -18,6 +18,9 @@<br>
&gt; &gt; @@ -24,7 +25,7 @@ index 0851613fc9..4417101569 100644<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;alloc-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;architecture.h&quot;<br>
&gt; &gt; -@@ -1143,11 +1146,15 @@ void reset_cached_pid(void) {<br>
&gt; &gt; +@@ -1121,11 +1124,15 @@ void reset_cached_pid(void) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cached_pid =3D CACHED_PI=
D_UNSET;<br>
&gt; &gt;=C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt; @@ -40,6 +41,3 @@ index 0851613fc9..4417101569 100644<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0pid_t getpid_cached(void) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static bool installed =
=3D false;<br>
&gt; &gt; ---<br>
&gt; &gt; -2.27.0<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_=
t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0010-Use-ui=
ntmax_t-for-handling-rlim_t.patch<br>
&gt; &gt; index aeacd865ae..af1a6bb053 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-h=
andling-rlim_t.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-h=
andling-rlim_t.patch<br>
&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; -From e45bb02174812e4935214f42a18725be320770d5 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From dc40487e0ac26e3ca317429b9c3e8f01772de60a Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt;=C2=A0 From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com"=
 target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Mon, 25 Feb 2019 15:12:41 +0800<br>
&gt; &gt; -Subject: [PATCH 10/26] Use uintmax_t for handling rlim_t<br>
&gt; &gt; +Subject: [PATCH] Use uintmax_t for handling rlim_t<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 PRIu{32,64} is not right format to represent rlim_t type<b=
r>
&gt; &gt;=C2=A0 therefore use %ju and typecast the rlim_t variables to<br>
&gt; &gt; @@ -20,6 +20,7 @@ Upstream-Status: Denied [<a href=3D"https://gi=
thub.com/systemd/systemd/pull/7199" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/systemd/systemd/pull/7199</a>]<br>
&gt; &gt;=C2=A0 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt;=C2=A0 [Rebased for v241]<br>
&gt; &gt;=C2=A0 Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windr=
iver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/format-util.h |=C2=A0 8 +-------<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/rlimit-util.c | 10 +++++-----<br>
&gt; &gt; @@ -46,10 +47,10 @@ index b7e18768e3..3195ab205d 100644<br>
&gt; &gt;=C2=A0 =C2=A0#if SIZEOF_DEV_T =3D=3D 8<br>
&gt; &gt;=C2=A0 =C2=A0#=C2=A0 define DEV_FMT &quot;%&quot; PRIu64<br>
&gt; &gt;=C2=A0 diff --git a/src/basic/rlimit-util.c b/src/basic/rlimit-ut=
il.c<br>
&gt; &gt; -index 880976312c..9e1b61cd4a 100644<br>
&gt; &gt; +index 23d108d5df..94373c9422 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/rlimit-util.c<br>
&gt; &gt;=C2=A0 +++ b/src/basic/rlimit-util.c<br>
&gt; &gt; -@@ -306,13 +306,13 @@ int rlimit_format(const struct rlimit *rl=
, char **ret) {<br>
&gt; &gt; +@@ -308,13 +308,13 @@ int rlimit_format(const struct rlimit *rl=
, char **ret) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rl-&gt;rlim_cur &gt;=
=
=3D RLIM_INFINITY &amp;&amp; rl-&gt;rlim_max &gt;=3D RLIM_INFINITY)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0s =3D strdup(&quot;infinity&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (rl-&gt;rlim_cur=
 &gt;=3D RLIM_INFINITY)<br>
&gt; &gt; @@ -67,7 +68,7 @@ index 880976312c..9e1b61cd4a 100644<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!s)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return -ENOMEM;<br>
&gt; &gt; -@@ -403,7 +403,7 @@ int rlimit_nofile_safe(void) {<br>
&gt; &gt; +@@ -405,7 +405,7 @@ int rlimit_nofile_safe(void) {<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rl.rlim_cur =3D FD_SETSI=
ZE;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (setrlimit(RLIMIT_NOF=
ILE, &amp;rl) &lt; 0)<br>
&gt; &gt; @@ -77,10 +78,10 @@ index 880976312c..9e1b61cd4a 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; &gt;=C2=A0 =C2=A0}<br>
&gt; &gt;=C2=A0 diff --git a/src/core/execute.c b/src/core/execute.c<br>
&gt; &gt; -index 89632e0582..335283776c 100644<br>
&gt; &gt; +index f82fc294c0..4696d055a8 100644<br>
&gt; &gt;=C2=A0 --- a/src/core/execute.c<br>
&gt; &gt;=C2=A0 +++ b/src/core/execute.c<br>
&gt; &gt; -@@ -5288,9 +5288,9 @@ void exec_context_dump(const ExecContext =
*c, FILE* f, const char *prefix) {<br>
&gt; &gt; +@@ -5370,9 +5370,9 @@ void exec_context_dump(const ExecContext =
*c, FILE* f, const char *prefix) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (unsigned i =3D 0; i=
 &lt; RLIM_NLIMITS; i++)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if (c-&gt;rlimit[i]) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(f, &quot;%sLimit%s: &quot; RLIM_=
FMT &quot;\n&quot;,<br>
&gt; &gt; @@ -92,6 +93,3 @@ index 89632e0582..335283776c 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0}<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (c-&gt;ioprio_set) {<=
br>
&gt; &gt; ---<br>
&gt; &gt; -2.27.0<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0011-test-sizeof.=
c-Disable-tests-for-missing-typedefs-in-.patch b/meta/recipes-core/systemd/=
systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch<br>
&gt; &gt; index 6d7fdbcb64..b1d782719c 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disab=
le-tests-for-missing-typedefs-in-.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disab=
le-tests-for-missing-typedefs-in-.patch<br>
&gt; &gt; @@ -1,13 +1,13 @@<br>
&gt; &gt; -From d1db531ddd3bbf94d5e764b7917bcc8684ff6357 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From f8be7b283309e4332eedc088774daac637afef7b Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt;=C2=A0 From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com"=
 target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Wed, 28 Feb 2018 21:25:22 -0800<br>
&gt; &gt; -Subject: [PATCH 11/26] test-sizeof.c: Disable tests for missing=
 typedefs in<br>
&gt; &gt; - musl<br>
&gt; &gt; +Subject: [PATCH] test-sizeof.c: Disable tests for missing typed=
efs in musl<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Upstream-Status: Inappropriate [musl specific]<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt;=C2=A0 Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windr=
iver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0src/test/test-sizeof.c | 4 ++++<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 4 insertions(+)<br>
&gt; &gt; @@ -37,6 +37,3 @@ index 3c9dc180fa..e1a59d408c 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info(pid_t);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info(uid_t);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info(gid_t);<br>
&gt; &gt; ---<br>
&gt; &gt; -2.27.0<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0012-don-t-pass-A=
T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/syst=
emd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch<br>
&gt; &gt; index c15b6e7d82..5f2178734d 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLI=
NK_NOFOLLOW-flag-to-faccessat.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLI=
NK_NOFOLLOW-flag-to-faccessat.patch<br>
&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; -From 03e89da266edf70121a19ffc32a78cc3b97585ef Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From 06915b70735caa66987af758ebdc4207757ae758 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt;=C2=A0 From: Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.=
com" target=3D"_blank">armccurdy@gmail.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Tue, 10 Oct 2017 14:33:30 -0700<br>
&gt; &gt; -Subject: [PATCH 12/26] don&#39;t pass AT_SYMLINK_NOFOLLOW flag =
to faccessat()<br>
&gt; &gt; +Subject: [PATCH] don&#39;t pass AT_SYMLINK_NOFOLLOW flag to fac=
cessat()<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Avoid using AT_SYMLINK_NOFOLLOW flag. It doesn&#39;t seem =
like the right<br>
&gt; &gt;=C2=A0 thing to do and it&#39;s not portable (not supported by mu=
sl). See:<br>
&gt; &gt; @@ -25,20 +25,22 @@ just historical and not actually necessary o=
r desired behaviour?<br>
&gt; &gt;=C2=A0 Upstream-Status: Inappropriate [musl specific]<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Signed-off-by: Andre McCurdy &lt;<a href=3D"mailto:armccur=
dy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt; - src/basic/fs-util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 22 +++=
++++++++++++++++++-<br>
&gt; &gt; + src/basic/fs-util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 23 +++=
++++++++++++++++++--<br>
&gt; &gt;=C2=A0 =C2=A0src/shared/base-filesystem.c |=C2=A0 6 +++---<br>
&gt; &gt; - 2 files changed, 24 insertions(+), 4 deletions(-)<br>
&gt; &gt; + 2 files changed, 24 insertions(+), 5 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h<br>
&gt; &gt; -index 5dc8853eac..0491b3dae2 100644<br>
&gt; &gt; +index 027037f7a7..16eb379caf 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/fs-util.h<br>
&gt; &gt;=C2=A0 +++ b/src/basic/fs-util.h<br>
&gt; &gt; -@@ -43,7 +43,27 @@ int futimens_opath(int fd, const struct time=
spec ts[2]);<br>
&gt; &gt; +@@ -44,8 +44,27 @@ int futimens_opath(int fd, const struct time=
spec ts[2]);<br>
&gt; &gt;=C2=A0 =C2=A0int fd_warn_permissions(const char *path, int fd);<b=
r>
&gt; &gt;=C2=A0 =C2=A0int stat_warn_permissions(const char *path, const st=
ruct stat *st);<br>
&gt; &gt;<br>
&gt; &gt; --#define laccess(path, mode) faccessat(AT_FDCWD, (path), (mode)=
, AT_SYMLINK_NOFOLLOW)<br>
&gt; &gt; +-#define laccess(path, mode)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (faccessat(AT_FDCWD, (path), (mode=
), AT_SYMLINK_NOFOLLOW) &lt; 0 ? -errno : 0)<br>
&gt; &gt;=C2=A0 +/*<br>
&gt; &gt;=C2=A0 +=C2=A0 =C2=A0Avoid using AT_SYMLINK_NOFOLLOW flag. It doe=
sn&#39;t seem like the right thing to<br>
&gt; &gt;=C2=A0 +=C2=A0 =C2=A0do and it&#39;s not portable (not supported =
by musl). See:<br>
&gt; &gt; @@ -94,6 +96,3 @@ index 1d05409086..1ed06c31ab 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt; ---<br>
&gt; &gt; -2.27.0<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0013-Define-glibc=
-compatible-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/=
systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch<br>
&gt; &gt; index 89736bcfde..51b145729d 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compat=
ible-basename-for-non-glibc-syste.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compat=
ible-basename-for-non-glibc-syste.patch<br>
&gt; &gt; @@ -1,8 +1,7 @@<br>
&gt; &gt; -From dd134880e9a16595ab473934577e873c748e9c7a Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From 0c44af262cfa07c57db4b32de1f7610af47797f4 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Sun, 27 May 2018 08:36:44 -0700<br>
&gt; &gt; -Subject: [PATCH 13/26] Define glibc compatible basename() for n=
on-glibc<br>
&gt; &gt; - systems<br>
&gt; &gt; +Subject: [PATCH] Define glibc compatible basename() for non-gli=
bc systems<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Fixes builds with musl, even though systemd is adamant abo=
ut<br>
&gt; &gt;=C2=A0 using non-posix basename implementation, we have a way out=
<br>
&gt; &gt; @@ -10,12 +9,13 @@ using non-posix basename implementation, we h=
ave a way out<br>
&gt; &gt;=C2=A0 Upstream-Status: Inappropriate [musl specific]<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0src/machine/machine-dbus.c | 5 +++++<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 5 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/machine/machine-dbus.c b/src/machine/mach=
ine-dbus.c<br>
&gt; &gt; -index f5780f1aec..aec5825b3e 100644<br>
&gt; &gt; +index 3a1e4f9072..ab87b9882c 100644<br>
&gt; &gt;=C2=A0 --- a/src/machine/machine-dbus.c<br>
&gt; &gt;=C2=A0 +++ b/src/machine/machine-dbus.c<br>
&gt; &gt;=C2=A0 @@ -11,6 +11,11 @@<br>
&gt; &gt; @@ -30,6 +30,3 @@ index f5780f1aec..aec5825b3e 100644<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;alloc-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;bus-common-errors.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;bus-get-properties.h&quot;<br>
&gt; &gt; ---<br>
&gt; &gt; -2.27.0<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0014-Do-not-disab=
le-buffering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/=
systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch<br>
&gt; &gt; index e95d2ae078..7444d4375f 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buff=
ering-when-writing-to-oom_score_a.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buff=
ering-when-writing-to-oom_score_a.patch<br>
&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; -From 55af446156da863b5b36a1109845858956a4c274 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From 0f4b60e34a806055c678eb97a7ec7e21291bcf48 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt;=C2=A0 From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com"=
 target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Wed, 4 Jul 2018 15:00:44 +0800<br>
&gt; &gt; -Subject: [PATCH 14/26] Do not disable buffering when writing to=
 oom_score_adj<br>
&gt; &gt; +Subject: [PATCH] Do not disable buffering when writing to oom_s=
core_adj<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 On musl, disabling buffering when writing to oom_score_adj=
 will<br>
&gt; &gt;=C2=A0 cause the following error.<br>
&gt; &gt; @@ -19,15 +19,16 @@ Upstream-Status: Inappropriate [musl specifi=
c]<br>
&gt; &gt;=C2=A0 Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windr=
iver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 [rebased for systemd 243]<br>
&gt; &gt;=C2=A0 Signed-off-by: Scott Murray &lt;<a href=3D"mailto:scott.mu=
rray@konsulko.com" target=3D"_blank">scott.murray@konsulko.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/process-util.c | 2 +-<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/basic/process-util.c b/src/basic/process-=
util.c<br>
&gt; &gt; -index 4417101569..556dab8ebf 100644<br>
&gt; &gt; +index caa9dfe3a3..6101f43db5 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/process-util.c<br>
&gt; &gt;=C2=A0 +++ b/src/basic/process-util.c<br>
&gt; &gt; -@@ -1536,7 +1536,7 @@ int set_oom_score_adjust(int value) {<br>
&gt; &gt; +@@ -1523,7 +1523,7 @@ int set_oom_score_adjust(int value) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(t, &quot;%i&quot=
;, value);<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return write_string_file=
(&quot;/proc/self/oom_score_adj&quot;, t,<br>
&gt; &gt; @@ -36,6 +37,3 @@ index 4417101569..556dab8ebf 100644<br>
&gt; &gt;=C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0int pidfd_get_pid(int fd, pid_t *ret) {<br>
&gt; &gt; ---<br>
&gt; &gt; -2.27.0<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0015-distinguish-=
XSI-compliant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/=
systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch<br>
&gt; &gt; index 5cdcf84dc1..90cc70d216 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-com=
pliant-strerror_r-from-GNU-specif.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-com=
pliant-strerror_r-from-GNU-specif.patch<br>
&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; -From e382845aed90cfe4496a8351d57d4466dd2e9a9c Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From c30ab62d18ce88187f5eb6c236e0977c9337f68d Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt;=C2=A0 From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com"=
 target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Tue, 10 Jul 2018 15:40:17 +0800<br>
&gt; &gt; -Subject: [PATCH 15/26] distinguish XSI-compliant strerror_r fro=
m GNU-specifi<br>
&gt; &gt; +Subject: [PATCH] distinguish XSI-compliant strerror_r from GNU-=
specifi<br>
&gt; &gt;=C2=A0 =C2=A0strerror_r<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 XSI-compliant strerror_r and GNU-specifi strerror_r are di=
fferent.<br>
&gt; &gt; @@ -18,28 +18,12 @@ assigned to (char *) variable, resulting in =
segment fault.<br>
&gt; &gt;=C2=A0 Upstream-Status: Inappropriate [musl specific]<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windr=
iver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt; - src/journal/journal-send.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 ++++=
+<br>
&gt; &gt; - src/libsystemd/sd-bus/bus-error.c | 5 +++++<br>
&gt; &gt; + src/libsystemd/sd-bus/bus-error.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 5 +++++<br>
&gt; &gt; + src/libsystemd/sd-journal/journal-send.c | 5 +++++<br>
&gt; &gt;=C2=A0 =C2=A02 files changed, 10 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; -diff --git a/src/journal/journal-send.c b/src/journal/journal-s=
end.c<br>
&gt; &gt; -index e8e6ad555b..8ca5271d02 100644<br>
&gt; &gt; ---- a/src/journal/journal-send.c<br>
&gt; &gt; -+++ b/src/journal/journal-send.c<br>
&gt; &gt; -@@ -348,7 +348,12 @@ static int fill_iovec_perror_and_send(cons=
t char *message, int skip, struct iove<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c=
har* j;<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e=
rrno =3D 0;<br>
&gt; &gt; -+#ifndef __GLIBC__<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strerr=
or_r(_saved_errno_, buffer + 8 + k, n - 8 - k);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 j =3D =
buffer + 8 + k;<br>
&gt; &gt; -+#else<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0j=
 =3D strerror_r(_saved_errno_, buffer + 8 + k, n - 8 - k);<br>
&gt; &gt; -+#endif<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
f (errno =3D=3D 0) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0char error[STRLEN(&quot;ERRNO=3D&quot;) + DECIM=
AL_STR_MAX(int) + 1];<br>
&gt; &gt; -<br>
&gt; &gt;=C2=A0 diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsy=
stemd/sd-bus/bus-error.c<br>
&gt; &gt;=C2=A0 index 8da2024a50..9605a9b869 100644<br>
&gt; &gt;=C2=A0 --- a/src/libsystemd/sd-bus/bus-error.c<br>
&gt; &gt; @@ -57,6 +41,20 @@ index 8da2024a50..9605a9b869 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if (errno =3D=3D ERANGE || strlen(x) &gt;=3D k - 1) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(m);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0k *=3D 2;<br>
&gt; &gt; ---<br>
&gt; &gt; -2.27.0<br>
&gt; &gt; -<br>
&gt; &gt; +diff --git a/src/libsystemd/sd-journal/journal-send.c b/src/lib=
systemd/sd-journal/journal-send.c<br>
&gt; &gt; +index e8e6ad555b..8ca5271d02 100644<br>
&gt; &gt; +--- a/src/libsystemd/sd-journal/journal-send.c<br>
&gt; &gt; ++++ b/src/libsystemd/sd-journal/journal-send.c<br>
&gt; &gt; +@@ -348,7 +348,12 @@ static int fill_iovec_perror_and_send(cons=
t char *message, int skip, struct iove<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c=
har* j;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e=
rrno =3D 0;<br>
&gt; &gt; ++#ifndef __GLIBC__<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strerr=
or_r(_saved_errno_, buffer + 8 + k, n - 8 - k);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 j =3D =
buffer + 8 + k;<br>
&gt; &gt; ++#else<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0j=
 =3D strerror_r(_saved_errno_, buffer + 8 + k, n - 8 - k);<br>
&gt; &gt; ++#endif<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
f (errno =3D=3D 0) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0char error[STRLEN(&quot;ERRNO=3D&quot;) + DECIM=
AL_STR_MAX(int) + 1];<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0016-Hide-__start=
_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch b/meta/recipes-core/systemd/s=
ystemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch<br>
&gt; &gt; index 9a125de638..de7f9ecfa2 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ER=
ROR_MAP-and-__stop_BUS_ERROR_MAP.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ER=
ROR_MAP-and-__stop_BUS_ERROR_MAP.patch<br>
&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; -From 0c7af5f288231a8c0545e169e01ba5ee173cafe7 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From fa86e5578256dddb296fd30128929ea7c4b792a4 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt;=C2=A0 From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com"=
 target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Mon, 25 Feb 2019 15:18:00 +0800<br>
&gt; &gt; -Subject: [PATCH 16/26] Hide __start_BUS_ERROR_MAP and __stop_BU=
S_ERROR_MAP<br>
&gt; &gt; +Subject: [PATCH] Hide __start_BUS_ERROR_MAP and __stop_BUS_ERRO=
R_MAP<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 for currently unknown reasons they get exported to the sha=
red libries<br>
&gt; &gt;=C2=A0 even without being listed in the sym file<br>
&gt; &gt; @@ -11,6 +11,7 @@ Upstream-Status: Pending<br>
&gt; &gt;=C2=A0 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt;=C2=A0 [Rebased for v241]<br>
&gt; &gt;=C2=A0 Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windr=
iver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0src/libsystemd/sd-bus/bus-error.c | 4 ++--<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; &gt; @@ -30,6 +31,3 @@ index 9605a9b869..38b6cf90c3 100644<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0/* Additional maps registered with sd_bus_error_add_=
map() are in this<br>
&gt; &gt;=C2=A0 =C2=A0 * NULL terminated array */<br>
&gt; &gt; ---<br>
&gt; &gt; -2.27.0<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0017-missing_type=
.h-add-__compar_d_fn_t-definition.patch b/meta/recipes-core/systemd/systemd=
/0017-missing_type.h-add-__compar_d_fn_t-definition.patch<br>
&gt; &gt; index 31747c6b40..d9ef2b8a47 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-=
__compar_d_fn_t-definition.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-=
__compar_d_fn_t-definition.patch<br>
&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; -From 32dd7a47b87793cd836ab4bb776d1524f24c2d58 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From 11e730694706fa354a0e43c588ef66677a777d9a Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt;=C2=A0 From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com"=
 target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Mon, 25 Feb 2019 15:27:54 +0800<br>
&gt; &gt; -Subject: [PATCH 17/26] missing_type.h: add __compar_d_fn_t defi=
nition<br>
&gt; &gt; +Subject: [PATCH] missing_type.h: add __compar_d_fn_t definition=
<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Fix the following compile failure:<br>
&gt; &gt;=C2=A0 src/basic/util.h:71:18: error: unknown type name &#39;__co=
mpar_d_fn_t&#39;; did you mean &#39;__compar_fn_t&#39;?<br>
&gt; &gt; @@ -9,6 +9,7 @@ src/basic/util.h:71:18: error: unknown type name=
 &#39;__compar_d_fn_t&#39;; did you mean<br>
&gt; &gt;=C2=A0 Upstream-Status: Inappropriate [musl specific]<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windr=
iver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/missing_type.h | 1 +<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 1 insertion(+)<br>
&gt; &gt; @@ -25,6 +26,3 @@ index 3df1084ef2..697aa7f58a 100644<br>
&gt; &gt;=C2=A0 =C2=A0#endif<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#ifndef __COMPAR_FN_T<br>
&gt; &gt; ---<br>
&gt; &gt; -2.27.0<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0018-avoid-redefi=
nition-of-prctl_mm_map-structure.patch b/meta/recipes-core/systemd/systemd/=
0018-avoid-redefinition-of-prctl_mm_map-structure.patch<br>
&gt; &gt; index 56d361a213..3b60854233 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-=
of-prctl_mm_map-structure.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-=
of-prctl_mm_map-structure.patch<br>
&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; -From bfc3416edeb69082ac9b9c9e844f12d7b45bb006 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From 45bae28d3da6607d33d54f4b30a500f5249aadde Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt;=C2=A0 From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com"=
 target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Mon, 25 Feb 2019 15:44:54 +0800<br>
&gt; &gt; -Subject: [PATCH 18/26] avoid redefinition of prctl_mm_map struc=
ture<br>
&gt; &gt; +Subject: [PATCH] avoid redefinition of prctl_mm_map structure<b=
r>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Fix the following compile failure:<br>
&gt; &gt;=C2=A0 error: redefinition of &#39;struct prctl_mm_map&#39;<br>
&gt; &gt; @@ -9,6 +9,7 @@ error: redefinition of &#39;struct prctl_mm_map&=
#39;<br>
&gt; &gt;=C2=A0 Upstream-Status: Inappropriate [musl specific]<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windr=
iver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/missing_prctl.h | 2 ++<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
&gt; &gt; @@ -27,6 +28,3 @@ index ab851306ba..5547cad875 100644<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0/* 58319057b7847667f0c9585b9de0e8932b0fdb08 (4.3) */=
<br>
&gt; &gt;=C2=A0 =C2=A0#ifndef PR_CAP_AMBIENT<br>
&gt; &gt; ---<br>
&gt; &gt; -2.27.0<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0019-Handle-missi=
ng-LOCK_EX.patch b/meta/recipes-core/systemd/systemd/0019-Handle-missing-LO=
CK_EX.patch<br>
&gt; &gt; index 6ca196489b..7d6433f317 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK=
_EX.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK=
_EX.patch<br>
&gt; &gt; @@ -1,16 +1,17 @@<br>
&gt; &gt; -From e427f03de2c56e868bb0f24aa231315b2dae1b71 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From 6e593ff2afbe4bfe15eee2ec34e51490a38462f5 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt;=C2=A0 From: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmai=
l.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Fri, 7 Aug 2020 15:19:27 +0000<br>
&gt; &gt; -Subject: [PATCH 19/26] Handle missing LOCK_EX<br>
&gt; &gt; +Subject: [PATCH] Handle missing LOCK_EX<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Upstream-Status: Inappropriate [musl specific]<br>
&gt; &gt;=C2=A0 Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.kie=
rnan@gmail.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0src/partition/makefs.c | 1 +<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 1 insertion(+)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/partition/makefs.c b/src/partition/makefs=
.c<br>
&gt; &gt; -index fd924d2231..b97580fdcc 100644<br>
&gt; &gt; +index 7c94fbfedb..42f966722d 100644<br>
&gt; &gt;=C2=A0 --- a/src/partition/makefs.c<br>
&gt; &gt;=C2=A0 +++ b/src/partition/makefs.c<br>
&gt; &gt;=C2=A0 @@ -6,6 +6,7 @@<br>
&gt; &gt; @@ -21,6 +22,3 @@ index fd924d2231..b97580fdcc 100644<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;alloc-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;blockdev-util.h&quot;<br>
&gt; &gt; ---<br>
&gt; &gt; -2.27.0<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0020-Fix-incompat=
ible-pointer-type-struct-sockaddr_un.patch b/meta/recipes-core/systemd/syst=
emd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch<br>
&gt; &gt; index f74de43849..1faee1c055 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-po=
inter-type-struct-sockaddr_un.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-po=
inter-type-struct-sockaddr_un.patch<br>
&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; -From 9abbc5e69e21aef0d4d4567e69302fa660b76c53 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From ac579b296aa29c2f1dad9425c6d795e154ec8f7c Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt;=C2=A0 From: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmai=
l.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Fri, 7 Aug 2020 15:20:17 +0000<br>
&gt; &gt; -Subject: [PATCH 20/26] Fix incompatible pointer type struct soc=
kaddr_un *<br>
&gt; &gt; +Subject: [PATCH] Fix incompatible pointer type struct sockaddr_=
un *<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 | ../../../../../../workspace/sources/systemd/src/nspawn/n=
spawn.c: In function &#39;cant_be_in_netns&#39;:<br>
&gt; &gt;=C2=A0 | ../../../../../../workspace/sources/systemd/src/nspawn/n=
spawn.c:4893:25: error: passing argument 2 of &#39;connect&#39; from incomp=
atible pointer type [-Werror=3Dincompatible-pointer-types]<br>
&gt; &gt; @@ -18,15 +18,16 @@ Subject: [PATCH 20/26] Fix incompatible poin=
ter type struct sockaddr_un *<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Upstream-Status: Inappropriate [musl specific]<br>
&gt; &gt;=C2=A0 Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.kie=
rnan@gmail.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0src/nspawn/nspawn.c | 2 +-<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c<br>
&gt; &gt; -index 0842731c18..3528b7ff14 100644<br>
&gt; &gt; +index a4ac8ed2bb..0c41a48d4b 100644<br>
&gt; &gt;=C2=A0 --- a/src/nspawn/nspawn.c<br>
&gt; &gt;=C2=A0 +++ b/src/nspawn/nspawn.c<br>
&gt; &gt; -@@ -5084,7 +5084,7 @@ static int cant_be_in_netns(void) {<br>
&gt; &gt; +@@ -5125,7 +5125,7 @@ static int cant_be_in_netns(void) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd &lt; 0)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return log_error_errno(errno, &quot;Failed to allocate udev control =
socket: %m&quot;);<br>
&gt; &gt;<br>
&gt; &gt; @@ -35,6 +36,3 @@ index 0842731c18..3528b7ff14 100644<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if (errno =3D=3D ENOENT || ERRNO_IS_DISCONNECT(errno))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return log_error_errno(SYNTHETIC_ERRNO(E=
OPNOTSUPP),<br>
&gt; &gt; ---<br>
&gt; &gt; -2.27.0<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0021-test-json.c-=
define-M_PIl.patch b/meta/recipes-core/systemd/systemd/0021-test-json.c-def=
ine-M_PIl.patch<br>
&gt; &gt; index fa6652a5bf..14c8ff73a0 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-=
M_PIl.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-=
M_PIl.patch<br>
&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; -From 1f5bc54bed0b365e7e448c26f6c792dbe8b3b198 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From 6bc78df50adb48d24a2abfdf65b44b932cc5a571 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt;=C2=A0 From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com"=
 target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Mon, 25 Feb 2019 16:53:06 +0800<br>
&gt; &gt; -Subject: [PATCH 21/26] test-json.c: define M_PIl<br>
&gt; &gt; +Subject: [PATCH] test-json.c: define M_PIl<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Fix the following compile failure:<br>
&gt; &gt;=C2=A0 src/test/test-json.c:305:50: error: &#39;M_PIl&#39; undecl=
ared (first use in this function); did you mean &#39;M_PI&#39;?<br>
&gt; &gt; @@ -9,6 +9,7 @@ src/test/test-json.c:305:50: error: &#39;M_PIl&#=
39; undeclared (first use in this functi<br>
&gt; &gt;=C2=A0 Upstream-Status: Inappropriate [musl specific]<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windr=
iver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0src/test/test-json.c | 4 ++++<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 4 insertions(+)<br>
&gt; &gt; @@ -28,6 +29,3 @@ index 1d4b11945e..572c8cf9d0 100644<br>
&gt; &gt;=C2=A0 =C2=A0static void test_tokenizer(const char *data, ...) {<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned line =3D 0, col=
umn =3D 0;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *state =3D NULL;<br=
>
&gt; &gt; ---<br>
&gt; &gt; -2.27.0<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0022-do-not-disab=
le-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0022-d=
o-not-disable-buffer-in-writing-files.patch<br>
&gt; &gt; index 675fd20f11..bd627c51e9 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buff=
er-in-writing-files.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buff=
er-in-writing-files.patch<br>
&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; -From 564dba5ad0cd884e3f69fa19ca64095413578ea5 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From 7cb6579572b50ef44bc0a321a4c73cce55b0c2f2 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt;=C2=A0 From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com"=
 target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Fri, 1 Mar 2019 15:22:15 +0800<br>
&gt; &gt; -Subject: [PATCH 22/26] do not disable buffer in writing files<b=
r>
&gt; &gt; +Subject: [PATCH] do not disable buffer in writing files<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Do not disable buffer in writing files, otherwise we get<b=
r>
&gt; &gt;=C2=A0 failure at boot for musl like below.<br>
&gt; &gt; @@ -18,10 +18,12 @@ Signed-off-by: Chen Qi &lt;<a href=3D"mailto=
:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.v=
alek@siemens.com" target=3D"_blank">andrej.valek@siemens.com</a>&gt;<br>
&gt; &gt;=C2=A0 [rebased for systemd 243]<br>
&gt; &gt;=C2=A0 Signed-off-by: Scott Murray &lt;<a href=3D"mailto:scott.mu=
rray@konsulko.com" target=3D"_blank">scott.murray@konsulko.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/cgroup-util.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++-----<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/procfs-util.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/smack-util.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt; + src/basic/sysctl-util.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/util.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 =C2=A0src/binfmt/binfmt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++---<br>
&gt; &gt;=C2=A0 =C2=A0src/core/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt; &gt; @@ -32,18 +34,15 @@ Signed-off-by: Scott Murray &lt;<a href=3D"m=
ailto:scott.murray@konsulko.com" target=3D"_blank">scott.murray@konsulko.co=
m</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0src/nspawn/nspawn-cgroup.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 =C2=A0src/nspawn/nspawn.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++---<br>
&gt; &gt;=C2=A0 =C2=A0src/shared/cgroup-setup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt; &gt; - src/shared/sysctl-util.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 =C2=A0src/sleep/sleep.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 ++++----<br>
&gt; &gt; - src/udev/udevadm-trigger.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt; - src/udev/udevd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 =C2=A0src/vconsole/vconsole-setup.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt; - 18 files changed, 35 insertions(+), 35 deletions(-)<br>
&gt; &gt; + 16 files changed, 33 insertions(+), 33 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-ut=
il.c<br>
&gt; &gt; -index bb960f183c..cb804c5f4b 100644<br>
&gt; &gt; +index 50c1ae1b2b..5b40e92163 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/cgroup-util.c<br>
&gt; &gt;=C2=A0 +++ b/src/basic/cgroup-util.c<br>
&gt; &gt; -@@ -759,7 +759,7 @@ int cg_install_release_agent(const char *co=
ntroller, const char *agent) {<br>
&gt; &gt; +@@ -765,7 +765,7 @@ int cg_install_release_agent(const char *co=
ntroller, const char *agent) {<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sc =3D strstrip(contents=
);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (isempty(sc)) {<br>
&gt; &gt; @@ -52,7 +51,7 @@ index bb960f183c..cb804c5f4b 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if (r &lt; 0)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return r;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (!path_equal(s=
c, agent))<br>
&gt; &gt; -@@ -777,7 +777,7 @@ int cg_install_release_agent(const char *co=
ntroller, const char *agent) {<br>
&gt; &gt; +@@ -783,7 +783,7 @@ int cg_install_release_agent(const char *co=
ntroller, const char *agent) {<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sc =3D strstrip(contents=
);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (streq(sc, &quot;0&qu=
ot;)) {<br>
&gt; &gt; @@ -61,7 +60,7 @@ index bb960f183c..cb804c5f4b 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if (r &lt; 0)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return r;<br>
&gt; &gt;<br>
&gt; &gt; -@@ -804,7 +804,7 @@ int cg_uninstall_release_agent(const char *=
controller) {<br>
&gt; &gt; +@@ -810,7 +810,7 @@ int cg_uninstall_release_agent(const char *=
controller) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return r;<br>
&gt; &gt;<br>
&gt; &gt; @@ -70,7 +69,7 @@ index bb960f183c..cb804c5f4b 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return r;<br>
&gt; &gt;<br>
&gt; &gt; -@@ -814,7 +814,7 @@ int cg_uninstall_release_agent(const char *=
controller) {<br>
&gt; &gt; +@@ -820,7 +820,7 @@ int cg_uninstall_release_agent(const char *=
controller) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return r;<br>
&gt; &gt;<br>
&gt; &gt; @@ -79,7 +78,7 @@ index bb960f183c..cb804c5f4b 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return r;<br>
&gt; &gt;<br>
&gt; &gt; -@@ -1646,7 +1646,7 @@ int cg_set_attribute(const char *controll=
er, const char *path, const char *attri<br>
&gt; &gt; +@@ -1650,7 +1650,7 @@ int cg_set_attribute(const char *controll=
er, const char *path, const char *attri<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return r;<br>
&gt; &gt;<br>
&gt; &gt; @@ -121,11 +120,24 @@ index 3362ee3924..80c0f2a52e 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return r;<br>
&gt; &gt;<br>
&gt; &gt; +diff --git a/src/basic/sysctl-util.c b/src/basic/sysctl-util.c<=
br>
&gt; &gt; +index c96b5cd77f..d2476d9665 100644<br>
&gt; &gt; +--- a/src/basic/sysctl-util.c<br>
&gt; &gt; ++++ b/src/basic/sysctl-util.c<br>
&gt; &gt; +@@ -93,7 +93,7 @@ int sysctl_write_ip_property(int af, const ch=
ar *ifname, const char *property, c<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log_debug(&quot;Setting &#39;=
%s&#39; to &#39;%s&#39;&quot;, p, value);<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return write_string_file(p, value,=
 WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER);<b=
r>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return write_string_file(p, value,=
 WRITE_STRING_FILE_VERIFY_ON_FAILURE | 0);<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; + int sysctl_read(const char *property, char **ret) {<br>
&gt; &gt;=C2=A0 diff --git a/src/basic/util.c b/src/basic/util.c<br>
&gt; &gt; -index f98ecf3858..13e0f7431f 100644<br>
&gt; &gt; +index 955b18bd2a..6d89c90176 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/util.c<br>
&gt; &gt;=C2=A0 +++ b/src/basic/util.c<br>
&gt; &gt; -@@ -267,7 +267,7 @@ void disable_coredumps(void) {<br>
&gt; &gt; +@@ -234,7 +234,7 @@ void disable_coredumps(void) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (detect_container() &=
gt; 0)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return;<br>
&gt; &gt;<br>
&gt; &gt; @@ -135,7 +147,7 @@ index f98ecf3858..13e0f7431f 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0log_debug_errno(r, &quot;Failed to turn off coredumps, ignoring: %m&=
quot;);<br>
&gt; &gt;=C2=A0 =C2=A0}<br>
&gt; &gt;=C2=A0 diff --git a/src/binfmt/binfmt.c b/src/binfmt/binfmt.c<br>
&gt; &gt; -index 43ed2f385b..37a6f578f7 100644<br>
&gt; &gt; +index f6b72e0bae..e9fd4d06be 100644<br>
&gt; &gt;=C2=A0 --- a/src/binfmt/binfmt.c<br>
&gt; &gt;=C2=A0 +++ b/src/binfmt/binfmt.c<br>
&gt; &gt;=C2=A0 @@ -48,7 +48,7 @@ static int delete_rule(const char *rule)=
 {<br>
&gt; &gt; @@ -156,7 +168,7 @@ index 43ed2f385b..37a6f578f7 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return log_error_errno(r, &quot;Failed to add binary format: %m&quot=
;);<br>
&gt; &gt;<br>
&gt; &gt; -@@ -223,7 +223,7 @@ static int run(int argc, char *argv[]) {<br=
>
&gt; &gt; +@@ -222,7 +222,7 @@ static int run(int argc, char *argv[]) {<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0}<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* Flush out all rules */<br>
&gt; &gt; @@ -166,10 +178,10 @@ index 43ed2f385b..37a6f578f7 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0STRV_FOREACH(f, files) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0k =3D apply_file(*f, true);<br>
&gt; &gt;=C2=A0 diff --git a/src/core/main.c b/src/core/main.c<br>
&gt; &gt; -index a280b756ff..334532cd42 100644<br>
&gt; &gt; +index 3ee8d0a869..ec36e3e80f 100644<br>
&gt; &gt;=C2=A0 --- a/src/core/main.c<br>
&gt; &gt;=C2=A0 +++ b/src/core/main.c<br>
&gt; &gt; -@@ -1382,7 +1382,7 @@ static int bump_unix_max_dgram_qlen(void)=
 {<br>
&gt; &gt; +@@ -1401,7 +1401,7 @@ static int bump_unix_max_dgram_qlen(void)=
 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (v &gt;=3D DEFAULT_UN=
IX_MAX_DGRAM_QLEN)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return 0;<br>
&gt; &gt;<br>
&gt; &gt; @@ -178,7 +190,7 @@ index a280b756ff..334532cd42 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return log_full_errno(IN_SET(r, -EROFS, -EPERM, -EACCES) ? LOG_DEBUG=
 : LOG_WARNING, r,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Failed to bump AF_UNIX datagram queue length, ignoring: %m=
&quot;);<br>
&gt; &gt; -@@ -1666,7 +1666,7 @@ static void initialize_core_pattern(bool =
skip_setup) {<br>
&gt; &gt; +@@ -1678,7 +1678,7 @@ static void initialize_core_pattern(bool =
skip_setup) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (getpid_cached() !=3D=
 1)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return;<br>
&gt; &gt;<br>
&gt; &gt; @@ -188,7 +200,7 @@ index a280b756ff..334532cd42 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0log_warning_errno(r, &quot;Failed to write &#39;%s&#39; to /proc/sys=
/kernel/core_pattern, ignoring: %m&quot;, arg_early_core_pattern);<br>
&gt; &gt;=C2=A0 =C2=A0}<br>
&gt; &gt;=C2=A0 diff --git a/src/core/smack-setup.c b/src/core/smack-setup=
.c<br>
&gt; &gt; -index 1fe592af70..603942a000 100644<br>
&gt; &gt; +index 8cc1696a4f..ab7b4ba2c3 100644<br>
&gt; &gt;=C2=A0 --- a/src/core/smack-setup.c<br>
&gt; &gt;=C2=A0 +++ b/src/core/smack-setup.c<br>
&gt; &gt;=C2=A0 @@ -325,17 +325,17 @@ int mac_smack_setup(bool *loaded_pol=
icy) {<br>
&gt; &gt; @@ -214,7 +226,7 @@ index 1fe592af70..603942a000 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0log_warning_errno(r, &quot;Failed to set SMACK netlabel rule \&quot;=
127.0.0.1 -CIPSO\&quot;: %m&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0#endif<br>
&gt; &gt;=C2=A0 diff --git a/src/hibernate-resume/hibernate-resume.c b/src=
/hibernate-resume/hibernate-resume.c<br>
&gt; &gt; -index d8f91f4e66..a088e6e2d8 100644<br>
&gt; &gt; +index 58e35e403e..1d0beb4008 100644<br>
&gt; &gt;=C2=A0 --- a/src/hibernate-resume/hibernate-resume.c<br>
&gt; &gt;=C2=A0 +++ b/src/hibernate-resume/hibernate-resume.c<br>
&gt; &gt;=C2=A0 @@ -45,7 +45,7 @@ int main(int argc, char *argv[]) {<br>
&gt; &gt; @@ -227,20 +239,20 @@ index d8f91f4e66..a088e6e2d8 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0log_error_errno(r, &quot;Failed to write &#39;%s&#39; to /sys/power/=
resume: %m&quot;, major_minor);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return EXIT_FAILURE;<br>
&gt; &gt;=C2=A0 diff --git a/src/libsystemd/sd-device/sd-device.c b/src/li=
bsystemd/sd-device/sd-device.c<br>
&gt; &gt; -index d06f90ce1d..43d0a58750 100644<br>
&gt; &gt; +index d82f01a164..b8fd63346c 100644<br>
&gt; &gt;=C2=A0 --- a/src/libsystemd/sd-device/sd-device.c<br>
&gt; &gt;=C2=A0 +++ b/src/libsystemd/sd-device/sd-device.c<br>
&gt; &gt; -@@ -1976,7 +1976,7 @@ _public_ int sd_device_set_sysattr_value(=
sd_device *device, const char *sysattr,<br>
&gt; &gt; +@@ -1987,7 +1987,7 @@ _public_ int sd_device_set_sysattr_value(=
sd_device *device, const char *sysattr,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!value)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return -ENOMEM;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D write_string_file(path,=
 value, WRITE_STRING_FILE_DISABLE_BUFFER | WRITE_STRING_FILE_NOFOLLOW);<br>
&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D write_string_file(path,=
 value, 0 | WRITE_STRING_FILE_NOFOLLOW);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
f (r =3D=3D -ELOOP)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/=
* On failure, clear cache entry, as we do not know how it fails. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d=
evice_remove_cached_sysattr_value(device, sysattr);<br>
&gt; &gt;=C2=A0 diff --git a/src/login/logind-dbus.c b/src/login/logind-db=
us.c<br>
&gt; &gt; -index 7d757aa286..a5d9da5b7e 100644<br>
&gt; &gt; +index 3bc424b83b..5f5eef0843 100644<br>
&gt; &gt;=C2=A0 --- a/src/login/logind-dbus.c<br>
&gt; &gt;=C2=A0 +++ b/src/login/logind-dbus.c<br>
&gt; &gt;=C2=A0 @@ -1330,7 +1330,7 @@ static int trigger_device(Manager *m=
, sd_device *d) {<br>
&gt; &gt; @@ -266,10 +278,10 @@ index cb01b25bc6..e92051268b 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0log_error_errno(r, &quot;Failed to move process: %m&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0goto finish;<br>
&gt; &gt;=C2=A0 diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c<br>
&gt; &gt; -index 3528b7ff14..11b0c20f95 100644<br>
&gt; &gt; +index 0c41a48d4b..9c893b18e4 100644<br>
&gt; &gt;=C2=A0 --- a/src/nspawn/nspawn.c<br>
&gt; &gt;=C2=A0 +++ b/src/nspawn/nspawn.c<br>
&gt; &gt; -@@ -2667,7 +2667,7 @@ static int reset_audit_loginuid(void) {<b=
r>
&gt; &gt; +@@ -2695,7 +2695,7 @@ static int reset_audit_loginuid(void) {<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (streq(p, &quot;42949=
67295&quot;))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return 0;<br>
&gt; &gt;<br>
&gt; &gt; @@ -278,7 +290,7 @@ index 3528b7ff14..11b0c20f95 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0log_error_errno(r,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Failed=
 to reset audit login UID. This probably means that your kernel is too\n&qu=
ot;<br>
&gt; &gt; -@@ -3920,13 +3920,13 @@ static int setup_uid_map(pid_t pid) {<b=
r>
&gt; &gt; +@@ -3948,13 +3948,13 @@ static int setup_uid_map(pid_t pid) {<b=
r>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xsprintf(uid_map, &quot;=
/proc/&quot; PID_FMT &quot;/uid_map&quot;, pid);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xsprintf(line, UID_FMT &=
quot; &quot; UID_FMT &quot; &quot; UID_FMT &quot;\n&quot;, 0, arg_uid_shift=
, arg_uid_range);<br>
&gt; &gt; @@ -316,21 +328,8 @@ index f197f715c7..077f893177 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log_debug_er=
rno(r, &quot;Failed to %s controller %s for %s (%s): %m&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FLAGS_SET(mask, bit) ? &quot;=
enable&quot; : &quot;disable&quot;, n, p, fs);<br>
&gt; &gt; -diff --git a/src/shared/sysctl-util.c b/src/shared/sysctl-util.=
c<br>
&gt; &gt; -index 670c33108b..7c7c3dcfb6 100644<br>
&gt; &gt; ---- a/src/shared/sysctl-util.c<br>
&gt; &gt; -+++ b/src/shared/sysctl-util.c<br>
&gt; &gt; -@@ -93,7 +93,7 @@ int sysctl_write_ip_property(int af, const ch=
ar *ifname, const char *property, c<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log_debug(&quot;Setting &#39;=
%s&#39; to &#39;%s&#39;&quot;, p, value);<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 return write_string_file(p, value,=
 WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER);<b=
r>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return write_string_file(p, value,=
 WRITE_STRING_FILE_VERIFY_ON_FAILURE | 0);<br>
&gt; &gt; - }<br>
&gt; &gt; -<br>
&gt; &gt; - int sysctl_read(const char *property, char **content) {<br>
&gt; &gt;=C2=A0 diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c<br>
&gt; &gt; -index 39ab554290..d0e566645d 100644<br>
&gt; &gt; +index 262d4cea66..0523e8dc9b 100644<br>
&gt; &gt;=C2=A0 --- a/src/sleep/sleep.c<br>
&gt; &gt;=C2=A0 +++ b/src/sleep/sleep.c<br>
&gt; &gt;=C2=A0 @@ -48,7 +48,7 @@ static int write_hibernate_location_info=
(const HibernateLocation *hibernate_loca<br>
&gt; &gt; @@ -369,34 +368,8 @@ index 39ab554290..d0e566645d 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if (k &gt;=3D 0)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0log_debug_errno(k, &quot;Failed to write &#39;%s&#39; to /sys/power/=
state: %m&quot;, *state);<br>
&gt; &gt; -diff --git a/src/udev/udevadm-trigger.c b/src/udev/udevadm-trig=
ger.c<br>
&gt; &gt; -index 5c74184c33..65f528314e 100644<br>
&gt; &gt; ---- a/src/udev/udevadm-trigger.c<br>
&gt; &gt; -+++ b/src/udev/udevadm-trigger.c<br>
&gt; &gt; -@@ -43,7 +43,7 @@ static int exec_list(sd_device_enumerator *e,=
 const char *action, Set **settle_s<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
f (!filename)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0return log_oom();<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D =
write_string_file(filename, action, WRITE_STRING_FILE_DISABLE_BUFFER);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D =
write_string_file(filename, action, 0);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
f (r &lt; 0) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0bool ignore =3D IN_SET(r, -ENOENT, -ENODEV);<br=
>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/src/udev/udevd.c b/src/udev/udevd.c<br>
&gt; &gt; -index d24b8d4398..d123a43904 100644<br>
&gt; &gt; ---- a/src/udev/udevd.c<br>
&gt; &gt; -+++ b/src/udev/udevd.c<br>
&gt; &gt; -@@ -1192,7 +1192,7 @@ static int synthesize_change_one(sd_devic=
e *dev, const char *syspath) {<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filename =3D strjoina(syspath=
, &quot;/uevent&quot;);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log_device_debug(dev, &quot;d=
evice is closed, synthesising &#39;change&#39; on %s&quot;, syspath);<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D write_string_file(filename, =
&quot;change&quot;, WRITE_STRING_FILE_DISABLE_BUFFER);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D write_string_file(filename, =
&quot;change&quot;, 0);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eturn log_device_debug_errno(dev, r, &quot;Failed to write &#39;change&#39;=
 to %s: %m&quot;, filename);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt;=C2=A0 diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/=
vconsole-setup.c<br>
&gt; &gt; -index b28e2853e1..115b7233a0 100644<br>
&gt; &gt; +index d1c3febdd5..1cc68694d1 100644<br>
&gt; &gt;=C2=A0 --- a/src/vconsole/vconsole-setup.c<br>
&gt; &gt;=C2=A0 +++ b/src/vconsole/vconsole-setup.c<br>
&gt; &gt;=C2=A0 @@ -116,7 +116,7 @@ static int toggle_utf8_vc(const char *=
name, int fd, bool utf8) {<br>
&gt; &gt; @@ -408,6 +381,3 @@ index b28e2853e1..115b7233a0 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return log_warning_errno(r, &quot;Failed to %s sysfs UTF-8 flag: %m&=
quot;, enable_disable(utf8));<br>
&gt; &gt;<br>
&gt; &gt; ---<br>
&gt; &gt; -2.27.0<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0025-Handle-__cpu=
_mask-usage.patch b/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mas=
k-usage.patch<br>
&gt; &gt; index 1cc3985d12..7d1bd60255 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-u=
sage.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-u=
sage.patch<br>
&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; -From bbda4a48a34662393117fc677c3a678d4ce4c2ec Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From d73755cc60f401f0f20f357752e45aeeeef8e83f Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt;=C2=A0 From: Scott Murray &lt;<a href=3D"mailto:scott.murray@kons=
ulko.com" target=3D"_blank">scott.murray@konsulko.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Fri, 13 Sep 2019 19:26:27 -0400<br>
&gt; &gt; -Subject: [PATCH 25/26] Handle __cpu_mask usage<br>
&gt; &gt; +Subject: [PATCH] Handle __cpu_mask usage<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Fixes errors:<br>
&gt; &gt;<br>
&gt; &gt; @@ -18,6 +18,7 @@ add a typedef to cpu-set-util.h defining __cpu=
_mask appropriately.<br>
&gt; &gt;=C2=A0 Upstream-Status: Inappropriate [musl specific]<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Signed-off-by: Scott Murray &lt;<a href=3D"mailto:scott.mu=
rray@konsulko.com" target=3D"_blank">scott.murray@konsulko.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0src/shared/cpu-set-util.h | 2 ++<br>
&gt; &gt;=C2=A0 =C2=A0src/test/test-sizeof.c=C2=A0 =C2=A0 | 2 +-<br>
&gt; &gt; @@ -55,6 +56,3 @@ index e1a59d408c..c269ea6e8c 100644<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0/* Print information about various types. Useful whe=
n diagnosing<br>
&gt; &gt;=C2=A0 =C2=A0 * gcc diagnostics on an unfamiliar architecture. */=
<br>
&gt; &gt; ---<br>
&gt; &gt; -2.27.0<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0026-Handle-missi=
ng-gshadow.patch b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gs=
hadow.patch<br>
&gt; &gt; index 4180afb08e..068600fa44 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gsha=
dow.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gsha=
dow.patch<br>
&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; -From 47bf88f74717b417e4adbcc04256334b2335c873 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From 04e94f9a15101daa8f65a9af269d26cda2a24056 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt;=C2=A0 From: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmai=
l.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Tue, 10 Mar 2020 11:05:20 +0000<br>
&gt; &gt; -Subject: [PATCH 26/26] Handle missing gshadow<br>
&gt; &gt; +Subject: [PATCH] Handle missing gshadow<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 gshadow usage is now present in the userdb code. Mask all =
uses of it to<br>
&gt; &gt;=C2=A0 allow compilation on musl<br>
&gt; &gt; @@ -10,6 +10,7 @@ Upstream-Status: Inappropriate [musl specific]=
<br>
&gt; &gt;=C2=A0 Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.kie=
rnan@gmail.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
&gt; &gt;=C2=A0 [Rebased for v247]<br>
&gt; &gt;=C2=A0 Signed-off-by: Luca Boccassi &lt;<a href=3D"mailto:luca.bo=
ccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsoft.com</a>&gt;=
<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0src/shared/user-record-nss.c | 20 ++++++++++++++++++=
++<br>
&gt; &gt;=C2=A0 =C2=A0src/shared/user-record-nss.h |=C2=A0 4 ++++<br>
&gt; &gt; @@ -138,10 +139,10 @@ index 22ab04d6ee..4e52e7a911 100644<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;shadow.h&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/shared/userdb.c b/src/shared/userdb.c<br>
&gt; &gt; -index 2d480283d1..0d19764f2e 100644<br>
&gt; &gt; +index 613350bd46..5c821d28cd 100644<br>
&gt; &gt;=C2=A0 --- a/src/shared/userdb.c<br>
&gt; &gt;=C2=A0 +++ b/src/shared/userdb.c<br>
&gt; &gt; -@@ -929,13 +929,16 @@ int groupdb_iterator_get(UserDBIterator *=
iterator, GroupRecord **ret) {<br>
&gt; &gt; +@@ -938,13 +938,16 @@ int groupdb_iterator_get(UserDBIterator *=
iterator, GroupRecord **ret) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if (gr) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_cleanup_free_ char *buffer =3D NULL;<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool incomplete =3D false;<br>
&gt; &gt; @@ -155,10 +156,10 @@ index 2d480283d1..0d19764f2e 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iterator-&gt=
;synthesize_nobody =3D false;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 +#if ENABLE_GSHADOW<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D nss_sgrp_for_group(gr, &amp;sgrp, &amp;bu=
ffer);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log_debug_errno(r, =
&quot;Failed to acquire shadow entry for group %s, ignoring: %m&quot;, gr-&=
gt;gr_name);<br>
&gt; &gt; -@@ -943,6 +946,9 @@ int groupdb_iterator_get(UserDBIterator *it=
erator, GroupRecord **ret) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!FLAGS_SET(iterator-&gt;flags, USERDB_AVOID=
_SHADOW)) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D nss_sgrp_for_=
group(gr, &amp;sgrp, &amp;buffer);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0) {<br>
&gt; &gt; +@@ -957,6 +960,9 @@ int groupdb_iterator_get(UserDBIterator *it=
erator, GroupRecord **ret) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D nss_group_to_group_record(gr, r &g=
t;=3D 0 ? &amp;sgrp : NULL, ret);<br>
&gt; &gt; @@ -168,6 +169,3 @@ index 2d480283d1..0d19764f2e 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return r;<br=
>
&gt; &gt;<br>
&gt; &gt; ---<br>
&gt; &gt; -2.27.0<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0027-proc-dont-tr=
igger-mount-error-with-invalid-options-o.patch b/meta/recipes-core/systemd/=
systemd/0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 94a4c307b5..0000000000<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0027-proc-dont-trigger-m=
ount-error-with-invalid-options-o.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,97 +0,0 @@<br>
&gt; &gt; -From 297aba739cd689e4dc9f43bb1422ec88d481099a Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; -From: Paul Gortmaker &lt;<a href=3D"mailto:paul.gortmaker@windr=
iver.com" target=3D"_blank">paul.gortmaker@windriver.com</a>&gt;<br>
&gt; &gt; -Date: Wed, 13 Jan 2021 21:09:33 +0000<br>
&gt; &gt; -Subject: [PATCH] proc: dont trigger mount error with invalid op=
tions on old<br>
&gt; &gt; - kernels<br>
&gt; &gt; -<br>
&gt; &gt; -As of commit 4e39995371738b04d98d27b0d34ea8fe09ec9fab (&quot;co=
re: introduce<br>
&gt; &gt; -ProtectProc=3D and ProcSubset=3D to expose hidepid=3D and subse=
t=3D procfs<br>
&gt; &gt; -mount options&quot;) kernels older than v5.8 generate multple w=
arnings at<br>
&gt; &gt; -boot, as seen in this Yocto build from today:<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0qemux86-64 login: root<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0[=C2=A0 =C2=A065.829009] proc: Bad value fo=
r &#39;hidepid&#39;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0root@qemux86-64:~# dmesg|grep proc:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0[=C2=A0 =C2=A016.990706] proc: Bad value fo=
r &#39;hidepid&#39;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0[=C2=A0 =C2=A028.060178] proc: Bad value fo=
r &#39;hidepid&#39;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0[=C2=A0 =C2=A028.874229] proc: Bad value fo=
r &#39;hidepid&#39;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0[=C2=A0 =C2=A032.685107] proc: Bad value fo=
r &#39;hidepid&#39;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0[=C2=A0 =C2=A065.829009] proc: Bad value fo=
r &#39;hidepid&#39;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0root@qemux86-64:~#<br>
&gt; &gt; -<br>
&gt; &gt; -The systemd maintainer has dismissed this as something people s=
hould<br>
&gt; &gt; -simply ignore[1] and has no interest in trying to avoid it by<b=
r>
&gt; &gt; -proactively checking the kernel version, so people can safely a=
ssume<br>
&gt; &gt; -that they will never see this version check commit upstream.<br=
>
&gt; &gt; -<br>
&gt; &gt; -However, as can be seen above, telling people to just ignore it=
 is not<br>
&gt; &gt; -an option, as we&#39;ll end up answering the same question and =
dealing with<br>
&gt; &gt; -the same bug over and over again.<br>
&gt; &gt; -<br>
&gt; &gt; -The commit that triggers this is systemd v247-rc1~378^2~3 -- so=
 any<br>
&gt; &gt; -systemd 247 and above plus kernel v5.7 or older will need this.=
<br>
&gt; &gt; -<br>
&gt; &gt; -[1] <a href=3D"https://github.com/systemd/systemd/issues/16896"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/systemd/systemd/is=
sues/16896</a><br>
&gt; &gt; -<br>
&gt; &gt; -Upstream-Status: Denied [<a href=3D"https://github.com/systemd/=
systemd/issues/16896" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/systemd/systemd/issues/16896</a>]<br>
&gt; &gt; -Signed-off-by: Paul Gortmaker &lt;<a href=3D"mailto:paul.gortma=
ker@windriver.com" target=3D"_blank">paul.gortmaker@windriver.com</a>&gt;<b=
r>
&gt; &gt; -<br>
&gt; &gt; -Index: git/src/core/namespace.c<br>
&gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; ---- git.orig/src/core/namespace.c<br>
&gt; &gt; -+++ git/src/core/namespace.c<br>
&gt; &gt; -@@ -4,7 +4,9 @@<br>
&gt; &gt; - #include &lt;linux/loop.h&gt;<br>
&gt; &gt; - #include &lt;sched.h&gt;<br>
&gt; &gt; - #include &lt;stdio.h&gt;<br>
&gt; &gt; -+#include &lt;stdlib.h&gt;<br>
&gt; &gt; - #include &lt;sys/mount.h&gt;<br>
&gt; &gt; -+#include &lt;sys/utsname.h&gt;<br>
&gt; &gt; - #include &lt;unistd.h&gt;<br>
&gt; &gt; - #include &lt;linux/fs.h&gt;<br>
&gt; &gt; -<br>
&gt; &gt; -@@ -860,13 +862,32 @@ static int mount_sysfs(const MountEntry<b=
r>
&gt; &gt; -<br>
&gt; &gt; - static int mount_procfs(const MountEntry *m, const NamespaceIn=
fo *ns_info) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *entry_path;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 int r;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int r, major, minor;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct utsname uts;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool old =3D false;<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(m);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(ns_info);<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entry_path =3D mount_entry_pa=
th(m);<br>
&gt; &gt; -<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If uname says that the system i=
s older than v5.8, then the textual hidepid=3D stuff is not<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* supported by the kernel, a=
nd thus the per-instance hidepid=3D neither, which means we<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* really don&#39;t want to u=
se it, since it would affect our host&#39;s /proc * mount. Hence let&#39;s<=
br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* gracefully fallback to a c=
lassic, unrestricted version. */<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D uname(&amp;uts);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return =
errno;<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 major =3D atoi(uts.release);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 minor =3D atoi(strchr(uts.release,=
 &#39;.&#39;) + 1);<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (major &lt; 5 || (major =3D=3D =
5 &amp;&amp; minor &lt; 8)) {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_de=
bug(&quot;Pre v5.8 kernel detected [v%d.%d] - skipping hidepid=3D&quot;, ma=
jor, minor);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 old =
=3D true;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -+<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Mount a new instance, so t=
hat we get the one that matches our user namespace, if we are running in<br=
>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * one. i.e we don&#39;t reus=
e existing mounts here under any condition, we want a new instance owned by=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * our user namespace and wit=
h our hidepid=3D settings applied. Hence, let&#39;s get rid of everything<b=
r>
&gt; &gt; -@@ -875,8 +896,8 @@ static int mount_procfs(const MountEntry<br=
>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) mkdir_p_label(entry_pa=
th, 0755);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) umount_recursive(entry=
_path, 0);<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ns_info-&gt;protect_proc !=3D =
PROTECT_PROC_DEFAULT ||<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ns_info-&gt;proc_sub=
set !=3D PROC_SUBSET_ALL) {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!old &amp;&amp; (ns_info-&gt;p=
rotect_proc !=3D PROTECT_PROC_DEFAULT ||<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ns_info-&gt;proc_sub=
set !=3D PROC_SUBSET_ALL)) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_=
cleanup_free_ char *opts =3D NULL;<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/=
* Starting with kernel 5.8 procfs&#39; hidepid=3D logic is truly per-instan=
ce (previously it<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd/0028-missing_sysc=
all.h-Define-MIPS-ABI-defines-for-musl.patch b/meta/recipes-core/systemd/sy=
stemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch<br>
&gt; &gt; index bbee6e6b28..2289404d8d 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-D=
efine-MIPS-ABI-defines-for-musl.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-D=
efine-MIPS-ABI-defines-for-musl.patch<br>
&gt; &gt; @@ -1,4 +1,4 @@<br>
&gt; &gt; -From 7b32582c066549fea0f7180a6c575e7fa37a867f Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From 366cd28f5f93ba7c861cd32a718251770d74830e Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Mon, 12 Apr 2021 23:44:53 -0700<br>
&gt; &gt;=C2=A0 Subject: [PATCH] missing_syscall.h: Define MIPS ABI define=
s for musl<br>
&gt; &gt; @@ -10,15 +10,16 @@ them here in case they are undefined<br>
&gt; &gt;=C2=A0 Upstream-Status: Pending<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/missing_syscall.h | 6 ++++++<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 6 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/basic/missing_syscall.h b/src/basic/missi=
ng_syscall.h<br>
&gt; &gt; -index 0594a1b930..495d161334 100644<br>
&gt; &gt; +index 1384324804..0202d00372 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/missing_syscall.h<br>
&gt; &gt;=C2=A0 +++ b/src/basic/missing_syscall.h<br>
&gt; &gt; -@@ -15,6 +15,12 @@<br>
&gt; &gt; +@@ -20,6 +20,12 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;asm/sgidefs.h&gt;<br>
&gt; &gt;=C2=A0 =C2=A0#endif<br>
&gt; &gt;<br>
&gt; &gt; @@ -28,9 +29,6 @@ index 0594a1b930..495d161334 100644<br>
&gt; &gt;=C2=A0 +#define _MIPS_SIM_ABI64=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A03<br>
&gt; &gt;=C2=A0 +#endif<br>
&gt; &gt;=C2=A0 +<br>
&gt; &gt; - #if defined(__x86_64__) &amp;&amp; defined(__ILP32__)<br>
&gt; &gt; - #=C2=A0 define systemd_SC_arch_bias(x) ((x) | /* __X32_SYSCALL=
_BIT */ 0x40000000)<br>
&gt; &gt; - #elif defined(__ia64__)<br>
&gt; &gt; ---<br>
&gt; &gt; -2.31.1<br>
&gt; &gt; -<br>
&gt; &gt; + #include &quot;missing_keyctl.h&quot;<br>
&gt; &gt; + #include &quot;missing_stat.h&quot;<br>
&gt; &gt; + #include &quot;missing_syscall_def.h&quot;<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd=
_247.6.bb" rel=3D"noreferrer" target=3D"_blank">systemd_247.6.bb</a> b/meta=
/recipes-core/systemd/<a href=3D"http://systemd_248.3.bb" rel=3D"noreferrer=
" target=3D"_blank">systemd_248.3.bb</a><br>
&gt; &gt; similarity index 99%<br>
&gt; &gt; rename from meta/recipes-core/systemd/<a href=3D"http://systemd_=
247.6.bb" rel=3D"noreferrer" target=3D"_blank">systemd_247.6.bb</a><br>
&gt; &gt; rename to meta/recipes-core/systemd/<a href=3D"http://systemd_24=
8.3.bb" rel=3D"noreferrer" target=3D"_blank">systemd_248.3.bb</a><br>
&gt; &gt; index ce6ac7ebaa..b241330d96 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd_247.6.=
bb" rel=3D"noreferrer" target=3D"_blank">systemd_247.6.bb</a><br>
&gt; &gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_248.3.=
bb" rel=3D"noreferrer" target=3D"_blank">systemd_248.3.bb</a><br>
&gt; &gt; @@ -14,7 +14,8 @@ inherit useradd pkgconfig meson perlnative upd=
ate-rc.d update-alternatives qemu<br>
&gt; &gt;=C2=A0 # that we don&#39;t build both udev and systemd in world b=
uilds.<br>
&gt; &gt;=C2=A0 REQUIRED_DISTRO_FEATURES =3D &quot;systemd&quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRC_URI +=3D &quot;file://touchscreen.rules \<br>
&gt; &gt; +SRC_URI +=3D &quot; \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://touchscreen.rul=
es \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://00-create-=
volatile.conf \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.conta=
ins(&#39;PACKAGECONFIG&#39;, &#39;polkit_hostnamed_fallback&#39;, &#39;file=
://org.freedesktop.hostname1_no_polkit.conf&#39;, &#39;&#39;, d)} \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.conta=
ins(&#39;PACKAGECONFIG&#39;, &#39;polkit_hostnamed_fallback&#39;, &#39;file=
://00-hostnamed-network-user.conf&#39;, &#39;&#39;, d)} \<br>
&gt; &gt; @@ -24,9 +25,6 @@ SRC_URI +=3D &quot;file://touchscreen.rules \<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-binfm=
t-Don-t-install-dependency-links-at-install-tim.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-implm=
ent-systemd-sysv-install-for-OE.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-syste=
md.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-logind-Res=
tore-chvt-as-non-root-user-without-polkit.patch \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0027-proc-dont-=
trigger-mount-error-with-invalid-options-o.patch \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-analyze-re=
solve-executable-path-if-it-is-relative.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 # patches needed by musl<br>
&gt; &gt; @@ -474,6 +472,7 @@ FILES_${PN}-container =3D &quot;${sysconfdir=
}/dbus-1/system.d/org.freedesktop.import1.c<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${rootlibexecdir}/systemd/systemd-machin=
ed \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${rootlibexecdir}/systemd/systemd-pull \=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${exec_prefix}/lib/tmpfiles.d/systemd-ns=
pawn.conf \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0${exec_prefix}/lib/tmpfiles.d/README \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${systemd_system_unitdir}/systemd-nspawn=
@.service \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/libnss_mymachines.so.2 \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/dbus-1/system-services/org.fr=
eedesktop.import1.service \<br>
&gt; &gt; @@ -605,6 +604,7 @@ FILES_${PN} =3D &quot; ${base_bindir}/* \<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${=
exec_prefix}/lib/environment.d \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${=
localstatedir} \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${=
rootlibexecdir}/modprobe.d/systemd.conf \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${rootl=
ibexecdir}/modprobe.d/README \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${=
datadir}/dbus-1/system.d/org.freedesktop.timedate1.conf \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${=
datadir}/dbus-1/system.d/org.freedesktop.locale1.conf \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${=
datadir}/dbus-1/system.d/org.freedesktop.network1.conf \<br>
&gt; &gt; @@ -647,6 +647,7 @@ FILES_udev +=3D &quot;${base_sbindir}/udevd =
\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${r=
ootlibexecdir}/udev/ata_id \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${r=
ootlibexecdir}/udev/cdrom_id \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${r=
ootlibexecdir}/udev/collect \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${rootli=
bexecdir}/udev/dmi_memory_id \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${r=
ootlibexecdir}/udev/fido_id \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${r=
ootlibexecdir}/udev/findkeyboards \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${r=
ootlibexecdir}/udev/keyboard-force-release.sh \<br>
&gt; &gt; @@ -674,6 +675,7 @@ FILES_udev +=3D &quot;${base_sbindir}/udevd =
\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${r=
ootlibexecdir}/udev/rules.d/61-autosuspend-manual.rules \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${r=
ootlibexecdir}/udev/rules.d/64-btrfs.rules \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${r=
ootlibexecdir}/udev/rules.d/70-joystick.rules \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${rootli=
bexecdir}/udev/rules.d/70-memory.rules \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${r=
ootlibexecdir}/udev/rules.d/70-mouse.rules \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${r=
ootlibexecdir}/udev/rules.d/70-power-switch.rules \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${r=
ootlibexecdir}/udev/rules.d/70-touchpad.rules \<br>
&gt; &gt; @@ -683,6 +685,7 @@ FILES_udev +=3D &quot;${base_sbindir}/udevd =
\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${r=
ootlibexecdir}/udev/rules.d/80-drivers.rules \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${r=
ootlibexecdir}/udev/rules.d/80-net-setup-link.rules \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${r=
ootlibexecdir}/udev/rules.d/90-vconsole.rules \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${rootli=
bexecdir}/udev/rules.d/README \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${s=
ysconfdir}/udev \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${s=
ysconfdir}/init.d/systemd-udevd \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${s=
ystemd_unitdir}/system/*udev* \<br>
&gt; &gt; --<br>
&gt; &gt; 2.31.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
</blockquote></div>

--000000000000fafdc905c322d93e--
