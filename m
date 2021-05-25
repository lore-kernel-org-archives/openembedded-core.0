Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web08.10180.1621950775506587628
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 06:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GqhhuKm6;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id j184so8369750qkd.6
        for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 06:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Zwm84Ftmg9LQ6md+XO/Q4oELEoVpyyh8Z8z+a1J7YVI=;
        b=GqhhuKm604cbyd8W01ffhy8Th7pqO6JS2OyAgMsA2dvIDw5wrWfzRigHm2TOlQwtJP
         tdakFKKvnLYO/Go42/pQ4C9Fl4PupN/kiT9C8LSed+M40Kg7QH3V87b1pOmOVX/xN11u
         6uuwNOmYxsNjrN5QA88SRwkW0IElCIF85xkfydJEAmUeBlPeJ74v1vLePPysSsQouViP
         rXqSiwf47skpOZm0QEkQlSEkYxoybsoMs7QtqQuBft0ZkngkKNH2D0WOo1NhVfE3TYvy
         yF/u93fr3aonXDAIebk/LpjR4CmgfssUbtToDkpg34pBx5icEBSAE8CmHUnmQHC6F4jM
         uqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Zwm84Ftmg9LQ6md+XO/Q4oELEoVpyyh8Z8z+a1J7YVI=;
        b=TwnKtLrCkmNLeE/Pu58QjB4ecUjT8JbnKQxLqq/Wv3sWeCq4oaSUJQSuW+UzchkSG2
         QJiHc8+jv1Cf03LEt9mOYJo+vQClqHppwtE9R16H1f0nQ7PaYlgjHlNItqKneEXLIUCp
         30Yd8f+B231AxaSyCi1tuACv/JTfLmC/gIGUQFFbWhGpOkBXJClSx2Vej00x8cAOkPEH
         0nWGoXOg47Qj/PddTR7SKBv9AM944u5GcWR8pl1nwsH6/FFExb4MVRVwYA+BhWJ1YU5A
         Ee/IlDVSUGSpYY8pVkWbP5+wQpeAL6iQPMooQVOyt/Z0aVUteZcucUhOt08Y1DEZik88
         s3ZA==
X-Gm-Message-State: AOAM531OscfQJrhLWMaQyuwJNdTRDIq9K84oy5H6A3ZKPSBHgglsCirm
	VfPR0km/7Exm0XcgmNtpgNW04cIZfAE+1DDFmwE=
X-Google-Smtp-Source: ABdhPJz2TwkOIq6i+l4VKxaGIOmMuPtml8XlZLNXPwyGK7QHiT2mWRChirC05WFUWbcYisrwC94qR52vrfYHcDDaA4M=
X-Received: by 2002:a37:270d:: with SMTP id n13mr34017664qkn.146.1621950774102;
 Tue, 25 May 2021 06:52:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a37:5643:0:0:0:0:0 with HTTP; Tue, 25 May 2021 06:52:53
 -0700 (PDT)
In-Reply-To: <CANNYZj9V6e9+uqA=PPF06SKop4mp-UGfsoZ21mZF7spVsm21Aw@mail.gmail.com>
References: <20210524091347.419253-1-alex.kanavin@gmail.com>
 <20210524091347.419253-2-alex.kanavin@gmail.com> <CAMKF1sq9mwdOOPFebQ1xXHXEJOLrx_-3jgHCb_6VhBd5yoZh8A@mail.gmail.com>
 <CAMKF1sp3yeZV3VW7i0MHhaj0e8LvMpXd4yb5SUKXRf-WArDkPA@mail.gmail.com> <CANNYZj9V6e9+uqA=PPF06SKop4mp-UGfsoZ21mZF7spVsm21Aw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 25 May 2021 06:52:53 -0700
Message-ID: <CAMKF1srLE4eN4JoQfXyt4ma6_uVxZwpxB8AqmyWN8xZx=dWKpQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/21] systemd: update 247.6 -> 248.3
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000bbd0c905c327d751"

--000000000000bbd0c905c327d751
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, May 25, 2021, Alexander Kanavin <alex.kanavin@gmail.com> wrote:

> I have to ask: should musl patches for systemd be maintained separately?
> It's a big pile, they aren't accepted by upstream, they aren't tested on
> the AB (hence I didn't even notice the breakage), and they cause rebase
> problems at every version upgrade.
>
> I would propose that a separate recipe is made that takes the sources fro=
m
> a repo, rather than carry the patches in oe-core.
>

It=E2=80=99s fine as it is


>
> Alex
>
> On Tue, 25 May 2021 at 03:41, Khem Raj <raj.khem@gmail.com> wrote:
>
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
> > like other files in 0005-src-basic-missing.h-check-for-missing-strndupa=
.
> patch
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
> > >  ...md-boot_247.6.bb =3D> systemd-boot_248.3.bb} |   0
> > >  meta/recipes-core/systemd/systemd.inc         |   6 +-
> > >  ...ve-executable-path-if-it-is-relative.patch |  39 ---
> > >  ...chvt-as-non-root-user-without-polkit.patch | 227
> ------------------
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
> > >  .../{systemd_247.6.bb =3D> systemd_248.3.bb}    |  11 +-
> > >  32 files changed, 388 insertions(+), 951 deletions(-)
> > >  delete mode 100644 meta/recipes-core/systemd/files/
> 48fff0a2af3f62acd446ebec8081b039b72caad8.patch
> > >  delete mode 100644 meta/recipes-core/systemd/files/
> 7c5fd25119a495009ea62f79e5daec34cc464628.patch
> > >  rename meta/recipes-core/systemd/{systemd-boot_247.6.bb =3D>
> systemd-boot_248.3.bb} (100%)
> > >  delete mode 100644 meta/recipes-core/systemd/
> systemd/0001-analyze-resolve-executable-path-if-it-is-relative.patch
> > >  delete mode 100644 meta/recipes-core/systemd/
> systemd/0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch
> > >  delete mode 100644 meta/recipes-core/systemd/systemd/0027-proc-dont-
> trigger-mount-error-with-invalid-options-o.patch
> > >  rename meta/recipes-core/systemd/{systemd_247.6.bb =3D>
> systemd_248.3.bb} (99%)
> > >
> > > diff --git a/meta/recipes-core/systemd/files/
> 48fff0a2af3f62acd446ebec8081b039b72caad8.patch
> b/meta/recipes-core/systemd/files/48fff0a2af3f62acd446ebec8081b0
> 39b72caad8.patch
> > > deleted file mode 100644
> > > index e3ce296741..0000000000
> > > --- a/meta/recipes-core/systemd/files/48fff0a2af3f62acd446ebec8081b0
> 39b72caad8.patch
> > > +++ /dev/null
> > > @@ -1,179 +0,0 @@
> > > -From 48fff0a2af3f62acd446ebec8081b039b72caad8 Mon Sep 17 00:00:00
> 2001
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
> > > - src/boot/efi/missing_efi.h | 67 ++++++++++++++++++++++++++++++
> ++++++++
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
> > > -         EFI_GUID EfiSimpleTextInputExProtocolGuid =3D
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
> > > - #define EFI_CONTROL_PRESSED             (EFI_RIGHT_CONTROL_PRESSED|
> EFI_LEFT_CONTROL_PRESSED)
> > > - #define EFI_ALT_PRESSED                 (EFI_RIGHT_ALT_PRESSED|EFI_
> LEFT_ALT_PRESSED)
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
> > > diff --git a/meta/recipes-core/systemd/files/
> 7c5fd25119a495009ea62f79e5daec34cc464628.patch
> b/meta/recipes-core/systemd/files/7c5fd25119a495009ea62f79e5daec
> 34cc464628.patch
> > > deleted file mode 100644
> > > index ae449791f1..0000000000
> > > --- a/meta/recipes-core/systemd/files/7c5fd25119a495009ea62f79e5daec
> 34cc464628.patch
> > > +++ /dev/null
> > > @@ -1,53 +0,0 @@
> > > -From 7c5fd25119a495009ea62f79e5daec34cc464628 Mon Sep 17 00:00:00
> 2001
> > > -From: =3D?UTF-8?q?Zbigniew=3D20J=3DC4=3D99drzejewski-Szmek?=3D <
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
> > > -@@ -184,17 +184,20 @@ html =3D custom_target(
> > > -         depends : html_pages,
> > > -         command : ['echo'])
> > > -
> > > --run_target(
> > > --        'doc-sync',
> > > --        depends : man_pages + html_pages,
> > > --        command : ['rsync', '-rlv',
> > > --                   '--delete-excluded',
> > > --                   '--include=3Dman',
> > > --                   '--include=3D*.html',
> > > --                   '--exclude=3D*',
> > > --                   '--omit-dir-times',
> > > --                   meson.current_build_dir(),
> > > --                   get_option('www-target')])
> > > -+rsync =3D find_program('rsync', required : false)
> > > -+if rsync.found()
> > > -+        run_target(
> > > -+                'doc-sync',
> > > -+                depends : man_pages + html_pages,
> > > -+                command : [rsync, '-rlv',
> > > -+                           '--delete-excluded',
> > > -+                           '--include=3Dman',
> > > -+                           '--include=3D*.html',
> > > -+                           '--exclude=3D*',
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
> > > @@ -14,11 +14,9 @@ LICENSE =3D "GPLv2 & LGPLv2.1"
> > >  LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D
> 751419260aa954499f7abaabaa882bbe \
> > >                      file://LICENSE.LGPL2.1;md5=3D
> 4fbd65380cdd255951079008b364516c"
> > >
> > > -SRCREV =3D "17472dca0160cbe7b807ca648475fd70d0d62fe5"
> > > -SRCBRANCH =3D "v247-stable"
> > > +SRCREV =3D "37c4cfde0ce613f0f00544d3f4e2e72bf93d9c76"
> > > +SRCBRANCH =3D "v248-stable"
> > >  SRC_URI =3D "git://github.com/systemd/systemd-stable.git;protocol=3D
> git;branch=3D${SRCBRANCH}
> <http://github.com/systemd/systemd-stable.git;protocol=3Dgit;branch=3D$%7=
BSRCBRANCH%7D>
> \
> > > -           file://7c5fd25119a495009ea62f79e5daec34cc464628.patch \
> > > -           file://48fff0a2af3f62acd446ebec8081b039b72caad8.patch \
> > >  "
> > >
> > >  S =3D "${WORKDIR}/git"
> > > diff --git a/meta/recipes-core/systemd/systemd/0001-analyze-resolve-
> executable-path-if-it-is-relative.patch b/meta/recipes-core/systemd/
> systemd/0001-analyze-resolve-executable-path-if-it-is-relative.patch
> > > deleted file mode 100644
> > > index fd7f94a61d..0000000000
> > > --- a/meta/recipes-core/systemd/systemd/0001-analyze-resolve-
> executable-path-if-it-is-relative.patch
> > > +++ /dev/null
> > > @@ -1,39 +0,0 @@
> > > -From b9b7a8e3825f0433e120f7a6d7d5d635a839cab9 Mon Sep 17 00:00:00
> 2001
> > > -From: Mingli Yu <mingli.yu@windriver.com>
> > > -Date: Thu, 21 Jan 2021 06:19:44 +0000
> > > -Subject: [PATCH] analyze: resolve executable path if it is relative
> > > -
> > > -Upstream-Status: Backport [https://github.com/systemd/systemd/commit=
/
> f1fb046a985521f7d4a662f02546686ff20b7e5d]
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
> > > --                return log_unit_error_errno(u, errno, "Command %s i=
s
> not executable: %m", exec->path);
> > > -+        r =3D find_executable_full(exec->path, false, NULL);
> > > -+        if (r < 0)
> > > -+                return log_unit_error_errno(u, r, "Command %s is no=
t
> executable: %m", exec->path);
> > > -
> > > -         return 0;
> > > - }
> > > ---
> > > -2.26.2
> > > -
> > > diff --git a/meta/recipes-core/systemd/systemd/0001-logind-Restore-
> chvt-as-non-root-user-without-polkit.patch b/meta/recipes-core/systemd/
> systemd/0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch
> > > deleted file mode 100644
> > > index 89ef39bc3e..0000000000
> > > --- a/meta/recipes-core/systemd/systemd/0001-logind-Restore-
> chvt-as-non-root-user-without-polkit.patch
> > > +++ /dev/null
> > > @@ -1,227 +0,0 @@
> > > -From 150d9cade6d475570395cb418b824524dead9577 Mon Sep 17 00:00:00
> 2001
> > > -From: Joshua Watt <JPEWhacker@gmail.com>
> > > -Date: Fri, 30 Oct 2020 08:15:43 -0500
> > > -Subject: [PATCH] logind: Restore chvt as non-root user without polki=
t
> > > -
> > > -4acf0cfd2f ("logind: check PolicyKit before allowing VT switch") bro=
ke
> > > -the ability to write user sessions that run graphical sessions (e.g.
> > > -weston/X11). This was partially amended in 19bb87fbfa ("login: allow
> > > -non-console sessions to change vt") by changing the default PolicyKi=
t
> > > -policy so that non-root users are again allowed to switch the VT. Th=
is
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
> > > - src/login/logind-seat-dbus.c    | 41 ++++--------------------------
> ---
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
> > > -@@ -1047,15 +1048,7 @@ static int method_activate_session_on_seat(sd=
_bus_message
> *message, void *userda
> > > -                 return sd_bus_error_setf(error,
> BUS_ERROR_SESSION_NOT_ON_SEAT,
> > > -                                          "Session %s not on seat
> %s", session_name, seat_name);
> > > -
> > > --        r =3D bus_verify_polkit_async(
> > > --                        message,
> > > --                        CAP_SYS_ADMIN,
> > > --                        "org.freedesktop.login1.chvt",
> > > --                        NULL,
> > > --                        false,
> > > --                        UID_INVALID,
> > > --                        &m->polkit_registry,
> > > --                        error);
> > > -+        r =3D check_polkit_chvt(message, m, error);
> > > -         if (r < 0)
> > > -                 return r;
> > > -         if (r =3D=3D 0)
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
> > > -@@ -179,15 +180,7 @@ static int method_activate_session(sd_bus_messa=
ge
> *message, void *userdata, sd_b
> > > -         if (session->seat !=3D s)
> > > -                 return sd_bus_error_setf(error,
> BUS_ERROR_SESSION_NOT_ON_SEAT, "Session %s not on seat %s", name, s->id);
> > > -
> > > --        r =3D bus_verify_polkit_async(
> > > --                        message,
> > > --                        CAP_SYS_ADMIN,
> > > --                        "org.freedesktop.login1.chvt",
> > > --                        NULL,
> > > --                        false,
> > > --                        UID_INVALID,
> > > --                        &s->manager->polkit_registry,
> > > --                        error);
> > > -+        r =3D check_polkit_chvt(message, s->manager, error);
> > > -         if (r < 0)
> > > -                 return r;
> > > -         if (r =3D=3D 0)
> > > -@@ -215,15 +208,7 @@ static int method_switch_to(sd_bus_message
> *message, void *userdata, sd_bus_erro
> > > -         if (to <=3D 0)
> > > -                 return sd_bus_error_setf(error,
> SD_BUS_ERROR_INVALID_ARGS, "Invalid virtual terminal");
> > > -
> > > --        r =3D bus_verify_polkit_async(
> > > --                        message,
> > > --                        CAP_SYS_ADMIN,
> > > --                        "org.freedesktop.login1.chvt",
> > > --                        NULL,
> > > --                        false,
> > > --                        UID_INVALID,
> > > --                        &s->manager->polkit_registry,
> > > --                        error);
> > > -+        r =3D check_polkit_chvt(message, s->manager, error);
> > > -         if (r < 0)
> > > -                 return r;
> > > -         if (r =3D=3D 0)
> > > -@@ -243,15 +228,7 @@ static int method_switch_to_next(sd_bus_message
> *message, void *userdata, sd_bus
> > > -         assert(message);
> > > -         assert(s);
> > > -
> > > --        r =3D bus_verify_polkit_async(
> > > --                        message,
> > > --                        CAP_SYS_ADMIN,
> > > --                        "org.freedesktop.login1.chvt",
> > > --                        NULL,
> > > --                        false,
> > > --                        UID_INVALID,
> > > --                        &s->manager->polkit_registry,
> > > --                        error);
> > > -+        r =3D check_polkit_chvt(message, s->manager, error);
> > > -         if (r < 0)
> > > -                 return r;
> > > -         if (r =3D=3D 0)
> > > -@@ -271,15 +248,7 @@ static int method_switch_to_previous(sd_bus_mes=
sage
> *message, void *userdata, sd
> > > -         assert(message);
> > > -         assert(s);
> > > -
> > > --        r =3D bus_verify_polkit_async(
> > > --                        message,
> > > --                        CAP_SYS_ADMIN,
> > > --                        "org.freedesktop.login1.chvt",
> > > --                        NULL,
> > > --                        false,
> > > --                        UID_INVALID,
> > > --                        &s->manager->polkit_registry,
> > > --                        error);
> > > -+        r =3D check_polkit_chvt(message, s->manager, error);
> > > -         if (r < 0)
> > > -                 return r;
> > > -         if (r =3D=3D 0)
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
> > > --        r =3D bus_verify_polkit_async(
> > > --                        message,
> > > --                        CAP_SYS_ADMIN,
> > > --                        "org.freedesktop.login1.chvt",
> > > --                        NULL,
> > > --                        false,
> > > --                        UID_INVALID,
> > > --                        &s->manager->polkit_registry,
> > > --                        error);
> > > -+        r =3D check_polkit_chvt(message, s->manager, error);
> > > -         if (r < 0)
> > > -                 return r;
> > > -         if (r =3D=3D 0)
> > > -diff --git a/src/login/meson.build b/src/login/meson.build
> > > -index 0a7d3d5440..7e46be2add 100644
> > > ---- a/src/login/meson.build
> > > -+++ b/src/login/meson.build
> > > -@@ -26,6 +26,7 @@ liblogind_core_sources =3D files('''
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
> > > diff --git a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-s=
pecific-qsort_r.patch
> b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-
> specific-qsort_r.patch
> > > index d856bcb583..4cdf66e767 100644
> > > --- a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-
> specific-qsort_r.patch
> > > +++ b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-
> specific-qsort_r.patch
> > > @@ -1,7 +1,7 @@
> > > -From 66ece0b870b3a34fdabc48b88437e6cc354e9fce Mon Sep 17 00:00:00
> 2001
> > > +From 159c53612444ec1df492bae528a5a88a275b93bf Mon Sep 17 00:00:00
> 2001
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
> typeof(p[0])*) =3D func; \
> > > +@@ -55,18 +55,4 @@ static inline void _qsort_safe(void *base, size_t
> nmemb, size_t size, __compar_f
> > >                   _qsort_safe((p), (n), sizeof((p)[0]),
> (__compar_fn_t) _func_); \
> > >           })
> > > --
> > > +
> > >  -static inline void qsort_r_safe(void *base, size_t nmemb, size_t
> size, __compar_d_fn_t compar, void *userdata) {
> > >  -        if (nmemb <=3D 1)
> > >  -                return;
> > > @@ -40,11 +40,13 @@ index 1d194a1f04..3394c9eb72 100644
> > >  -                int (*_func_)(const typeof(p[0])*, const
> typeof(p[0])*, typeof(userdata)) =3D func; \
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
> > > +@@ -126,9 +126,13 @@ static struct trie* trie_free(struct trie *trie=
)
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
> > >                   for (size_t i =3D 0; i < n_rows; i++)
> > >                           sorted[i] =3D i * t->n_columns;
> > >
> > > @@ -145,7 +147,7 @@ index a13a198b7a..bce10bc607 100644
> > >           }
> > >
> > >           if (t->display_map)
> > > -@@ -2440,7 +2447,12 @@ int table_to_json(Table *t, JsonVariant **ret=
)
> {
> > > +@@ -2580,7 +2587,12 @@ int table_to_json(Table *t, JsonVariant **ret=
)
> {
> > >                   for (size_t i =3D 0; i < n_rows; i++)
> > >                           sorted[i] =3D i * t->n_columns;
> > >
> > > @@ -159,6 +161,3 @@ index a13a198b7a..bce10bc607 100644
> > >           }
> > >
> > >           if (t->display_map)
> > > ---
> > > -2.27.0
> > > -
> > > diff --git a/meta/recipes-core/systemd/systemd/0003-missing_type.h-
> add-__compare_fn_t-and-comparison_fn_.patch b/meta/recipes-core/systemd/
> systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
> > > index f43a22aa8b..9b1768d9ca 100644
> > > --- a/meta/recipes-core/systemd/systemd/0003-missing_type.h-
> add-__compare_fn_t-and-comparison_fn_.patch
> > > +++ b/meta/recipes-core/systemd/systemd/0003-missing_type.h-
> add-__compare_fn_t-and-comparison_fn_.patch
> > > @@ -1,7 +1,7 @@
> > > -From 9f0d5996bbb2db3679a4075fa8301750b786c03b Mon Sep 17 00:00:00
> 2001
> > > +From 4afb8adc83348bf75964fc10af7902e04dd62637 Mon Sep 17 00:00:00
> 2001
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
> > >   const char * const catalog_file_dirs[] =3D {
> > >           "/usr/local/lib/systemd/catalog/",
> > > ---
> > > -2.27.0
> > > -
> > > diff --git a/meta/recipes-core/systemd/systemd/0004-add-fallback-
> parse_printf_format-implementation.patch b/meta/recipes-core/systemd/
> systemd/0004-add-fallback-parse_printf_format-implementation.patch
> > > index bdd64a0252..dc40a2fe8d 100644
> > > --- a/meta/recipes-core/systemd/systemd/0004-add-fallback-
> parse_printf_format-implementation.patch
> > > +++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-
> parse_printf_format-implementation.patch
> > > @@ -1,7 +1,7 @@
> > > -From f3dbe29f7620a063af4d8eb3ea7c48ecd410200d Mon Sep 17 00:00:00
> 2001
> > > -From: Chen Qi <Qi.Chen@windriver.com>
> > > -Date: Mon, 25 Feb 2019 14:04:21 +0800
> > > -Subject: [PATCH 04/26] add fallback parse_printf_format implementati=
on
> > > +From 6c18e5f9373da3e3b38f2c5727e2aefe07fcbbd9 Mon Sep 17 00:00:00
> 2001
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
> > > - src/basic/parse-printf-format.c | 273 +++++++++++++++++++++++++++++=
+
> ++
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
> > >   basic_sources +=3D generated_gperf_headers
> > > -+
> > > +
> > >  +if conf.get('HAVE_PRINTF_H') !=3D 1
> > >  +        basic_sources +=3D [files('parse-printf-format.c')]
> > >  +endif
> > >  +
> > > - basic_gcrypt_sources =3D files(
> > > -         'gcrypt-util.c',
> > > -         'gcrypt-util.h')
> > > ++
> > > + ############################################################
> > > +
> > > + arch_list =3D [
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
> > > diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-
> missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/
> systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
> > > index d63e3c0d09..a0d757b3f3 100644
> > > --- a/meta/recipes-core/systemd/systemd/0005-src-basic-
> missing.h-check-for-missing-strndupa.patch
> > > +++ b/meta/recipes-core/systemd/systemd/0005-src-basic-
> missing.h-check-for-missing-strndupa.patch
> > > @@ -1,7 +1,7 @@
> > > -From 5aeae0ea89f5af74ed5d95bed1d87a03b3801ff0 Mon Sep 17 00:00:00
> 2001
> > > +From 6b0732ac7164914ce16e231e35980b849bdfc4c8 Mon Sep 17 00:00:00
> 2001
> > >  From: Chen Qi <Qi.Chen@windriver.com>
> > >  Date: Mon, 25 Feb 2019 14:18:21 +0800
> > > -Subject: [PATCH 05/26] src/basic/missing.h: check for missing strndu=
pa
> > > +Subject: [PATCH] src/basic/missing.h: check for missing strndupa
> > >
> > >  include missing.h  for definition of strndupa
> > >
> > > @@ -17,6 +17,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com=
>
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
> > >           have =3D cc.has_function(ident[0], prefix : ident[1], args =
:
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
> > >           _cleanup_free_ char *link =3D NULL;
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
> > >           _cleanup_free_ char *fs =3D NULL;
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
> > > +diff --git a/src/basic/mountpoint-util.c b/src/basic/mountpoint-util=
.c
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
> > >           _cleanup_free_ char *value =3D NULL;
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
> > >   static char **arg_path =3D NULL;
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
> > >   static const UnitActiveState state_translation_table[_SERVICE_STATE=
_MAX]
> =3D {
> > >           [SERVICE_DEAD] =3D UNIT_INACTIVE,
> > > +diff --git a/src/coredump/coredump-vacuum.c b/src/coredump/coredump-
> vacuum.c
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
> > >   #define PRIV_KEY_FILE CERTIFICATE_ROOT "/private/journal-remote.pem=
"
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
> > >           s =3D startswith(s, prefix);
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
> > > +         /* We need a dummy function because log_parse_environment i=
s
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
> > >   static const char profile_dirs[] =3D CONF_PATHS_NULSTR("systemd/
> portable/profile");
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
> > >   static int arg_family =3D AF_UNSPEC;
> > >   static int arg_ifindex =3D 0;
> > > +diff --git a/src/shared/bus-get-properties.c b/src/shared/bus-get-
> properties.c
> > > +index feb6d3807f..eb11d29e50 100644
> > >  --- a/src/shared/bus-get-properties.c
> > >  +++ b/src/shared/bus-get-properties.c
> > >  @@ -4,6 +4,7 @@
> > > @@ -448,6 +536,8 @@ Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com>
> > >
> > >   int bus_property_get_bool(
> > >                   sd_bus *bus,
> > > +diff --git a/src/shared/bus-unit-procs.c b/src/shared/bus-unit-procs=
.c
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
> > >           sd_event *e =3D userdata;
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
> > >           IMPORTER_STATE_LINE =3D 0,    /* waiting to read, or readin=
g
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
> > >   static pid_t pager_pid =3D 0;
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
> > >           assert_se(hexchar(0xa) =3D=3D 'a');
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
> > > diff --git a/meta/recipes-core/systemd/systemd/0006-Include-netinet-i=
f_ether.h.patch
> b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
> > > index a978558b42..54d714266e 100644
> > > --- a/meta/recipes-core/systemd/systemd/0006-Include-netinet-
> if_ether.h.patch
> > > +++ b/meta/recipes-core/systemd/systemd/0006-Include-netinet-
> if_ether.h.patch
> > > @@ -1,7 +1,7 @@
> > > -From d3ed0da271738fd0fc3d3e4d82d6f5810334b05e Mon Sep 17 00:00:00
> 2001
> > > +From 2069f0b0d5ab8f869aeba635a347e0b11d362b30 Mon Sep 17 00:00:00
> 2001
> > >  From: Khem Raj <raj.khem@gmail.com>
> > >  Date: Thu, 26 Oct 2017 22:10:42 -0700
> > > -Subject: [PATCH 06/26] Include netinet/if_ether.h
> > > +Subject: [PATCH] Include netinet/if_ether.h
> > >
> > >  Fixes
> > >  /path/to/systemd/recipe-sysroot/usr/include/netinet/if_ether.h:101:8=
:
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
> > >   /* When we include libgen.h because we need dirname() we immediatel=
y
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
> > >  diff --git a/src/network/netdev/bridge.c b/src/network/netdev/bridge=
.c
> > > -index 1f59cd8b42..5fdbae7e99 100644
> > > +index 38432f1578..79ccfe578e 100644
> > >  --- a/src/network/netdev/bridge.c
> > >  +++ b/src/network/netdev/bridge.c
> > >  @@ -1,5 +1,6 @@
> > > @@ -114,7 +115,7 @@ index 1f59cd8b42..5fdbae7e99 100644
> > >
> > >   #include "bridge.h"
> > >  diff --git a/src/network/netdev/macsec.c b/src/network/netdev/macsec=
.c
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
> > >   #if __GNUC__ >=3D 7
> > >   _Pragma("GCC diagnostic ignored \"-Wimplicit-fallthrough\"")
> > >   #endif
> > >  +#include <netinet/if_ether.h>
> > >   #include <stddef.h>
> > >   #include "bareudp.h"
> > > - #include "bond.h"
> > > + #include "batadv.h"
> > >  diff --git a/src/network/netdev/netdev.c b/src/network/netdev/netdev=
.c
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
> > >  diff --git a/src/network/networkd-link.c b/src/network/networkd-link=
.c
> > > -index 3bfe636691..e0c68c8ad3 100644
> > > +index 8219d95b0d..c92230453b 100644
> > >  --- a/src/network/networkd-link.c
> > >  +++ b/src/network/networkd-link.c
> > >  @@ -1,8 +1,8 @@
> > > @@ -241,7 +242,7 @@ index 3bfe636691..e0c6
>
>

--000000000000bbd0c905c327d751
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, May 25, 2021, Alexander Kanavin &lt;<a href=3D"mailto:a=
lex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><div dir=3D"ltr"><div>I have to ask: should musl patche=
s for systemd be maintained separately? It&#39;s a big pile, they aren&#39;=
t accepted by upstream, they aren&#39;t tested on the AB (hence I didn&#39;=
t even notice the breakage), and they cause rebase problems at every versio=
n upgrade.</div><div><br></div><div>I would propose that a separate recipe =
is made that takes the sources from a repo, rather than carry the patches i=
n oe-core.</div></div></blockquote><div><br></div><div>It=E2=80=99s fine as=
 it is=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><div><br></div><div>Alex<br></div></div><br><div><div dir=3D"ltr">=
On Tue, 25 May 2021 at 03:41, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">since master-next broke my CI, I have sent a fix on top=
 of this.<br>
Please include that<br>
<br>
On Mon, May 24, 2021 at 5:18 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Fails to compile for musl<br>
&gt;<br>
&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/585507/" rel=
=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.<wbr>org/Erro=
rs/Details/585507/</a><br>
&gt;<br>
&gt; src/basic/percent-util.c source file needs to include<br>
&gt;<br>
&gt; #include &quot;missing_stdlib.h&quot;<br>
&gt;<br>
&gt; like other files in 0005-src-basic-missing.h-<wbr>check-for-missing-st=
rndupa.<wbr>patch<br>
&gt;<br>
&gt; On Mon, May 24, 2021 at 2:14 AM Alexander Kanavin<br>
&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.k=
anavin@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Drop backports:<br>
&gt; &gt; 48fff0a2af3f62acd446ebec8081b0<wbr>39b72caad8.patch<br>
&gt; &gt; 7c5fd25119a495009ea62f79e5daec<wbr>34cc464628.patch<br>
&gt; &gt; 0001-analyze-resolve-<wbr>executable-path-if-it-is-<wbr>relative.=
patch<br>
&gt; &gt; 0001-analyze-resolve-<wbr>executable-path-if-it-is-<wbr>relative.=
patch<br>
&gt; &gt;<br>
&gt; &gt; Drop 0027-proc-dont-trigger-mount-<wbr>error-with-invalid-options=
-o.<wbr>patch<br>
&gt; &gt; as difficult to rebase; please resend if you feel strongly that<b=
r>
&gt; &gt; it is needed.<br>
&gt; &gt;<br>
&gt; &gt; Rebase the big pile of musl patches.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanav=
in@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 ...<wbr>f0a2af3f62acd446ebec8081b039b7<wbr>2caad8.patch | 1=
79 --------------<br>
&gt; &gt;=C2=A0 ...<wbr>d25119a495009ea62f79e5daec34cc<wbr>464628.patch |=
=C2=A0 53 ----<br>
&gt; &gt;=C2=A0 ...<a href=3D"http://md-boot_247.6.bb" rel=3D"noreferrer" t=
arget=3D"_blank">md-boot_247.6.bb</a> =3D&gt; <a href=3D"http://systemd-boo=
t_248.3.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_248.3.bb</a>}=
 |=C2=A0 =C2=A00<br>
&gt; &gt;=C2=A0 meta/recipes-core/systemd/<wbr>systemd.inc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt; &gt;=C2=A0 ...ve-executable-path-if-it-<wbr>is-relative.patch |=C2=A0 =
39 ---<br>
&gt; &gt;=C2=A0 ...chvt-as-non-root-user-<wbr>without-polkit.patch | 227 --=
----------------<br>
&gt; &gt;=C2=A0 ...002-don-t-use-glibc-<wbr>specific-qsort_r.patch |=C2=A0 =
29 ++-<br>
&gt; &gt;=C2=A0 ...dd-__compare_fn_t-and-<wbr>comparison_fn_.patch |=C2=A0 =
26 +-<br>
&gt; &gt;=C2=A0 ...k-parse_printf_format-<wbr>implementation.patch |=C2=A0 =
46 ++--<br>
&gt; &gt;=C2=A0 ...missing.h-check-for-<wbr>missing-strndupa.patch | 204 ++=
++++++++++----<br>
&gt; &gt;=C2=A0 .../0006-Include-netinet-if_<wbr>ether.h.patch=C2=A0 =C2=A0=
 =C2=A0|=C2=A0 56 +++--<br>
&gt; &gt;=C2=A0 ...OB_BRACE-and-GLOB_<wbr>ALTDIRFUNC-is-not-.patch |=C2=A0 =
17 +-<br>
&gt; &gt;=C2=A0 ...008-add-missing-FTW_-<wbr>macros-for-musl.patch |=C2=A0 =
=C2=A08 +-<br>
&gt; &gt;=C2=A0 ..._register_atfork-for-non-<wbr>glibc-build.patch |=C2=A0 =
12 +-<br>
&gt; &gt;=C2=A0 ...10-Use-uintmax_t-for-<wbr>handling-rlim_t.patch |=C2=A0 =
18 +-<br>
&gt; &gt;=C2=A0 ...sable-tests-for-missing-<wbr>typedefs-in-.patch |=C2=A0 =
=C2=A09 +-<br>
&gt; &gt;=C2=A0 ...T_SYMLINK_NOFOLLOW-flag-to-<wbr>faccessat.patch |=C2=A0 =
19 +-<br>
&gt; &gt;=C2=A0 ...patible-basename-for-non-<wbr>glibc-syste.patch |=C2=A0 =
11 +-<br>
&gt; &gt;=C2=A0 ...uffering-when-writing-to-<wbr>oom_score_a.patch |=C2=A0 =
12 +-<br>
&gt; &gt;=C2=A0 ...compliant-strerror_r-from-<wbr>GNU-specif.patch |=C2=A0 =
46 ++--<br>
&gt; &gt;=C2=A0 ...S_ERROR_MAP-and-__stop_BUS_<wbr>ERROR_MAP.patch |=C2=A0 =
=C2=A08 +-<br>
&gt; &gt;=C2=A0 ...ype.h-add-__compar_d_fn_t-<wbr>definition.patch |=C2=A0 =
=C2=A08 +-<br>
&gt; &gt;=C2=A0 ...definition-of-prctl_mm_map-<wbr>structure.patch |=C2=A0 =
=C2=A08 +-<br>
&gt; &gt;=C2=A0 .../systemd/0019-Handle-<wbr>missing-LOCK_EX.patch |=C2=A0 =
10 +-<br>
&gt; &gt;=C2=A0 ...ible-pointer-type-struct-<wbr>sockaddr_un.patch |=C2=A0 =
12 +-<br>
&gt; &gt;=C2=A0 .../0021-test-json.c-define-M_<wbr>PIl.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
&gt; &gt;=C2=A0 ...-not-disable-buffer-in-<wbr>writing-files.patch | 116 ++=
++-----<br>
&gt; &gt;=C2=A0 .../0025-Handle-__cpu_mask-<wbr>usage.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
&gt; &gt;=C2=A0 .../systemd/0026-Handle-<wbr>missing-gshadow.patch |=C2=A0 =
20 +-<br>
&gt; &gt;=C2=A0 ...r-mount-error-with-invalid-<wbr>options-o.patch |=C2=A0 =
97 --------<br>
&gt; &gt;=C2=A0 ...l.h-Define-MIPS-ABI-<wbr>defines-for-musl.patch |=C2=A0 =
16 +-<br>
&gt; &gt;=C2=A0 .../{<a href=3D"http://systemd_247.6.bb" rel=3D"noreferrer"=
 target=3D"_blank">systemd_247.6.bb</a> =3D&gt; <a href=3D"http://systemd_2=
48.3.bb" rel=3D"noreferrer" target=3D"_blank">systemd_248.3.bb</a>}=C2=A0 =
=C2=A0 |=C2=A0 11 +-<br>
&gt; &gt;=C2=A0 32 files changed, 388 insertions(+), 951 deletions(-)<br>
&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-core/systemd/<wbr>files/<wb=
r>48fff0a2af3f62acd446ebec8081b0<wbr>39b72caad8.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-core/systemd/<wbr>files/<wb=
r>7c5fd25119a495009ea62f79e5daec<wbr>34cc464628.patch<br>
&gt; &gt;=C2=A0 rename meta/recipes-core/systemd/{<a href=3D"http://systemd=
-boot_247.6.bb" rel=3D"noreferrer" target=3D"_blank">sys<wbr>temd-boot_247.=
6.bb</a> =3D&gt; <a href=3D"http://systemd-boot_248.3.bb" rel=3D"noreferrer=
" target=3D"_blank">systemd-boot_248.3.bb</a>} (100%)<br>
&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-core/systemd/<wbr>systemd/0=
001-analyze-resolve-<wbr>executable-path-if-it-is-<wbr>relative.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-core/systemd/<wbr>systemd/0=
001-logind-Restore-<wbr>chvt-as-non-root-user-without-<wbr>polkit.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-core/systemd/<wbr>systemd/0=
027-proc-dont-<wbr>trigger-mount-error-with-<wbr>invalid-options-o.patch<br=
>
&gt; &gt;=C2=A0 rename meta/recipes-core/systemd/{<a href=3D"http://systemd=
_247.6.bb" rel=3D"noreferrer" target=3D"_blank">sys<wbr>temd_247.6.bb</a> =
=3D&gt; <a href=3D"http://systemd_248.3.bb" rel=3D"noreferrer" target=3D"_b=
lank">systemd_248.3.bb</a>} (99%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/<wbr>files/<wbr>48fff0a2af=
3f62acd446ebec8081b0<wbr>39b72caad8.patch b/meta/recipes-core/systemd/<wbr>=
files/<wbr>48fff0a2af3f62acd446ebec8081b0<wbr>39b72caad8.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index e3ce296741..0000000000<br>
&gt; &gt; --- a/meta/recipes-core/systemd/<wbr>files/<wbr>48fff0a2af3f62acd=
446ebec8081b0<wbr>39b72caad8.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,179 +0,0 @@<br>
&gt; &gt; -From 48fff0a2af3f62acd446ebec8081b0<wbr>39b72caad8 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; -From: Daan De Meyer &lt;<a href=3D"mailto:daan.j.demeyer@gmail.c=
om" target=3D"_blank">daan.j.demeyer@gmail.com</a>&gt;<br>
&gt; &gt; -Date: Fri, 12 Mar 2021 22:09:44 +0000<br>
&gt; &gt; -Subject: [PATCH] boot: Move console declarations to missing_efi.=
h<br>
&gt; &gt; -<br>
&gt; &gt; -These were added to eficonex.h in gnu-efi 3.0.13. Let&#39;s move=
 them<br>
&gt; &gt; -to missing_efi.h behind an appropriate guard to fix the build wi=
th<br>
&gt; &gt; -recent versions of gnu-efi.<br>
&gt; &gt; -<br>
&gt; &gt; -(cherry picked from commit 95ba433a5f34baf92921fb58051bc8<wbr>24=
1f908c0e)<br>
&gt; &gt; -<br>
&gt; &gt; -Upstream-Status: Backport<br>
&gt; &gt; -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kana=
vin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; ----<br>
&gt; &gt; - src/boot/efi/console.c=C2=A0 =C2=A0 =C2=A0| 57 ----------------=
--------------<wbr>--<br>
&gt; &gt; - src/boot/efi/console.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +---<br>
&gt; &gt; - src/boot/efi/missing_efi.h | 67 ++++++++++++++++++++++++++++++<=
wbr>++++++++<br>
&gt; &gt; - 3 files changed, 68 insertions(+), 62 deletions(-)<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/src/boot/efi/console.c b/src/boot/efi/console.c<br>
&gt; &gt; -index 2dd4543d51..1d6dfeeea2 100644<br>
&gt; &gt; ---- a/src/boot/efi/console.c<br>
&gt; &gt; -+++ b/src/boot/efi/console.c<br>
&gt; &gt; -@@ -9,63 +9,6 @@<br>
&gt; &gt; - #define SYSTEM_FONT_WIDTH 8<br>
&gt; &gt; - #define SYSTEM_FONT_HEIGHT 19<br>
&gt; &gt; -<br>
&gt; &gt; --#define EFI_SIMPLE_TEXT_INPUT_EX_<wbr>PROTOCOL_GUID \<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 { 0xdd9e7534, 0x7762, 0x4698, { 0x8=
c, 0x14, 0xf5, 0x85, 0x17, 0xa6, 0x25, 0xaa } }<br>
&gt; &gt; --<br>
&gt; &gt; --struct _EFI_SIMPLE_TEXT_INPUT_EX_<wbr>PROTOCOL;<br>
&gt; &gt; --<br>
&gt; &gt; --typedef EFI_STATUS (EFIAPI *EFI_INPUT_RESET_EX)(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct _EFI_SIMPLE_TEXT_INPUT_EX_<w=
br>PROTOCOL *This,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 BOOLEAN ExtendedVerification<br>
&gt; &gt; --);<br>
&gt; &gt; --<br>
&gt; &gt; --typedef UINT8 EFI_KEY_TOGGLE_STATE;<br>
&gt; &gt; --<br>
&gt; &gt; --typedef struct {<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 UINT32 KeyShiftState;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_TOGGLE_STATE KeyToggleState=
;<br>
&gt; &gt; --} EFI_KEY_STATE;<br>
&gt; &gt; --<br>
&gt; &gt; --typedef struct {<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_INPUT_KEY Key;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_STATE KeyState;<br>
&gt; &gt; --} EFI_KEY_DATA;<br>
&gt; &gt; --<br>
&gt; &gt; --typedef EFI_STATUS (EFIAPI *EFI_INPUT_READ_KEY_EX)(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct _EFI_SIMPLE_TEXT_INPUT_EX_<w=
br>PROTOCOL *This,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_DATA *KeyData<br>
&gt; &gt; --);<br>
&gt; &gt; --<br>
&gt; &gt; --typedef EFI_STATUS (EFIAPI *EFI_SET_STATE)(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct _EFI_SIMPLE_TEXT_INPUT_EX_<w=
br>PROTOCOL *This,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_TOGGLE_STATE *KeyToggleStat=
e<br>
&gt; &gt; --);<br>
&gt; &gt; --<br>
&gt; &gt; --typedef EFI_STATUS (EFIAPI *EFI_KEY_NOTIFY_FUNCTION)(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_DATA *KeyData<br>
&gt; &gt; --);<br>
&gt; &gt; --<br>
&gt; &gt; --typedef EFI_STATUS (EFIAPI *EFI_REGISTER_KEYSTROKE_<wbr>NOTIFY)=
(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct _EFI_SIMPLE_TEXT_INPUT_EX_<w=
br>PROTOCOL *This,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_DATA KeyData,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_NOTIFY_FUNCTION KeyNotifica=
tionFunction,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 VOID **NotifyHandle<br>
&gt; &gt; --);<br>
&gt; &gt; --<br>
&gt; &gt; --typedef EFI_STATUS (EFIAPI *EFI_UNREGISTER_KEYSTROKE_<wbr>NOTIF=
Y)(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct _EFI_SIMPLE_TEXT_INPUT_EX_<w=
br>PROTOCOL *This,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 VOID *NotificationHandle<br>
&gt; &gt; --);<br>
&gt; &gt; --<br>
&gt; &gt; --typedef struct _EFI_SIMPLE_TEXT_INPUT_EX_<wbr>PROTOCOL {<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_INPUT_RESET_EX Reset;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_INPUT_READ_KEY_EX ReadKeyStroke=
Ex;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_EVENT WaitForKeyEx;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_SET_STATE SetState;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_REGISTER_KEYSTROKE_NOTIFY Regis=
terKeyNotify;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_UNREGISTER_KEYSTROKE_<wbr>NOTIF=
Y UnregisterKeyNotify;<br>
&gt; &gt; --} EFI_SIMPLE_TEXT_INPUT_EX_<wbr>PROTOCOL;<br>
&gt; &gt; --<br>
&gt; &gt; - EFI_STATUS console_key_read(UINT64 *key, BOOLEAN wait) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EFI_GUID EfiSimpleTextInputExP=
rotocolGu<wbr>id =3D EFI_SIMPLE_TEXT_INPUT_EX_<wbr>PROTOCOL_GUID;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static EFI_SIMPLE_TEXT_INPUT_E=
X_<wbr>PROTOCOL *TextInputEx;<br>
&gt; &gt; -diff --git a/src/boot/efi/console.h b/src/boot/efi/console.h<br>
&gt; &gt; -index 41df3a406e..2c69af552a 100644<br>
&gt; &gt; ---- a/src/boot/efi/console.h<br>
&gt; &gt; -+++ b/src/boot/efi/console.h<br>
&gt; &gt; -@@ -1,11 +1,7 @@<br>
&gt; &gt; - /* SPDX-License-Identifier: LGPL-2.1-or-later */<br>
&gt; &gt; - #pragma once<br>
&gt; &gt; -<br>
&gt; &gt; --#define EFI_SHIFT_STATE_VALID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A00x80000000<br>
&gt; &gt; --#define EFI_RIGHT_CONTROL_PRESSED=C2=A0 =C2=A0 =C2=A0 =C2=A00x0=
0000004<br>
&gt; &gt; --#define EFI_LEFT_CONTROL_PRESSED=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0=
0000008<br>
&gt; &gt; --#define EFI_RIGHT_ALT_PRESSED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A00x00000010<br>
&gt; &gt; --#define EFI_LEFT_ALT_PRESSED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x00000020<br>
&gt; &gt; -+#include &quot;missing_efi.h&quot;<br>
&gt; &gt; -<br>
&gt; &gt; - #define EFI_CONTROL_PRESSED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0(EFI_RIGHT_CONTROL_PRESSED|<wbr>EFI_LEFT_CONTROL_PRESSED)<br>
&gt; &gt; - #define EFI_ALT_PRESSED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(EFI_RIGHT_ALT_PRESSED|EFI_<wbr>LEFT_ALT_PRESSED)<b=
r>
&gt; &gt; -diff --git a/src/boot/efi/missing_efi.h b/src/boot/efi/missing_e=
fi.h<br>
&gt; &gt; -index 1b838af2a4..b6aae1eb5b 100644<br>
&gt; &gt; ---- a/src/boot/efi/missing_efi.h<br>
&gt; &gt; -+++ b/src/boot/efi/missing_efi.h<br>
&gt; &gt; -@@ -53,3 +53,70 @@ typedef struct _EFI_RNG_PROTOCOL {<br>
&gt; &gt; - } EFI_RNG_PROTOCOL;<br>
&gt; &gt; -<br>
&gt; &gt; - #endif<br>
&gt; &gt; -+<br>
&gt; &gt; -+#ifndef EFI_SIMPLE_TEXT_INPUT_EX_<wbr>PROTOCOL_GUID<br>
&gt; &gt; -+<br>
&gt; &gt; -+#define EFI_SIMPLE_TEXT_INPUT_EX_<wbr>PROTOCOL_GUID \<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { 0xdd9e7534, 0x7762, 0x4698, { 0x8=
c, 0x14, 0xf5, 0x85, 0x17, 0xa6, 0x25, 0xaa } }<br>
&gt; &gt; -+<br>
&gt; &gt; -+#define EFI_SHIFT_STATE_VALID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A00x80000000<br>
&gt; &gt; -+#define EFI_RIGHT_CONTROL_PRESSED=C2=A0 =C2=A0 =C2=A0 =C2=A00x0=
0000004<br>
&gt; &gt; -+#define EFI_LEFT_CONTROL_PRESSED=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0=
0000008<br>
&gt; &gt; -+#define EFI_RIGHT_ALT_PRESSED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A00x00000010<br>
&gt; &gt; -+#define EFI_LEFT_ALT_PRESSED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x00000020<br>
&gt; &gt; -+<br>
&gt; &gt; -+struct _EFI_SIMPLE_TEXT_INPUT_EX_<wbr>PROTOCOL;<br>
&gt; &gt; -+<br>
&gt; &gt; -+typedef EFI_STATUS (EFIAPI *EFI_INPUT_RESET_EX)(<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct _EFI_SIMPLE_TEXT_INPUT_EX_<w=
br>PROTOCOL *This,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BOOLEAN ExtendedVerification<br>
&gt; &gt; -+);<br>
&gt; &gt; -+<br>
&gt; &gt; -+typedef UINT8 EFI_KEY_TOGGLE_STATE;<br>
&gt; &gt; -+<br>
&gt; &gt; -+typedef struct {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 UINT32 KeyShiftState;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_TOGGLE_STATE KeyToggleState=
;<br>
&gt; &gt; -+} EFI_KEY_STATE;<br>
&gt; &gt; -+<br>
&gt; &gt; -+typedef struct {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_INPUT_KEY Key;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_STATE KeyState;<br>
&gt; &gt; -+} EFI_KEY_DATA;<br>
&gt; &gt; -+<br>
&gt; &gt; -+typedef EFI_STATUS (EFIAPI *EFI_INPUT_READ_KEY_EX)(<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct _EFI_SIMPLE_TEXT_INPUT_EX_<w=
br>PROTOCOL *This,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_DATA *KeyData<br>
&gt; &gt; -+);<br>
&gt; &gt; -+<br>
&gt; &gt; -+typedef EFI_STATUS (EFIAPI *EFI_SET_STATE)(<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct _EFI_SIMPLE_TEXT_INPUT_EX_<w=
br>PROTOCOL *This,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_TOGGLE_STATE *KeyToggleStat=
e<br>
&gt; &gt; -+);<br>
&gt; &gt; -+<br>
&gt; &gt; -+typedef EFI_STATUS (EFIAPI *EFI_KEY_NOTIFY_FUNCTION)(<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_DATA *KeyData<br>
&gt; &gt; -+);<br>
&gt; &gt; -+<br>
&gt; &gt; -+typedef EFI_STATUS (EFIAPI *EFI_REGISTER_KEYSTROKE_<wbr>NOTIFY)=
(<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct _EFI_SIMPLE_TEXT_INPUT_EX_<w=
br>PROTOCOL *This,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_DATA KeyData,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_KEY_NOTIFY_FUNCTION KeyNotifica=
tionFunction,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VOID **NotifyHandle<br>
&gt; &gt; -+);<br>
&gt; &gt; -+<br>
&gt; &gt; -+typedef EFI_STATUS (EFIAPI *EFI_UNREGISTER_KEYSTROKE_<wbr>NOTIF=
Y)(<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct _EFI_SIMPLE_TEXT_INPUT_EX_<w=
br>PROTOCOL *This,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VOID *NotificationHandle<br>
&gt; &gt; -+);<br>
&gt; &gt; -+<br>
&gt; &gt; -+typedef struct _EFI_SIMPLE_TEXT_INPUT_EX_<wbr>PROTOCOL {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_INPUT_RESET_EX Reset;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_INPUT_READ_KEY_EX ReadKeyStroke=
Ex;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_EVENT WaitForKeyEx;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_SET_STATE SetState;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_REGISTER_KEYSTROKE_NOTIFY Regis=
terKeyNotify;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_UNREGISTER_KEYSTROKE_<wbr>NOTIF=
Y UnregisterKeyNotify;<br>
&gt; &gt; -+} EFI_SIMPLE_TEXT_INPUT_EX_<wbr>PROTOCOL;<br>
&gt; &gt; -+<br>
&gt; &gt; -+#endif<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/<wbr>files/<wbr>7c5fd25119=
a495009ea62f79e5daec<wbr>34cc464628.patch b/meta/recipes-core/systemd/<wbr>=
files/<wbr>7c5fd25119a495009ea62f79e5daec<wbr>34cc464628.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index ae449791f1..0000000000<br>
&gt; &gt; --- a/meta/recipes-core/systemd/<wbr>files/<wbr>7c5fd25119a495009=
ea62f79e5daec<wbr>34cc464628.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,53 +0,0 @@<br>
&gt; &gt; -From 7c5fd25119a495009ea62f79e5daec<wbr>34cc464628 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; -From: =3D?UTF-8?q?Zbigniew=3D20J=3DC4=3D<wbr>99drzejewski-Szmek?=
=3D &lt;<a href=3D"mailto:zbyszek@in.waw.pl" target=3D"_blank">zbyszek@in.w=
aw.pl</a>&gt;<br>
&gt; &gt; -Date: Mon, 12 Apr 2021 14:03:32 +0200<br>
&gt; &gt; -Subject: [PATCH] meson: do not fail if rsync is not installed wi=
th meson<br>
&gt; &gt; - 0.57.2<br>
&gt; &gt; -<br>
&gt; &gt; -<a href=3D"https://github.com/mesonbuild/meson/issues/8641" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/<wbr>mesonbuild/meson/=
issues/8641</a><br>
&gt; &gt; -<br>
&gt; &gt; -Our CI started to fail. Even if the change is reverted in meson,=
<br>
&gt; &gt; -we need a quick workaround here.<br>
&gt; &gt; -<br>
&gt; &gt; -Upstream-Status: Backport<br>
&gt; &gt; -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kana=
vin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
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
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command : [&#39;echo&#39;])<br=
>
&gt; &gt; -<br>
&gt; &gt; --run_target(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;doc-sync&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends : man_pages + html_pages,<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 command : [&#39;rsync&#39;, &#39;-r=
lv&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;--delete-excluded&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;--include=3Dman&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;--include=3D*.html&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;--exclude=3D*&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;--omit-dir-times&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0meson.current_build_dir(),<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0get_option(&#39;www-target&#39;)])<br>
&gt; &gt; -+rsync =3D find_program(&#39;rsync&#39;, required : false)<br>
&gt; &gt; -+if rsync.found()<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 run_target(<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;do=
c-sync&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depends=
 : man_pages + html_pages,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 command=
 : [rsync, &#39;-rlv&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--delete-excluded&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--include=3Dman&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--include=3D*.html&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--exclude=3D*&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--omit-dir-times&#39;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meson.current_build_dir(),<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_option(&#39;www-target&#39;)])<br>
&gt; &gt; -+endif<br>
&gt; &gt; -<br>
&gt; &gt; - ##############################<wbr>############################=
##<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-=
boot_247.6.bb" rel=3D"noreferrer" target=3D"_blank">sy<wbr>stemd-boot_247.6=
.bb</a> b/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_248.3.bb=
" rel=3D"noreferrer" target=3D"_blank">sy<wbr>stemd-boot_248.3.bb</a><br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-core/systemd/<a href=3D"http://systemd-b=
oot_247.6.bb" rel=3D"noreferrer" target=3D"_blank">syst<wbr>emd-boot_247.6.=
bb</a><br>
&gt; &gt; rename to meta/recipes-core/systemd/<a href=3D"http://systemd-boo=
t_248.3.bb" rel=3D"noreferrer" target=3D"_blank">syst<wbr>emd-boot_248.3.bb=
</a><br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/<wbr>systemd.inc b/meta/re=
cipes-core/systemd/<wbr>systemd.inc<br>
&gt; &gt; index 88dddb309c..0524a25008 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/<wbr>systemd.inc<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/<wbr>systemd.inc<br>
&gt; &gt; @@ -14,11 +14,9 @@ LICENSE =3D &quot;GPLv2 &amp; LGPLv2.1&quot;<b=
r>
&gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE.GPL2;md5=3D<wbr>7=
51419260aa954499f7abaabaa882b<wbr>be \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 file://LICENSE.LGPL2.1;md5=3D<wbr>4fbd65380cdd255951079008b36451=
<wbr>6c&quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRCREV =3D &quot;<wbr>17472dca0160cbe7b807ca648475fd<wbr>70d0d62=
fe5&quot;<br>
&gt; &gt; -SRCBRANCH =3D &quot;v247-stable&quot;<br>
&gt; &gt; +SRCREV =3D &quot;<wbr>37c4cfde0ce613f0f00544d3f4e2e7<wbr>2bf93d9=
c76&quot;<br>
&gt; &gt; +SRCBRANCH =3D &quot;v248-stable&quot;<br>
&gt; &gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/system=
d/systemd-stable.git;protocol=3Dgit;branch=3D$%7BSRCBRANCH%7D" rel=3D"noref=
errer" target=3D"_blank">github.com/systemd/<wbr>systemd-stable.git;protoco=
l=3D<wbr>git;branch=3D${SRCBRANCH}</a> \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://<wbr>7c5fd25119a=
495009ea62f79e5daec<wbr>34cc464628.patch \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://<wbr>48fff0a2af3=
f62acd446ebec8081b0<wbr>39b72caad8.patch \<br>
&gt; &gt;=C2=A0 &quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/<wbr>systemd/0001-analyze-=
resolve-<wbr>executable-path-if-it-is-<wbr>relative.patch b/meta/recipes-co=
re/systemd/<wbr>systemd/0001-analyze-resolve-<wbr>executable-path-if-it-is-=
<wbr>relative.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index fd7f94a61d..0000000000<br>
&gt; &gt; --- a/meta/recipes-core/systemd/<wbr>systemd/0001-analyze-resolve=
-<wbr>executable-path-if-it-is-<wbr>relative.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,39 +0,0 @@<br>
&gt; &gt; -From b9b7a8e3825f0433e120f7a6d7d5d6<wbr>35a839cab9 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; -From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" t=
arget=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt; &gt; -Date: Thu, 21 Jan 2021 06:19:44 +0000<br>
&gt; &gt; -Subject: [PATCH] analyze: resolve executable path if it is relat=
ive<br>
&gt; &gt; -<br>
&gt; &gt; -Upstream-Status: Backport [<a href=3D"https://github.com/systemd=
/systemd/commit/f1fb046a985521f7d4a662f02546686ff20b7e5d" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/systemd/<wbr>systemd/commit/<wbr>f1f=
b046a985521f7d4a662f0254668<wbr>6ff20b7e5d</a>]<br>
&gt; &gt; -<br>
&gt; &gt; -Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriv=
er.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt; &gt; ----<br>
&gt; &gt; - src/analyze/analyze-verify.c | 7 +++++--<br>
&gt; &gt; - 1 file changed, 5 insertions(+), 2 deletions(-)<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/src/analyze/analyze-verify.c b/src/analyze/analyze-=
verify.c<br>
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
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn 0;<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (exec-&gt;flags &amp; EXEC_=
COMMAND_IGNORE_FAILURE)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn 0;<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (access(exec-&gt;path, X_OK) &lt=
; 0)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
log_unit_error_errno(u, errno, &quot;Command %s is not executable: %m&quot;=
, exec-&gt;path);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D find_executable_full(exec-&gt=
;<wbr>path, false, NULL);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
log_unit_error_errno(u, r, &quot;Command %s is not executable: %m&quot;, ex=
ec-&gt;path);<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; - }<br>
&gt; &gt; ---<br>
&gt; &gt; -2.26.2<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/<wbr>systemd/0001-logind-R=
estore-<wbr>chvt-as-non-root-user-without-<wbr>polkit.patch b/meta/recipes-=
core/systemd/<wbr>systemd/0001-logind-Restore-<wbr>chvt-as-non-root-user-wi=
thout-<wbr>polkit.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 89ef39bc3e..0000000000<br>
&gt; &gt; --- a/meta/recipes-core/systemd/<wbr>systemd/0001-logind-Restore-=
<wbr>chvt-as-non-root-user-without-<wbr>polkit.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,227 +0,0 @@<br>
&gt; &gt; -From 150d9cade6d475570395cb418b8245<wbr>24dead9577 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; -From: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" ta=
rget=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
&gt; &gt; -Date: Fri, 30 Oct 2020 08:15:43 -0500<br>
&gt; &gt; -Subject: [PATCH] logind: Restore chvt as non-root user without p=
olkit<br>
&gt; &gt; -<br>
&gt; &gt; -4acf0cfd2f (&quot;logind: check PolicyKit before allowing VT swi=
tch&quot;) broke<br>
&gt; &gt; -the ability to write user sessions that run graphical sessions (=
e.g.<br>
&gt; &gt; -weston/X11). This was partially amended in 19bb87fbfa (&quot;log=
in: allow<br>
&gt; &gt; -non-console sessions to change vt&quot;) by changing the default=
 PolicyKit<br>
&gt; &gt; -policy so that non-root users are again allowed to switch the VT=
. This<br>
&gt; &gt; -makes the policy when PolKit is not enabled (as on many embedded=
<br>
&gt; &gt; -systems) match the default PolKit policy and allows launching gr=
aphical<br>
&gt; &gt; -sessions as a non-root user.<br>
&gt; &gt; -<br>
&gt; &gt; -Closes #17473<br>
&gt; &gt; ----<br>
&gt; &gt; - src/login/logind-dbus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +=
+-------<br>
&gt; &gt; - src/login/logind-polkit.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 26 ++++++=
+++++++++++++++<br>
&gt; &gt; - src/login/logind-polkit.h=C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 ++++++=
++<br>
&gt; &gt; - src/login/logind-seat-dbus.c=C2=A0 =C2=A0 | 41 ++++------------=
--------------<wbr>---<br>
&gt; &gt; - src/login/logind-session-dbus.<wbr>c | 11 ++-------<br>
&gt; &gt; - src/login/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 1 +<br>
&gt; &gt; - 6 files changed, 46 insertions(+), 54 deletions(-)<br>
&gt; &gt; - create mode 100644 src/login/logind-polkit.c<br>
&gt; &gt; - create mode 100644 src/login/logind-polkit.h<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/src/login/logind-dbus.c b/src/login/logind-dbus.c<b=
r>
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
&gt; &gt; -@@ -1047,15 +1048,7 @@ static int method_activate_session_on_<wb=
r>seat(sd_bus_message *message, void *userda<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn sd_bus_error_setf(error, BUS_ERROR_SESSION_NOT_ON_SEAT,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;Session %s not on seat %s&quot;, session_name, seat_name);=
<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D bus_verify_polkit_async(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 message,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 CAP_SYS_ADMIN,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;org.freedesktop.login1.chvt&quot;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 NULL,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 false,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 UID_INVALID,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &amp;m-&gt;polkit_registry,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 error);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D check_polkit_chvt(message, m,=
 error);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn r;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r =3D=3D 0)<br>
&gt; &gt; -diff --git a/src/login/logind-polkit.c b/src/login/logind-polkit=
.c<br>
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
&gt; &gt; -+int check_polkit_chvt(sd_bus_<wbr>message *message, Manager *ma=
nager, sd_bus_error *error) {<br>
&gt; &gt; -+#if ENABLE_POLKIT<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return bus_verify_polkit_async(<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 message,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 CAP_SYS_ADMIN,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;org.freedesktop.login1.chvt&quot;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 NULL,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 false,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 UID_INVALID,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &amp;manager-&gt;polkit_registry,<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 error);<br>
&gt; &gt; -+#else<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Allow chvt when polkit is not pr=
esent. This allows a service to start a graphical session as a<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* non-root user when polkit i=
s not compiled in, matching the default polkit policy */<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
&gt; &gt; -+#endif<br>
&gt; &gt; -+}<br>
&gt; &gt; -+<br>
&gt; &gt; -+<br>
&gt; &gt; -diff --git a/src/login/logind-polkit.h b/src/login/logind-polkit=
.h<br>
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
&gt; &gt; -+int check_polkit_chvt(sd_bus_<wbr>message *message, Manager *ma=
nager, sd_bus_error *error);<br>
&gt; &gt; -+<br>
&gt; &gt; -diff --git a/src/login/logind-seat-dbus.c b/src/login/logind-sea=
t-dbus.c<br>
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
&gt; &gt; -@@ -179,15 +180,7 @@ static int method_activate_session(sd_<wbr>=
bus_message *message, void *userdata, sd_b<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (session-&gt;seat !=3D s)<b=
r>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn sd_bus_error_setf(error, BUS_ERROR_SESSION_NOT_ON_SEAT, &quot;Session =
%s not on seat %s&quot;, name, s-&gt;id);<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D bus_verify_polkit_async(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 message,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 CAP_SYS_ADMIN,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;org.freedesktop.login1.chvt&quot;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 NULL,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 false,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 UID_INVALID,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &amp;s-&gt;manager-&gt;polkit_registry,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 error);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D check_polkit_chvt(message, s-=
&gt;manager, error);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn r;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r =3D=3D 0)<br>
&gt; &gt; -@@ -215,15 +208,7 @@ static int method_switch_to(sd_bus_<wbr>mes=
sage *message, void *userdata, sd_bus_erro<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (to &lt;=3D 0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn sd_bus_error_setf(error, SD_BUS_ERROR_INVALID_ARGS, &quot;Invalid virt=
ual terminal&quot;);<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D bus_verify_polkit_async(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 message,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 CAP_SYS_ADMIN,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;org.freedesktop.login1.chvt&quot;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 NULL,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 false,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 UID_INVALID,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &amp;s-&gt;manager-&gt;polkit_registry,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 error);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D check_polkit_chvt(message, s-=
&gt;manager, error);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn r;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r =3D=3D 0)<br>
&gt; &gt; -@@ -243,15 +228,7 @@ static int method_switch_to_next(sd_bus_<wb=
r>message *message, void *userdata, sd_bus<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(message);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(s);<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D bus_verify_polkit_async(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 message,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 CAP_SYS_ADMIN,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;org.freedesktop.login1.chvt&quot;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 NULL,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 false,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 UID_INVALID,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &amp;s-&gt;manager-&gt;polkit_registry,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 error);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D check_polkit_chvt(message, s-=
&gt;manager, error);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn r;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r =3D=3D 0)<br>
&gt; &gt; -@@ -271,15 +248,7 @@ static int method_switch_to_previous(sd_<wb=
r>bus_message *message, void *userdata, sd<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(message);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(s);<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D bus_verify_polkit_async(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 message,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 CAP_SYS_ADMIN,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;org.freedesktop.login1.chvt&quot;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 NULL,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 false,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 UID_INVALID,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &amp;s-&gt;manager-&gt;polkit_registry,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 error);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D check_polkit_chvt(message, s-=
&gt;manager, error);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn r;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r =3D=3D 0)<br>
&gt; &gt; -diff --git a/src/login/logind-session-<wbr>dbus.c b/src/login/lo=
gind-session-<wbr>dbus.c<br>
&gt; &gt; -index ccc5ac8df2..57c8a4e900 100644<br>
&gt; &gt; ---- a/src/login/logind-session-<wbr>dbus.c<br>
&gt; &gt; -+++ b/src/login/logind-session-<wbr>dbus.c<br>
&gt; &gt; -@@ -11,6 +11,7 @@<br>
&gt; &gt; - #include &quot;fd-util.h&quot;<br>
&gt; &gt; - #include &quot;logind-brightness.h&quot;<br>
&gt; &gt; - #include &quot;logind-dbus.h&quot;<br>
&gt; &gt; -+#include &quot;logind-polkit.h&quot;<br>
&gt; &gt; - #include &quot;logind-seat-dbus.h&quot;<br>
&gt; &gt; - #include &quot;logind-session-dbus.h&quot;<br>
&gt; &gt; - #include &quot;logind-session-device.h&quot;<br>
&gt; &gt; -@@ -192,15 +193,7 @@ int bus_session_method_activate(<wbr>sd_bus=
_message *message, void *userdata, sd_bus_<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(message);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(s);<br>
&gt; &gt; -<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D bus_verify_polkit_async(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 message,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 CAP_SYS_ADMIN,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;org.freedesktop.login1.chvt&quot;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 NULL,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 false,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 UID_INVALID,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &amp;s-&gt;manager-&gt;polkit_registry,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 error);<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D check_polkit_chvt(message, s-=
&gt;manager, error);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn r;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r =3D=3D 0)<br>
&gt; &gt; -diff --git a/src/login/meson.build b/src/login/meson.build<br>
&gt; &gt; -index 0a7d3d5440..7e46be2add 100644<br>
&gt; &gt; ---- a/src/login/meson.build<br>
&gt; &gt; -+++ b/src/login/meson.build<br>
&gt; &gt; -@@ -26,6 +26,7 @@ liblogind_core_sources =3D files(&#39;&#39;&#3=
9;<br>
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
&gt; &gt; diff --git a/meta/recipes-core/systemd/<wbr>systemd/0002-don-t-us=
e-glibc-<wbr>specific-qsort_r.patch b/meta/recipes-core/systemd/<wbr>system=
d/0002-don-t-use-glibc-<wbr>specific-qsort_r.patch<br>
&gt; &gt; index d856bcb583..4cdf66e767 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/<wbr>systemd/0002-don-t-use-glibc=
-<wbr>specific-qsort_r.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/<wbr>systemd/0002-don-t-use-glibc=
-<wbr>specific-qsort_r.patch<br>
&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; -From 66ece0b870b3a34fdabc48b88437e6<wbr>cc354e9fce Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; +From 159c53612444ec1df492bae528a5a8<wbr>8a275b93bf Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt;=C2=A0 From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" =
target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Mon, 25 Feb 2019 13:41:41 +0800<br>
&gt; &gt; -Subject: [PATCH 02/26] don&#39;t use glibc-specific qsort_r<br>
&gt; &gt; +Subject: [PATCH] don&#39;t use glibc-specific qsort_r<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Upstream-Status: Inappropriate [musl specific]<br>
&gt; &gt;<br>
&gt; &gt; @@ -12,6 +12,7 @@ Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi=
.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.va=
lek@siemens.com" target=3D"_blank">andrej.valek@siemens.com</a>&gt;<br>
&gt; &gt;=C2=A0 [Rebased for v247]<br>
&gt; &gt;=C2=A0 Signed-off-by: Luca Boccassi &lt;<a href=3D"mailto:luca.boc=
cassi@microsoft.com" target=3D"_blank">luca.boccassi@microsoft.com</a>&gt;<=
br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/sort-util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 14 ------------<br>
&gt; &gt;=C2=A0 =C2=A0src/libsystemd/sd-hwdb/hwdb-<wbr>util.c | 19 ++++++++=
+++-----<br>
&gt; &gt; @@ -19,14 +20,13 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A03 files changed, 38 insertions(+), 31 deletions(-)<br=
>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h<=
br>
&gt; &gt; -index 1d194a1f04..3394c9eb72 100644<br>
&gt; &gt; +index 49586a4a24..d92a5ab0ed 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/sort-util.h<br>
&gt; &gt;=C2=A0 +++ b/src/basic/sort-util.h<br>
&gt; &gt; -@@ -54,17 +54,3 @@ static inline void _qsort_safe(void *base, si=
ze_t nmemb, size_t size, __compar_f<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in=
t (*_func_)(const typeof(p[0])*, const typeof(p[0])*) =3D func; \<br>
&gt; &gt; +@@ -55,18 +55,4 @@ static inline void _qsort_safe(void *base, si=
ze_t nmemb, size_t size, __compar_f<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0_qsort_safe((p), (n), sizeof((p)[0]), (__compar_fn_t) _func_); \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0})<br>
&gt; &gt; --<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 -static inline void qsort_r_safe(void *base, size_t nmemb, =
size_t size, __compar_d_fn_t compar, void *userdata) {<br>
&gt; &gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nmemb &lt;=3D 1)<br>
&gt; &gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 re=
turn;<br>
&gt; &gt; @@ -40,11 +40,13 @@ index 1d194a1f04..3394c9eb72 100644<br>
&gt; &gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in=
t (*_func_)(const typeof(p[0])*, const typeof(p[0])*, typeof(userdata)) =3D=
 func; \<br>
&gt; &gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qs=
ort_r_safe((p), (n), sizeof((p)[0]), (__compar_d_fn_t) _func_, userdata); \=
<br>
&gt; &gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 })<br>
&gt; &gt; +-<br>
&gt; &gt; + int cmp_int(const int *a, const int *b);<br>
&gt; &gt;=C2=A0 diff --git a/src/libsystemd/sd-hwdb/hwdb-<wbr>util.c b/src/=
libsystemd/sd-hwdb/hwdb-<wbr>util.c<br>
&gt; &gt; -index 4c94ba9c88..95495dba6d 100644<br>
&gt; &gt; +index fd45ff0f54..ac4b63c49b 100644<br>
&gt; &gt;=C2=A0 --- a/src/libsystemd/sd-hwdb/hwdb-<wbr>util.c<br>
&gt; &gt;=C2=A0 +++ b/src/libsystemd/sd-hwdb/hwdb-<wbr>util.c<br>
&gt; &gt; -@@ -126,9 +126,13 @@ static void trie_free(struct trie *trie) {<=
br>
&gt; &gt; +@@ -126,9 +126,13 @@ static struct trie* trie_free(struct trie *=
trie) {<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0DEFINE_TRIVIAL_CLEANUP_FUNC(<wbr>struct trie*, trie_f=
ree);<br>
&gt; &gt;<br>
&gt; &gt; @@ -85,10 +87,10 @@ index 4c94ba9c88..95495dba6d 100644<br>
&gt; &gt;=C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/shared/format-table.c b/src/shared/format-=
table.c<br>
&gt; &gt; -index a13a198b7a..bce10bc607 100644<br>
&gt; &gt; +index dccb796b26..c3ab8ac296 100644<br>
&gt; &gt;=C2=A0 --- a/src/shared/format-table.c<br>
&gt; &gt;=C2=A0 +++ b/src/shared/format-table.c<br>
&gt; &gt; -@@ -1243,30 +1243,32 @@ static int cell_data_compare(TableData *=
a, size_t index_a, TableData *b, size_t<br>
&gt; &gt; +@@ -1290,30 +1290,32 @@ static int cell_data_compare(TableData *=
a, size_t index_a, TableData *b, size_t<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return CMP(index_a, index=
_b);<br>
&gt; &gt;=C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt; @@ -131,7 +133,7 @@ index a13a198b7a..bce10bc607 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Order identical lines =
by the order there were originally added in */<br>
&gt; &gt; -@@ -1844,7 +1846,12 @@ int table_print(Table *t, FILE *f) {<br>
&gt; &gt; +@@ -1952,7 +1954,12 @@ int table_print(Table *t, FILE *f) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0for (size_t i =3D 0; i &lt; n_rows; i++)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sorted[i] =3D i * t-&gt;n_columns;<br>
&gt; &gt;<br>
&gt; &gt; @@ -145,7 +147,7 @@ index a13a198b7a..bce10bc607 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (t-&gt;display_map)<br=
>
&gt; &gt; -@@ -2440,7 +2447,12 @@ int table_to_json(Table *t, JsonVariant *=
*ret) {<br>
&gt; &gt; +@@ -2580,7 +2587,12 @@ int table_to_json(Table *t, JsonVariant *=
*ret) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0for (size_t i =3D 0; i &lt; n_rows; i++)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sorted[i] =3D i * t-&gt;n_columns;<br>
&gt; &gt;<br>
&gt; &gt; @@ -159,6 +161,3 @@ index a13a198b7a..bce10bc607 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (t-&gt;display_map)<br=
>
&gt; &gt; ---<br>
&gt; &gt; -2.27.0<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/<wbr>systemd/0003-missing_=
type.h-<wbr>add-__compare_fn_t-and-<wbr>comparison_fn_.patch b/meta/recipes=
-core/systemd/<wbr>systemd/0003-missing_type.h-<wbr>add-__compare_fn_t-and-=
<wbr>comparison_fn_.patch<br>
&gt; &gt; index f43a22aa8b..9b1768d9ca 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/<wbr>systemd/0003-missing_type.h-=
<wbr>add-__compare_fn_t-and-<wbr>comparison_fn_.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/<wbr>systemd/0003-missing_type.h-=
<wbr>add-__compare_fn_t-and-<wbr>comparison_fn_.patch<br>
&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; -From 9f0d5996bbb2db3679a4075fa83017<wbr>50b786c03b Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; +From 4afb8adc83348bf75964fc10af7902<wbr>e04dd62637 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt;=C2=A0 From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" =
target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Mon, 25 Feb 2019 13:55:12 +0800<br>
&gt; &gt; -Subject: [PATCH 03/26] missing_type.h: add __compare_fn_t and co=
mparison_fn_t<br>
&gt; &gt; +Subject: [PATCH] missing_type.h: add __compare_fn_t and comparis=
on_fn_t<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Make it work with musl where comparison_fn_t and __compare_=
fn_t<br>
&gt; &gt;=C2=A0 is not provided.<br>
&gt; &gt; @@ -13,11 +13,12 @@ Signed-off-by: Alex Kiernan &lt;<a href=3D"ma=
ilto:alex.kiernan@gmail.com" target=3D"_blank">alex.kiernan@gmail.com</a>&g=
t;<br>
&gt; &gt;=C2=A0 Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windri=
ver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 [Rebased for v242]<br>
&gt; &gt;=C2=A0 Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.va=
lek@siemens.com" target=3D"_blank">andrej.valek@siemens.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt; - src/basic/missing_type.h | 9 +++++++++<br>
&gt; &gt; - src/basic/sort-util.h=C2=A0 =C2=A0 | 1 +<br>
&gt; &gt; - src/core/kmod-setup.c=C2=A0 =C2=A0 | 1 +<br>
&gt; &gt; - src/journal/catalog.c=C2=A0 =C2=A0 | 1 +<br>
&gt; &gt; + src/basic/missing_type.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 9 +++++++++<br>
&gt; &gt; + src/basic/sort-util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 +<br>
&gt; &gt; + src/core/kmod-setup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 +<br>
&gt; &gt; + src/libsystemd/sd-journal/<wbr>catalog.c | 1 +<br>
&gt; &gt;=C2=A0 =C2=A04 files changed, 12 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/basic/missing_type.h b/src/basic/missing_t=
ype.h<br>
&gt; &gt; @@ -38,7 +39,7 @@ index f6233090a9..aeaf6ad5ec 100644<br>
&gt; &gt;=C2=A0 +typedef int (*__compar_fn_t)(const void *, const void *);<=
br>
&gt; &gt;=C2=A0 +#endif<br>
&gt; &gt;=C2=A0 diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h<=
br>
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
&gt; &gt; +diff --git a/src/libsystemd/sd-journal/<wbr>catalog.c b/src/libs=
ystemd/sd-journal/<wbr>catalog.c<br>
&gt; &gt; +index aea3241d18..75e6c56a28 100644<br>
&gt; &gt; +--- a/src/libsystemd/sd-journal/<wbr>catalog.c<br>
&gt; &gt; ++++ b/src/libsystemd/sd-journal/<wbr>catalog.c<br>
&gt; &gt;=C2=A0 @@ -28,6 +28,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;string-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;strv.h&quot;<br>
&gt; &gt; @@ -73,6 +74,3 @@ index 0f6ad8a29e..4e1077ade4 100644<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0const char * const catalog_file_dirs[] =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;/usr/local/lib/syst=
emd/<wbr>catalog/&quot;,<br>
&gt; &gt; ---<br>
&gt; &gt; -2.27.0<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/<wbr>systemd/0004-add-fall=
back-<wbr>parse_printf_format-<wbr>implementation.patch b/meta/recipes-core=
/systemd/<wbr>systemd/0004-add-fallback-<wbr>parse_printf_format-<wbr>imple=
mentation.patch<br>
&gt; &gt; index bdd64a0252..dc40a2fe8d 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/<wbr>systemd/0004-add-fallback-<w=
br>parse_printf_format-<wbr>implementation.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/<wbr>systemd/0004-add-fallback-<w=
br>parse_printf_format-<wbr>implementation.patch<br>
&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; -From f3dbe29f7620a063af4d8eb3ea7c48<wbr>ecd410200d Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; -From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" targe=
t=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt; -Date: Mon, 25 Feb 2019 14:04:21 +0800<br>
&gt; &gt; -Subject: [PATCH 04/26] add fallback parse_printf_format implemen=
tation<br>
&gt; &gt; +From 6c18e5f9373da3e3b38f2c5727e2ae<wbr>fe07fcbbd9 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; +Date: Sat, 22 May 2021 20:26:24 +0200<br>
&gt; &gt; +Subject: [PATCH] [PATCH] add fallback parse_printf_format implem=
entation<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Upstream-Status: Inappropriate [musl specific]<br>
&gt; &gt;<br>
&gt; &gt; @@ -11,21 +11,21 @@ Signed-off-by: Chen Qi &lt;<a href=3D"mailto:=
Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 [rebased for systemd 243]<br>
&gt; &gt;=C2=A0 Signed-off-by: Scott Murray &lt;<a href=3D"mailto:scott.mur=
ray@konsulko.com" target=3D"_blank">scott.murray@konsulko.com</a>&gt;<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt; - meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt; &gt; - src/basic/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A05 +<br>
&gt; &gt; - src/basic/parse-printf-format.<wbr>c | 273 ++++++++++++++++++++=
++++++++++<wbr>++<br>
&gt; &gt; - src/basic/parse-printf-format.<wbr>h |=C2=A0 57 +++++++<br>
&gt; &gt; - src/basic/stdio-util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
&gt; &gt; - src/journal/journal-send.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 =
+-<br>
&gt; &gt; + meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt; &gt; + src/basic/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +<br>
&gt; &gt; + src/basic/parse-printf-format.<wbr>c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 273 +++++++++++++++++++++++<br>
&gt; &gt; + src/basic/parse-printf-format.<wbr>h=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 57 +++++<br>
&gt; &gt; + src/basic/stdio-util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt; &gt; + src/libsystemd/sd-journal/<wbr>journal-send.c |=C2=A0 =C2=A02 +=
-<br>
&gt; &gt;=C2=A0 =C2=A06 files changed, 338 insertions(+), 2 deletions(-)<br=
>
&gt; &gt;=C2=A0 =C2=A0create mode 100644 src/basic/parse-printf-format.<wbr=
>c<br>
&gt; &gt;=C2=A0 =C2=A0create mode 100644 src/basic/parse-printf-format.<wbr=
>h<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/meson.build b/meson.build<br>
&gt; &gt; -index f406d595e6..6aa47fc755 100644<br>
&gt; &gt; +index 27186d63a3..2abb7b3188 100644<br>
&gt; &gt;=C2=A0 --- a/meson.build<br>
&gt; &gt;=C2=A0 +++ b/meson.build<br>
&gt; &gt; -@@ -646,6 +646,7 @@ endif<br>
&gt; &gt; +@@ -675,6 +675,7 @@ endif<br>
&gt; &gt;=C2=A0 =C2=A0foreach header : [&#39;crypt.h&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;linux/memfd.h&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;linux/vm_sockets.h&#39;,<br>
&gt; &gt; @@ -34,21 +34,21 @@ index f406d595e6..6aa47fc755 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;valgrind/memcheck.h&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;valgrind/valgrind.h&#39;,<br>
&gt; &gt;=C2=A0 diff --git a/src/basic/meson.build b/src/basic/meson.build<=
br>
&gt; &gt; -index 1183ea83ad..aa5c958850 100644<br>
&gt; &gt; +index 60ef801a25..aba2172edd 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/meson.build<br>
&gt; &gt;=C2=A0 +++ b/src/basic/meson.build<br>
&gt; &gt; -@@ -322,6 +322,11 @@ foreach item : [[&#39;af&#39;,=C2=A0 =C2=A0=
 =C2=A0af_list_txt,=C2=A0 =C2=A0 =C2=A0&#39;af&#39;,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&#39;&#39;],<br>
&gt; &gt; - endforeach<br>
&gt; &gt; +@@ -341,6 +341,11 @@ endforeach<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0basic_sources +=3D generated_gperf_headers<br>
&gt; &gt; -+<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 +if conf.get(&#39;HAVE_PRINTF_H&#39;) !=3D 1<br>
&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 basic_sources +=3D [files(&#39=
;parse-printf-format.c&#39;<wbr>)]<br>
&gt; &gt;=C2=A0 +endif<br>
&gt; &gt;=C2=A0 +<br>
&gt; &gt; - basic_gcrypt_sources =3D files(<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;gcrypt-util.c&#39;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;gcrypt-util.h&#39;)<br>
&gt; &gt; ++<br>
&gt; &gt; + ##############################<wbr>############################=
##<br>
&gt; &gt; +<br>
&gt; &gt; + arch_list =3D [<br>
&gt; &gt;=C2=A0 diff --git a/src/basic/parse-printf-<wbr>format.c b/src/bas=
ic/parse-printf-<wbr>format.c<br>
&gt; &gt;=C2=A0 new file mode 100644<br>
&gt; &gt;=C2=A0 index 0000000000..49437e5445<br>
&gt; &gt; @@ -410,10 +410,10 @@ index 6dc1e72312..cea76b36cf 100644<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#define snprintf_ok(buf, len, fmt, ...) \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((size_t) snprintf(buf, l=
en, fmt, __VA_ARGS__) &lt; (len))<br>
&gt; &gt; -diff --git a/src/journal/journal-send.c b/src/journal/journal-se=
nd.c<br>
&gt; &gt; +diff --git a/src/libsystemd/sd-journal/<wbr>journal-send.c b/src=
/libsystemd/sd-journal/<wbr>journal-send.c<br>
&gt; &gt;=C2=A0 index fd3fd7ef9c..e8e6ad555b 100644<br>
&gt; &gt; ---- a/src/journal/journal-send.c<br>
&gt; &gt; -+++ b/src/journal/journal-send.c<br>
&gt; &gt; +--- a/src/libsystemd/sd-journal/<wbr>journal-send.c<br>
&gt; &gt; ++++ b/src/libsystemd/sd-journal/<wbr>journal-send.c<br>
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
&gt; &gt; diff --git a/meta/recipes-core/systemd/<wbr>systemd/0005-src-basi=
c-<wbr>missing.h-check-for-missing-<wbr>strndupa.patch b/meta/recipes-core/=
systemd/<wbr>systemd/0005-src-basic-<wbr>missing.h-check-for-missing-<wbr>s=
trndupa.patch<br>
&gt; &gt; index d63e3c0d09..a0d757b3f3 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/<wbr>systemd/0005-src-basic-<wbr>=
missing.h-check-for-missing-<wbr>strndupa.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/<wbr>systemd/0005-src-basic-<wbr>=
missing.h-check-for-missing-<wbr>strndupa.patch<br>
&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; -From 5aeae0ea89f5af74ed5d95bed1d87a<wbr>03b3801ff0 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; +From 6b0732ac7164914ce16e231e35980b<wbr>849bdfc4c8 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt;=C2=A0 From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" =
target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Mon, 25 Feb 2019 14:18:21 +0800<br>
&gt; &gt; -Subject: [PATCH 05/26] src/basic/missing.h: check for missing st=
rndupa<br>
&gt; &gt; +Subject: [PATCH] src/basic/missing.h: check for missing strndupa=
<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 include missing.h=C2=A0 for definition of strndupa<br>
&gt; &gt;<br>
&gt; &gt; @@ -17,6 +17,7 @@ Signed-off-by: Alex Kiernan &lt;<a href=3D"mail=
to:alex.kiernan@gmail.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt;=
<br>
&gt; &gt;=C2=A0 [rebased for systemd 244]<br>
&gt; &gt;=C2=A0 [Rebased for v247]<br>
&gt; &gt;=C2=A0 Signed-off-by: Luca Boccassi &lt;<a href=3D"mailto:luca.boc=
cassi@microsoft.com" target=3D"_blank">luca.boccassi@microsoft.com</a>&gt;<=
br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/backlight/backlight.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt; @@ -25,6 +26,7 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"mai=
lto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsoft.=
com</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/log.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/missing_stdlib.h=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 ++++++++++++<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/mkdir.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt; + src/basic/mountpoint-util.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/parse-util.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/path-lookup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/basic/proc-cmdline.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt; @@ -41,12 +43,12 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0src/coredump/coredump-vacuum.<wbr>c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/journal-remote/journal-<wbr>remote-main.c=C2=A0 =
=C2=A0|=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/journal/journalctl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt; - src/journal/sd-journal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/libsystemd/sd-bus/bus-<wbr>message.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/libsystemd/sd-bus/bus-<wbr>objects.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/libsystemd/sd-bus/bus-<wbr>socket.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/libsystemd/sd-bus/sd-bus.<wbr>c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/libsystemd/sd-bus/test-<wbr>bus-benchmark.c |=C2=
=A0 1 +<br>
&gt; &gt; + src/libsystemd/sd-journal/sd-<wbr>journal.c=C2=A0 =C2=A0 =C2=A0=
|=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/locale/keymap-util.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/login/pam_systemd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/network/generator/<wbr>network-generator.c=C2=A0 =
|=C2=A0 1 +<br>
&gt; &gt; @@ -68,18 +70,22 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0src/udev/udev-builtin-path_<wbr>id.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/udev/udev-event.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0src/udev/udev-rules.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
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
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #include &lt;sys/wa=
it.h&gt;&#39;&#39;&#39;],<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;mallinfo&#39;,=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#39;&#39;#include &lt;malloc.h&gt;&#39;&#39;=
&#39;],<br>
&gt; &gt; +@@ -550,6 +550,7 @@ foreach ident : [<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;execveat&#39;,=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#39;&#39;#include &lt;unistd.h&gt;&#39;&#39;=
&#39;],<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;close_range&#39;,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&#39;&#39;#include &lt;unistd.h&gt;&#39;&#3=
9;&#39;],<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;epoll_pwait2&#39;,=C2=A0=
 =C2=A0 =C2=A0 &#39;&#39;&#39;#include &lt;sys/epoll.h&gt;&#39;&#39;&#39;],=
<br>
&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [&#39;strndupa&#39; ,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&#39;&#39;#include &lt;string.h&gt;&#39;&#3=
9;&#39;],<br>
&gt; &gt;=C2=A0 =C2=A0]<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0have =3D cc.has_function(=
ident[0], prefix : ident[1], args : &#39;-D_GNU_SOURCE&#39;)<br>
&gt; &gt; +diff --git a/src/backlight/backlight.c b/src/backlight/backlight=
.c<br>
&gt; &gt; +index 86927be62e..a34be158a0 100644<br>
&gt; &gt;=C2=A0 --- a/src/backlight/backlight.c<br>
&gt; &gt;=C2=A0 +++ b/src/backlight/backlight.c<br>
&gt; &gt;=C2=A0 @@ -19,6 +19,7 @@<br>
&gt; &gt; @@ -90,6 +96,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"mai=
lto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsoft.=
com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static int help(void) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_cleanup_free_ char *link=
 =3D NULL;<br>
&gt; &gt; +diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c<b=
r>
&gt; &gt; +index 8dd3f8cd95..50c1ae1b2b 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/cgroup-util.c<br>
&gt; &gt;=C2=A0 +++ b/src/basic/cgroup-util.c<br>
&gt; &gt;=C2=A0 @@ -38,6 +38,7 @@<br>
&gt; &gt; @@ -100,9 +108,11 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static int cg_enumerate_items(const char *controller,=
 const char *path, FILE **_f, const char *item) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_cleanup_free_ char *fs =
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
&gt; &gt; @@ -110,6 +120,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0/* We follow bash for the character set. Different sh=
ells have different rules. */<br>
&gt; &gt;=C2=A0 =C2=A0#define VALID_BASH_ENV_NAME_CHARS=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; &gt; +diff --git a/src/basic/log.c b/src/basic/log.c<br>
&gt; &gt; +index 595db0c395..daff8eb68a 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/log.c<br>
&gt; &gt;=C2=A0 +++ b/src/basic/log.c<br>
&gt; &gt;=C2=A0 @@ -36,6 +36,7 @@<br>
&gt; &gt; @@ -120,6 +132,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#define SNDBUF_SIZE (8*1024*1024)<br>
&gt; &gt;<br>
&gt; &gt; +diff --git a/src/basic/missing_stdlib.h b/src/basic/missing_stdl=
ib.h<br>
&gt; &gt; +index 8c76f93eb2..9068bfb4f0 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/missing_stdlib.h<br>
&gt; &gt;=C2=A0 +++ b/src/basic/missing_stdlib.h<br>
&gt; &gt;=C2=A0 @@ -11,3 +11,15 @@<br>
&gt; &gt; @@ -138,6 +152,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 (char *)memcpy(__new, __old, __len); \<br>
&gt; &gt;=C2=A0 +=C2=A0 })<br>
&gt; &gt;=C2=A0 +#endif<br>
&gt; &gt; +diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c<br>
&gt; &gt; +index f91f8f7a08..fb31596216 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/mkdir.c<br>
&gt; &gt;=C2=A0 +++ b/src/basic/mkdir.c<br>
&gt; &gt;=C2=A0 @@ -14,6 +14,7 @@<br>
&gt; &gt; @@ -148,9 +164,23 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0int mkdir_safe_internal(<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0const char *path,<br>
&gt; &gt; +diff --git a/src/basic/mountpoint-util.c b/src/basic/mountpoint-=
util.c<br>
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
&gt; &gt; +diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c<br>
&gt; &gt; +index b79c885dfd..6dabda5691 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/parse-util.c<br>
&gt; &gt;=C2=A0 +++ b/src/basic/parse-util.c<br>
&gt; &gt; -@@ -22,6 +22,7 @@<br>
&gt; &gt; +@@ -19,6 +19,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;stat-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;string-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;strv.h&quot;<br>
&gt; &gt; @@ -158,6 +188,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0int parse_boolean(const char *v) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!v)<br>
&gt; &gt; +diff --git a/src/basic/path-lookup.c b/src/basic/path-lookup.c<b=
r>
&gt; &gt; +index e53c2302b1..ca1d40ccbe 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/path-lookup.c<br>
&gt; &gt;=C2=A0 +++ b/src/basic/path-lookup.c<br>
&gt; &gt;=C2=A0 @@ -15,6 +15,7 @@<br>
&gt; &gt; @@ -168,6 +200,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0int xdg_user_runtime_dir(char **ret, const char *suff=
ix) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *e;<br>
&gt; &gt; +diff --git a/src/basic/proc-cmdline.c b/src/basic/proc-cmdline.c=
<br>
&gt; &gt; +index 410b8a3eb5..f2c4355609 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/proc-cmdline.c<br>
&gt; &gt;=C2=A0 +++ b/src/basic/proc-cmdline.c<br>
&gt; &gt;=C2=A0 @@ -15,6 +15,7 @@<br>
&gt; &gt; @@ -178,6 +212,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0int proc_cmdline(char **ret) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *e;<br>
&gt; &gt; +diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c<b=
r>
&gt; &gt; +index ccab71f7d2..8f9eee8d36 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/procfs-util.c<br>
&gt; &gt;=C2=A0 +++ b/src/basic/procfs-util.c<br>
&gt; &gt;=C2=A0 @@ -11,6 +11,7 @@<br>
&gt; &gt; @@ -188,6 +224,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0int procfs_tasks_get_limit(uint64_<wbr>t *ret) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_cleanup_free_ char *valu=
e =3D NULL;<br>
&gt; &gt; +diff --git a/src/basic/selinux-util.c b/src/basic/selinux-util.c=
<br>
&gt; &gt; +index ee9e34ed47..96c1e9362d 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/selinux-util.c<br>
&gt; &gt;=C2=A0 +++ b/src/basic/selinux-util.c<br>
&gt; &gt;=C2=A0 @@ -27,6 +27,7 @@<br>
&gt; &gt; @@ -197,7 +235,9 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;=C2=A0 +#include &quot;missing_stdlib.h&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#if HAVE_SELINUX<br>
&gt; &gt; - DEFINE_TRIVIAL_CLEANUP_FUNC(<wbr>context_t, context_free);<br>
&gt; &gt; + DEFINE_TRIVIAL_CLEANUP_FUNC_<wbr>FULL(context_t, context_free, =
NULL);<br>
&gt; &gt; +diff --git a/src/basic/time-util.c b/src/basic/time-util.c<br>
&gt; &gt; +index 78d0390a00..47c38ca691 100644<br>
&gt; &gt;=C2=A0 --- a/src/basic/time-util.c<br>
&gt; &gt;=C2=A0 +++ b/src/basic/time-util.c<br>
&gt; &gt;=C2=A0 @@ -27,6 +27,7 @@<br>
&gt; &gt; @@ -208,6 +248,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static clockid_t map_clock_id(clockid_t c) {<br>
&gt; &gt;<br>
&gt; &gt; +diff --git a/src/boot/bless-boot.c b/src/boot/bless-boot.c<br>
&gt; &gt; +index 97ad1e0cb5..9d60f3cc79 100644<br>
&gt; &gt;=C2=A0 --- a/src/boot/bless-boot.c<br>
&gt; &gt;=C2=A0 +++ b/src/boot/bless-boot.c<br>
&gt; &gt;=C2=A0 @@ -18,6 +18,7 @@<br>
&gt; &gt; @@ -218,16 +260,20 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D=
"mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@micros=
oft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static char **arg_path =3D NULL;<br>
&gt; &gt;<br>
&gt; &gt; +diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-cgroup.c<br>
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
&gt; &gt;=C2=A0 =C2=A0BUS_DEFINE_PROPERTY_GET(bus_<wbr>property_get_tasks_m=
ax, &quot;t&quot;, TasksMax, tasks_max_resolve);<br>
&gt; &gt;<br>
&gt; &gt; +diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c<b=
r>
&gt; &gt; +index 5239c41d67..0f604efe98 100644<br>
&gt; &gt;=C2=A0 --- a/src/core/dbus-execute.c<br>
&gt; &gt;=C2=A0 +++ b/src/core/dbus-execute.c<br>
&gt; &gt;=C2=A0 @@ -41,6 +41,7 @@<br>
&gt; &gt; @@ -238,9 +284,11 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0BUS_DEFINE_PROPERTY_GET_ENUM(<wbr>bus_property_get_ex=
ec_output, exec_output, ExecOutput);<br>
&gt; &gt;=C2=A0 =C2=A0static BUS_DEFINE_PROPERTY_GET_ENUM(<wbr>property_get=
_exec_input, exec_input, ExecInput);<br>
&gt; &gt; +diff --git a/src/core/dbus-util.c b/src/core/dbus-util.c<br>
&gt; &gt; +index 44a2ccfca0..3926ccfa4a 100644<br>
&gt; &gt;=C2=A0 --- a/src/core/dbus-util.c<br>
&gt; &gt;=C2=A0 +++ b/src/core/dbus-util.c<br>
&gt; &gt; -@@ -7,6 +7,7 @@<br>
&gt; &gt; +@@ -9,6 +9,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;unit-printf.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;user-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;unit.h&quot;<br>
&gt; &gt; @@ -248,16 +296,20 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D=
"mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@micros=
oft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0int bus_property_get_triggered_<wbr>unit(<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0sd_bus *bus,<br>
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
&gt; &gt; @@ -268,6 +320,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#if HAVE_KMOD<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;module-util.h&quot;<br>
&gt; &gt; +diff --git a/src/core/service.c b/src/core/service.c<br>
&gt; &gt; +index 4c5bfb17fb..8c05f36119 100644<br>
&gt; &gt;=C2=A0 --- a/src/core/service.c<br>
&gt; &gt;=C2=A0 +++ b/src/core/service.c<br>
&gt; &gt;=C2=A0 @@ -41,6 +41,7 @@<br>
&gt; &gt; @@ -278,6 +332,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static const UnitActiveState state_translation_table[=
_<wbr>SERVICE_STATE_MAX] =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[SERVICE_DEAD] =3D UNIT_I=
NACTIVE,<br>
&gt; &gt; +diff --git a/src/coredump/coredump-<wbr>vacuum.c b/src/coredump/=
coredump-<wbr>vacuum.c<br>
&gt; &gt; +index 95c3fca661..d4a9f27b08 100644<br>
&gt; &gt;=C2=A0 --- a/src/coredump/coredump-<wbr>vacuum.c<br>
&gt; &gt;=C2=A0 +++ b/src/coredump/coredump-<wbr>vacuum.c<br>
&gt; &gt;=C2=A0 @@ -16,6 +16,7 @@<br>
&gt; &gt; @@ -288,9 +344,11 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#define DEFAULT_MAX_USE_LOWER (uint64_t) (1ULL*1024UL=
L*1024ULL)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 1 MiB */<br>
&gt; &gt;=C2=A0 =C2=A0#define DEFAULT_MAX_USE_UPPER (uint64_t) (4ULL*1024UL=
L*1024ULL*1024ULL)<wbr>=C2=A0 =C2=A0/* 4 GiB */<br>
&gt; &gt; +diff --git a/src/journal-remote/journal-<wbr>remote-main.c b/src=
/journal-remote/journal-<wbr>remote-main.c<br>
&gt; &gt; +index ae1d43756a..24de98c9f3 100644<br>
&gt; &gt;=C2=A0 --- a/src/journal-remote/journal-<wbr>remote-main.c<br>
&gt; &gt;=C2=A0 +++ b/src/journal-remote/journal-<wbr>remote-main.c<br>
&gt; &gt; -@@ -22,6 +22,7 @@<br>
&gt; &gt; +@@ -24,6 +24,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;stat-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;string-table.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;strv.h&quot;<br>
&gt; &gt; @@ -298,9 +356,11 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#define PRIV_KEY_FILE CERTIFICATE_ROOT &quot;/private=
/journal-remote.pem&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#define CERT_FILE=C2=A0 =C2=A0 =C2=A0CERTIFICATE_ROOT=
 &quot;/certs/journal-remote.pem&quot;<br>
&gt; &gt; +diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c=
<br>
&gt; &gt; +index 76d05c1eee..0beb77b2e5 100644<br>
&gt; &gt;=C2=A0 --- a/src/journal/journalctl.c<br>
&gt; &gt;=C2=A0 +++ b/src/journal/journalctl.c<br>
&gt; &gt; -@@ -73,6 +73,7 @@<br>
&gt; &gt; +@@ -72,6 +72,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;unit-name.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;user-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;varlink.h&quot;<br>
&gt; &gt; @@ -308,19 +368,11 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D=
"mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@micros=
oft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUTE=
)<br>
&gt; &gt;=C2=A0 =C2=A0#define PROCESS_INOTIFY_INTERVAL 1024=C2=A0 =C2=A0/* =
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
&gt; &gt; +diff --git a/src/libsystemd/sd-bus/bus-<wbr>message.c b/src/libs=
ystemd/sd-bus/bus-<wbr>message.c<br>
&gt; &gt; +index b25064b672..b3bbe63a91 100644<br>
&gt; &gt;=C2=A0 --- a/src/libsystemd/sd-bus/bus-<wbr>message.c<br>
&gt; &gt;=C2=A0 +++ b/src/libsystemd/sd-bus/bus-<wbr>message.c<br>
&gt; &gt; -@@ -21,6 +21,7 @@<br>
&gt; &gt; +@@ -20,6 +20,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;strv.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;time-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;utf8.h&quot;<br>
&gt; &gt; @@ -328,9 +380,11 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static int message_append_basic(sd_bus_<wbr>message *=
m, char type, const void *p, const void **stored);<br>
&gt; &gt;<br>
&gt; &gt; +diff --git a/src/libsystemd/sd-bus/bus-<wbr>objects.c b/src/libs=
ystemd/sd-bus/bus-<wbr>objects.c<br>
&gt; &gt; +index bfd42aea7d..daefc56e3e 100644<br>
&gt; &gt;=C2=A0 --- a/src/libsystemd/sd-bus/bus-<wbr>objects.c<br>
&gt; &gt;=C2=A0 +++ b/src/libsystemd/sd-bus/bus-<wbr>objects.c<br>
&gt; &gt; -@@ -13,6 +13,7 @@<br>
&gt; &gt; +@@ -12,6 +12,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;set.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;string-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;strv.h&quot;<br>
&gt; &gt; @@ -338,6 +392,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static int node_vtable_get_userdata(<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0sd_bus *bus,<br>
&gt; &gt; +diff --git a/src/libsystemd/sd-bus/bus-<wbr>socket.c b/src/libsy=
stemd/sd-bus/bus-<wbr>socket.c<br>
&gt; &gt; +index 832526cc1b..7bff701806 100644<br>
&gt; &gt;=C2=A0 --- a/src/libsystemd/sd-bus/bus-<wbr>socket.c<br>
&gt; &gt;=C2=A0 +++ b/src/libsystemd/sd-bus/bus-<wbr>socket.c<br>
&gt; &gt;=C2=A0 @@ -28,6 +28,7 @@<br>
&gt; &gt; @@ -348,29 +404,47 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D=
"mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@micros=
oft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#define SNDBUF_SIZE (8*1024*1024)<br>
&gt; &gt;<br>
&gt; &gt; +diff --git a/src/libsystemd/sd-bus/sd-<wbr>bus.c b/src/libsystem=
d/sd-bus/sd-<wbr>bus.c<br>
&gt; &gt; +index e719c74370..ac2a605680 100644<br>
&gt; &gt;=C2=A0 --- a/src/libsystemd/sd-bus/sd-<wbr>bus.c<br>
&gt; &gt;=C2=A0 +++ b/src/libsystemd/sd-bus/sd-<wbr>bus.c<br>
&gt; &gt;=C2=A0 @@ -41,6 +41,7 @@<br>
&gt; &gt; - #include &quot;process-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;string-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;strv.h&quot;<br>
&gt; &gt; + #include &quot;user-util.h&quot;<br>
&gt; &gt;=C2=A0 +#include &quot;missing_stdlib.h&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#define log_debug_bus_message(m)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do {=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; &gt; +diff --git a/src/libsystemd/sd-bus/test-<wbr>bus-benchmark.c b/s=
rc/libsystemd/sd-bus/test-<wbr>bus-benchmark.c<br>
&gt; &gt; +index 13c08fe295..9aae83486e 100644<br>
&gt; &gt;=C2=A0 --- a/src/libsystemd/sd-bus/test-<wbr>bus-benchmark.c<br>
&gt; &gt;=C2=A0 +++ b/src/libsystemd/sd-bus/test-<wbr>bus-benchmark.c<br>
&gt; &gt;=C2=A0 @@ -14,6 +14,7 @@<br>
&gt; &gt; - #include &quot;missing_resource.h&quot;<br>
&gt; &gt; + #include &quot;string-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;time-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;util.h&quot;<br>
&gt; &gt;=C2=A0 +#include &quot;missing_stdlib.h&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#define MAX_SIZE (2*1024*1024)<br>
&gt; &gt;<br>
&gt; &gt; +diff --git a/src/libsystemd/sd-journal/<wbr>sd-journal.c b/src/l=
ibsystemd/sd-journal/<wbr>sd-journal.c<br>
&gt; &gt; +index c90b4c926e..0efdccff5d 100644<br>
&gt; &gt; +--- a/src/libsystemd/sd-journal/<wbr>sd-journal.c<br>
&gt; &gt; ++++ b/src/libsystemd/sd-journal/<wbr>sd-journal.c<br>
&gt; &gt; +@@ -40,6 +40,7 @@<br>
&gt; &gt; + #include &quot;string-util.h&quot;<br>
&gt; &gt; + #include &quot;strv.h&quot;<br>
&gt; &gt; + #include &quot;syslog-util.h&quot;<br>
&gt; &gt; ++#include &quot;missing_stdlib.h&quot;<br>
&gt; &gt; +<br>
&gt; &gt; + #define JOURNAL_FILES_MAX 7168<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/src/locale/keymap-util.c b/src/locale/keymap-util.c=
<br>
&gt; &gt; +index d2f0566dbc..3b7746557e 100644<br>
&gt; &gt;=C2=A0 --- a/src/locale/keymap-util.c<br>
&gt; &gt;=C2=A0 +++ b/src/locale/keymap-util.c<br>
&gt; &gt; -@@ -21,6 +21,7 @@<br>
&gt; &gt; +@@ -24,6 +24,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;string-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;strv.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;tmpfile-util.h&quot;<br>
&gt; &gt; @@ -378,6 +452,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static bool startswith_comma(const char *s, const cha=
r *prefix) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D startswith(s, prefi=
x);<br>
&gt; &gt; +diff --git a/src/login/pam_systemd.c b/src/login/pam_systemd.c<b=
r>
&gt; &gt; +index 2021c31bd5..58eb09808d 100644<br>
&gt; &gt;=C2=A0 --- a/src/login/pam_systemd.c<br>
&gt; &gt;=C2=A0 +++ b/src/login/pam_systemd.c<br>
&gt; &gt;=C2=A0 @@ -31,6 +31,7 @@<br>
&gt; &gt; @@ -388,6 +464,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;pam-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;parse-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;path-util.h&quot;<br>
&gt; &gt; +diff --git a/src/network/generator/<wbr>network-generator.c b/sr=
c/network/generator/<wbr>network-generator.c<br>
&gt; &gt; +index ae673ddf5b..a79e5114ca 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/generator/<wbr>network-generator.c<br>
&gt; &gt;=C2=A0 +++ b/src/network/generator/<wbr>network-generator.c<br>
&gt; &gt;=C2=A0 @@ -13,6 +13,7 @@<br>
&gt; &gt; @@ -398,6 +476,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0/*<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0# .network<br>
&gt; &gt; +diff --git a/src/nspawn/nspawn-settings.c b/src/nspawn/nspawn-se=
ttings.c<br>
&gt; &gt; +index d4619bead5..0e832fd994 100644<br>
&gt; &gt;=C2=A0 --- a/src/nspawn/nspawn-settings.c<br>
&gt; &gt;=C2=A0 +++ b/src/nspawn/nspawn-settings.c<br>
&gt; &gt;=C2=A0 @@ -16,6 +16,7 @@<br>
&gt; &gt; @@ -408,19 +488,23 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D=
"mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@micros=
oft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0Settings *settings_new(void) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Settings *s;<br>
&gt; &gt; +diff --git a/src/nss-mymachines/nss-<wbr>mymachines.c b/src/nss-=
mymachines/nss-<wbr>mymachines.c<br>
&gt; &gt; +index 44715bb3e5..bc1e688b5e 100644<br>
&gt; &gt;=C2=A0 --- a/src/nss-mymachines/nss-<wbr>mymachines.c<br>
&gt; &gt;=C2=A0 +++ b/src/nss-mymachines/nss-<wbr>mymachines.c<br>
&gt; &gt; -@@ -19,6 +19,7 @@<br>
&gt; &gt; +@@ -21,6 +21,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;nss-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;signal-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;string-util.h&quot;<br>
&gt; &gt;=C2=A0 +#include &quot;missing_stdlib.h&quot;<br>
&gt; &gt;<br>
&gt; &gt; - NSS_GETHOSTBYNAME_PROTOTYPES(<wbr>mymachines);<br>
&gt; &gt; - NSS_GETPW_PROTOTYPES(<wbr>mymachines);<br>
&gt; &gt; + static void setup_logging(void) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* We need a dummy function be=
cause log_parse_environment is a macro. */<br>
&gt; &gt; +diff --git a/src/portable/portable.c b/src/portable/portable.c<b=
r>
&gt; &gt; +index f201f52531..c78ad0f471 100644<br>
&gt; &gt;=C2=A0 --- a/src/portable/portable.c<br>
&gt; &gt;=C2=A0 +++ b/src/portable/portable.c<br>
&gt; &gt; -@@ -31,6 +31,7 @@<br>
&gt; &gt; +@@ -32,6 +32,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;strv.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;tmpfile-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;user-util.h&quot;<br>
&gt; &gt; @@ -428,9 +512,11 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static const char profile_dirs[] =3D CONF_PATHS_NULST=
R(&quot;systemd/<wbr>portable/profile&quot;);<br>
&gt; &gt;<br>
&gt; &gt; +diff --git a/src/resolve/resolvectl.c b/src/resolve/resolvectl.c=
<br>
&gt; &gt; +index 52bbae3293..4ccbae09c4 100644<br>
&gt; &gt;=C2=A0 --- a/src/resolve/resolvectl.c<br>
&gt; &gt;=C2=A0 +++ b/src/resolve/resolvectl.c<br>
&gt; &gt; -@@ -37,6 +37,7 @@<br>
&gt; &gt; +@@ -41,6 +41,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;terminal-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;utf8.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;verbs.h&quot;<br>
&gt; &gt; @@ -438,6 +524,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static int arg_family =3D AF_UNSPEC;<br>
&gt; &gt;=C2=A0 =C2=A0static int arg_ifindex =3D 0;<br>
&gt; &gt; +diff --git a/src/shared/bus-get-<wbr>properties.c b/src/shared/b=
us-get-<wbr>properties.c<br>
&gt; &gt; +index feb6d3807f..eb11d29e50 100644<br>
&gt; &gt;=C2=A0 --- a/src/shared/bus-get-<wbr>properties.c<br>
&gt; &gt;=C2=A0 +++ b/src/shared/bus-get-<wbr>properties.c<br>
&gt; &gt;=C2=A0 @@ -4,6 +4,7 @@<br>
&gt; &gt; @@ -448,6 +536,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0int bus_property_get_bool(<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0sd_bus *bus,<br>
&gt; &gt; +diff --git a/src/shared/bus-unit-procs.c b/src/shared/bus-unit-p=
rocs.c<br>
&gt; &gt; +index b76125e551..2e0892242f 100644<br>
&gt; &gt;=C2=A0 --- a/src/shared/bus-unit-procs.c<br>
&gt; &gt;=C2=A0 +++ b/src/shared/bus-unit-procs.c<br>
&gt; &gt;=C2=A0 @@ -10,6 +10,7 @@<br>
&gt; &gt; @@ -458,9 +548,11 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0struct CGroupInfo {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *cgroup_path;<br>
&gt; &gt; +diff --git a/src/shared/bus-unit-util.c b/src/shared/bus-unit-ut=
il.c<br>
&gt; &gt; +index a75178068b..3de06e2bd5 100644<br>
&gt; &gt;=C2=A0 --- a/src/shared/bus-unit-util.c<br>
&gt; &gt;=C2=A0 +++ b/src/shared/bus-unit-util.c<br>
&gt; &gt; -@@ -44,6 +44,7 @@<br>
&gt; &gt; +@@ -45,6 +45,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;unit-def.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;user-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;utf8.h&quot;<br>
&gt; &gt; @@ -468,6 +560,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0int bus_parse_unit_info(sd_bus_<wbr>message *message,=
 UnitInfo *u) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(message);<br>
&gt; &gt; +diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c<br>
&gt; &gt; +index 64ca67993c..31e3d148ea 100644<br>
&gt; &gt;=C2=A0 --- a/src/shared/bus-util.c<br>
&gt; &gt;=C2=A0 +++ b/src/shared/bus-util.c<br>
&gt; &gt;=C2=A0 @@ -21,6 +21,7 @@<br>
&gt; &gt; @@ -478,6 +572,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static int name_owner_change_callback(sd_<wbr>bus_mes=
sage *m, void *userdata, sd_bus_error *ret_error) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sd_event *e =3D userdata;=
<br>
&gt; &gt; +diff --git a/src/shared/dns-domain.c b/src/shared/dns-domain.c<b=
r>
&gt; &gt; +index e43aa12882..cec9b413c1 100644<br>
&gt; &gt;=C2=A0 --- a/src/shared/dns-domain.c<br>
&gt; &gt;=C2=A0 +++ b/src/shared/dns-domain.c<br>
&gt; &gt;=C2=A0 @@ -17,6 +17,7 @@<br>
&gt; &gt; @@ -488,6 +584,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0int dns_label_unescape(const char **name, char *dest,=
 size_t sz, DNSLabelFlags flags) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *n;<br>
&gt; &gt; +diff --git a/src/shared/journal-importer.<wbr>c b/src/shared/jou=
rnal-importer.<wbr>c<br>
&gt; &gt; +index b2785f0552..5f00902882 100644<br>
&gt; &gt;=C2=A0 --- a/src/shared/journal-importer.<wbr>c<br>
&gt; &gt;=C2=A0 +++ b/src/shared/journal-importer.<wbr>c<br>
&gt; &gt;=C2=A0 @@ -14,6 +14,7 @@<br>
&gt; &gt; @@ -498,6 +596,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0enum {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMPORTER_STATE_LINE =3D 0=
,=C2=A0 =C2=A0 /* waiting to read, or reading line */<br>
&gt; &gt; +diff --git a/src/shared/logs-show.c b/src/shared/logs-show.c<br>
&gt; &gt; +index e63c59bd94..dd9773c009 100644<br>
&gt; &gt;=C2=A0 --- a/src/shared/logs-show.c<br>
&gt; &gt;=C2=A0 +++ b/src/shared/logs-show.c<br>
&gt; &gt;=C2=A0 @@ -41,6 +41,7 @@<br>
&gt; &gt; @@ -508,6 +608,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0/* up to three lines (each up to 100 characters) or 3=
00 characters, whichever is less */<br>
&gt; &gt;=C2=A0 =C2=A0#define PRINT_LINE_THRESHOLD 3<br>
&gt; &gt; +diff --git a/src/shared/pager.c b/src/shared/pager.c<br>
&gt; &gt; +index 4bbad7e37b..eefcdd068c 100644<br>
&gt; &gt;=C2=A0 --- a/src/shared/pager.c<br>
&gt; &gt;=C2=A0 +++ b/src/shared/pager.c<br>
&gt; &gt;=C2=A0 @@ -26,6 +26,7 @@<br>
&gt; &gt; @@ -518,6 +620,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static pid_t pager_pid =3D 0;<br>
&gt; &gt;<br>
&gt; &gt; +diff --git a/src/shared/uid-range.c b/src/shared/uid-range.c<br>
&gt; &gt; +index 5d5bf7f21d..f1002ffa6c 100644<br>
&gt; &gt;=C2=A0 --- a/src/shared/uid-range.c<br>
&gt; &gt;=C2=A0 +++ b/src/shared/uid-range.c<br>
&gt; &gt;=C2=A0 @@ -9,6 +9,7 @@<br>
&gt; &gt; @@ -528,6 +632,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static bool uid_range_intersect(UidRange *range, uid_=
t start, uid_t nr) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(range);<br>
&gt; &gt; +diff --git a/src/socket-proxy/socket-<wbr>proxyd.c b/src/socket-=
proxy/socket-<wbr>proxyd.c<br>
&gt; &gt; +index 6e3ee0d76b..7727e33d95 100644<br>
&gt; &gt;=C2=A0 --- a/src/socket-proxy/socket-<wbr>proxyd.c<br>
&gt; &gt;=C2=A0 +++ b/src/socket-proxy/socket-<wbr>proxyd.c<br>
&gt; &gt;=C2=A0 @@ -26,6 +26,7 @@<br>
&gt; &gt; @@ -538,6 +644,8 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"m=
ailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsof=
t.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#define BUFFER_SIZE (256 * 1024)<br>
&gt; &gt;<br>
&gt; &gt; +diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct=
.c<br>
&gt; &gt; +index c9d318b8d1..fcb8d40805 100644<br>
&gt; &gt;=C2=A0 --- a/src/test/test-hexdecoct.c<br>
&gt; &gt;=C2=A0 +++ b/src/test/test-hexdecoct.c<br>
&gt; &gt;=C2=A0 @@ -6,6 +6,7 @@<br>
&gt; &gt; @@ -548,19 +656,23 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D=
"mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@micros=
oft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static void test_hexchar(void) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert_se(hexchar(0xa) =
=3D=3D &#39;a&#39;);<br>
&gt; &gt; +diff --git a/src/udev/udev-builtin-path_<wbr>id.c b/src/udev/ude=
v-builtin-path_<wbr>id.c<br>
&gt; &gt; +index 09cc1c3bd8..8a7d3152a7 100644<br>
&gt; &gt;=C2=A0 --- a/src/udev/udev-builtin-path_<wbr>id.c<br>
&gt; &gt;=C2=A0 +++ b/src/udev/udev-builtin-path_<wbr>id.c<br>
&gt; &gt;=C2=A0 @@ -22,6 +22,7 @@<br>
&gt; &gt; - #include &quot;strv.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;sysexits.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;udev-builtin.h&quot;<br>
&gt; &gt; + #include &quot;udev-util.h&quot;<br>
&gt; &gt;=C2=A0 +#include &quot;missing_stdlib.h&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0_printf_(2,3)<br>
&gt; &gt;=C2=A0 =C2=A0static void path_prepend(char **path, const char *fmt=
, ...) {<br>
&gt; &gt; +diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c<br>
&gt; &gt; +index 12597194a9..208b2458b5 100644<br>
&gt; &gt;=C2=A0 --- a/src/udev/udev-event.c<br>
&gt; &gt;=C2=A0 +++ b/src/udev/udev-event.c<br>
&gt; &gt; -@@ -34,6 +34,7 @@<br>
&gt; &gt; +@@ -33,6 +33,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;udev-util.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;udev-watch.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;user-util.h&quot;<br>
&gt; &gt; @@ -568,9 +680,11 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
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
&gt; &gt; @@ -578,13 +692,3 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"=
mailto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microso=
ft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#define RULES_DIRS (const char* const*) CONF_PATHS_ST=
RV(&quot;udev/rules.d&quot;<wbr>)<br>
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
&gt; &gt; diff --git a/meta/recipes-core/systemd/<wbr>systemd/0006-Include-=
netinet-<wbr>if_ether.h.patch b/meta/recipes-core/systemd/<wbr>systemd/0006=
-Include-netinet-<wbr>if_ether.h.patch<br>
&gt; &gt; index a978558b42..54d714266e 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/<wbr>systemd/0006-Include-netinet=
-<wbr>if_ether.h.patch<br>
&gt; &gt; +++ b/meta/recipes-core/systemd/<wbr>systemd/0006-Include-netinet=
-<wbr>if_ether.h.patch<br>
&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; -From d3ed0da271738fd0fc3d3e4d82d6f5<wbr>810334b05e Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; +From 2069f0b0d5ab8f869aeba635a347e0<wbr>b11d362b30 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Thu, 26 Oct 2017 22:10:42 -0700<br>
&gt; &gt; -Subject: [PATCH 06/26] Include netinet/if_ether.h<br>
&gt; &gt; +Subject: [PATCH] Include netinet/if_ether.h<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Fixes<br>
&gt; &gt;=C2=A0 /path/to/systemd/recipe-<wbr>sysroot/usr/include/netinet/<w=
br>if_ether.h:101:8: error: redefinition of &#39;struct ethhdr&#39;<br>
&gt; &gt; @@ -31,6 +31,7 @@ Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi=
.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 Signed-off-by: Scott Murray &lt;<a href=3D"mailto:scott.mur=
ray@konsulko.com" target=3D"_blank">scott.murray@konsulko.com</a>&gt;<br>
&gt; &gt;=C2=A0 [rebased for systemd 247]<br>
&gt; &gt;=C2=A0 Signed-off-by: Luca Boccassi &lt;<a href=3D"mailto:luca.boc=
cassi@microsoft.com" target=3D"_blank">luca.boccassi@microsoft.com</a>&gt;<=
br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0src/libsystemd-network/sd-<wbr>dhcp6-client.c=C2=A0 |=
 1 -<br>
&gt; &gt;=C2=A0 =C2=A0src/libsystemd/sd-netlink/<wbr>netlink-types.c | 1 +<=
br>
&gt; &gt; @@ -56,7 +57,7 @@ Signed-off-by: Luca Boccassi &lt;<a href=3D"mai=
lto:luca.boccassi@microsoft.com" target=3D"_blank">luca.boccassi@microsoft.=
com</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A021 files changed, 26 insertions(+), 8 deletions(-)<br=
>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/libsystemd-network/sd-<wbr>dhcp6-client.c =
b/src/libsystemd-network/sd-<wbr>dhcp6-client.c<br>
&gt; &gt; -index 66f87c4b95..de1264ae46 100644<br>
&gt; &gt; +index 410bfda10e..e70ed8be92 100644<br>
&gt; &gt;=C2=A0 --- a/src/libsystemd-network/sd-<wbr>dhcp6-client.c<br>
&gt; &gt;=C2=A0 +++ b/src/libsystemd-network/sd-<wbr>dhcp6-client.c<br>
&gt; &gt;=C2=A0 @@ -5,7 +5,6 @@<br>
&gt; &gt; @@ -68,7 +69,7 @@ index 66f87c4b95..de1264ae46 100644<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;sd-dhcp6-client.h&quot;<br>
&gt; &gt;=C2=A0 diff --git a/src/libsystemd/sd-netlink/<wbr>netlink-types.c=
 b/src/libsystemd/sd-netlink/<wbr>netlink-types.c<br>
&gt; &gt; -index 6fb6c147d9..8eda02d202 100644<br>
&gt; &gt; +index ed7b9a8cd1..112c0b09e4 100644<br>
&gt; &gt;=C2=A0 --- a/src/libsystemd/sd-netlink/<wbr>netlink-types.c<br>
&gt; &gt;=C2=A0 +++ b/src/libsystemd/sd-netlink/<wbr>netlink-types.c<br>
&gt; &gt;=C2=A0 @@ -3,6 +3,7 @@<br>
&gt; &gt; @@ -80,7 +81,7 @@ index 6fb6c147d9..8eda02d202 100644<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;linux/netlink.h&gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;linux/rtnetlink.h&gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/machine/machine-dbus.c b/src/machine/machi=
ne-dbus.c<br>
&gt; &gt; -index bb67beb665..f5780f1aec 100644<br>
&gt; &gt; +index e7c4ed3c7c..3a1e4f9072 100644<br>
&gt; &gt;=C2=A0 --- a/src/machine/machine-dbus.c<br>
&gt; &gt;=C2=A0 +++ b/src/machine/machine-dbus.c<br>
&gt; &gt;=C2=A0 @@ -3,6 +3,7 @@<br>
&gt; &gt; @@ -92,7 +93,7 @@ index bb67beb665..f5780f1aec 100644<br>
&gt; &gt;=C2=A0 =C2=A0/* When we include libgen.h because we need dirname()=
 we immediately<br>
&gt; &gt;=C2=A0 =C2=A0 * undefine basename() since libgen.h defines it as a=
 macro to the POSIX<br>
&gt; &gt;=C2=A0 diff --git a/src/network/netdev/bond.c b/src/network/netdev=
/bond.c<br>
&gt; &gt; -index e27f36067b..8868f1da5d 100644<br>
&gt; &gt; +index cf7ca88d6f..34ab468191 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/netdev/bond.c<br>
&gt; &gt;=C2=A0 +++ b/src/network/netdev/bond.c<br>
&gt; &gt;=C2=A0 @@ -1,5 +1,6 @@<br>
&gt; &gt; @@ -103,7 +104,7 @@ index e27f36067b..8868f1da5d 100644<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;bond.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;bond-util.h&quot;<br>
&gt; &gt;=C2=A0 diff --git a/src/network/netdev/bridge.c b/src/network/netd=
ev/bridge.c<br>
&gt; &gt; -index 1f59cd8b42..5fdbae7e99 100644<br>
&gt; &gt; +index 38432f1578..79ccfe578e 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/netdev/bridge.c<br>
&gt; &gt;=C2=A0 +++ b/src/network/netdev/bridge.c<br>
&gt; &gt;=C2=A0 @@ -1,5 +1,6 @@<br>
&gt; &gt; @@ -114,7 +115,7 @@ index 1f59cd8b42..5fdbae7e99 100644<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;bridge.h&quot;<br>
&gt; &gt;=C2=A0 diff --git a/src/network/netdev/macsec.c b/src/network/netd=
ev/macsec.c<br>
&gt; &gt; -index 82e71c3920..fbae86e216 100644<br>
&gt; &gt; +index 77c5f8c4e7..04be1b4ab2 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/netdev/macsec.c<br>
&gt; &gt;=C2=A0 +++ b/src/network/netdev/macsec.c<br>
&gt; &gt;=C2=A0 @@ -1,5 +1,6 @@<br>
&gt; &gt; @@ -125,19 +126,19 @@ index 82e71c3920..fbae86e216 100644<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;linux/if_ether.h&gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;linux/if_macsec.h&gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/network/netdev/netdev-<wbr>gperf.gperf b/s=
rc/network/netdev/netdev-<wbr>gperf.gperf<br>
&gt; &gt; -index 4e89761f2c..91251fa6ec 100644<br>
&gt; &gt; +index 8abe044890..3c54c58928 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/netdev/netdev-<wbr>gperf.gperf<br>
&gt; &gt;=C2=A0 +++ b/src/network/netdev/netdev-<wbr>gperf.gperf<br>
&gt; &gt; -@@ -2,6 +2,7 @@<br>
&gt; &gt; +@@ -3,6 +3,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#if __GNUC__ &gt;=3D 7<br>
&gt; &gt;=C2=A0 =C2=A0_Pragma(&quot;GCC diagnostic ignored \&quot;-Wimplici=
t-fallthrough\&quot;&quot;)<br>
&gt; &gt;=C2=A0 =C2=A0#endif<br>
&gt; &gt;=C2=A0 +#include &lt;netinet/if_ether.h&gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;stddef.h&gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;bareudp.h&quot;<br>
&gt; &gt; - #include &quot;bond.h&quot;<br>
&gt; &gt; + #include &quot;batadv.h&quot;<br>
&gt; &gt;=C2=A0 diff --git a/src/network/netdev/netdev.c b/src/network/netd=
ev/netdev.c<br>
&gt; &gt; -index 9f390b5781..62aeafb1e4 100644<br>
&gt; &gt; +index b31f0fa81a..c80e1ff537 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/netdev/netdev.c<br>
&gt; &gt;=C2=A0 +++ b/src/network/netdev/netdev.c<br>
&gt; &gt;=C2=A0 @@ -1,5 +1,6 @@<br>
&gt; &gt; @@ -148,7 +149,7 @@ index 9f390b5781..62aeafb1e4 100644<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;netinet/in.h&gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;unistd.h&gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/network/networkd-brvlan.<wbr>c b/src/netwo=
rk/networkd-brvlan.<wbr>c<br>
&gt; &gt; -index e53c73c30c..9bf0771b84 100644<br>
&gt; &gt; +index 2847b336c9..4d6af8c642 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/networkd-brvlan.<wbr>c<br>
&gt; &gt;=C2=A0 +++ b/src/network/networkd-brvlan.<wbr>c<br>
&gt; &gt;=C2=A0 @@ -4,6 +4,7 @@<br>
&gt; &gt; @@ -160,7 +161,7 @@ index e53c73c30c..9bf0771b84 100644<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;stdbool.h&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/network/networkd-dhcp-<wbr>common.c b/src/=
network/networkd-dhcp-<wbr>common.c<br>
&gt; &gt; -index 9f58121350..554d006cb8 100644<br>
&gt; &gt; +index 00d055cf8d..65821c1d31 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/networkd-dhcp-<wbr>common.c<br>
&gt; &gt;=C2=A0 +++ b/src/network/networkd-dhcp-<wbr>common.c<br>
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
&gt; &gt;=C2=A0 diff --git a/src/network/networkd-dhcp-<wbr>server.c b/src/=
network/networkd-dhcp-<wbr>server.c<br>
&gt; &gt; -index cf279c640d..bae541029b 100644<br>
&gt; &gt; +index 5cdf432c27..93cffb9863 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/networkd-dhcp-<wbr>server.c<br>
&gt; &gt;=C2=A0 +++ b/src/network/networkd-dhcp-<wbr>server.c<br>
&gt; &gt;=C2=A0 @@ -1,8 +1,8 @@<br>
&gt; &gt; @@ -197,7 +198,7 @@ index cf279c640d..bae541029b 100644<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;sd-dhcp-server.h&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/network/networkd-dhcp4.c b/src/network/net=
workd-dhcp4.c<br>
&gt; &gt; -index f3c1e5f609..e4ef6eca63 100644<br>
&gt; &gt; +index 23dc3a45db..7ae6c2467a 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/networkd-dhcp4.c<br>
&gt; &gt;=C2=A0 +++ b/src/network/networkd-dhcp4.c<br>
&gt; &gt;=C2=A0 @@ -1,9 +1,9 @@<br>
&gt; &gt; @@ -212,7 +213,7 @@ index f3c1e5f609..e4ef6eca63 100644<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;escape.h&quot;<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;alloc-util.h&quot;<br>
&gt; &gt;=C2=A0 diff --git a/src/network/networkd-dhcp6.c b/src/network/net=
workd-dhcp6.c<br>
&gt; &gt; -index 5c077c1ec8..fa98042aa5 100644<br>
&gt; &gt; +index aa077d6219..4f6ce22059 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/networkd-dhcp6.c<br>
&gt; &gt;=C2=A0 +++ b/src/network/networkd-dhcp6.c<br>
&gt; &gt;=C2=A0 @@ -3,9 +3,9 @@<br>
&gt; &gt; @@ -227,7 +228,7 @@ index 5c077c1ec8..fa98042aa5 100644<br>
&gt; &gt;=C2=A0 =C2=A0#include &quot;sd-dhcp6-client.h&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/network/networkd-link.c b/src/network/netw=
orkd-link.c<br>
&gt; &gt; -index 3bfe636691..e0c68c8ad3 100644<br>
&gt; &gt; +index 8219d95b0d..c92230453b 100644<br>
&gt; &gt;=C2=A0 --- a/src/network/networkd-link.c<br>
&gt; &gt;=C2=A0 +++ b/src/network/networkd-link.c<br>
&gt; &gt;=C2=A0 @@ -1,8 +1,8 @@<br>
&gt; &gt; @@ -241,7 +242,7 @@ index 3bfe636691..e0c6</blockquote></div></bl=
ockquote>

--000000000000bbd0c905c327d751--
