Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96211EDE99E
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 09:08:16 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.7517.1694682488215885893
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 02:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=BSrymXCi;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-31f7400cb74so570129f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 02:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694682486; x=1695287286; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DmD1nLCYZNKgfhcJDz2425PsRQAYx4tA0/8+5h3AlJw=;
        b=BSrymXCiRmup5Sp+caBENff1T9lW35+UzH9NtsgVpYdR7Udye1xE9kOIcCJAnzF2oC
         XqCZveqfRfL7oBhixMJpTC5z18q9Xfvz3YxQyCjGdXMWK30Yh8oChoT0akiCG+eDcyEk
         xP9idHdGb72qsPfYRl0EQ/nA4r5U602gXJidM++F8jP3Ha4m1TQp5wjwTb9dEU6qAkX0
         U2fpLz9zEvvt8vDxLr8//ujv+NYmov2hCk61MY4+uj5nbux1buhxF9iljBn67MCQ/wPF
         uIaaALqOtc1buGmMP6xWhxToqr8XvMMD4tOYSVM93pmo0SecQ8XGMUbQKxr3f/0tRuUk
         Y7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694682486; x=1695287286;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DmD1nLCYZNKgfhcJDz2425PsRQAYx4tA0/8+5h3AlJw=;
        b=A6tp+Dw7r/QrtlZz6whrobMPpqLBgFiWMCjx+p1ZpwIuuLSMNrk+BNVYvrtuXnzDtS
         C/M6Xahswr36AA5gzY5It+RsTpZA1ZiyQ+jF0KP3+LWaw1S+InU99c12VQr0iGgqktR2
         X0XJ6CeeoEm/qX1QpY7TBLPwKzcWqgU284Nf5sZblTI3MeIM+YF8YTAFnSMqphYWVlYM
         hRZKjwdBNtw4KkMNFRXL6O6urHSyiOWoCFrmYXSjWwDAfvTW6JmKH+QbFLQ5l3VjShi/
         f1BE3YUOEqJNh/v01pknayT4kid9BGRsEzpqtBey4vPbYY0E8xrym9pdSFmqyTfm2tZX
         +Fmw==
X-Gm-Message-State: AOJu0YzqNshb1ferPqeCW1a92M/YqLFpDeu5yVXdIOY0Uwwc8fhizQ7Q
	i8E03lAz+By/0EqwqJx2yuMB1fQ1omgMic8gQWc=
X-Google-Smtp-Source: AGHT+IEI5uP7ra/ZuC4hFBIkCutf1ASin0Rg9SXUv3EaFEtBfHAgclTsie6Vi1aW5v4gBIkHbqKa75WZfPNBkOprmqQ=
X-Received: by 2002:adf:fe4d:0:b0:317:5bb2:aeca with SMTP id
 m13-20020adffe4d000000b003175bb2aecamr3804429wrs.16.1694682485564; Thu, 14
 Sep 2023 02:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230912172439.2336327-1-ross.burton@arm.com>
In-Reply-To: <20230912172439.2336327-1-ross.burton@arm.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 14 Sep 2023 11:07:53 +0200
Message-ID: <CA+chaQdGwohtDJFPa=pyVM+ST1BnWbd5Y9bFO7cWL7KbExtTAA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][mickledore] gcc: Fix -fstack-protector issue on aarch64
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Content-Type: multipart/alternative; boundary="0000000000008f299b06054e0339"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 09:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187628

--0000000000008f299b06054e0339
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FYI: one of LGE proprietary components triggers ICE with this applied, I'll
try to find minimal reproducer later, this is just for other people who
might hit the same:

error: unrecognizable insn:
 2923 | }
      | ^
(insn 416 286 290 17 (parallel [
            (set (mem/c:SI (plus:DI (reg/f:DI 29 x29)
                        (const_int -260 [0xfffffffffffffefc])) [1
redacted.pixel_format+0 S4 A32])
                (const_int 0 [0]))
            (set (mem/c:SI (plus:DI (reg/f:DI 29 x29)
                        (const_int -256 [0xffffffffffffff00])) [1
redacted.pixel_value+0 S4 A128])
                (reg/v:SI 22 x22 [orig:141 color ] [141]))
        ])
"TOPDIR/BUILD/work/redacted/redacted/redacted/git/redacted.c":2903:45 -1
     (expr_list:REG_DEAD (reg/v:SI 22 x22 [orig:141 color ] [141])
        (nil)))
during RTL pass: cprop_hardreg
TOPDIR/BUILD/work/redacted/redacted/redacted/git/redacted.c:2923:1:
internal compiler error: in extract_insn, at recog.cc:2791
0x191624a internal_error(char const*, ...)
???:0
0x6bee26 fancy_abort(char const*, int, char const*)
???:0
0x697469 _fatal_insn(char const*, rtx_def const*, char const*, int, char
const*)
???:0
0x697485 _fatal_insn_not_found(rtx_def const*, char const*, int, char
const*)
???:0
0xbef198 extract_constrain_insn(rtx_insn*)
???:0

On Tue, Sep 12, 2023 at 7:24=E2=80=AFPM Ross Burton <ross.burton@arm.com> w=
rote:

> From: Ross Burton <ross.burton@arm.com>
>
> This series of patches fixes deficiencies in GCC's -fstack-protector
> implementation for AArch64 when using dynamically allocated stack space.
> This is CVE-2023-4039.  See:
>
>
> https://developer.arm.com/Arm%20Security%20Center/GCC%20Stack%20Protector=
%20Vulnerability%20AArch64
>
> https://github.com/metaredteam/external-disclosures/security/advisories/G=
HSA-x7ch-h5rf-w2mf
>
> for more details.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/gcc/gcc-12.3.inc        |    1 +
>  .../gcc/gcc/CVE-2023-4039.patch               | 3093 +++++++++++++++++
>  2 files changed, 3094 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc/CVE-2023-4039.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-12.3.inc
> b/meta/recipes-devtools/gcc/gcc-12.3.inc
> index 4ec03f925c8..5896f26e1af 100644
> --- a/meta/recipes-devtools/gcc/gcc-12.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-12.3.inc
> @@ -63,6 +63,7 @@ SRC_URI =3D "${BASEURI} \
>             file://0026-rust-recursion-limit.patch \
>             file://prefix-map-realpath.patch \
>             file://hardcoded-paths.patch \
> +           file://CVE-2023-4039.patch \
>  "
>  SRC_URI[sha256sum] =3D
> "949a5d4f99e786421a93b532b22ffab5578de7321369975b91aec97adfda8c3b"
>
> diff --git a/meta/recipes-devtools/gcc/gcc/CVE-2023-4039.patch
> b/meta/recipes-devtools/gcc/gcc/CVE-2023-4039.patch
> new file mode 100644
> index 00000000000..8cb52849cd3
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/CVE-2023-4039.patch
> @@ -0,0 +1,3093 @@
> +From: Richard Sandiford <richard.sandiford@arm.com>
> +Subject: [PATCH 00/19] aarch64: Fix -fstack-protector issue
> +Date: Tue, 12 Sep 2023 16:25:10 +0100
> +
> +This series of patches fixes deficiencies in GCC's -fstack-protector
> +implementation for AArch64 when using dynamically allocated stack space.
> +This is CVE-2023-4039.  See:
> +
> +
> https://developer.arm.com/Arm%20Security%20Center/GCC%20Stack%20Protector=
%20Vulnerability%20AArch64
> +
> https://github.com/metaredteam/external-disclosures/security/advisories/G=
HSA-x7ch-h5rf-w2mf
> +
> +for more details.
> +
> +The fix is to put the saved registers above the locals area when
> +-fstack-protector is used.
> +
> +The series also fixes a stack-clash problem that I found while working
> +on the CVE.  In unpatched sources, the stack-clash problem would only
> +trigger for unrealistic numbers of arguments (8K 64-bit arguments, or an
> +equivalent).  But it would be a more significant issue with the new
> +-fstack-protector frame layout.  It's therefore important that both
> +problems are fixed together.
> +
> +Some reorganisation of the code seemed necessary to fix the problems in =
a
> +cleanish way.  The series is therefore quite long, but only a handful of
> +patches should have any effect on code generation.
> +
> +See the individual patches for a detailed description.
> +
> +Tested on aarch64-linux-gnu. Pushed to trunk and to all active branches.
> +I've also pushed backports to GCC 7+ to vendors/ARM/heads/CVE-2023-4039.
> +
> +CVE: CVE-2023-4039
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +
> +From 62fbb215cc817e9f2c1ca80282a64f4ee30806bc Mon Sep 17 00:00:00 2001
> +From: Richard Sandiford <richard.sandiford@arm.com>
> +Date: Tue, 12 Sep 2023 16:08:48 +0100
> +Subject: [PATCH 01/19] aarch64: Use local frame vars in shrink-wrapping
> code
> +
> +aarch64_layout_frame uses a shorthand for referring to
> +cfun->machine->frame:
> +
> +  aarch64_frame &frame =3D cfun->machine->frame;
> +
> +This patch does the same for some other heavy users of the structure.
> +No functional change intended.
> +
> +gcc/
> +       * config/aarch64/aarch64.cc (aarch64_save_callee_saves): Use
> +       a local shorthand for cfun->machine->frame.
> +       (aarch64_restore_callee_saves, aarch64_get_separate_components):
> +       (aarch64_process_components): Likewise.
> +       (aarch64_allocate_and_probe_stack_space): Likewise.
> +       (aarch64_expand_prologue, aarch64_expand_epilogue): Likewise.
> +       (aarch64_layout_frame): Use existing shorthand for one more case.
> +---
> + gcc/config/aarch64/aarch64.cc | 123 ++++++++++++++++++----------------
> + 1 file changed, 64 insertions(+), 59 deletions(-)
> +
> +diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> +index 226dc9dffd4..ae42ffdedbe 100644
> +--- a/gcc/config/aarch64/aarch64.cc
> ++++ b/gcc/config/aarch64/aarch64.cc
> +@@ -8351,7 +8351,7 @@ aarch64_layout_frame (void)
> +   frame.is_scs_enabled
> +     =3D (!crtl->calls_eh_return
> +        && sanitize_flags_p (SANITIZE_SHADOW_CALL_STACK)
> +-       && known_ge (cfun->machine->frame.reg_offset[LR_REGNUM], 0));
> ++       && known_ge (frame.reg_offset[LR_REGNUM], 0));
> +
> +   /* When shadow call stack is enabled, the scs_pop in the epilogue wil=
l
> +      restore x30, and we don't need to pop x30 again in the traditional
> +@@ -8763,6 +8763,7 @@ aarch64_save_callee_saves (poly_int64 start_offset=
,
> +                          unsigned start, unsigned limit, bool skip_wb,
> +                          bool hard_fp_valid_p)
> + {
> ++  aarch64_frame &frame =3D cfun->machine->frame;
> +   rtx_insn *insn;
> +   unsigned regno;
> +   unsigned regno2;
> +@@ -8777,8 +8778,8 @@ aarch64_save_callee_saves (poly_int64 start_offset=
,
> +       bool frame_related_p =3D aarch64_emit_cfi_for_reg_p (regno);
> +
> +       if (skip_wb
> +-        && (regno =3D=3D cfun->machine->frame.wb_push_candidate1
> +-            || regno =3D=3D cfun->machine->frame.wb_push_candidate2))
> ++        && (regno =3D=3D frame.wb_push_candidate1
> ++            || regno =3D=3D frame.wb_push_candidate2))
> +       continue;
> +
> +       if (cfun->machine->reg_is_wrapped_separately[regno])
> +@@ -8786,7 +8787,7 @@ aarch64_save_callee_saves (poly_int64 start_offset=
,
> +
> +       machine_mode mode =3D aarch64_reg_save_mode (regno);
> +       reg =3D gen_rtx_REG (mode, regno);
> +-      offset =3D start_offset + cfun->machine->frame.reg_offset[regno];
> ++      offset =3D start_offset + frame.reg_offset[regno];
> +       rtx base_rtx =3D stack_pointer_rtx;
> +       poly_int64 sp_offset =3D offset;
> +
> +@@ -8799,7 +8800,7 @@ aarch64_save_callee_saves (poly_int64 start_offset=
,
> +       {
> +         gcc_assert (known_eq (start_offset, 0));
> +         poly_int64 fp_offset
> +-          =3D cfun->machine->frame.below_hard_fp_saved_regs_size;
> ++          =3D frame.below_hard_fp_saved_regs_size;
> +         if (hard_fp_valid_p)
> +           base_rtx =3D hard_frame_pointer_rtx;
> +         else
> +@@ -8821,8 +8822,7 @@ aarch64_save_callee_saves (poly_int64 start_offset=
,
> +         && (regno2 =3D aarch64_next_callee_save (regno + 1, limit)) <=
=3D
> limit
> +         && !cfun->machine->reg_is_wrapped_separately[regno2]
> +         && known_eq (GET_MODE_SIZE (mode),
> +-                     cfun->machine->frame.reg_offset[regno2]
> +-                     - cfun->machine->frame.reg_offset[regno]))
> ++                     frame.reg_offset[regno2] - frame.reg_offset[regno]=
))
> +       {
> +         rtx reg2 =3D gen_rtx_REG (mode, regno2);
> +         rtx mem2;
> +@@ -8872,6 +8872,7 @@ static void
> + aarch64_restore_callee_saves (poly_int64 start_offset, unsigned start,
> +                             unsigned limit, bool skip_wb, rtx *cfi_ops)
> + {
> ++  aarch64_frame &frame =3D cfun->machine->frame;
> +   unsigned regno;
> +   unsigned regno2;
> +   poly_int64 offset;
> +@@ -8888,13 +8889,13 @@ aarch64_restore_callee_saves (poly_int64
> start_offset, unsigned start,
> +       rtx reg, mem;
> +
> +       if (skip_wb
> +-        && (regno =3D=3D cfun->machine->frame.wb_pop_candidate1
> +-            || regno =3D=3D cfun->machine->frame.wb_pop_candidate2))
> ++        && (regno =3D=3D frame.wb_pop_candidate1
> ++            || regno =3D=3D frame.wb_pop_candidate2))
> +       continue;
> +
> +       machine_mode mode =3D aarch64_reg_save_mode (regno);
> +       reg =3D gen_rtx_REG (mode, regno);
> +-      offset =3D start_offset + cfun->machine->frame.reg_offset[regno];
> ++      offset =3D start_offset + frame.reg_offset[regno];
> +       rtx base_rtx =3D stack_pointer_rtx;
> +       if (mode =3D=3D VNx2DImode && BYTES_BIG_ENDIAN)
> +       aarch64_adjust_sve_callee_save_base (mode, base_rtx, anchor_reg,
> +@@ -8905,8 +8906,7 @@ aarch64_restore_callee_saves (poly_int64
> start_offset, unsigned start,
> +         && (regno2 =3D aarch64_next_callee_save (regno + 1, limit)) <=
=3D
> limit
> +         && !cfun->machine->reg_is_wrapped_separately[regno2]
> +         && known_eq (GET_MODE_SIZE (mode),
> +-                     cfun->machine->frame.reg_offset[regno2]
> +-                     - cfun->machine->frame.reg_offset[regno]))
> ++                     frame.reg_offset[regno2] - frame.reg_offset[regno]=
))
> +       {
> +         rtx reg2 =3D gen_rtx_REG (mode, regno2);
> +         rtx mem2;
> +@@ -9011,6 +9011,7 @@ offset_12bit_unsigned_scaled_p (machine_mode mode,
> poly_int64 offset)
> + static sbitmap
> + aarch64_get_separate_components (void)
> + {
> ++  aarch64_frame &frame =3D cfun->machine->frame;
> +   sbitmap components =3D sbitmap_alloc (LAST_SAVED_REGNUM + 1);
> +   bitmap_clear (components);
> +
> +@@ -9027,18 +9028,18 @@ aarch64_get_separate_components (void)
> +       if (mode =3D=3D VNx2DImode && BYTES_BIG_ENDIAN)
> +         continue;
> +
> +-      poly_int64 offset =3D cfun->machine->frame.reg_offset[regno];
> ++      poly_int64 offset =3D frame.reg_offset[regno];
> +
> +       /* If the register is saved in the first SVE save slot, we use
> +          it as a stack probe for -fstack-clash-protection.  */
> +       if (flag_stack_clash_protection
> +-          && maybe_ne
> (cfun->machine->frame.below_hard_fp_saved_regs_size, 0)
> ++          && maybe_ne (frame.below_hard_fp_saved_regs_size, 0)
> +           && known_eq (offset, 0))
> +         continue;
> +
> +       /* Get the offset relative to the register we'll use.  */
> +       if (frame_pointer_needed)
> +-        offset -=3D cfun->machine->frame.below_hard_fp_saved_regs_size;
> ++        offset -=3D frame.below_hard_fp_saved_regs_size;
> +       else
> +         offset +=3D crtl->outgoing_args_size;
> +
> +@@ -9057,11 +9058,11 @@ aarch64_get_separate_components (void)
> +   /* If the spare predicate register used by big-endian SVE code
> +      is call-preserved, it must be saved in the main prologue
> +      before any saves that use it.  */
> +-  if (cfun->machine->frame.spare_pred_reg !=3D INVALID_REGNUM)
> +-    bitmap_clear_bit (components, cfun->machine->frame.spare_pred_reg);
> ++  if (frame.spare_pred_reg !=3D INVALID_REGNUM)
> ++    bitmap_clear_bit (components, frame.spare_pred_reg);
> +
> +-  unsigned reg1 =3D cfun->machine->frame.wb_push_candidate1;
> +-  unsigned reg2 =3D cfun->machine->frame.wb_push_candidate2;
> ++  unsigned reg1 =3D frame.wb_push_candidate1;
> ++  unsigned reg2 =3D frame.wb_push_candidate2;
> +   /* If registers have been chosen to be stored/restored with
> +      writeback don't interfere with them to avoid having to output
> explicit
> +      stack adjustment instructions.  */
> +@@ -9170,6 +9171,7 @@ aarch64_get_next_set_bit (sbitmap bmp, unsigned in=
t
> start)
> + static void
> + aarch64_process_components (sbitmap components, bool prologue_p)
> + {
> ++  aarch64_frame &frame =3D cfun->machine->frame;
> +   rtx ptr_reg =3D gen_rtx_REG (Pmode, frame_pointer_needed
> +                            ? HARD_FRAME_POINTER_REGNUM
> +                            : STACK_POINTER_REGNUM);
> +@@ -9184,9 +9186,9 @@ aarch64_process_components (sbitmap components,
> bool prologue_p)
> +       machine_mode mode =3D aarch64_reg_save_mode (regno);
> +
> +       rtx reg =3D gen_rtx_REG (mode, regno);
> +-      poly_int64 offset =3D cfun->machine->frame.reg_offset[regno];
> ++      poly_int64 offset =3D frame.reg_offset[regno];
> +       if (frame_pointer_needed)
> +-      offset -=3D cfun->machine->frame.below_hard_fp_saved_regs_size;
> ++      offset -=3D frame.below_hard_fp_saved_regs_size;
> +       else
> +       offset +=3D crtl->outgoing_args_size;
> +
> +@@ -9211,14 +9213,14 @@ aarch64_process_components (sbitmap components,
> bool prologue_p)
> +         break;
> +       }
> +
> +-      poly_int64 offset2 =3D cfun->machine->frame.reg_offset[regno2];
> ++      poly_int64 offset2 =3D frame.reg_offset[regno2];
> +       /* The next register is not of the same class or its offset is no=
t
> +        mergeable with the current one into a pair.  */
> +       if (aarch64_sve_mode_p (mode)
> +         || !satisfies_constraint_Ump (mem)
> +         || GP_REGNUM_P (regno) !=3D GP_REGNUM_P (regno2)
> +         || (crtl->abi->id () =3D=3D ARM_PCS_SIMD && FP_REGNUM_P (regno)=
)
> +-        || maybe_ne ((offset2 - cfun->machine->frame.reg_offset[regno])=
,
> ++        || maybe_ne ((offset2 - frame.reg_offset[regno]),
> +                      GET_MODE_SIZE (mode)))
> +       {
> +         insn =3D emit_insn (set);
> +@@ -9240,7 +9242,7 @@ aarch64_process_components (sbitmap components,
> bool prologue_p)
> +       /* REGNO2 can be saved/restored in a pair with REGNO.  */
> +       rtx reg2 =3D gen_rtx_REG (mode, regno2);
> +       if (frame_pointer_needed)
> +-      offset2 -=3D cfun->machine->frame.below_hard_fp_saved_regs_size;
> ++      offset2 -=3D frame.below_hard_fp_saved_regs_size;
> +       else
> +       offset2 +=3D crtl->outgoing_args_size;
> +       rtx addr2 =3D plus_constant (Pmode, ptr_reg, offset2);
> +@@ -9335,6 +9337,7 @@ aarch64_allocate_and_probe_stack_space (rtx temp1,
> rtx temp2,
> +                                       bool frame_related_p,
> +                                       bool final_adjustment_p)
> + {
> ++  aarch64_frame &frame =3D cfun->machine->frame;
> +   HOST_WIDE_INT guard_size
> +     =3D 1 << param_stack_clash_protection_guard_size;
> +   HOST_WIDE_INT guard_used_by_caller =3D STACK_CLASH_CALLER_GUARD;
> +@@ -9355,25 +9358,25 @@ aarch64_allocate_and_probe_stack_space (rtx
> temp1, rtx temp2,
> +        register as a probe.  We can't assume that LR was saved at
> position 0
> +        though, so treat any space below it as unprobed.  */
> +   if (final_adjustment_p
> +-      && known_eq (cfun->machine->frame.below_hard_fp_saved_regs_size,
> 0))
> ++      && known_eq (frame.below_hard_fp_saved_regs_size, 0))
> +     {
> +-      poly_int64 lr_offset =3D cfun->machine->frame.reg_offset[LR_REGNU=
M];
> ++      poly_int64 lr_offset =3D frame.reg_offset[LR_REGNUM];
> +       if (known_ge (lr_offset, 0))
> +       min_probe_threshold -=3D lr_offset.to_constant ();
> +       else
> +       gcc_assert (!flag_stack_clash_protection || known_eq (poly_size,
> 0));
> +     }
> +
> +-  poly_int64 frame_size =3D cfun->machine->frame.frame_size;
> ++  poly_int64 frame_size =3D frame.frame_size;
> +
> +   /* We should always have a positive probe threshold.  */
> +   gcc_assert (min_probe_threshold > 0);
> +
> +   if (flag_stack_clash_protection && !final_adjustment_p)
> +     {
> +-      poly_int64 initial_adjust =3D cfun->machine->frame.initial_adjust=
;
> +-      poly_int64 sve_callee_adjust =3D
> cfun->machine->frame.sve_callee_adjust;
> +-      poly_int64 final_adjust =3D cfun->machine->frame.final_adjust;
> ++      poly_int64 initial_adjust =3D frame.initial_adjust;
> ++      poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
> ++      poly_int64 final_adjust =3D frame.final_adjust;
> +
> +       if (known_eq (frame_size, 0))
> +       {
> +@@ -9662,17 +9665,18 @@ aarch64_epilogue_uses (int regno)
> + void
> + aarch64_expand_prologue (void)
> + {
> +-  poly_int64 frame_size =3D cfun->machine->frame.frame_size;
> +-  poly_int64 initial_adjust =3D cfun->machine->frame.initial_adjust;
> +-  HOST_WIDE_INT callee_adjust =3D cfun->machine->frame.callee_adjust;
> +-  poly_int64 final_adjust =3D cfun->machine->frame.final_adjust;
> +-  poly_int64 callee_offset =3D cfun->machine->frame.callee_offset;
> +-  poly_int64 sve_callee_adjust =3D cfun->machine->frame.sve_callee_adju=
st;
> ++  aarch64_frame &frame =3D cfun->machine->frame;
> ++  poly_int64 frame_size =3D frame.frame_size;
> ++  poly_int64 initial_adjust =3D frame.initial_adjust;
> ++  HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;
> ++  poly_int64 final_adjust =3D frame.final_adjust;
> ++  poly_int64 callee_offset =3D frame.callee_offset;
> ++  poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
> +   poly_int64 below_hard_fp_saved_regs_size
> +-    =3D cfun->machine->frame.below_hard_fp_saved_regs_size;
> +-  unsigned reg1 =3D cfun->machine->frame.wb_push_candidate1;
> +-  unsigned reg2 =3D cfun->machine->frame.wb_push_candidate2;
> +-  bool emit_frame_chain =3D cfun->machine->frame.emit_frame_chain;
> ++    =3D frame.below_hard_fp_saved_regs_size;
> ++  unsigned reg1 =3D frame.wb_push_candidate1;
> ++  unsigned reg2 =3D frame.wb_push_candidate2;
> ++  bool emit_frame_chain =3D frame.emit_frame_chain;
> +   rtx_insn *insn;
> +
> +   if (flag_stack_clash_protection && known_eq (callee_adjust, 0))
> +@@ -9703,7 +9707,7 @@ aarch64_expand_prologue (void)
> +     }
> +
> +   /* Push return address to shadow call stack.  */
> +-  if (cfun->machine->frame.is_scs_enabled)
> ++  if (frame.is_scs_enabled)
> +     emit_insn (gen_scs_push ());
> +
> +   if (flag_stack_usage_info)
> +@@ -9742,7 +9746,7 @@ aarch64_expand_prologue (void)
> +
> +   /* The offset of the frame chain record (if any) from the current SP.
> */
> +   poly_int64 chain_offset =3D (initial_adjust + callee_adjust
> +-                           - cfun->machine->frame.hard_fp_offset);
> ++                           - frame.hard_fp_offset);
> +   gcc_assert (known_ge (chain_offset, 0));
> +
> +   /* The offset of the bottom of the save area from the current SP.  */
> +@@ -9845,16 +9849,17 @@ aarch64_use_return_insn_p (void)
> + void
> + aarch64_expand_epilogue (bool for_sibcall)
> + {
> +-  poly_int64 initial_adjust =3D cfun->machine->frame.initial_adjust;
> +-  HOST_WIDE_INT callee_adjust =3D cfun->machine->frame.callee_adjust;
> +-  poly_int64 final_adjust =3D cfun->machine->frame.final_adjust;
> +-  poly_int64 callee_offset =3D cfun->machine->frame.callee_offset;
> +-  poly_int64 sve_callee_adjust =3D cfun->machine->frame.sve_callee_adju=
st;
> ++  aarch64_frame &frame =3D cfun->machine->frame;
> ++  poly_int64 initial_adjust =3D frame.initial_adjust;
> ++  HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;
> ++  poly_int64 final_adjust =3D frame.final_adjust;
> ++  poly_int64 callee_offset =3D frame.callee_offset;
> ++  poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
> +   poly_int64 below_hard_fp_saved_regs_size
> +-    =3D cfun->machine->frame.below_hard_fp_saved_regs_size;
> +-  unsigned reg1 =3D cfun->machine->frame.wb_pop_candidate1;
> +-  unsigned reg2 =3D cfun->machine->frame.wb_pop_candidate2;
> +-  unsigned int last_gpr =3D (cfun->machine->frame.is_scs_enabled
> ++    =3D frame.below_hard_fp_saved_regs_size;
> ++  unsigned reg1 =3D frame.wb_pop_candidate1;
> ++  unsigned reg2 =3D frame.wb_pop_candidate2;
> ++  unsigned int last_gpr =3D (frame.is_scs_enabled
> +                          ? R29_REGNUM : R30_REGNUM);
> +   rtx cfi_ops =3D NULL;
> +   rtx_insn *insn;
> +@@ -9888,7 +9893,7 @@ aarch64_expand_epilogue (bool for_sibcall)
> +   /* We need to add memory barrier to prevent read from deallocated
> stack.  */
> +   bool need_barrier_p
> +     =3D maybe_ne (get_frame_size ()
> +-              + cfun->machine->frame.saved_varargs_size, 0);
> ++              + frame.saved_varargs_size, 0);
> +
> +   /* Emit a barrier to prevent loads from a deallocated stack.  */
> +   if (maybe_gt (final_adjust, crtl->outgoing_args_size)
> +@@ -9969,7 +9974,7 @@ aarch64_expand_epilogue (bool for_sibcall)
> +     }
> +
> +   /* Pop return address from shadow call stack.  */
> +-  if (cfun->machine->frame.is_scs_enabled)
> ++  if (frame.is_scs_enabled)
> +     {
> +       machine_mode mode =3D aarch64_reg_save_mode (R30_REGNUM);
> +       rtx reg =3D gen_rtx_REG (mode, R30_REGNUM);
> +@@ -12564,24 +12569,24 @@ aarch64_can_eliminate (const int from
> ATTRIBUTE_UNUSED, const int to)
> + poly_int64
> + aarch64_initial_elimination_offset (unsigned from, unsigned to)
> + {
> ++  aarch64_frame &frame =3D cfun->machine->frame;
> ++
> +   if (to =3D=3D HARD_FRAME_POINTER_REGNUM)
> +     {
> +       if (from =3D=3D ARG_POINTER_REGNUM)
> +-      return cfun->machine->frame.hard_fp_offset;
> ++      return frame.hard_fp_offset;
> +
> +       if (from =3D=3D FRAME_POINTER_REGNUM)
> +-      return cfun->machine->frame.hard_fp_offset
> +-             - cfun->machine->frame.locals_offset;
> ++      return frame.hard_fp_offset - frame.locals_offset;
> +     }
> +
> +   if (to =3D=3D STACK_POINTER_REGNUM)
> +     {
> +       if (from =3D=3D FRAME_POINTER_REGNUM)
> +-        return cfun->machine->frame.frame_size
> +-               - cfun->machine->frame.locals_offset;
> ++      return frame.frame_size - frame.locals_offset;
> +     }
> +
> +-  return cfun->machine->frame.frame_size;
> ++  return frame.frame_size;
> + }
> +
> +
> +--
> +2.34.1
> +
> +
> +From 12a8889de169f892d2e927584c00d20b8b7e456f Mon Sep 17 00:00:00 2001
> +From: Richard Sandiford <richard.sandiford@arm.com>
> +Date: Tue, 12 Sep 2023 16:08:49 +0100
> +Subject: [PATCH 02/19] aarch64: Avoid a use of callee_offset
> +
> +When we emit the frame chain, i.e. when we reach Here in this statement
> +of aarch64_expand_prologue:
> +
> +  if (emit_frame_chain)
> +    {
> +      // Here
> +      ...
> +    }
> +
> +the stack is in one of two states:
> +
> +- We've allocated up to the frame chain, but no more.
> +
> +- We've allocated the whole frame, and the frame chain is within easy
> +  reach of the new SP.
> +
> +The offset of the frame chain from the current SP is available
> +in aarch64_frame as callee_offset.  It is also available as the
> +chain_offset local variable, where the latter is calculated from other
> +data.  (However, chain_offset is not always equal to callee_offset when
> +!emit_frame_chain, so chain_offset isn't redundant.)
> +
> +In c600df9a4060da3c6121ff4d0b93f179eafd69d1 I switched to using
> +chain_offset for the initialisation of the hard frame pointer:
> +
> +       aarch64_add_offset (Pmode, hard_frame_pointer_rtx,
> +-                         stack_pointer_rtx, callee_offset,
> ++                         stack_pointer_rtx, chain_offset,
> +                          tmp1_rtx, tmp0_rtx, frame_pointer_needed);
> +
> +But the later REG_CFA_ADJUST_CFA handling still used callee_offset.
> +
> +I think the difference is harmless, but it's more logical for the
> +CFA note to be in sync, and it's more convenient for later patches
> +if it uses chain_offset.
> +
> +gcc/
> +       * config/aarch64/aarch64.cc (aarch64_expand_prologue): Use
> +       chain_offset rather than callee_offset.
> +---
> + gcc/config/aarch64/aarch64.cc | 4 +---
> + 1 file changed, 1 insertion(+), 3 deletions(-)
> +
> +diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> +index ae42ffdedbe..79253322fd7 100644
> +--- a/gcc/config/aarch64/aarch64.cc
> ++++ b/gcc/config/aarch64/aarch64.cc
> +@@ -9670,7 +9670,6 @@ aarch64_expand_prologue (void)
> +   poly_int64 initial_adjust =3D frame.initial_adjust;
> +   HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;
> +   poly_int64 final_adjust =3D frame.final_adjust;
> +-  poly_int64 callee_offset =3D frame.callee_offset;
> +   poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
> +   poly_int64 below_hard_fp_saved_regs_size
> +     =3D frame.below_hard_fp_saved_regs_size;
> +@@ -9783,8 +9782,7 @@ aarch64_expand_prologue (void)
> +            implicit.  */
> +         if (!find_reg_note (insn, REG_CFA_ADJUST_CFA, NULL_RTX))
> +           {
> +-            rtx src =3D plus_constant (Pmode, stack_pointer_rtx,
> +-                                     callee_offset);
> ++            rtx src =3D plus_constant (Pmode, stack_pointer_rtx,
> chain_offset);
> +             add_reg_note (insn, REG_CFA_ADJUST_CFA,
> +                           gen_rtx_SET (hard_frame_pointer_rtx, src));
> +           }
> +--
> +2.34.1
> +
> +
> +From 03d5e89e7f3be53fd7142556e8e0a2774c653dca Mon Sep 17 00:00:00 2001
> +From: Richard Sandiford <richard.sandiford@arm.com>
> +Date: Tue, 12 Sep 2023 16:08:49 +0100
> +Subject: [PATCH 03/19] aarch64: Explicitly handle frames with no saved
> + registers
> +
> +If a frame has no saved registers, it can be allocated in one go.
> +There is no need to treat the areas below and above the saved
> +registers as separate.
> +
> +And if we allocate the frame in one go, it should be allocated
> +as the initial_adjust rather than the final_adjust.  This allows the
> +frame size to grow to guard_size - guard_used_by_caller before a stack
> +probe is needed.  (A frame with no register saves is necessarily a
> +leaf frame.)
> +
> +This is a no-op as thing stand, since a leaf function will have
> +no outgoing arguments, and so all the frame will be above where
> +the saved registers normally go.
> +
> +gcc/
> +       * config/aarch64/aarch64.cc (aarch64_layout_frame): Explicitly
> +       allocate the frame in one go if there are no saved registers.
> +---
> + gcc/config/aarch64/aarch64.cc | 8 +++++---
> + 1 file changed, 5 insertions(+), 3 deletions(-)
> +
> +diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> +index 79253322fd7..e1f21230c15 100644
> +--- a/gcc/config/aarch64/aarch64.cc
> ++++ b/gcc/config/aarch64/aarch64.cc
> +@@ -8378,9 +8378,11 @@ aarch64_layout_frame (void)
> +
> +   HOST_WIDE_INT const_size, const_outgoing_args_size, const_fp_offset;
> +   HOST_WIDE_INT const_saved_regs_size;
> +-  if (frame.frame_size.is_constant (&const_size)
> +-      && const_size < max_push_offset
> +-      && known_eq (frame.hard_fp_offset, const_size))
> ++  if (known_eq (frame.saved_regs_size, 0))
> ++    frame.initial_adjust =3D frame.frame_size;
> ++  else if (frame.frame_size.is_constant (&const_size)
> ++         && const_size < max_push_offset
> ++         && known_eq (frame.hard_fp_offset, const_size))
> +     {
> +       /* Simple, small frame with no outgoing arguments:
> +
> +--
> +2.34.1
> +
> +
> +From 49c2eb7616756c323b7f6b18d8616ec945eb1263 Mon Sep 17 00:00:00 2001
> +From: Richard Sandiford <richard.sandiford@arm.com>
> +Date: Tue, 12 Sep 2023 16:08:49 +0100
> +Subject: [PATCH 04/19] aarch64: Add bytes_below_saved_regs to frame info
> +
> +The frame layout code currently hard-codes the assumption that
> +the number of bytes below the saved registers is equal to the
> +size of the outgoing arguments.  This patch abstracts that
> +value into a new field of aarch64_frame.
> +
> +gcc/
> +       * config/aarch64/aarch64.h
> (aarch64_frame::bytes_below_saved_regs): New
> +       field.
> +       * config/aarch64/aarch64.cc (aarch64_layout_frame): Initialize it=
,
> +       and use it instead of crtl->outgoing_args_size.
> +       (aarch64_get_separate_components): Use bytes_below_saved_regs
> instead
> +       of outgoing_args_size.
> +       (aarch64_process_components): Likewise.
> +---
> + gcc/config/aarch64/aarch64.cc | 71 ++++++++++++++++++-----------------
> + gcc/config/aarch64/aarch64.h  |  5 +++
> + 2 files changed, 41 insertions(+), 35 deletions(-)
> +
> +diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> +index e1f21230c15..94e1b686584 100644
> +--- a/gcc/config/aarch64/aarch64.cc
> ++++ b/gcc/config/aarch64/aarch64.cc
> +@@ -8217,6 +8217,8 @@ aarch64_layout_frame (void)
> +   gcc_assert (crtl->is_leaf
> +             || maybe_ne (frame.reg_offset[R30_REGNUM],
> SLOT_NOT_REQUIRED));
> +
> ++  frame.bytes_below_saved_regs =3D crtl->outgoing_args_size;
> ++
> +   /* Now assign stack slots for the registers.  Start with the predicat=
e
> +      registers, since predicate LDR and STR have a relatively small
> +      offset range.  These saves happen below the hard frame pointer.  *=
/
> +@@ -8321,18 +8323,18 @@ aarch64_layout_frame (void)
> +
> +   poly_int64 varargs_and_saved_regs_size =3D offset +
> frame.saved_varargs_size;
> +
> +-  poly_int64 above_outgoing_args
> ++  poly_int64 saved_regs_and_above
> +     =3D aligned_upper_bound (varargs_and_saved_regs_size
> +                          + get_frame_size (),
> +                          STACK_BOUNDARY / BITS_PER_UNIT);
> +
> +   frame.hard_fp_offset
> +-    =3D above_outgoing_args - frame.below_hard_fp_saved_regs_size;
> ++    =3D saved_regs_and_above - frame.below_hard_fp_saved_regs_size;
> +
> +   /* Both these values are already aligned.  */
> +-  gcc_assert (multiple_p (crtl->outgoing_args_size,
> ++  gcc_assert (multiple_p (frame.bytes_below_saved_regs,
> +                         STACK_BOUNDARY / BITS_PER_UNIT));
> +-  frame.frame_size =3D above_outgoing_args + crtl->outgoing_args_size;
> ++  frame.frame_size =3D saved_regs_and_above + frame.bytes_below_saved_r=
egs;
> +
> +   frame.locals_offset =3D frame.saved_varargs_size;
> +
> +@@ -8376,7 +8378,7 @@ aarch64_layout_frame (void)
> +   else if (frame.wb_pop_candidate1 !=3D INVALID_REGNUM)
> +     max_push_offset =3D 256;
> +
> +-  HOST_WIDE_INT const_size, const_outgoing_args_size, const_fp_offset;
> ++  HOST_WIDE_INT const_size, const_below_saved_regs, const_fp_offset;
> +   HOST_WIDE_INT const_saved_regs_size;
> +   if (known_eq (frame.saved_regs_size, 0))
> +     frame.initial_adjust =3D frame.frame_size;
> +@@ -8384,31 +8386,31 @@ aarch64_layout_frame (void)
> +          && const_size < max_push_offset
> +          && known_eq (frame.hard_fp_offset, const_size))
> +     {
> +-      /* Simple, small frame with no outgoing arguments:
> ++      /* Simple, small frame with no data below the saved registers.
> +
> +        stp reg1, reg2, [sp, -frame_size]!
> +        stp reg3, reg4, [sp, 16]  */
> +       frame.callee_adjust =3D const_size;
> +     }
> +-  else if (crtl->outgoing_args_size.is_constant
> (&const_outgoing_args_size)
> ++  else if (frame.bytes_below_saved_regs.is_constant
> (&const_below_saved_regs)
> +          && frame.saved_regs_size.is_constant (&const_saved_regs_size)
> +-         && const_outgoing_args_size + const_saved_regs_size < 512
> +-         /* We could handle this case even with outgoing args, provided
> +-            that the number of args left us with valid offsets for all
> +-            predicate and vector save slots.  It's such a rare case tha=
t
> +-            it hardly seems worth the effort though.  */
> +-         && (!saves_below_hard_fp_p || const_outgoing_args_size =3D=3D =
0)
> ++         && const_below_saved_regs + const_saved_regs_size < 512
> ++         /* We could handle this case even with data below the saved
> ++            registers, provided that that data left us with valid offse=
ts
> ++            for all predicate and vector save slots.  It's such a rare
> ++            case that it hardly seems worth the effort though.  */
> ++         && (!saves_below_hard_fp_p || const_below_saved_regs =3D=3D 0)
> +          && !(cfun->calls_alloca
> +               && frame.hard_fp_offset.is_constant (&const_fp_offset)
> +               && const_fp_offset < max_push_offset))
> +     {
> +-      /* Frame with small outgoing arguments:
> ++      /* Frame with small area below the saved registers:
> +
> +        sub sp, sp, frame_size
> +-       stp reg1, reg2, [sp, outgoing_args_size]
> +-       stp reg3, reg4, [sp, outgoing_args_size + 16]  */
> ++       stp reg1, reg2, [sp, bytes_below_saved_regs]
> ++       stp reg3, reg4, [sp, bytes_below_saved_regs + 16]  */
> +       frame.initial_adjust =3D frame.frame_size;
> +-      frame.callee_offset =3D const_outgoing_args_size;
> ++      frame.callee_offset =3D const_below_saved_regs;
> +     }
> +   else if (saves_below_hard_fp_p
> +          && known_eq (frame.saved_regs_size,
> +@@ -8418,30 +8420,29 @@ aarch64_layout_frame (void)
> +
> +        sub sp, sp, hard_fp_offset + below_hard_fp_saved_regs_size
> +        save SVE registers relative to SP
> +-       sub sp, sp, outgoing_args_size  */
> ++       sub sp, sp, bytes_below_saved_regs  */
> +       frame.initial_adjust =3D (frame.hard_fp_offset
> +                             + frame.below_hard_fp_saved_regs_size);
> +-      frame.final_adjust =3D crtl->outgoing_args_size;
> ++      frame.final_adjust =3D frame.bytes_below_saved_regs;
> +     }
> +   else if (frame.hard_fp_offset.is_constant (&const_fp_offset)
> +          && const_fp_offset < max_push_offset)
> +     {
> +-      /* Frame with large outgoing arguments or SVE saves, but with
> +-       a small local area:
> ++      /* Frame with large area below the saved registers, or with SVE
> saves,
> ++       but with a small area above:
> +
> +        stp reg1, reg2, [sp, -hard_fp_offset]!
> +        stp reg3, reg4, [sp, 16]
> +        [sub sp, sp, below_hard_fp_saved_regs_size]
> +        [save SVE registers relative to SP]
> +-       sub sp, sp, outgoing_args_size  */
> ++       sub sp, sp, bytes_below_saved_regs  */
> +       frame.callee_adjust =3D const_fp_offset;
> +       frame.sve_callee_adjust =3D frame.below_hard_fp_saved_regs_size;
> +-      frame.final_adjust =3D crtl->outgoing_args_size;
> ++      frame.final_adjust =3D frame.bytes_below_saved_regs;
> +     }
> +   else
> +     {
> +-      /* Frame with large local area and outgoing arguments or SVE save=
s,
> +-       using frame pointer:
> ++      /* General case:
> +
> +        sub sp, sp, hard_fp_offset
> +        stp x29, x30, [sp, 0]
> +@@ -8449,10 +8450,10 @@ aarch64_layout_frame (void)
> +        stp reg3, reg4, [sp, 16]
> +        [sub sp, sp, below_hard_fp_saved_regs_size]
> +        [save SVE registers relative to SP]
> +-       sub sp, sp, outgoing_args_size  */
> ++       sub sp, sp, bytes_below_saved_regs  */
> +       frame.initial_adjust =3D frame.hard_fp_offset;
> +       frame.sve_callee_adjust =3D frame.below_hard_fp_saved_regs_size;
> +-      frame.final_adjust =3D crtl->outgoing_args_size;
> ++      frame.final_adjust =3D frame.bytes_below_saved_regs;
> +     }
> +
> +   /* Make sure the individual adjustments add up to the full frame
> size.  */
> +@@ -9043,7 +9044,7 @@ aarch64_get_separate_components (void)
> +       if (frame_pointer_needed)
> +         offset -=3D frame.below_hard_fp_saved_regs_size;
> +       else
> +-        offset +=3D crtl->outgoing_args_size;
> ++        offset +=3D frame.bytes_below_saved_regs;
> +
> +       /* Check that we can access the stack slot of the register with o=
ne
> +          direct load with no adjustments needed.  */
> +@@ -9192,7 +9193,7 @@ aarch64_process_components (sbitmap components,
> bool prologue_p)
> +       if (frame_pointer_needed)
> +       offset -=3D frame.below_hard_fp_saved_regs_size;
> +       else
> +-      offset +=3D crtl->outgoing_args_size;
> ++      offset +=3D frame.bytes_below_saved_regs;
> +
> +       rtx addr =3D plus_constant (Pmode, ptr_reg, offset);
> +       rtx mem =3D gen_frame_mem (mode, addr);
> +@@ -9246,7 +9247,7 @@ aarch64_process_components (sbitmap components,
> bool prologue_p)
> +       if (frame_pointer_needed)
> +       offset2 -=3D frame.below_hard_fp_saved_regs_size;
> +       else
> +-      offset2 +=3D crtl->outgoing_args_size;
> ++      offset2 +=3D frame.bytes_below_saved_regs;
> +       rtx addr2 =3D plus_constant (Pmode, ptr_reg, offset2);
> +       rtx mem2 =3D gen_frame_mem (mode, addr2);
> +       rtx set2 =3D prologue_p ? gen_rtx_SET (mem2, reg2)
> +@@ -9320,10 +9321,10 @@ aarch64_stack_clash_protection_alloca_probe_rang=
e
> (void)
> +    registers.  If POLY_SIZE is not large enough to require a probe this
> function
> +    will only adjust the stack.  When allocating the stack space
> +    FRAME_RELATED_P is then used to indicate if the allocation is frame
> related.
> +-   FINAL_ADJUSTMENT_P indicates whether we are allocating the outgoing
> +-   arguments.  If we are then we ensure that any allocation larger than
> the ABI
> +-   defined buffer needs a probe so that the invariant of having a 1KB
> buffer is
> +-   maintained.
> ++   FINAL_ADJUSTMENT_P indicates whether we are allocating the area belo=
w
> ++   the saved registers.  If we are then we ensure that any allocation
> ++   larger than the ABI defined buffer needs a probe so that the
> ++   invariant of having a 1KB buffer is maintained.
> +
> +    We emit barriers after each stack adjustment to prevent optimization=
s
> from
> +    breaking the invariant that we never drop the stack more than a
> page.  This
> +@@ -9532,7 +9533,7 @@ aarch64_allocate_and_probe_stack_space (rtx temp1,
> rtx temp2,
> +   /* Handle any residuals.  Residuals of at least MIN_PROBE_THRESHOLD
> have to
> +      be probed.  This maintains the requirement that each page is probe=
d
> at
> +      least once.  For initial probing we probe only if the allocation i=
s
> +-     more than GUARD_SIZE - buffer, and for the outgoing arguments we
> probe
> ++     more than GUARD_SIZE - buffer, and below the saved registers we
> probe
> +      if the amount is larger than buffer.  GUARD_SIZE - buffer + buffer
> =3D=3D
> +      GUARD_SIZE.  This works that for any allocation that is large
> enough to
> +      trigger a probe here, we'll have at least one, and if they're not
> large
> +diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
> +index 6834c3e9922..1e105e12db8 100644
> +--- a/gcc/config/aarch64/aarch64.h
> ++++ b/gcc/config/aarch64/aarch64.h
> +@@ -871,6 +871,11 @@ struct GTY (()) aarch64_frame
> +   /* The size of the callee-save registers with a slot in REG_OFFSET.  =
*/
> +   poly_int64 saved_regs_size;
> +
> ++  /* The number of bytes between the bottom of the static frame (the
> bottom
> ++     of the outgoing arguments) and the bottom of the register save are=
a.
> ++     This value is always a multiple of STACK_BOUNDARY.  */
> ++  poly_int64 bytes_below_saved_regs;
> ++
> +   /* The size of the callee-save registers with a slot in REG_OFFSET th=
at
> +      are saved below the hard frame pointer.  */
> +   poly_int64 below_hard_fp_saved_regs_size;
> +--
> +2.34.1
> +
> +
> +From 34081079ea4de0c98331843f574b5f6f94d7b234 Mon Sep 17 00:00:00 2001
> +From: Richard Sandiford <richard.sandiford@arm.com>
> +Date: Tue, 12 Sep 2023 16:08:50 +0100
> +Subject: [PATCH 05/19] aarch64: Add bytes_below_hard_fp to frame info
> +
> +Following on from the previous bytes_below_saved_regs patch, this one
> +records the number of bytes that are below the hard frame pointer.
> +This eventually replaces below_hard_fp_saved_regs_size.
> +
> +If a frame pointer is not needed, the epilogue adds final_adjust
> +to the stack pointer before restoring registers:
> +
> +     aarch64_add_sp (tmp1_rtx, tmp0_rtx, final_adjust, true);
> +
> +Therefore, if the epilogue needs to restore the stack pointer from
> +the hard frame pointer, the directly corresponding offset is:
> +
> +     -bytes_below_hard_fp + final_adjust
> +
> +i.e. go from the hard frame pointer to the bottom of the frame,
> +then add the same amount as if we were using the stack pointer
> +from the outset.
> +
> +gcc/
> +       * config/aarch64/aarch64.h (aarch64_frame::bytes_below_hard_fp):
> New
> +       field.
> +       * config/aarch64/aarch64.cc (aarch64_layout_frame): Initialize it=
.
> +       (aarch64_expand_epilogue): Use it instead of
> +       below_hard_fp_saved_regs_size.
> +---
> + gcc/config/aarch64/aarch64.cc | 6 +++---
> + gcc/config/aarch64/aarch64.h  | 5 +++++
> + 2 files changed, 8 insertions(+), 3 deletions(-)
> +
> +diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> +index 94e1b686584..c7d84245fbf 100644
> +--- a/gcc/config/aarch64/aarch64.cc
> ++++ b/gcc/config/aarch64/aarch64.cc
> +@@ -8269,6 +8269,7 @@ aarch64_layout_frame (void)
> +      of the callee save area.  */
> +   bool saves_below_hard_fp_p =3D maybe_ne (offset, 0);
> +   frame.below_hard_fp_saved_regs_size =3D offset;
> ++  frame.bytes_below_hard_fp =3D offset + frame.bytes_below_saved_regs;
> +   if (frame.emit_frame_chain)
> +     {
> +       /* FP and LR are placed in the linkage record.  */
> +@@ -9856,8 +9857,7 @@ aarch64_expand_epilogue (bool for_sibcall)
> +   poly_int64 final_adjust =3D frame.final_adjust;
> +   poly_int64 callee_offset =3D frame.callee_offset;
> +   poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
> +-  poly_int64 below_hard_fp_saved_regs_size
> +-    =3D frame.below_hard_fp_saved_regs_size;
> ++  poly_int64 bytes_below_hard_fp =3D frame.bytes_below_hard_fp;
> +   unsigned reg1 =3D frame.wb_pop_candidate1;
> +   unsigned reg2 =3D frame.wb_pop_candidate2;
> +   unsigned int last_gpr =3D (frame.is_scs_enabled
> +@@ -9915,7 +9915,7 @@ aarch64_expand_epilogue (bool for_sibcall)
> +        is restored on the instruction doing the writeback.  */
> +     aarch64_add_offset (Pmode, stack_pointer_rtx,
> +                       hard_frame_pointer_rtx,
> +-                      -callee_offset - below_hard_fp_saved_regs_size,
> ++                      -bytes_below_hard_fp + final_adjust,
> +                       tmp1_rtx, tmp0_rtx, callee_adjust =3D=3D 0);
> +   else
> +      /* The case where we need to re-use the register here is very rare=
,
> so
> +diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
> +index 1e105e12db8..de68ff7202f 100644
> +--- a/gcc/config/aarch64/aarch64.h
> ++++ b/gcc/config/aarch64/aarch64.h
> +@@ -880,6 +880,11 @@ struct GTY (()) aarch64_frame
> +      are saved below the hard frame pointer.  */
> +   poly_int64 below_hard_fp_saved_regs_size;
> +
> ++  /* The number of bytes between the bottom of the static frame (the
> bottom
> ++     of the outgoing arguments) and the hard frame pointer.  This value
> is
> ++     always a multiple of STACK_BOUNDARY.  */
> ++  poly_int64 bytes_below_hard_fp;
> ++
> +   /* Offset from the base of the frame (incomming SP) to the
> +      top of the locals area.  This value is always a multiple of
> +      STACK_BOUNDARY.  */
> +--
> +2.34.1
> +
> +
> +From 187861af7c51db9eddc6f954b589c121b210fc74 Mon Sep 17 00:00:00 2001
> +From: Richard Sandiford <richard.sandiford@arm.com>
> +Date: Tue, 12 Sep 2023 16:08:50 +0100
> +Subject: [PATCH 06/19] aarch64: Tweak aarch64_save/restore_callee_saves
> +
> +aarch64_save_callee_saves and aarch64_restore_callee_saves took
> +a parameter called start_offset that gives the offset of the
> +bottom of the saved register area from the current stack pointer.
> +However, it's more convenient for later patches if we use the
> +bottom of the entire frame as the reference point, rather than
> +the bottom of the saved registers.
> +
> +Doing that removes the need for the callee_offset field.
> +Other than that, this is not a win on its own.  It only really
> +makes sense in combination with the follow-on patches.
> +
> +gcc/
> +       * config/aarch64/aarch64.h (aarch64_frame::callee_offset): Delete=
.
> +       * config/aarch64/aarch64.cc (aarch64_layout_frame): Remove
> +       callee_offset handling.
> +       (aarch64_save_callee_saves): Replace the start_offset parameter
> +       with a bytes_below_sp parameter.
> +       (aarch64_restore_callee_saves): Likewise.
> +       (aarch64_expand_prologue): Update accordingly.
> +       (aarch64_expand_epilogue): Likewise.
> +---
> + gcc/config/aarch64/aarch64.cc | 56 +++++++++++++++++------------------
> + gcc/config/aarch64/aarch64.h  |  4 ---
> + 2 files changed, 28 insertions(+), 32 deletions(-)
> +
> +diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> +index c7d84245fbf..e79551af41d 100644
> +--- a/gcc/config/aarch64/aarch64.cc
> ++++ b/gcc/config/aarch64/aarch64.cc
> +@@ -8343,7 +8343,6 @@ aarch64_layout_frame (void)
> +   frame.final_adjust =3D 0;
> +   frame.callee_adjust =3D 0;
> +   frame.sve_callee_adjust =3D 0;
> +-  frame.callee_offset =3D 0;
> +
> +   frame.wb_pop_candidate1 =3D frame.wb_push_candidate1;
> +   frame.wb_pop_candidate2 =3D frame.wb_push_candidate2;
> +@@ -8411,7 +8410,6 @@ aarch64_layout_frame (void)
> +        stp reg1, reg2, [sp, bytes_below_saved_regs]
> +        stp reg3, reg4, [sp, bytes_below_saved_regs + 16]  */
> +       frame.initial_adjust =3D frame.frame_size;
> +-      frame.callee_offset =3D const_below_saved_regs;
> +     }
> +   else if (saves_below_hard_fp_p
> +          && known_eq (frame.saved_regs_size,
> +@@ -8758,12 +8756,13 @@ aarch64_add_cfa_expression (rtx_insn *insn, rtx
> reg,
> + }
> +
> + /* Emit code to save the callee-saved registers from register number
> START
> +-   to LIMIT to the stack at the location starting at offset START_OFFSE=
T,
> +-   skipping any write-back candidates if SKIP_WB is true.
> HARD_FP_VALID_P
> +-   is true if the hard frame pointer has been set up.  */
> ++   to LIMIT to the stack.  The stack pointer is currently BYTES_BELOW_S=
P
> ++   bytes above the bottom of the static frame.  Skip any write-back
> ++   candidates if SKIP_WB is true.  HARD_FP_VALID_P is true if the hard
> ++   frame pointer has been set up.  */
> +
> + static void
> +-aarch64_save_callee_saves (poly_int64 start_offset,
> ++aarch64_save_callee_saves (poly_int64 bytes_below_sp,
> +                          unsigned start, unsigned limit, bool skip_wb,
> +                          bool hard_fp_valid_p)
> + {
> +@@ -8791,7 +8790,9 @@ aarch64_save_callee_saves (poly_int64 start_offset=
,
> +
> +       machine_mode mode =3D aarch64_reg_save_mode (regno);
> +       reg =3D gen_rtx_REG (mode, regno);
> +-      offset =3D start_offset + frame.reg_offset[regno];
> ++      offset =3D (frame.reg_offset[regno]
> ++              + frame.bytes_below_saved_regs
> ++              - bytes_below_sp);
> +       rtx base_rtx =3D stack_pointer_rtx;
> +       poly_int64 sp_offset =3D offset;
> +
> +@@ -8802,9 +8803,7 @@ aarch64_save_callee_saves (poly_int64 start_offset=
,
> +       else if (GP_REGNUM_P (regno)
> +              && (!offset.is_constant (&const_offset) || const_offset >=
=3D
> 512))
> +       {
> +-        gcc_assert (known_eq (start_offset, 0));
> +-        poly_int64 fp_offset
> +-          =3D frame.below_hard_fp_saved_regs_size;
> ++        poly_int64 fp_offset =3D frame.bytes_below_hard_fp -
> bytes_below_sp;
> +         if (hard_fp_valid_p)
> +           base_rtx =3D hard_frame_pointer_rtx;
> +         else
> +@@ -8868,12 +8867,13 @@ aarch64_save_callee_saves (poly_int64
> start_offset,
> + }
> +
> + /* Emit code to restore the callee registers from register number START
> +-   up to and including LIMIT.  Restore from the stack offset
> START_OFFSET,
> +-   skipping any write-back candidates if SKIP_WB is true.  Write the
> +-   appropriate REG_CFA_RESTORE notes into CFI_OPS.  */
> ++   up to and including LIMIT.  The stack pointer is currently
> BYTES_BELOW_SP
> ++   bytes above the bottom of the static frame.  Skip any write-back
> ++   candidates if SKIP_WB is true.  Write the appropriate REG_CFA_RESTOR=
E
> ++   notes into CFI_OPS.  */
> +
> + static void
> +-aarch64_restore_callee_saves (poly_int64 start_offset, unsigned start,
> ++aarch64_restore_callee_saves (poly_int64 bytes_below_sp, unsigned start=
,
> +                             unsigned limit, bool skip_wb, rtx *cfi_ops)
> + {
> +   aarch64_frame &frame =3D cfun->machine->frame;
> +@@ -8899,7 +8899,9 @@ aarch64_restore_callee_saves (poly_int64
> start_offset, unsigned start,
> +
> +       machine_mode mode =3D aarch64_reg_save_mode (regno);
> +       reg =3D gen_rtx_REG (mode, regno);
> +-      offset =3D start_offset + frame.reg_offset[regno];
> ++      offset =3D (frame.reg_offset[regno]
> ++              + frame.bytes_below_saved_regs
> ++              - bytes_below_sp);
> +       rtx base_rtx =3D stack_pointer_rtx;
> +       if (mode =3D=3D VNx2DImode && BYTES_BIG_ENDIAN)
> +       aarch64_adjust_sve_callee_save_base (mode, base_rtx, anchor_reg,
> +@@ -9675,8 +9677,6 @@ aarch64_expand_prologue (void)
> +   HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;
> +   poly_int64 final_adjust =3D frame.final_adjust;
> +   poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
> +-  poly_int64 below_hard_fp_saved_regs_size
> +-    =3D frame.below_hard_fp_saved_regs_size;
> +   unsigned reg1 =3D frame.wb_push_candidate1;
> +   unsigned reg2 =3D frame.wb_push_candidate2;
> +   bool emit_frame_chain =3D frame.emit_frame_chain;
> +@@ -9752,8 +9752,8 @@ aarch64_expand_prologue (void)
> +                            - frame.hard_fp_offset);
> +   gcc_assert (known_ge (chain_offset, 0));
> +
> +-  /* The offset of the bottom of the save area from the current SP.  */
> +-  poly_int64 saved_regs_offset =3D chain_offset -
> below_hard_fp_saved_regs_size;
> ++  /* The offset of the current SP from the bottom of the static frame.
> */
> ++  poly_int64 bytes_below_sp =3D frame_size - initial_adjust -
> callee_adjust;
> +
> +   if (emit_frame_chain)
> +     {
> +@@ -9761,7 +9761,7 @@ aarch64_expand_prologue (void)
> +       {
> +         reg1 =3D R29_REGNUM;
> +         reg2 =3D R30_REGNUM;
> +-        aarch64_save_callee_saves (saved_regs_offset, reg1, reg2,
> ++        aarch64_save_callee_saves (bytes_below_sp, reg1, reg2,
> +                                    false, false);
> +       }
> +       else
> +@@ -9801,7 +9801,7 @@ aarch64_expand_prologue (void)
> +       emit_insn (gen_stack_tie (stack_pointer_rtx,
> hard_frame_pointer_rtx));
> +     }
> +
> +-  aarch64_save_callee_saves (saved_regs_offset, R0_REGNUM, R30_REGNUM,
> ++  aarch64_save_callee_saves (bytes_below_sp, R0_REGNUM, R30_REGNUM,
> +                            callee_adjust !=3D 0 || emit_frame_chain,
> +                            emit_frame_chain);
> +   if (maybe_ne (sve_callee_adjust, 0))
> +@@ -9811,16 +9811,17 @@ aarch64_expand_prologue (void)
> +       aarch64_allocate_and_probe_stack_space (tmp1_rtx, tmp0_rtx,
> +                                             sve_callee_adjust,
> +                                             !frame_pointer_needed,
> false);
> +-      saved_regs_offset +=3D sve_callee_adjust;
> ++      bytes_below_sp -=3D sve_callee_adjust;
> +     }
> +-  aarch64_save_callee_saves (saved_regs_offset, P0_REGNUM, P15_REGNUM,
> ++  aarch64_save_callee_saves (bytes_below_sp, P0_REGNUM, P15_REGNUM,
> +                            false, emit_frame_chain);
> +-  aarch64_save_callee_saves (saved_regs_offset, V0_REGNUM, V31_REGNUM,
> ++  aarch64_save_callee_saves (bytes_below_sp, V0_REGNUM, V31_REGNUM,
> +                            callee_adjust !=3D 0 || emit_frame_chain,
> +                            emit_frame_chain);
> +
> +   /* We may need to probe the final adjustment if it is larger than the
> guard
> +      that is assumed by the called.  */
> ++  gcc_assert (known_eq (bytes_below_sp, final_adjust));
> +   aarch64_allocate_and_probe_stack_space (tmp1_rtx, tmp0_rtx,
> final_adjust,
> +                                         !frame_pointer_needed, true);
> + }
> +@@ -9855,7 +9856,6 @@ aarch64_expand_epilogue (bool for_sibcall)
> +   poly_int64 initial_adjust =3D frame.initial_adjust;
> +   HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;
> +   poly_int64 final_adjust =3D frame.final_adjust;
> +-  poly_int64 callee_offset =3D frame.callee_offset;
> +   poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
> +   poly_int64 bytes_below_hard_fp =3D frame.bytes_below_hard_fp;
> +   unsigned reg1 =3D frame.wb_pop_candidate1;
> +@@ -9925,9 +9925,9 @@ aarch64_expand_epilogue (bool for_sibcall)
> +
> +   /* Restore the vector registers before the predicate registers,
> +      so that we can use P4 as a temporary for big-endian SVE frames.  *=
/
> +-  aarch64_restore_callee_saves (callee_offset, V0_REGNUM, V31_REGNUM,
> ++  aarch64_restore_callee_saves (final_adjust, V0_REGNUM, V31_REGNUM,
> +                               callee_adjust !=3D 0, &cfi_ops);
> +-  aarch64_restore_callee_saves (callee_offset, P0_REGNUM, P15_REGNUM,
> ++  aarch64_restore_callee_saves (final_adjust, P0_REGNUM, P15_REGNUM,
> +                               false, &cfi_ops);
> +   if (maybe_ne (sve_callee_adjust, 0))
> +     aarch64_add_sp (NULL_RTX, NULL_RTX, sve_callee_adjust, true);
> +@@ -9935,7 +9935,7 @@ aarch64_expand_epilogue (bool for_sibcall)
> +   /* When shadow call stack is enabled, the scs_pop in the epilogue wil=
l
> +      restore x30, we don't need to restore x30 again in the traditional
> +      way.  */
> +-  aarch64_restore_callee_saves (callee_offset - sve_callee_adjust,
> ++  aarch64_restore_callee_saves (final_adjust + sve_callee_adjust,
> +                               R0_REGNUM, last_gpr,
> +                               callee_adjust !=3D 0, &cfi_ops);
> +
> +diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
> +index de68ff7202f..94fca4b9471 100644
> +--- a/gcc/config/aarch64/aarch64.h
> ++++ b/gcc/config/aarch64/aarch64.h
> +@@ -907,10 +907,6 @@ struct GTY (()) aarch64_frame
> +      It is zero when no push is used.  */
> +   HOST_WIDE_INT callee_adjust;
> +
> +-  /* The offset from SP to the callee-save registers after
> initial_adjust.
> +-     It may be non-zero if no push is used (ie. callee_adjust =3D=3D 0)=
.  */
> +-  poly_int64 callee_offset;
> +-
> +   /* The size of the stack adjustment before saving or after restoring
> +      SVE registers.  */
> +   poly_int64 sve_callee_adjust;
> +--
> +2.34.1
> +
> +
> +From 2b983f9064d808daf909bde1d4a13980934a7e6e Mon Sep 17 00:00:00 2001
> +From: Richard Sandiford <richard.sandiford@arm.com>
> +Date: Tue, 12 Sep 2023 16:08:51 +0100
> +Subject: [PATCH 07/19] aarch64: Only calculate chain_offset if there is =
a
> + chain
> +
> +After previous patches, it is no longer necessary to calculate
> +a chain_offset in cases where there is no chain record.
> +
> +gcc/
> +       * config/aarch64/aarch64.cc (aarch64_expand_prologue): Move the
> +       calculation of chain_offset into the emit_frame_chain block.
> +---
> + gcc/config/aarch64/aarch64.cc | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> +index e79551af41d..d71a042d611 100644
> +--- a/gcc/config/aarch64/aarch64.cc
> ++++ b/gcc/config/aarch64/aarch64.cc
> +@@ -9747,16 +9747,16 @@ aarch64_expand_prologue (void)
> +   if (callee_adjust !=3D 0)
> +     aarch64_push_regs (reg1, reg2, callee_adjust);
> +
> +-  /* The offset of the frame chain record (if any) from the current SP.
> */
> +-  poly_int64 chain_offset =3D (initial_adjust + callee_adjust
> +-                           - frame.hard_fp_offset);
> +-  gcc_assert (known_ge (chain_offset, 0));
> +-
> +   /* The offset of the current SP from the bottom of the static frame.
> */
> +   poly_int64 bytes_below_sp =3D frame_size - initial_adjust -
> callee_adjust;
> +
> +   if (emit_frame_chain)
> +     {
> ++      /* The offset of the frame chain record (if any) from the current
> SP.  */
> ++      poly_int64 chain_offset =3D (initial_adjust + callee_adjust
> ++                               - frame.hard_fp_offset);
> ++      gcc_assert (known_ge (chain_offset, 0));
> ++
> +       if (callee_adjust =3D=3D 0)
> +       {
> +         reg1 =3D R29_REGNUM;
> +--
> +2.34.1
> +
> +
> +From 0a0a824808d1dec51004fb5805c1a0ae2a35433f Mon Sep 17 00:00:00 2001
> +From: Richard Sandiford <richard.sandiford@arm.com>
> +Date: Tue, 12 Sep 2023 16:08:51 +0100
> +Subject: [PATCH 08/19] aarch64: Rename locals_offset to bytes_above_loca=
ls
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +locals_offset was described as:
> +
> +  /* Offset from the base of the frame (incomming SP) to the
> +     top of the locals area.  This value is always a multiple of
> +     STACK_BOUNDARY.  */
> +
> +This is implicitly an =E2=80=9Cupside down=E2=80=9D view of the frame: t=
he incoming
> +SP is at offset 0, and anything N bytes below the incoming SP is at
> +offset N (rather than -N).
> +
> +However, reg_offset instead uses a =E2=80=9Cright way up=E2=80=9D view; =
that is,
> +it views offsets in address terms.  Something above X is at a
> +positive offset from X and something below X is at a negative
> +offset from X.
> +
> +Also, even on FRAME_GROWS_DOWNWARD targets like AArch64,
> +target-independent code views offsets in address terms too:
> +locals are allocated at negative offsets to virtual_stack_vars.
> +
> +It seems confusing to have *_offset fields of the same structure
> +using different polarities like this.  This patch tries to avoid
> +that by renaming locals_offset to bytes_above_locals.
> +
> +gcc/
> +       * config/aarch64/aarch64.h (aarch64_frame::locals_offset): Rename
> to...
> +       (aarch64_frame::bytes_above_locals): ...this.
> +       * config/aarch64/aarch64.cc (aarch64_layout_frame)
> +       (aarch64_initial_elimination_offset): Update accordingly.
> +---
> + gcc/config/aarch64/aarch64.cc | 6 +++---
> + gcc/config/aarch64/aarch64.h  | 6 +++---
> + 2 files changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> +index d71a042d611..d4ec352ba98 100644
> +--- a/gcc/config/aarch64/aarch64.cc
> ++++ b/gcc/config/aarch64/aarch64.cc
> +@@ -8337,7 +8337,7 @@ aarch64_layout_frame (void)
> +                         STACK_BOUNDARY / BITS_PER_UNIT));
> +   frame.frame_size =3D saved_regs_and_above + frame.bytes_below_saved_r=
egs;
> +
> +-  frame.locals_offset =3D frame.saved_varargs_size;
> ++  frame.bytes_above_locals =3D frame.saved_varargs_size;
> +
> +   frame.initial_adjust =3D 0;
> +   frame.final_adjust =3D 0;
> +@@ -12578,13 +12578,13 @@ aarch64_initial_elimination_offset (unsigned
> from, unsigned to)
> +       return frame.hard_fp_offset;
> +
> +       if (from =3D=3D FRAME_POINTER_REGNUM)
> +-      return frame.hard_fp_offset - frame.locals_offset;
> ++      return frame.hard_fp_offset - frame.bytes_above_locals;
> +     }
> +
> +   if (to =3D=3D STACK_POINTER_REGNUM)
> +     {
> +       if (from =3D=3D FRAME_POINTER_REGNUM)
> +-      return frame.frame_size - frame.locals_offset;
> ++      return frame.frame_size - frame.bytes_above_locals;
> +     }
> +
> +   return frame.frame_size;
> +diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
> +index 94fca4b9471..bf46e6124aa 100644
> +--- a/gcc/config/aarch64/aarch64.h
> ++++ b/gcc/config/aarch64/aarch64.h
> +@@ -885,10 +885,10 @@ struct GTY (()) aarch64_frame
> +      always a multiple of STACK_BOUNDARY.  */
> +   poly_int64 bytes_below_hard_fp;
> +
> +-  /* Offset from the base of the frame (incomming SP) to the
> +-     top of the locals area.  This value is always a multiple of
> ++  /* The number of bytes between the top of the locals area and the top
> ++     of the frame (the incomming SP).  This value is always a multiple =
of
> +      STACK_BOUNDARY.  */
> +-  poly_int64 locals_offset;
> ++  poly_int64 bytes_above_locals;
> +
> +   /* Offset from the base of the frame (incomming SP) to the
> +      hard_frame_pointer.  This value is always a multiple of
> +--
> +2.34.1
> +
> +
> +From 3fbf0789202b30a67b12e1fb785c7130f098d665 Mon Sep 17 00:00:00 2001
> +From: Richard Sandiford <richard.sandiford@arm.com>
> +Date: Tue, 12 Sep 2023 16:08:52 +0100
> +Subject: [PATCH 09/19] aarch64: Rename hard_fp_offset to
> bytes_above_hard_fp
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Similarly to the previous locals_offset patch, hard_fp_offset
> +was described as:
> +
> +  /* Offset from the base of the frame (incomming SP) to the
> +     hard_frame_pointer.  This value is always a multiple of
> +     STACK_BOUNDARY.  */
> +  poly_int64 hard_fp_offset;
> +
> +which again took an =E2=80=9Cupside-down=E2=80=9D view: higher offsets m=
eant lower
> +addresses.  This patch renames the field to bytes_above_hard_fp instead.
> +
> +gcc/
> +       * config/aarch64/aarch64.h (aarch64_frame::hard_fp_offset): Renam=
e
> +       to...
> +       (aarch64_frame::bytes_above_hard_fp): ...this.
> +       * config/aarch64/aarch64.cc (aarch64_layout_frame)
> +       (aarch64_expand_prologue): Update accordingly.
> +       (aarch64_initial_elimination_offset): Likewise.
> +---
> + gcc/config/aarch64/aarch64.cc | 26 +++++++++++++-------------
> + gcc/config/aarch64/aarch64.h  |  6 +++---
> + 2 files changed, 16 insertions(+), 16 deletions(-)
> +
> +diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> +index d4ec352ba98..3c4052740e7 100644
> +--- a/gcc/config/aarch64/aarch64.cc
> ++++ b/gcc/config/aarch64/aarch64.cc
> +@@ -8329,7 +8329,7 @@ aarch64_layout_frame (void)
> +                          + get_frame_size (),
> +                          STACK_BOUNDARY / BITS_PER_UNIT);
> +
> +-  frame.hard_fp_offset
> ++  frame.bytes_above_hard_fp
> +     =3D saved_regs_and_above - frame.below_hard_fp_saved_regs_size;
> +
> +   /* Both these values are already aligned.  */
> +@@ -8378,13 +8378,13 @@ aarch64_layout_frame (void)
> +   else if (frame.wb_pop_candidate1 !=3D INVALID_REGNUM)
> +     max_push_offset =3D 256;
> +
> +-  HOST_WIDE_INT const_size, const_below_saved_regs, const_fp_offset;
> ++  HOST_WIDE_INT const_size, const_below_saved_regs, const_above_fp;
> +   HOST_WIDE_INT const_saved_regs_size;
> +   if (known_eq (frame.saved_regs_size, 0))
> +     frame.initial_adjust =3D frame.frame_size;
> +   else if (frame.frame_size.is_constant (&const_size)
> +          && const_size < max_push_offset
> +-         && known_eq (frame.hard_fp_offset, const_size))
> ++         && known_eq (frame.bytes_above_hard_fp, const_size))
> +     {
> +       /* Simple, small frame with no data below the saved registers.
> +
> +@@ -8401,8 +8401,8 @@ aarch64_layout_frame (void)
> +             case that it hardly seems worth the effort though.  */
> +          && (!saves_below_hard_fp_p || const_below_saved_regs =3D=3D 0)
> +          && !(cfun->calls_alloca
> +-              && frame.hard_fp_offset.is_constant (&const_fp_offset)
> +-              && const_fp_offset < max_push_offset))
> ++              && frame.bytes_above_hard_fp.is_constant (&const_above_fp=
)
> ++              && const_above_fp < max_push_offset))
> +     {
> +       /* Frame with small area below the saved registers:
> +
> +@@ -8420,12 +8420,12 @@ aarch64_layout_frame (void)
> +        sub sp, sp, hard_fp_offset + below_hard_fp_saved_regs_size
> +        save SVE registers relative to SP
> +        sub sp, sp, bytes_below_saved_regs  */
> +-      frame.initial_adjust =3D (frame.hard_fp_offset
> ++      frame.initial_adjust =3D (frame.bytes_above_hard_fp
> +                             + frame.below_hard_fp_saved_regs_size);
> +       frame.final_adjust =3D frame.bytes_below_saved_regs;
> +     }
> +-  else if (frame.hard_fp_offset.is_constant (&const_fp_offset)
> +-         && const_fp_offset < max_push_offset)
> ++  else if (frame.bytes_above_hard_fp.is_constant (&const_above_fp)
> ++         && const_above_fp < max_push_offset)
> +     {
> +       /* Frame with large area below the saved registers, or with SVE
> saves,
> +        but with a small area above:
> +@@ -8435,7 +8435,7 @@ aarch64_layout_frame (void)
> +        [sub sp, sp, below_hard_fp_saved_regs_size]
> +        [save SVE registers relative to SP]
> +        sub sp, sp, bytes_below_saved_regs  */
> +-      frame.callee_adjust =3D const_fp_offset;
> ++      frame.callee_adjust =3D const_above_fp;
> +       frame.sve_callee_adjust =3D frame.below_hard_fp_saved_regs_size;
> +       frame.final_adjust =3D frame.bytes_below_saved_regs;
> +     }
> +@@ -8450,7 +8450,7 @@ aarch64_layout_frame (void)
> +        [sub sp, sp, below_hard_fp_saved_regs_size]
> +        [save SVE registers relative to SP]
> +        sub sp, sp, bytes_below_saved_regs  */
> +-      frame.initial_adjust =3D frame.hard_fp_offset;
> ++      frame.initial_adjust =3D frame.bytes_above_hard_fp;
> +       frame.sve_callee_adjust =3D frame.below_hard_fp_saved_regs_size;
> +       frame.final_adjust =3D frame.bytes_below_saved_regs;
> +     }
> +@@ -9754,7 +9754,7 @@ aarch64_expand_prologue (void)
> +     {
> +       /* The offset of the frame chain record (if any) from the current
> SP.  */
> +       poly_int64 chain_offset =3D (initial_adjust + callee_adjust
> +-                               - frame.hard_fp_offset);
> ++                               - frame.bytes_above_hard_fp);
> +       gcc_assert (known_ge (chain_offset, 0));
> +
> +       if (callee_adjust =3D=3D 0)
> +@@ -12575,10 +12575,10 @@ aarch64_initial_elimination_offset (unsigned
> from, unsigned to)
> +   if (to =3D=3D HARD_FRAME_POINTER_REGNUM)
> +     {
> +       if (from =3D=3D ARG_POINTER_REGNUM)
> +-      return frame.hard_fp_offset;
> ++      return frame.bytes_above_hard_fp;
> +
> +       if (from =3D=3D FRAME_POINTER_REGNUM)
> +-      return frame.hard_fp_offset - frame.bytes_above_locals;
> ++      return frame.bytes_above_hard_fp - frame.bytes_above_locals;
> +     }
> +
> +   if (to =3D=3D STACK_POINTER_REGNUM)
> +diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
> +index bf46e6124aa..dd1f403f939 100644
> +--- a/gcc/config/aarch64/aarch64.h
> ++++ b/gcc/config/aarch64/aarch64.h
> +@@ -890,10 +890,10 @@ struct GTY (()) aarch64_frame
> +      STACK_BOUNDARY.  */
> +   poly_int64 bytes_above_locals;
> +
> +-  /* Offset from the base of the frame (incomming SP) to the
> +-     hard_frame_pointer.  This value is always a multiple of
> ++  /* The number of bytes between the hard_frame_pointer and the top of
> ++     the frame (the incomming SP).  This value is always a multiple of
> +      STACK_BOUNDARY.  */
> +-  poly_int64 hard_fp_offset;
> ++  poly_int64 bytes_above_hard_fp;
> +
> +   /* The size of the frame.  This value is the offset from base of the
> +      frame (incomming SP) to the stack_pointer.  This value is always
> +--
> +2.34.1
> +
> +
> +From aac8b31379ac3bbd14fc6427dce23f56e54e8485 Mon Sep 17 00:00:00 2001
> +From: Richard Sandiford <richard.sandiford@arm.com>
> +Date: Tue, 12 Sep 2023 16:08:52 +0100
> +Subject: [PATCH 10/19] aarch64: Tweak frame_size comment
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This patch fixes another case in which a value was described with
> +an =E2=80=9Cupside-down=E2=80=9D view.
> +
> +gcc/
> +       * config/aarch64/aarch64.h (aarch64_frame::frame_size): Tweak
> comment.
> +---
> + gcc/config/aarch64/aarch64.h | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
> +index dd1f403f939..700524ae22b 100644
> +--- a/gcc/config/aarch64/aarch64.h
> ++++ b/gcc/config/aarch64/aarch64.h
> +@@ -895,8 +895,8 @@ struct GTY (()) aarch64_frame
> +      STACK_BOUNDARY.  */
> +   poly_int64 bytes_above_hard_fp;
> +
> +-  /* The size of the frame.  This value is the offset from base of the
> +-     frame (incomming SP) to the stack_pointer.  This value is always
> ++  /* The size of the frame, i.e. the number of bytes between the bottom
> ++     of the outgoing arguments and the incoming SP.  This value is alwa=
ys
> +      a multiple of STACK_BOUNDARY.  */
> +   poly_int64 frame_size;
> +
> +--
> +2.34.1
> +
> +
> +From 8d5506a8aeb8dd7e8b209a3663b07688478f76b9 Mon Sep 17 00:00:00 2001
> +From: Richard Sandiford <richard.sandiford@arm.com>
> +Date: Tue, 12 Sep 2023 16:08:53 +0100
> +Subject: [PATCH 11/19] aarch64: Measure reg_offset from the bottom of th=
e
> + frame
> +
> +reg_offset was measured from the bottom of the saved register area.
> +This made perfect sense with the original layout, since the bottom
> +of the saved register area was also the hard frame pointer address.
> +It became slightly less obvious with SVE, since we save SVE
> +registers below the hard frame pointer, but it still made sense.
> +
> +However, if we want to allow different frame layouts, it's more
> +convenient and obvious to measure reg_offset from the bottom of
> +the frame.  After previous patches, it's also a slight simplification
> +in its own right.
> +
> +gcc/
> +       * config/aarch64/aarch64.h (aarch64_frame): Add comment above
> +       reg_offset.
> +       * config/aarch64/aarch64.cc (aarch64_layout_frame): Walk offsets
> +       from the bottom of the frame, rather than the bottom of the saved
> +       register area.  Measure reg_offset from the bottom of the frame
> +       rather than the bottom of the saved register area.
> +       (aarch64_save_callee_saves): Update accordingly.
> +       (aarch64_restore_callee_saves): Likewise.
> +       (aarch64_get_separate_components): Likewise.
> +       (aarch64_process_components): Likewise.
> +---
> + gcc/config/aarch64/aarch64.cc | 53 ++++++++++++++++-------------------
> + gcc/config/aarch64/aarch64.h  |  3 ++
> + 2 files changed, 27 insertions(+), 29 deletions(-)
> +
> +diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> +index 3c4052740e7..97dd077844b 100644
> +--- a/gcc/config/aarch64/aarch64.cc
> ++++ b/gcc/config/aarch64/aarch64.cc
> +@@ -8139,7 +8139,6 @@ aarch64_needs_frame_chain (void)
> + static void
> + aarch64_layout_frame (void)
> + {
> +-  poly_int64 offset =3D 0;
> +   int regno, last_fp_reg =3D INVALID_REGNUM;
> +   machine_mode vector_save_mode =3D aarch64_reg_save_mode (V8_REGNUM);
> +   poly_int64 vector_save_size =3D GET_MODE_SIZE (vector_save_mode);
> +@@ -8217,7 +8216,9 @@ aarch64_layout_frame (void)
> +   gcc_assert (crtl->is_leaf
> +             || maybe_ne (frame.reg_offset[R30_REGNUM],
> SLOT_NOT_REQUIRED));
> +
> +-  frame.bytes_below_saved_regs =3D crtl->outgoing_args_size;
> ++  poly_int64 offset =3D crtl->outgoing_args_size;
> ++  gcc_assert (multiple_p (offset, STACK_BOUNDARY / BITS_PER_UNIT));
> ++  frame.bytes_below_saved_regs =3D offset;
> +
> +   /* Now assign stack slots for the registers.  Start with the predicat=
e
> +      registers, since predicate LDR and STR have a relatively small
> +@@ -8229,7 +8230,8 @@ aarch64_layout_frame (void)
> +       offset +=3D BYTES_PER_SVE_PRED;
> +       }
> +
> +-  if (maybe_ne (offset, 0))
> ++  poly_int64 saved_prs_size =3D offset - frame.bytes_below_saved_regs;
> ++  if (maybe_ne (saved_prs_size, 0))
> +     {
> +       /* If we have any vector registers to save above the predicate
> registers,
> +        the offset of the vector register save slots need to be a multip=
le
> +@@ -8247,10 +8249,10 @@ aarch64_layout_frame (void)
> +       offset =3D aligned_upper_bound (offset, STACK_BOUNDARY /
> BITS_PER_UNIT);
> +       else
> +       {
> +-        if (known_le (offset, vector_save_size))
> +-          offset =3D vector_save_size;
> +-        else if (known_le (offset, vector_save_size * 2))
> +-          offset =3D vector_save_size * 2;
> ++        if (known_le (saved_prs_size, vector_save_size))
> ++          offset =3D frame.bytes_below_saved_regs + vector_save_size;
> ++        else if (known_le (saved_prs_size, vector_save_size * 2))
> ++          offset =3D frame.bytes_below_saved_regs + vector_save_size * =
2;
> +         else
> +           gcc_unreachable ();
> +       }
> +@@ -8267,9 +8269,10 @@ aarch64_layout_frame (void)
> +
> +   /* OFFSET is now the offset of the hard frame pointer from the bottom
> +      of the callee save area.  */
> +-  bool saves_below_hard_fp_p =3D maybe_ne (offset, 0);
> +-  frame.below_hard_fp_saved_regs_size =3D offset;
> +-  frame.bytes_below_hard_fp =3D offset + frame.bytes_below_saved_regs;
> ++  frame.below_hard_fp_saved_regs_size =3D offset -
> frame.bytes_below_saved_regs;
> ++  bool saves_below_hard_fp_p
> ++    =3D maybe_ne (frame.below_hard_fp_saved_regs_size, 0);
> ++  frame.bytes_below_hard_fp =3D offset;
> +   if (frame.emit_frame_chain)
> +     {
> +       /* FP and LR are placed in the linkage record.  */
> +@@ -8320,9 +8323,10 @@ aarch64_layout_frame (void)
> +
> +   offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_UNI=
T);
> +
> +-  frame.saved_regs_size =3D offset;
> ++  frame.saved_regs_size =3D offset - frame.bytes_below_saved_regs;
> +
> +-  poly_int64 varargs_and_saved_regs_size =3D offset +
> frame.saved_varargs_size;
> ++  poly_int64 varargs_and_saved_regs_size
> ++    =3D frame.saved_regs_size + frame.saved_varargs_size;
> +
> +   poly_int64 saved_regs_and_above
> +     =3D aligned_upper_bound (varargs_and_saved_regs_size
> +@@ -8790,9 +8794,7 @@ aarch64_save_callee_saves (poly_int64
> bytes_below_sp,
> +
> +       machine_mode mode =3D aarch64_reg_save_mode (regno);
> +       reg =3D gen_rtx_REG (mode, regno);
> +-      offset =3D (frame.reg_offset[regno]
> +-              + frame.bytes_below_saved_regs
> +-              - bytes_below_sp);
> ++      offset =3D frame.reg_offset[regno] - bytes_below_sp;
> +       rtx base_rtx =3D stack_pointer_rtx;
> +       poly_int64 sp_offset =3D offset;
> +
> +@@ -8899,9 +8901,7 @@ aarch64_restore_callee_saves (poly_int64
> bytes_below_sp, unsigned start,
> +
> +       machine_mode mode =3D aarch64_reg_save_mode (regno);
> +       reg =3D gen_rtx_REG (mode, regno);
> +-      offset =3D (frame.reg_offset[regno]
> +-              + frame.bytes_below_saved_regs
> +-              - bytes_below_sp);
> ++      offset =3D frame.reg_offset[regno] - bytes_below_sp;
> +       rtx base_rtx =3D stack_pointer_rtx;
> +       if (mode =3D=3D VNx2DImode && BYTES_BIG_ENDIAN)
> +       aarch64_adjust_sve_callee_save_base (mode, base_rtx, anchor_reg,
> +@@ -9040,14 +9040,12 @@ aarch64_get_separate_components (void)
> +          it as a stack probe for -fstack-clash-protection.  */
> +       if (flag_stack_clash_protection
> +           && maybe_ne (frame.below_hard_fp_saved_regs_size, 0)
> +-          && known_eq (offset, 0))
> ++          && known_eq (offset, frame.bytes_below_saved_regs))
> +         continue;
> +
> +       /* Get the offset relative to the register we'll use.  */
> +       if (frame_pointer_needed)
> +-        offset -=3D frame.below_hard_fp_saved_regs_size;
> +-      else
> +-        offset +=3D frame.bytes_below_saved_regs;
> ++        offset -=3D frame.bytes_below_hard_fp;
> +
> +       /* Check that we can access the stack slot of the register with o=
ne
> +          direct load with no adjustments needed.  */
> +@@ -9194,9 +9192,7 @@ aarch64_process_components (sbitmap components,
> bool prologue_p)
> +       rtx reg =3D gen_rtx_REG (mode, regno);
> +       poly_int64 offset =3D frame.reg_offset[regno];
> +       if (frame_pointer_needed)
> +-      offset -=3D frame.below_hard_fp_saved_regs_size;
> +-      else
> +-      offset +=3D frame.bytes_below_saved_regs;
> ++      offset -=3D frame.bytes_below_hard_fp;
> +
> +       rtx addr =3D plus_constant (Pmode, ptr_reg, offset);
> +       rtx mem =3D gen_frame_mem (mode, addr);
> +@@ -9248,9 +9244,7 @@ aarch64_process_components (sbitmap components,
> bool prologue_p)
> +       /* REGNO2 can be saved/restored in a pair with REGNO.  */
> +       rtx reg2 =3D gen_rtx_REG (mode, regno2);
> +       if (frame_pointer_needed)
> +-      offset2 -=3D frame.below_hard_fp_saved_regs_size;
> +-      else
> +-      offset2 +=3D frame.bytes_below_saved_regs;
> ++      offset2 -=3D frame.bytes_below_hard_fp;
> +       rtx addr2 =3D plus_constant (Pmode, ptr_reg, offset2);
> +       rtx mem2 =3D gen_frame_mem (mode, addr2);
> +       rtx set2 =3D prologue_p ? gen_rtx_SET (mem2, reg2)
> +@@ -9366,7 +9360,8 @@ aarch64_allocate_and_probe_stack_space (rtx temp1,
> rtx temp2,
> +   if (final_adjustment_p
> +       && known_eq (frame.below_hard_fp_saved_regs_size, 0))
> +     {
> +-      poly_int64 lr_offset =3D frame.reg_offset[LR_REGNUM];
> ++      poly_int64 lr_offset =3D (frame.reg_offset[LR_REGNUM]
> ++                            - frame.bytes_below_saved_regs);
> +       if (known_ge (lr_offset, 0))
> +       min_probe_threshold -=3D lr_offset.to_constant ();
> +       else
> +diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
> +index 700524ae22b..b6135837073 100644
> +--- a/gcc/config/aarch64/aarch64.h
> ++++ b/gcc/config/aarch64/aarch64.h
> +@@ -860,6 +860,9 @@ extern enum aarch64_processor aarch64_tune;
> + #ifdef HAVE_POLY_INT_H
> + struct GTY (()) aarch64_frame
> + {
> ++  /* The offset from the bottom of the static frame (the bottom of the
> ++     outgoing arguments) of each register save slot, or -2 if no save i=
s
> ++     needed.  */
> +   poly_int64 reg_offset[LAST_SAVED_REGNUM + 1];
> +
> +   /* The number of extra stack bytes taken up by register varargs.
> +--
> +2.34.1
> +
> +
> +From b47766614df3b9df878262efb2ad73aaac108363 Mon Sep 17 00:00:00 2001
> +From: Richard Sandiford <richard.sandiford@arm.com>
> +Date: Tue, 12 Sep 2023 16:08:53 +0100
> +Subject: [PATCH 12/19] aarch64: Simplify top of frame allocation
> +
> +After previous patches, it no longer really makes sense to allocate
> +the top of the frame in terms of varargs_and_saved_regs_size and
> +saved_regs_and_above.
> +
> +gcc/
> +       * config/aarch64/aarch64.cc (aarch64_layout_frame): Simplify
> +       the allocation of the top of the frame.
> +---
> + gcc/config/aarch64/aarch64.cc | 23 ++++++++---------------
> + 1 file changed, 8 insertions(+), 15 deletions(-)
> +
> +diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> +index 97dd077844b..81935852d5b 100644
> +--- a/gcc/config/aarch64/aarch64.cc
> ++++ b/gcc/config/aarch64/aarch64.cc
> +@@ -8325,23 +8325,16 @@ aarch64_layout_frame (void)
> +
> +   frame.saved_regs_size =3D offset - frame.bytes_below_saved_regs;
> +
> +-  poly_int64 varargs_and_saved_regs_size
> +-    =3D frame.saved_regs_size + frame.saved_varargs_size;
> +-
> +-  poly_int64 saved_regs_and_above
> +-    =3D aligned_upper_bound (varargs_and_saved_regs_size
> +-                         + get_frame_size (),
> +-                         STACK_BOUNDARY / BITS_PER_UNIT);
> +-
> +-  frame.bytes_above_hard_fp
> +-    =3D saved_regs_and_above - frame.below_hard_fp_saved_regs_size;
> ++  offset +=3D get_frame_size ();
> ++  offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_UNI=
T);
> ++  auto top_of_locals =3D offset;
> +
> +-  /* Both these values are already aligned.  */
> +-  gcc_assert (multiple_p (frame.bytes_below_saved_regs,
> +-                        STACK_BOUNDARY / BITS_PER_UNIT));
> +-  frame.frame_size =3D saved_regs_and_above + frame.bytes_below_saved_r=
egs;
> ++  offset +=3D frame.saved_varargs_size;
> ++  gcc_assert (multiple_p (offset, STACK_BOUNDARY / BITS_PER_UNIT));
> ++  frame.frame_size =3D offset;
> +
> +-  frame.bytes_above_locals =3D frame.saved_varargs_size;
> ++  frame.bytes_above_hard_fp =3D frame.frame_size -
> frame.bytes_below_hard_fp;
> ++  frame.bytes_above_locals =3D frame.frame_size - top_of_locals;
> +
> +   frame.initial_adjust =3D 0;
> +   frame.final_adjust =3D 0;
> +--
> +2.34.1
> +
> +
> +From 08f71b4bb28fb74d20e8d2927a557e8119ce9f4d Mon Sep 17 00:00:00 2001
> +From: Richard Sandiford <richard.sandiford@arm.com>
> +Date: Tue, 12 Sep 2023 16:08:54 +0100
> +Subject: [PATCH 13/19] aarch64: Minor initial adjustment tweak
> +
> +This patch just changes a calculation of initial_adjust
> +to one that makes it slightly more obvious that the total
> +adjustment is frame.frame_size.
> +
> +gcc/
> +       * config/aarch64/aarch64.cc (aarch64_layout_frame): Tweak
> +       calculation of initial_adjust for frames in which all saves
> +       are SVE saves.
> +---
> + gcc/config/aarch64/aarch64.cc | 5 ++---
> + 1 file changed, 2 insertions(+), 3 deletions(-)
> +
> +diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> +index 81935852d5b..4d9fcf3d162 100644
> +--- a/gcc/config/aarch64/aarch64.cc
> ++++ b/gcc/config/aarch64/aarch64.cc
> +@@ -8414,11 +8414,10 @@ aarch64_layout_frame (void)
> +     {
> +       /* Frame in which all saves are SVE saves:
> +
> +-       sub sp, sp, hard_fp_offset + below_hard_fp_saved_regs_size
> ++       sub sp, sp, frame_size - bytes_below_saved_regs
> +        save SVE registers relative to SP
> +        sub sp, sp, bytes_below_saved_regs  */
> +-      frame.initial_adjust =3D (frame.bytes_above_hard_fp
> +-                            + frame.below_hard_fp_saved_regs_size);
> ++      frame.initial_adjust =3D frame.frame_size -
> frame.bytes_below_saved_regs;
> +       frame.final_adjust =3D frame.bytes_below_saved_regs;
> +     }
> +   else if (frame.bytes_above_hard_fp.is_constant (&const_above_fp)
> +--
> +2.34.1
> +
> +
> +From f22315d5c19e8310e4dc880fd509678fd291fca8 Mon Sep 17 00:00:00 2001
> +From: Richard Sandiford <richard.sandiford@arm.com>
> +Date: Tue, 12 Sep 2023 16:08:54 +0100
> +Subject: [PATCH 14/19] aarch64: Tweak stack clash boundary condition
> +
> +The AArch64 ABI says that, when stack clash protection is used,
> +there can be a maximum of 1KiB of unprobed space at sp on entry
> +to a function.  Therefore, we need to probe when allocating
> +>=3D guard_size - 1KiB of data (>=3D rather than >).  This is what
> +GCC does.
> +
> +If an allocation is exactly guard_size bytes, it is enough to allocate
> +those bytes and probe once at offset 1024.  It isn't possible to use a
> +single probe at any other offset: higher would conmplicate later code,
> +by leaving more unprobed space than usual, while lower would risk
> +leaving an entire page unprobed.  For simplicity, the code probes all
> +allocations at offset 1024.
> +
> +Some register saves also act as probes.  If we need to allocate
> +more space below the last such register save probe, we need to
> +probe the allocation if it is > 1KiB.  Again, this allocation is
> +then sometimes (but not always) probed at offset 1024.  This sort of
> +allocation is currently only used for outgoing arguments, which are
> +rarely this big.
> +
> +However, the code also probed if this final outgoing-arguments
> +allocation was =3D=3D 1KiB, rather than just > 1KiB.  This isn't
> +necessary, since the register save then probes at offset 1024
> +as required.  Continuing to probe allocations of exactly 1KiB
> +would complicate later patches.
> +
> +gcc/
> +       * config/aarch64/aarch64.cc
> (aarch64_allocate_and_probe_stack_space):
> +       Don't probe final allocations that are exactly 1KiB in size (afte=
r
> +       unprobed space above the final allocation has been deducted).
> +
> +gcc/testsuite/
> +       * gcc.target/aarch64/stack-check-prologue-17.c: New test.
> +---
> + gcc/config/aarch64/aarch64.cc                 |  4 +-
> + .../aarch64/stack-check-prologue-17.c         | 55 +++++++++++++++++++
> + 2 files changed, 58 insertions(+), 1 deletion(-)
> + create mode 100644
> gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c
> +
> +diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> +index 4d9fcf3d162..34c1d8614cd 100644
> +--- a/gcc/config/aarch64/aarch64.cc
> ++++ b/gcc/config/aarch64/aarch64.cc
> +@@ -9333,9 +9333,11 @@ aarch64_allocate_and_probe_stack_space (rtx temp1=
,
> rtx temp2,
> +   HOST_WIDE_INT guard_size
> +     =3D 1 << param_stack_clash_protection_guard_size;
> +   HOST_WIDE_INT guard_used_by_caller =3D STACK_CLASH_CALLER_GUARD;
> ++  HOST_WIDE_INT byte_sp_alignment =3D STACK_BOUNDARY / BITS_PER_UNIT;
> ++  gcc_assert (multiple_p (poly_size, byte_sp_alignment));
> +   HOST_WIDE_INT min_probe_threshold
> +     =3D (final_adjustment_p
> +-       ? guard_used_by_caller
> ++       ? guard_used_by_caller + byte_sp_alignment
> +        : guard_size - guard_used_by_caller);
> +   /* When doing the final adjustment for the outgoing arguments, take
> into
> +      account any unprobed space there is above the current SP.  There a=
re
> +diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c
> b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c
> +new file mode 100644
> +index 00000000000..0d8a25d73a2
> +--- /dev/null
> ++++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c
> +@@ -0,0 +1,55 @@
> ++/* { dg-options "-O2 -fstack-clash-protection -fomit-frame-pointer
> --param stack-clash-protection-guard-size=3D12" } */
> ++/* { dg-final { check-function-bodies "**" "" } } */
> ++
> ++void f(int, ...);
> ++void g();
> ++
> ++/*
> ++** test1:
> ++**    ...
> ++**    str     x30, \[sp\]
> ++**    sub     sp, sp, #1024
> ++**    cbnz    w0, .*
> ++**    bl      g
> ++**    ...
> ++*/
> ++int test1(int z) {
> ++  __uint128_t x =3D 0;
> ++  int y[0x400];
> ++  if (z)
> ++    {
> ++      f(0, 0, 0, 0, 0, 0, 0, &y,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x);
> ++    }
> ++  g();
> ++  return 1;
> ++}
> ++
> ++/*
> ++** test2:
> ++**    ...
> ++**    str     x30, \[sp\]
> ++**    sub     sp, sp, #1040
> ++**    str     xzr, \[sp\]
> ++**    cbnz    w0, .*
> ++**    bl      g
> ++**    ...
> ++*/
> ++int test2(int z) {
> ++  __uint128_t x =3D 0;
> ++  int y[0x400];
> ++  if (z)
> ++    {
> ++      f(0, 0, 0, 0, 0, 0, 0, &y,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x);
> ++    }
> ++  g();
> ++  return 1;
> ++}
> +--
> +2.34.1
> +
> +
> +From 15e18831bf98fd25af098b970ebf0c9a6200a34b Mon Sep 17 00:00:00 2001
> +From: Richard Sandiford <richard.sandiford@arm.com>
> +Date: Tue, 12 Sep 2023 16:08:55 +0100
> +Subject: [PATCH 15/19] aarch64: Put LR save probe in first 16 bytes
> +
> +-fstack-clash-protection uses the save of LR as a probe for the next
> +allocation.  The next allocation could be:
> +
> +* another part of the static frame, e.g. when allocating SVE save slots
> +  or outgoing arguments
> +
> +* an alloca in the same function
> +
> +* an allocation made by a callee function
> +
> +However, when -fomit-frame-pointer is used, the LR save slot is placed
> +above the other GPR save slots.  It could therefore be up to 80 bytes
> +above the base of the GPR save area (which is also the hard fp address).
> +
> +aarch64_allocate_and_probe_stack_space took this into account when
> +deciding how much subsequent space could be allocated without needing
> +a probe.  However, it interacted badly with:
> +
> +      /* If doing a small final adjustment, we always probe at offset 0.
> +        This is done to avoid issues when LR is not at position 0 or whe=
n
> +        the final adjustment is smaller than the probing offset.  */
> +      else if (final_adjustment_p && rounded_size =3D=3D 0)
> +       residual_probe_offset =3D 0;
> +
> +which forces any allocation that is smaller than the guard page size
> +to be probed at offset 0 rather than the usual offset 1024.  It was
> +therefore possible to construct cases in which we had:
> +
> +* a probe using LR at SP + 80 bytes (or some other value >=3D 16)
> +* an allocation of the guard page size - 16 bytes
> +* a probe at SP + 0
> +
> +which allocates guard page size + 64 consecutive unprobed bytes.
> +
> +This patch requires the LR probe to be in the first 16 bytes of the
> +save area when stack clash protection is active.  Doing it
> +unconditionally would cause code-quality regressions.
> +
> +Putting LR before other registers prevents push/pop allocation
> +when shadow call stacks are enabled, since LR is restored
> +separately from the other callee-saved registers.
> +
> +The new comment doesn't say that the probe register is required
> +to be LR, since a later patch removes that restriction.
> +
> +gcc/
> +       * config/aarch64/aarch64.cc (aarch64_layout_frame): Ensure that
> +       the LR save slot is in the first 16 bytes of the register save
> area.
> +       Only form STP/LDP push/pop candidates if both registers are valid=
.
> +       (aarch64_allocate_and_probe_stack_space): Remove workaround for
> +       when LR was not in the first 16 bytes.
> +
> +gcc/testsuite/
> +       * gcc.target/aarch64/stack-check-prologue-18.c: New test.
> +       * gcc.target/aarch64/stack-check-prologue-19.c: Likewise.
> +       * gcc.target/aarch64/stack-check-prologue-20.c: Likewise.
> +---
> + gcc/config/aarch64/aarch64.cc                 |  72 ++++++-------
> + .../aarch64/stack-check-prologue-18.c         | 100 ++++++++++++++++++
> + .../aarch64/stack-check-prologue-19.c         | 100 ++++++++++++++++++
> + .../aarch64/stack-check-prologue-20.c         |   3 +
> + 4 files changed, 233 insertions(+), 42 deletions(-)
> + create mode 100644
> gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c
> + create mode 100644
> gcc/testsuite/gcc.target/aarch64/stack-check-prologue-19.c
> + create mode 100644
> gcc/testsuite/gcc.target/aarch64/stack-check-prologue-20.c
> +
> +diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> +index 34c1d8614cd..16433fb70f4 100644
> +--- a/gcc/config/aarch64/aarch64.cc
> ++++ b/gcc/config/aarch64/aarch64.cc
> +@@ -8273,26 +8273,34 @@ aarch64_layout_frame (void)
> +   bool saves_below_hard_fp_p
> +     =3D maybe_ne (frame.below_hard_fp_saved_regs_size, 0);
> +   frame.bytes_below_hard_fp =3D offset;
> ++
> ++  auto allocate_gpr_slot =3D [&](unsigned int regno)
> ++    {
> ++      frame.reg_offset[regno] =3D offset;
> ++      if (frame.wb_push_candidate1 =3D=3D INVALID_REGNUM)
> ++      frame.wb_push_candidate1 =3D regno;
> ++      else if (frame.wb_push_candidate2 =3D=3D INVALID_REGNUM)
> ++      frame.wb_push_candidate2 =3D regno;
> ++      offset +=3D UNITS_PER_WORD;
> ++    };
> ++
> +   if (frame.emit_frame_chain)
> +     {
> +       /* FP and LR are placed in the linkage record.  */
> +-      frame.reg_offset[R29_REGNUM] =3D offset;
> +-      frame.wb_push_candidate1 =3D R29_REGNUM;
> +-      frame.reg_offset[R30_REGNUM] =3D offset + UNITS_PER_WORD;
> +-      frame.wb_push_candidate2 =3D R30_REGNUM;
> +-      offset +=3D 2 * UNITS_PER_WORD;
> ++      allocate_gpr_slot (R29_REGNUM);
> ++      allocate_gpr_slot (R30_REGNUM);
> +     }
> ++  else if (flag_stack_clash_protection
> ++         && known_eq (frame.reg_offset[R30_REGNUM], SLOT_REQUIRED))
> ++    /* Put the LR save slot first, since it makes a good choice of prob=
e
> ++       for stack clash purposes.  The idea is that the link register
> usually
> ++       has to be saved before a call anyway, and so we lose little by
> ++       stopping it from being individually shrink-wrapped.  */
> ++    allocate_gpr_slot (R30_REGNUM);
> +
> +   for (regno =3D R0_REGNUM; regno <=3D R30_REGNUM; regno++)
> +     if (known_eq (frame.reg_offset[regno], SLOT_REQUIRED))
> +-      {
> +-      frame.reg_offset[regno] =3D offset;
> +-      if (frame.wb_push_candidate1 =3D=3D INVALID_REGNUM)
> +-        frame.wb_push_candidate1 =3D regno;
> +-      else if (frame.wb_push_candidate2 =3D=3D INVALID_REGNUM)
> +-        frame.wb_push_candidate2 =3D regno;
> +-      offset +=3D UNITS_PER_WORD;
> +-      }
> ++      allocate_gpr_slot (regno);
> +
> +   poly_int64 max_int_offset =3D offset;
> +   offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_UNI=
T);
> +@@ -8370,10 +8378,13 @@ aarch64_layout_frame (void)
> +      max_push_offset to 0, because no registers are popped at this time=
,
> +      so callee_adjust cannot be adjusted.  */
> +   HOST_WIDE_INT max_push_offset =3D 0;
> +-  if (frame.wb_pop_candidate2 !=3D INVALID_REGNUM)
> +-    max_push_offset =3D 512;
> +-  else if (frame.wb_pop_candidate1 !=3D INVALID_REGNUM)
> +-    max_push_offset =3D 256;
> ++  if (frame.wb_pop_candidate1 !=3D INVALID_REGNUM)
> ++    {
> ++      if (frame.wb_pop_candidate2 !=3D INVALID_REGNUM)
> ++      max_push_offset =3D 512;
> ++      else
> ++      max_push_offset =3D 256;
> ++    }
> +
> +   HOST_WIDE_INT const_size, const_below_saved_regs, const_above_fp;
> +   HOST_WIDE_INT const_saved_regs_size;
> +@@ -9339,29 +9350,6 @@ aarch64_allocate_and_probe_stack_space (rtx temp1=
,
> rtx temp2,
> +     =3D (final_adjustment_p
> +        ? guard_used_by_caller + byte_sp_alignment
> +        : guard_size - guard_used_by_caller);
> +-  /* When doing the final adjustment for the outgoing arguments, take
> into
> +-     account any unprobed space there is above the current SP.  There a=
re
> +-     two cases:
> +-
> +-     - When saving SVE registers below the hard frame pointer, we force
> +-       the lowest save to take place in the prologue before doing the
> final
> +-       adjustment (i.e. we don't allow the save to be shrink-wrapped).
> +-       This acts as a probe at SP, so there is no unprobed space.
> +-
> +-     - When there are no SVE register saves, we use the store of the li=
nk
> +-       register as a probe.  We can't assume that LR was saved at
> position 0
> +-       though, so treat any space below it as unprobed.  */
> +-  if (final_adjustment_p
> +-      && known_eq (frame.below_hard_fp_saved_regs_size, 0))
> +-    {
> +-      poly_int64 lr_offset =3D (frame.reg_offset[LR_REGNUM]
> +-                            - frame.bytes_below_saved_regs);
> +-      if (known_ge (lr_offset, 0))
> +-      min_probe_threshold -=3D lr_offset.to_constant ();
> +-      else
> +-      gcc_assert (!flag_stack_clash_protection || known_eq (poly_size,
> 0));
> +-    }
> +-
> +   poly_int64 frame_size =3D frame.frame_size;
> +
> +   /* We should always have a positive probe threshold.  */
> +@@ -9541,8 +9529,8 @@ aarch64_allocate_and_probe_stack_space (rtx temp1,
> rtx temp2,
> +       if (final_adjustment_p && rounded_size !=3D 0)
> +       min_probe_threshold =3D 0;
> +       /* If doing a small final adjustment, we always probe at offset 0=
.
> +-       This is done to avoid issues when LR is not at position 0 or whe=
n
> +-       the final adjustment is smaller than the probing offset.  */
> ++       This is done to avoid issues when the final adjustment is smalle=
r
> ++       than the probing offset.  */
> +       else if (final_adjustment_p && rounded_size =3D=3D 0)
> +       residual_probe_offset =3D 0;
> +
> +diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c
> b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c
> +new file mode 100644
> +index 00000000000..82447d20fff
> +--- /dev/null
> ++++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c
> +@@ -0,0 +1,100 @@
> ++/* { dg-options "-O2 -fstack-clash-protection -fomit-frame-pointer
> --param stack-clash-protection-guard-size=3D12" } */
> ++/* { dg-final { check-function-bodies "**" "" } } */
> ++
> ++void f(int, ...);
> ++void g();
> ++
> ++/*
> ++** test1:
> ++**    ...
> ++**    str     x30, \[sp\]
> ++**    sub     sp, sp, #4064
> ++**    str     xzr, \[sp\]
> ++**    cbnz    w0, .*
> ++**    bl      g
> ++**    ...
> ++**    str     x26, \[sp, #?4128\]
> ++**    ...
> ++*/
> ++int test1(int z) {
> ++  __uint128_t x =3D 0;
> ++  int y[0x400];
> ++  if (z)
> ++    {
> ++      asm volatile ("" :::
> ++                  "x19", "x20", "x21", "x22", "x23", "x24", "x25",
> "x26");
> ++      f(0, 0, 0, 0, 0, 0, 0, &y,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x);
> ++    }
> ++  g();
> ++  return 1;
> ++}
> ++
> ++/*
> ++** test2:
> ++**    ...
> ++**    str     x30, \[sp\]
> ++**    sub     sp, sp, #1040
> ++**    str     xzr, \[sp\]
> ++**    cbnz    w0, .*
> ++**    bl      g
> ++**    ...
> ++*/
> ++int test2(int z) {
> ++  __uint128_t x =3D 0;
> ++  int y[0x400];
> ++  if (z)
> ++    {
> ++      asm volatile ("" :::
> ++                  "x19", "x20", "x21", "x22", "x23", "x24", "x25",
> "x26");
> ++      f(0, 0, 0, 0, 0, 0, 0, &y,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x);
> ++    }
> ++  g();
> ++  return 1;
> ++}
> ++
> ++/*
> ++** test3:
> ++**    ...
> ++**    str     x30, \[sp\]
> ++**    sub     sp, sp, #1024
> ++**    cbnz    w0, .*
> ++**    bl      g
> ++**    ...
> ++*/
> ++int test3(int z) {
> ++  __uint128_t x =3D 0;
> ++  int y[0x400];
> ++  if (z)
> ++    {
> ++      asm volatile ("" :::
> ++                  "x19", "x20", "x21", "x22", "x23", "x24", "x25",
> "x26");
> ++      f(0, 0, 0, 0, 0, 0, 0, &y,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x);
> ++    }
> ++  g();
> ++  return 1;
> ++}
> +diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-19.c
> b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-19.c
> +new file mode 100644
> +index 00000000000..73ac3e4e4eb
> +--- /dev/null
> ++++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-19.c
> +@@ -0,0 +1,100 @@
> ++/* { dg-options "-O2 -fstack-clash-protection -fomit-frame-pointer
> --param stack-clash-protection-guard-size=3D12 -fsanitize=3Dshadow-call-s=
tack
> -ffixed-x18" } */
> ++/* { dg-final { check-function-bodies "**" "" } } */
> ++
> ++void f(int, ...);
> ++void g();
> ++
> ++/*
> ++** test1:
> ++**    ...
> ++**    str     x30, \[sp\]
> ++**    sub     sp, sp, #4064
> ++**    str     xzr, \[sp\]
> ++**    cbnz    w0, .*
> ++**    bl      g
> ++**    ...
> ++**    str     x26, \[sp, #?4128\]
> ++**    ...
> ++*/
> ++int test1(int z) {
> ++  __uint128_t x =3D 0;
> ++  int y[0x400];
> ++  if (z)
> ++    {
> ++      asm volatile ("" :::
> ++                  "x19", "x20", "x21", "x22", "x23", "x24", "x25",
> "x26");
> ++      f(0, 0, 0, 0, 0, 0, 0, &y,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x);
> ++    }
> ++  g();
> ++  return 1;
> ++}
> ++
> ++/*
> ++** test2:
> ++**    ...
> ++**    str     x30, \[sp\]
> ++**    sub     sp, sp, #1040
> ++**    str     xzr, \[sp\]
> ++**    cbnz    w0, .*
> ++**    bl      g
> ++**    ...
> ++*/
> ++int test2(int z) {
> ++  __uint128_t x =3D 0;
> ++  int y[0x400];
> ++  if (z)
> ++    {
> ++      asm volatile ("" :::
> ++                  "x19", "x20", "x21", "x22", "x23", "x24", "x25",
> "x26");
> ++      f(0, 0, 0, 0, 0, 0, 0, &y,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x);
> ++    }
> ++  g();
> ++  return 1;
> ++}
> ++
> ++/*
> ++** test3:
> ++**    ...
> ++**    str     x30, \[sp\]
> ++**    sub     sp, sp, #1024
> ++**    cbnz    w0, .*
> ++**    bl      g
> ++**    ...
> ++*/
> ++int test3(int z) {
> ++  __uint128_t x =3D 0;
> ++  int y[0x400];
> ++  if (z)
> ++    {
> ++      asm volatile ("" :::
> ++                  "x19", "x20", "x21", "x22", "x23", "x24", "x25",
> "x26");
> ++      f(0, 0, 0, 0, 0, 0, 0, &y,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> ++      x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x);
> ++    }
> ++  g();
> ++  return 1;
> ++}
> +diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-20.c
> b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-20.c
> +new file mode 100644
> +index 00000000000..690aae8dfd5
> +--- /dev/null
> ++++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-20.c
> +@@ -0,0 +1,3 @@
> ++/* { dg-options "-O2 -fstack-protector-all -fstack-clash-protection
> -fomit-frame-pointer --param stack-clash-protection-guard-size=3D12
> -fsanitize=3Dshadow-call-stack -ffixed-x18" } */
> ++
> ++#include "stack-check-prologue-19.c"
> +--
> +2.34.1
> +
> +
> +From c4f0e121faa36342f1d21919e54a05ad841c4f86 Mon Sep 17 00:00:00 2001
> +From: Richard Sandiford <richard.sandiford@arm.com>
> +Date: Tue, 12 Sep 2023 16:08:55 +0100
> +Subject: [PATCH 16/19] aarch64: Simplify probe of final frame allocation
> +
> +Previous patches ensured that the final frame allocation only needs
> +a probe when the size is strictly greater than 1KiB.  It's therefore
> +safe to use the normal 1024 probe offset in all cases.
> +
> +The main motivation for doing this is to simplify the code and
> +remove the number of special cases.
> +
> +gcc/
> +       * config/aarch64/aarch64.cc
> (aarch64_allocate_and_probe_stack_space):
> +       Always probe the residual allocation at offset 1024, asserting
> +       that that is in range.
> +
> +gcc/testsuite/
> +       * gcc.target/aarch64/stack-check-prologue-17.c: Expect the probe
> +       to be at offset 1024 rather than offset 0.
> +       * gcc.target/aarch64/stack-check-prologue-18.c: Likewise.
> +       * gcc.target/aarch64/stack-check-prologue-19.c: Likewise.
> +---
> + gcc/config/aarch64/aarch64.cc                        | 12 ++++--------
> + .../gcc.target/aarch64/stack-check-prologue-17.c     |  2 +-
> + .../gcc.target/aarch64/stack-check-prologue-18.c     |  4 ++--
> + .../gcc.target/aarch64/stack-check-prologue-19.c     |  4 ++--
> + 4 files changed, 9 insertions(+), 13 deletions(-)
> +
> +diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> +index 16433fb70f4..8abf3d7a1e2 100644
> +--- a/gcc/config/aarch64/aarch64.cc
> ++++ b/gcc/config/aarch64/aarch64.cc
> +@@ -9523,16 +9523,12 @@ aarch64_allocate_and_probe_stack_space (rtx
> temp1, rtx temp2,
> +      are still safe.  */
> +   if (residual)
> +     {
> +-      HOST_WIDE_INT residual_probe_offset =3D guard_used_by_caller;
> ++      gcc_assert (guard_used_by_caller + byte_sp_alignment <=3D size);
> ++
> +       /* If we're doing final adjustments, and we've done any full page
> +        allocations then any residual needs to be probed.  */
> +       if (final_adjustment_p && rounded_size !=3D 0)
> +       min_probe_threshold =3D 0;
> +-      /* If doing a small final adjustment, we always probe at offset 0=
.
> +-       This is done to avoid issues when the final adjustment is smalle=
r
> +-       than the probing offset.  */
> +-      else if (final_adjustment_p && rounded_size =3D=3D 0)
> +-      residual_probe_offset =3D 0;
> +
> +       aarch64_sub_sp (temp1, temp2, residual, frame_related_p);
> +       if (residual >=3D min_probe_threshold)
> +@@ -9543,8 +9539,8 @@ aarch64_allocate_and_probe_stack_space (rtx temp1,
> rtx temp2,
> +                    HOST_WIDE_INT_PRINT_DEC " bytes, probing will be
> required."
> +                    "\n", residual);
> +
> +-          emit_stack_probe (plus_constant (Pmode, stack_pointer_rtx,
> +-                                           residual_probe_offset));
> ++        emit_stack_probe (plus_constant (Pmode, stack_pointer_rtx,
> ++                                         guard_used_by_caller));
> +         emit_insn (gen_blockage ());
> +       }
> +     }
> +diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c
> b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c
> +index 0d8a25d73a2..f0ec1389771 100644
> +--- a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c
> ++++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c
> +@@ -33,7 +33,7 @@ int test1(int z) {
> + **    ...
> + **    str     x30, \[sp\]
> + **    sub     sp, sp, #1040
> +-**    str     xzr, \[sp\]
> ++**    str     xzr, \[sp, #?1024\]
> + **    cbnz    w0, .*
> + **    bl      g
> + **    ...
> +diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c
> b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c
> +index 82447d20fff..6383bec5ebc 100644
> +--- a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c
> ++++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c
> +@@ -9,7 +9,7 @@ void g();
> + **    ...
> + **    str     x30, \[sp\]
> + **    sub     sp, sp, #4064
> +-**    str     xzr, \[sp\]
> ++**    str     xzr, \[sp, #?1024\]
> + **    cbnz    w0, .*
> + **    bl      g
> + **    ...
> +@@ -50,7 +50,7 @@ int test1(int z) {
> + **    ...
> + **    str     x30, \[sp\]
> + **    sub     sp, sp, #1040
> +-**    str     xzr, \[sp\]
> ++**    str     xzr, \[sp, #?1024\]
> + **    cbnz    w0, .*
> + **    bl      g
> + **    ...
> +diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-19.c
> b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-19.c
> +index 73ac3e4e4eb..562039b5e9b 100644
> +--- a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-19.c
> ++++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-19.c
> +@@ -9,7 +9,7 @@ void g();
> + **    ...
> + **    str     x30, \[sp\]
> + **    sub     sp, sp, #4064
> +-**    str     xzr, \[sp\]
> ++**    str     xzr, \[sp, #?1024\]
> + **    cbnz    w0, .*
> + **    bl      g
> + **    ...
> +@@ -50,7 +50,7 @@ int test1(int z) {
> + **    ...
> + **    str     x30, \[sp\]
> + **    sub     sp, sp, #1040
> +-**    str     xzr, \[sp\]
> ++**    str     xzr, \[sp, #?1024\]
> + **    cbnz    w0, .*
> + **    bl      g
> + **    ...
> +--
> +2.34.1
> +
> +
> +From 6f0ab0a9f46a17b68349ff6035aa776bf65f0575 Mon Sep 17 00:00:00 2001
> +From: Richard Sandiford <richard.sandiford@arm.com>
> +Date: Tue, 12 Sep 2023 16:08:56 +0100
> +Subject: [PATCH 17/19] aarch64: Explicitly record probe registers in fra=
me
> + info
> +
> +The stack frame is currently divided into three areas:
> +
> +A: the area above the hard frame pointer
> +B: the SVE saves below the hard frame pointer
> +C: the outgoing arguments
> +
> +If the stack frame is allocated in one chunk, the allocation needs a
> +probe if the frame size is >=3D guard_size - 1KiB.  In addition, if the
> +function is not a leaf function, it must probe an address no more than
> +1KiB above the outgoing SP.  We ensured the second condition by
> +
> +(1) using single-chunk allocations for non-leaf functions only if
> +    the link register save slot is within 512 bytes of the bottom
> +    of the frame; and
> +
> +(2) using the link register save as a probe (meaning, for instance,
> +    that it can't be individually shrink wrapped)
> +
> +If instead the stack is allocated in multiple chunks, then:
> +
> +* an allocation involving only the outgoing arguments (C above) requires
> +  a probe if the allocation size is > 1KiB
> +
> +* any other allocation requires a probe if the allocation size
> +  is >=3D guard_size - 1KiB
> +
> +* second and subsequent allocations require the previous allocation
> +  to probe at the bottom of the allocated area, regardless of the size
> +  of that previous allocation
> +
> +The final point means that, unlike for single allocations,
> +it can be necessary to have both a non-SVE register probe and
> +an SVE register probe.  For example:
> +
> +* allocate A, probe using a non-SVE register save
> +* allocate B, probe using an SVE register save
> +* allocate C
> +
> +The non-SVE register used in this case was again the link register.
> +It was previously used even if the link register save slot was some
> +bytes above the bottom of the non-SVE register saves, but an earlier
> +patch avoided that by putting the link register save slot first.
> +
> +As a belt-and-braces fix, this patch explicitly records which
> +probe registers we're using and allows the non-SVE probe to be
> +whichever register comes first (as for SVE).
> +
> +The patch also avoids unnecessary probes in sve/pcs/stack_clash_3.c.
> +
> +gcc/
> +       * config/aarch64/aarch64.h (aarch64_frame::sve_save_and_probe)
> +       (aarch64_frame::hard_fp_save_and_probe): New fields.
> +       * config/aarch64/aarch64.cc (aarch64_layout_frame): Initialize
> them.
> +       Rather than asserting that a leaf function saves LR, instead asse=
rt
> +       that a leaf function saves something.
> +       (aarch64_get_separate_components): Prevent the chosen probe
> +       registers from being individually shrink-wrapped.
> +       (aarch64_allocate_and_probe_stack_space): Remove workaround for
> +       probe registers that aren't at the bottom of the previous
> allocation.
> +
> +gcc/testsuite/
> +       * gcc.target/aarch64/sve/pcs/stack_clash_3.c: Avoid redundant
> probes.
> +---
> + gcc/config/aarch64/aarch64.cc                 | 68 +++++++++++++++----
> + gcc/config/aarch64/aarch64.h                  |  8 +++
> + .../aarch64/sve/pcs/stack_clash_3.c           |  6 +-
> + 3 files changed, 64 insertions(+), 18 deletions(-)
> +
> +diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> +index 8abf3d7a1e2..a8d907df884 100644
> +--- a/gcc/config/aarch64/aarch64.cc
> ++++ b/gcc/config/aarch64/aarch64.cc
> +@@ -8210,15 +8210,11 @@ aarch64_layout_frame (void)
> +       && !crtl->abi->clobbers_full_reg_p (regno))
> +       frame.reg_offset[regno] =3D SLOT_REQUIRED;
> +
> +-  /* With stack-clash, LR must be saved in non-leaf functions.  The
> saving of
> +-     LR counts as an implicit probe which allows us to maintain the
> invariant
> +-     described in the comment at expand_prologue.  */
> +-  gcc_assert (crtl->is_leaf
> +-            || maybe_ne (frame.reg_offset[R30_REGNUM],
> SLOT_NOT_REQUIRED));
> +
> +   poly_int64 offset =3D crtl->outgoing_args_size;
> +   gcc_assert (multiple_p (offset, STACK_BOUNDARY / BITS_PER_UNIT));
> +   frame.bytes_below_saved_regs =3D offset;
> ++  frame.sve_save_and_probe =3D INVALID_REGNUM;
> +
> +   /* Now assign stack slots for the registers.  Start with the predicat=
e
> +      registers, since predicate LDR and STR have a relatively small
> +@@ -8226,6 +8222,8 @@ aarch64_layout_frame (void)
> +   for (regno =3D P0_REGNUM; regno <=3D P15_REGNUM; regno++)
> +     if (known_eq (frame.reg_offset[regno], SLOT_REQUIRED))
> +       {
> ++      if (frame.sve_save_and_probe =3D=3D INVALID_REGNUM)
> ++        frame.sve_save_and_probe =3D regno;
> +       frame.reg_offset[regno] =3D offset;
> +       offset +=3D BYTES_PER_SVE_PRED;
> +       }
> +@@ -8263,6 +8261,8 @@ aarch64_layout_frame (void)
> +     for (regno =3D V0_REGNUM; regno <=3D V31_REGNUM; regno++)
> +       if (known_eq (frame.reg_offset[regno], SLOT_REQUIRED))
> +       {
> ++        if (frame.sve_save_and_probe =3D=3D INVALID_REGNUM)
> ++          frame.sve_save_and_probe =3D regno;
> +         frame.reg_offset[regno] =3D offset;
> +         offset +=3D vector_save_size;
> +       }
> +@@ -8272,10 +8272,18 @@ aarch64_layout_frame (void)
> +   frame.below_hard_fp_saved_regs_size =3D offset -
> frame.bytes_below_saved_regs;
> +   bool saves_below_hard_fp_p
> +     =3D maybe_ne (frame.below_hard_fp_saved_regs_size, 0);
> ++  gcc_assert (!saves_below_hard_fp_p
> ++            || (frame.sve_save_and_probe !=3D INVALID_REGNUM
> ++                && known_eq (frame.reg_offset[frame.sve_save_and_probe]=
,
> ++                             frame.bytes_below_saved_regs)));
> ++
> +   frame.bytes_below_hard_fp =3D offset;
> ++  frame.hard_fp_save_and_probe =3D INVALID_REGNUM;
> +
> +   auto allocate_gpr_slot =3D [&](unsigned int regno)
> +     {
> ++      if (frame.hard_fp_save_and_probe =3D=3D INVALID_REGNUM)
> ++      frame.hard_fp_save_and_probe =3D regno;
> +       frame.reg_offset[regno] =3D offset;
> +       if (frame.wb_push_candidate1 =3D=3D INVALID_REGNUM)
> +       frame.wb_push_candidate1 =3D regno;
> +@@ -8309,6 +8317,8 @@ aarch64_layout_frame (void)
> +   for (regno =3D V0_REGNUM; regno <=3D V31_REGNUM; regno++)
> +     if (known_eq (frame.reg_offset[regno], SLOT_REQUIRED))
> +       {
> ++      if (frame.hard_fp_save_and_probe =3D=3D INVALID_REGNUM)
> ++        frame.hard_fp_save_and_probe =3D regno;
> +       /* If there is an alignment gap between integer and fp
> callee-saves,
> +          allocate the last fp register to it if possible.  */
> +       if (regno =3D=3D last_fp_reg
> +@@ -8332,6 +8342,17 @@ aarch64_layout_frame (void)
> +   offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_UNI=
T);
> +
> +   frame.saved_regs_size =3D offset - frame.bytes_below_saved_regs;
> ++  gcc_assert (known_eq (frame.saved_regs_size,
> ++                      frame.below_hard_fp_saved_regs_size)
> ++            || (frame.hard_fp_save_and_probe !=3D INVALID_REGNUM
> ++                && known_eq
> (frame.reg_offset[frame.hard_fp_save_and_probe],
> ++                             frame.bytes_below_hard_fp)));
> ++
> ++  /* With stack-clash, a register must be saved in non-leaf functions.
> ++     The saving of the bottommost register counts as an implicit probe,
> ++     which allows us to maintain the invariant described in the comment
> ++     at expand_prologue.  */
> ++  gcc_assert (crtl->is_leaf || maybe_ne (frame.saved_regs_size, 0));
> +
> +   offset +=3D get_frame_size ();
> +   offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_UNI=
T);
> +@@ -8462,6 +8483,25 @@ aarch64_layout_frame (void)
> +       frame.final_adjust =3D frame.bytes_below_saved_regs;
> +     }
> +
> ++  /* The frame is allocated in pieces, with each non-final piece
> ++     including a register save at offset 0 that acts as a probe for
> ++     the following piece.  In addition, the save of the bottommost
> register
> ++     acts as a probe for callees and allocas.  Roll back any probes tha=
t
> ++     aren't needed.
> ++
> ++     A probe isn't needed if it is associated with the final allocation
> ++     (including callees and allocas) that happens before the epilogue i=
s
> ++     executed.  */
> ++  if (crtl->is_leaf
> ++      && !cfun->calls_alloca
> ++      && known_eq (frame.final_adjust, 0))
> ++    {
> ++      if (maybe_ne (frame.sve_callee_adjust, 0))
> ++      frame.sve_save_and_probe =3D INVALID_REGNUM;
> ++      else
> ++      frame.hard_fp_save_and_probe =3D INVALID_REGNUM;
> ++    }
> ++
> +   /* Make sure the individual adjustments add up to the full frame
> size.  */
> +   gcc_assert (known_eq (frame.initial_adjust
> +                       + frame.callee_adjust
> +@@ -9039,13 +9079,6 @@ aarch64_get_separate_components (void)
> +
> +       poly_int64 offset =3D frame.reg_offset[regno];
> +
> +-      /* If the register is saved in the first SVE save slot, we use
> +-         it as a stack probe for -fstack-clash-protection.  */
> +-      if (flag_stack_clash_protection
> +-          && maybe_ne (frame.below_hard_fp_saved_regs_size, 0)
> +-          && known_eq (offset, frame.bytes_below_saved_regs))
> +-        continue;
> +-
> +       /* Get the offset relative to the register we'll use.  */
> +       if (frame_pointer_needed)
> +         offset -=3D frame.bytes_below_hard_fp;
> +@@ -9080,6 +9113,13 @@ aarch64_get_separate_components (void)
> +
> +   bitmap_clear_bit (components, LR_REGNUM);
> +   bitmap_clear_bit (components, SP_REGNUM);
> ++  if (flag_stack_clash_protection)
> ++    {
> ++      if (frame.sve_save_and_probe !=3D INVALID_REGNUM)
> ++      bitmap_clear_bit (components, frame.sve_save_and_probe);
> ++      if (frame.hard_fp_save_and_probe !=3D INVALID_REGNUM)
> ++      bitmap_clear_bit (components, frame.hard_fp_save_and_probe);
> ++    }
> +
> +   return components;
> + }
> +@@ -9616,8 +9656,8 @@ aarch64_epilogue_uses (int regno)
> +    When probing is needed, we emit a probe at the start of the prologue
> +    and every PARAM_STACK_CLASH_PROTECTION_GUARD_SIZE bytes thereafter.
> +
> +-   We have to track how much space has been allocated and the only stor=
es
> +-   to the stack we track as implicit probes are the FP/LR stores.
> ++   We can also use register saves as probes.  These are stored in
> ++   sve_save_and_probe and hard_fp_save_and_probe.
> +
> +    For outgoing arguments we probe if the size is larger than 1KB, such
> that
> +    the ABI specified buffer is maintained for the next callee.
> +diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
> +index b6135837073..46d4693e206 100644
> +--- a/gcc/config/aarch64/aarch64.h
> ++++ b/gcc/config/aarch64/aarch64.h
> +@@ -957,6 +957,14 @@ struct GTY (()) aarch64_frame
> +      This is the register they should use.  */
> +   unsigned spare_pred_reg;
> +
> ++  /* An SVE register that is saved below the hard frame pointer and tha=
t
> acts
> ++     as a probe for later allocations, or INVALID_REGNUM if none.  */
> ++  unsigned sve_save_and_probe;
> ++
> ++  /* A register that is saved at the hard frame pointer and that acts
> ++     as a probe for later allocations, or INVALID_REGNUM if none.  */
> ++  unsigned hard_fp_save_and_probe;
> ++
> +   bool laid_out;
> +
> +   /* True if shadow call stack should be enabled for the current
> function.  */
> +diff --git a/gcc/testsuite/gcc.target/aarch64/sve/pcs/stack_clash_3.c
> b/gcc/testsuite/gcc.target/aarch64/sve/pcs/stack_clash_3.c
> +index 3e01ec36c3a..3530a0d504b 100644
> +--- a/gcc/testsuite/gcc.target/aarch64/sve/pcs/stack_clash_3.c
> ++++ b/gcc/testsuite/gcc.target/aarch64/sve/pcs/stack_clash_3.c
> +@@ -11,11 +11,10 @@
> + **    mov     x11, sp
> + **    ...
> + **    sub     sp, sp, x13
> +-**    str     p4, \[sp\]
> + **    cbz     w0, [^\n]*
> ++**    str     p4, \[sp\]
> + **    ...
> + **    ptrue   p0\.b, all
> +-**    ldr     p4, \[sp\]
> + **    addvl   sp, sp, #1
> + **    ldr     x24, \[sp\], 32
> + **    ret
> +@@ -39,13 +38,12 @@ test_1 (int n)
> + **    mov     x11, sp
> + **    ...
> + **    sub     sp, sp, x13
> +-**    str     p4, \[sp\]
> + **    cbz     w0, [^\n]*
> ++**    str     p4, \[sp\]
> + **    str     p5, \[sp, #1, mul vl\]
> + **    str     p6, \[sp, #2, mul vl\]
> + **    ...
> + **    ptrue   p0\.b, all
> +-**    ldr     p4, \[sp\]
> + **    addvl   sp, sp, #1
> + **    ldr     x24, \[sp\], 32
> + **    ret
> +--
> +2.34.1
> +
> +
> +From 8254e1b9cd500e0c278465a3657543477e9d1250 Mon Sep 17 00:00:00 2001
> +From: Richard Sandiford <richard.sandiford@arm.com>
> +Date: Tue, 12 Sep 2023 16:08:56 +0100
> +Subject: [PATCH 18/19] aarch64: Remove below_hard_fp_saved_regs_size
> +
> +After previous patches, it's no longer necessary to store
> +saved_regs_size and below_hard_fp_saved_regs_size in the frame info.
> +All measurements instead use the top or bottom of the frame as
> +reference points.
> +
> +gcc/
> +       * config/aarch64/aarch64.h (aarch64_frame::saved_regs_size)
> +       (aarch64_frame::below_hard_fp_saved_regs_size): Delete.
> +       * config/aarch64/aarch64.cc (aarch64_layout_frame): Update
> accordingly.
> +---
> + gcc/config/aarch64/aarch64.cc | 45 ++++++++++++++++-------------------
> + gcc/config/aarch64/aarch64.h  |  7 ------
> + 2 files changed, 21 insertions(+), 31 deletions(-)
> +
> +diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> +index a8d907df884..ac3d3b336a3 100644
> +--- a/gcc/config/aarch64/aarch64.cc
> ++++ b/gcc/config/aarch64/aarch64.cc
> +@@ -8269,9 +8269,8 @@ aarch64_layout_frame (void)
> +
> +   /* OFFSET is now the offset of the hard frame pointer from the bottom
> +      of the callee save area.  */
> +-  frame.below_hard_fp_saved_regs_size =3D offset -
> frame.bytes_below_saved_regs;
> +-  bool saves_below_hard_fp_p
> +-    =3D maybe_ne (frame.below_hard_fp_saved_regs_size, 0);
> ++  auto below_hard_fp_saved_regs_size =3D offset -
> frame.bytes_below_saved_regs;
> ++  bool saves_below_hard_fp_p =3D maybe_ne (below_hard_fp_saved_regs_siz=
e,
> 0);
> +   gcc_assert (!saves_below_hard_fp_p
> +             || (frame.sve_save_and_probe !=3D INVALID_REGNUM
> +                 && known_eq (frame.reg_offset[frame.sve_save_and_probe]=
,
> +@@ -8341,9 +8340,8 @@ aarch64_layout_frame (void)
> +
> +   offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_UNI=
T);
> +
> +-  frame.saved_regs_size =3D offset - frame.bytes_below_saved_regs;
> +-  gcc_assert (known_eq (frame.saved_regs_size,
> +-                      frame.below_hard_fp_saved_regs_size)
> ++  auto saved_regs_size =3D offset - frame.bytes_below_saved_regs;
> ++  gcc_assert (known_eq (saved_regs_size, below_hard_fp_saved_regs_size)
> +             || (frame.hard_fp_save_and_probe !=3D INVALID_REGNUM
> +                 && known_eq
> (frame.reg_offset[frame.hard_fp_save_and_probe],
> +                              frame.bytes_below_hard_fp)));
> +@@ -8352,7 +8350,7 @@ aarch64_layout_frame (void)
> +      The saving of the bottommost register counts as an implicit probe,
> +      which allows us to maintain the invariant described in the comment
> +      at expand_prologue.  */
> +-  gcc_assert (crtl->is_leaf || maybe_ne (frame.saved_regs_size, 0));
> ++  gcc_assert (crtl->is_leaf || maybe_ne (saved_regs_size, 0));
> +
> +   offset +=3D get_frame_size ();
> +   offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_UNI=
T);
> +@@ -8409,7 +8407,7 @@ aarch64_layout_frame (void)
> +
> +   HOST_WIDE_INT const_size, const_below_saved_regs, const_above_fp;
> +   HOST_WIDE_INT const_saved_regs_size;
> +-  if (known_eq (frame.saved_regs_size, 0))
> ++  if (known_eq (saved_regs_size, 0))
> +     frame.initial_adjust =3D frame.frame_size;
> +   else if (frame.frame_size.is_constant (&const_size)
> +          && const_size < max_push_offset
> +@@ -8422,7 +8420,7 @@ aarch64_layout_frame (void)
> +       frame.callee_adjust =3D const_size;
> +     }
> +   else if (frame.bytes_below_saved_regs.is_constant
> (&const_below_saved_regs)
> +-         && frame.saved_regs_size.is_constant (&const_saved_regs_size)
> ++         && saved_regs_size.is_constant (&const_saved_regs_size)
> +          && const_below_saved_regs + const_saved_regs_size < 512
> +          /* We could handle this case even with data below the saved
> +             registers, provided that that data left us with valid offse=
ts
> +@@ -8441,8 +8439,7 @@ aarch64_layout_frame (void)
> +       frame.initial_adjust =3D frame.frame_size;
> +     }
> +   else if (saves_below_hard_fp_p
> +-         && known_eq (frame.saved_regs_size,
> +-                      frame.below_hard_fp_saved_regs_size))
> ++         && known_eq (saved_regs_size, below_hard_fp_saved_regs_size))
> +     {
> +       /* Frame in which all saves are SVE saves:
> +
> +@@ -8464,7 +8461,7 @@ aarch64_layout_frame (void)
> +        [save SVE registers relative to SP]
> +        sub sp, sp, bytes_below_saved_regs  */
> +       frame.callee_adjust =3D const_above_fp;
> +-      frame.sve_callee_adjust =3D frame.below_hard_fp_saved_regs_size;
> ++      frame.sve_callee_adjust =3D below_hard_fp_saved_regs_size;
> +       frame.final_adjust =3D frame.bytes_below_saved_regs;
> +     }
> +   else
> +@@ -8479,7 +8476,7 @@ aarch64_layout_frame (void)
> +        [save SVE registers relative to SP]
> +        sub sp, sp, bytes_below_saved_regs  */
> +       frame.initial_adjust =3D frame.bytes_above_hard_fp;
> +-      frame.sve_callee_adjust =3D frame.below_hard_fp_saved_regs_size;
> ++      frame.sve_callee_adjust =3D below_hard_fp_saved_regs_size;
> +       frame.final_adjust =3D frame.bytes_below_saved_regs;
> +     }
> +
> +@@ -9621,17 +9618,17 @@ aarch64_epilogue_uses (int regno)
> +       |  local variables              | <-- frame_pointer_rtx
> +       |                               |
> +       +-------------------------------+
> +-      |  padding                      | \
> +-      +-------------------------------+  |
> +-      |  callee-saved registers       |  | frame.saved_regs_size
> +-      +-------------------------------+  |
> +-      |  LR'                          |  |
> +-      +-------------------------------+  |
> +-      |  FP'                          |  |
> +-      +-------------------------------+  |<- hard_frame_pointer_rtx
> (aligned)
> +-      |  SVE vector registers         |  | \
> +-      +-------------------------------+  |  |
> below_hard_fp_saved_regs_size
> +-      |  SVE predicate registers      | /  /
> ++      |  padding                      |
> ++      +-------------------------------+
> ++      |  callee-saved registers       |
> ++      +-------------------------------+
> ++      |  LR'                          |
> ++      +-------------------------------+
> ++      |  FP'                          |
> ++      +-------------------------------+ <-- hard_frame_pointer_rtx
> (aligned)
> ++      |  SVE vector registers         |
> ++      +-------------------------------+
> ++      |  SVE predicate registers      |
> +       +-------------------------------+
> +       |  dynamic allocation           |
> +       +-------------------------------+
> +diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
> +index 46d4693e206..01f7751bc78 100644
> +--- a/gcc/config/aarch64/aarch64.h
> ++++ b/gcc/config/aarch64/aarch64.h
> +@@ -871,18 +871,11 @@ struct GTY (()) aarch64_frame
> +      STACK_BOUNDARY.  */
> +   HOST_WIDE_INT saved_varargs_size;
> +
> +-  /* The size of the callee-save registers with a slot in REG_OFFSET.  =
*/
> +-  poly_int64 saved_regs_size;
> +-
> +   /* The number of bytes between the bottom of the static frame (the
> bottom
> +      of the outgoing arguments) and the bottom of the register save are=
a.
> +      This value is always a multiple of STACK_BOUNDARY.  */
> +   poly_int64 bytes_below_saved_regs;
> +
> +-  /* The size of the callee-save registers with a slot in REG_OFFSET th=
at
> +-     are saved below the hard frame pointer.  */
> +-  poly_int64 below_hard_fp_saved_regs_size;
> +-
> +   /* The number of bytes between the bottom of the static frame (the
> bottom
> +      of the outgoing arguments) and the hard frame pointer.  This value
> is
> +      always a multiple of STACK_BOUNDARY.  */
> +--
> +2.34.1
> +
> +
> +From 75c37e031408262263442f5b4cdb83d3777b6422 Mon Sep 17 00:00:00 2001
> +From: Richard Sandiford <richard.sandiford@arm.com>
> +Date: Tue, 12 Sep 2023 16:08:57 +0100
> +Subject: [PATCH 19/19] aarch64: Make stack smash canary protect saved
> + registers
> +
> +AArch64 normally puts the saved registers near the bottom of the frame,
> +immediately above any dynamic allocations.  But this means that a
> +stack-smash attack on those dynamic allocations could overwrite the
> +saved registers without needing to reach as far as the stack smash
> +canary.
> +
> +The same thing could also happen for variable-sized arguments that are
> +passed by value, since those are allocated before a call and popped on
> +return.
> +
> +This patch avoids that by putting the locals (and thus the canary) below
> +the saved registers when stack smash protection is active.
> +
> +The patch fixes CVE-2023-4039.
> +
> +gcc/
> +       * config/aarch64/aarch64.cc (aarch64_save_regs_above_locals_p):
> +       New function.
> +       (aarch64_layout_frame): Use it to decide whether locals should
> +       go above or below the saved registers.
> +       (aarch64_expand_prologue): Update stack layout comment.
> +       Emit a stack tie after the final adjustment.
> +
> +gcc/testsuite/
> +       * gcc.target/aarch64/stack-protector-8.c: New test.
> +       * gcc.target/aarch64/stack-protector-9.c: Likewise.
> +---
> + gcc/config/aarch64/aarch64.cc                 | 46 +++++++--
> + .../gcc.target/aarch64/stack-protector-8.c    | 95 +++++++++++++++++++
> + .../gcc.target/aarch64/stack-protector-9.c    | 33 +++++++
> + 3 files changed, 168 insertions(+), 6 deletions(-)
> + create mode 100644 gcc/testsuite/gcc.target/aarch64/stack-protector-8.c
> + create mode 100644 gcc/testsuite/gcc.target/aarch64/stack-protector-9.c
> +
> +diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.=
cc
> +index ac3d3b336a3..96c3f48fdc4 100644
> +--- a/gcc/config/aarch64/aarch64.cc
> ++++ b/gcc/config/aarch64/aarch64.cc
> +@@ -8133,6 +8133,20 @@ aarch64_needs_frame_chain (void)
> +   return aarch64_use_frame_pointer;
> + }
> +
> ++/* Return true if the current function should save registers above
> ++   the locals area, rather than below it.  */
> ++
> ++static bool
> ++aarch64_save_regs_above_locals_p ()
> ++{
> ++  /* When using stack smash protection, make sure that the canary slot
> ++     comes between the locals and the saved registers.  Otherwise,
> ++     it would be possible for a carefully sized smash attack to change
> ++     the saved registers (particularly LR and FP) without reaching the
> ++     canary.  */
> ++  return crtl->stack_protect_guard;
> ++}
> ++
> + /* Mark the registers that need to be saved by the callee and calculate
> +    the size of the callee-saved registers area and frame record (both F=
P
> +    and LR may be omitted).  */
> +@@ -8144,6 +8158,7 @@ aarch64_layout_frame (void)
> +   poly_int64 vector_save_size =3D GET_MODE_SIZE (vector_save_mode);
> +   bool frame_related_fp_reg_p =3D false;
> +   aarch64_frame &frame =3D cfun->machine->frame;
> ++  poly_int64 top_of_locals =3D -1;
> +
> +   frame.emit_frame_chain =3D aarch64_needs_frame_chain ();
> +
> +@@ -8210,9 +8225,16 @@ aarch64_layout_frame (void)
> +       && !crtl->abi->clobbers_full_reg_p (regno))
> +       frame.reg_offset[regno] =3D SLOT_REQUIRED;
> +
> ++  bool regs_at_top_p =3D aarch64_save_regs_above_locals_p ();
> +
> +   poly_int64 offset =3D crtl->outgoing_args_size;
> +   gcc_assert (multiple_p (offset, STACK_BOUNDARY / BITS_PER_UNIT));
> ++  if (regs_at_top_p)
> ++    {
> ++      offset +=3D get_frame_size ();
> ++      offset =3D aligned_upper_bound (offset, STACK_BOUNDARY /
> BITS_PER_UNIT);
> ++      top_of_locals =3D offset;
> ++    }
> +   frame.bytes_below_saved_regs =3D offset;
> +   frame.sve_save_and_probe =3D INVALID_REGNUM;
> +
> +@@ -8352,15 +8374,18 @@ aarch64_layout_frame (void)
> +      at expand_prologue.  */
> +   gcc_assert (crtl->is_leaf || maybe_ne (saved_regs_size, 0));
> +
> +-  offset +=3D get_frame_size ();
> +-  offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_UNI=
T);
> +-  auto top_of_locals =3D offset;
> +-
> ++  if (!regs_at_top_p)
> ++    {
> ++      offset +=3D get_frame_size ();
> ++      offset =3D aligned_upper_bound (offset, STACK_BOUNDARY /
> BITS_PER_UNIT);
> ++      top_of_locals =3D offset;
> ++    }
> +   offset +=3D frame.saved_varargs_size;
> +   gcc_assert (multiple_p (offset, STACK_BOUNDARY / BITS_PER_UNIT));
> +   frame.frame_size =3D offset;
> +
> +   frame.bytes_above_hard_fp =3D frame.frame_size -
> frame.bytes_below_hard_fp;
> ++  gcc_assert (known_ge (top_of_locals, 0));
> +   frame.bytes_above_locals =3D frame.frame_size - top_of_locals;
> +
> +   frame.initial_adjust =3D 0;
> +@@ -9615,10 +9640,10 @@ aarch64_epilogue_uses (int regno)
> +       |  for register varargs         |
> +       |                               |
> +       +-------------------------------+
> +-      |  local variables              | <-- frame_pointer_rtx
> ++      |  local variables (1)          | <-- frame_pointer_rtx
> +       |                               |
> +       +-------------------------------+
> +-      |  padding                      |
> ++      |  padding (1)                  |
> +       +-------------------------------+
> +       |  callee-saved registers       |
> +       +-------------------------------+
> +@@ -9630,6 +9655,10 @@ aarch64_epilogue_uses (int regno)
> +       +-------------------------------+
> +       |  SVE predicate registers      |
> +       +-------------------------------+
> ++      |  local variables (2)          |
> ++      +-------------------------------+
> ++      |  padding (2)                  |
> ++      +-------------------------------+
> +       |  dynamic allocation           |
> +       +-------------------------------+
> +       |  padding                      |
> +@@ -9639,6 +9668,9 @@ aarch64_epilogue_uses (int regno)
> +       +-------------------------------+
> +       |                               | <-- stack_pointer_rtx (aligned)
> +
> ++   The regions marked (1) and (2) are mutually exclusive.  (2) is used
> ++   when aarch64_save_regs_above_locals_p is true.
> ++
> +    Dynamic stack allocations via alloca() decrease stack_pointer_rtx
> +    but leave frame_pointer_rtx and hard_frame_pointer_rtx
> +    unchanged.
> +@@ -9834,6 +9866,8 @@ aarch64_expand_prologue (void)
> +   gcc_assert (known_eq (bytes_below_sp, final_adjust));
> +   aarch64_allocate_and_probe_stack_space (tmp1_rtx, tmp0_rtx,
> final_adjust,
> +                                         !frame_pointer_needed, true);
> ++  if (emit_frame_chain && maybe_ne (final_adjust, 0))
> ++    emit_insn (gen_stack_tie (stack_pointer_rtx,
> hard_frame_pointer_rtx));
> + }
> +
> + /* Return TRUE if we can use a simple_return insn.
> +diff --git a/gcc/testsuite/gcc.target/aarch64/stack-protector-8.c
> b/gcc/testsuite/gcc.target/aarch64/stack-protector-8.c
> +new file mode 100644
> +index 00000000000..e71d820e365
> +--- /dev/null
> ++++ b/gcc/testsuite/gcc.target/aarch64/stack-protector-8.c
> +@@ -0,0 +1,95 @@
> ++/* { dg-options " -O -fstack-protector-strong
> -mstack-protector-guard=3Dsysreg -mstack-protector-guard-reg=3Dtpidr2_el0
> -mstack-protector-guard-offset=3D16" } */
> ++/* { dg-final { check-function-bodies "**" "" } } */
> ++
> ++void g(void *);
> ++__SVBool_t *h(void *);
> ++
> ++/*
> ++** test1:
> ++**    sub     sp, sp, #288
> ++**    stp     x29, x30, \[sp, #?272\]
> ++**    add     x29, sp, #?272
> ++**    mrs     (x[0-9]+), tpidr2_el0
> ++**    ldr     (x[0-9]+), \[\1, #?16\]
> ++**    str     \2, \[sp, #?264\]
> ++**    mov     \2, #?0
> ++**    add     x0, sp, #?8
> ++**    bl      g
> ++**    ...
> ++**    mrs     .*
> ++**    ...
> ++**    bne     .*
> ++**    ...
> ++**    ldp     x29, x30, \[sp, #?272\]
> ++**    add     sp, sp, #?288
> ++**    ret
> ++**    bl      __stack_chk_fail
> ++*/
> ++int test1() {
> ++  int y[0x40];
> ++  g(y);
> ++  return 1;
> ++}
> ++
> ++/*
> ++** test2:
> ++**    stp     x29, x30, \[sp, #?-16\]!
> ++**    mov     x29, sp
> ++**    sub     sp, sp, #1040
> ++**    mrs     (x[0-9]+), tpidr2_el0
> ++**    ldr     (x[0-9]+), \[\1, #?16\]
> ++**    str     \2, \[sp, #?1032\]
> ++**    mov     \2, #?0
> ++**    add     x0, sp, #?8
> ++**    bl      g
> ++**    ...
> ++**    mrs     .*
> ++**    ...
> ++**    bne     .*
> ++**    ...
> ++**    add     sp, sp, #?1040
> ++**    ldp     x29, x30, \[sp\], #?16
> ++**    ret
> ++**    bl      __stack_chk_fail
> ++*/
> ++int test2() {
> ++  int y[0x100];
> ++  g(y);
> ++  return 1;
> ++}
> ++
> ++#pragma GCC target "+sve"
> ++
> ++/*
> ++** test3:
> ++**    stp     x29, x30, \[sp, #?-16\]!
> ++**    mov     x29, sp
> ++**    addvl   sp, sp, #-18
> ++**    ...
> ++**    str     p4, \[sp\]
> ++**    ...
> ++**    sub     sp, sp, #272
> ++**    mrs     (x[0-9]+), tpidr2_el0
> ++**    ldr     (x[0-9]+), \[\1, #?16\]
> ++**    str     \2, \[sp, #?264\]
> ++**    mov     \2, #?0
> ++**    add     x0, sp, #?8
> ++**    bl      h
> ++**    ...
> ++**    mrs     .*
> ++**    ...
> ++**    bne     .*
> ++**    ...
> ++**    add     sp, sp, #?272
> ++**    ...
> ++**    ldr     p4, \[sp\]
> ++**    ...
> ++**    addvl   sp, sp, #18
> ++**    ldp     x29, x30, \[sp\], #?16
> ++**    ret
> ++**    bl      __stack_chk_fail
> ++*/
> ++__SVBool_t test3() {
> ++  int y[0x40];
> ++  return *h(y);
> ++}
> +diff --git a/gcc/testsuite/gcc.target/aarch64/stack-protector-9.c
> b/gcc/testsuite/gcc.target/aarch64/stack-protector-9.c
> +new file mode 100644
> +index 00000000000..58f322aa480
> +--- /dev/null
> ++++ b/gcc/testsuite/gcc.target/aarch64/stack-protector-9.c
> +@@ -0,0 +1,33 @@
> ++/* { dg-options "-O2 -mcpu=3Dneoverse-v1 -fstack-protector-all" } */
> ++/* { dg-final { check-function-bodies "**" "" } } */
> ++
> ++/*
> ++** main:
> ++**    ...
> ++**    stp     x29, x30, \[sp, #?-[0-9]+\]!
> ++**    ...
> ++**    sub     sp, sp, #[0-9]+
> ++**    ...
> ++**    str     x[0-9]+, \[x29, #?-8\]
> ++**    ...
> ++*/
> ++int f(const char *);
> ++void g(void *);
> ++int main(int argc, char* argv[])
> ++{
> ++  int a;
> ++  int b;
> ++  char c[2+f(argv[1])];
> ++  int d[0x100];
> ++  char y;
> ++
> ++  y=3D42; a=3D4; b=3D10;
> ++  c[0] =3D 'h'; c[1] =3D '\0';
> ++
> ++  c[f(argv[2])] =3D '\0';
> ++
> ++  __builtin_printf("%d %d\n%s\n", a, b, c);
> ++  g(d);
> ++
> ++  return 0;
> ++}
> +--
> +2.34.1
> +
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187543):
> https://lists.openembedded.org/g/openembedded-core/message/187543
> Mute This Topic: https://lists.openembedded.org/mt/101319990/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008f299b06054e0339
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FYI: one of LGE proprietary components triggers ICE with t=
his applied, I&#39;ll try to find minimal reproducer later, this is just fo=
r other people who might hit the same:<div><br></div><div>error: unrecogniz=
able insn:<br>=C2=A02923 | }<br>=C2=A0 =C2=A0 =C2=A0 | ^<br>(insn 416 286 2=
90 17 (parallel [<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (set (mem/c:=
SI (plus:DI (reg/f:DI 29 x29)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (const_int -260 [0xfffffffffffffe=
fc])) [1 redacted.pixel_format+0 S4 A32])<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (const_int 0 [0]))<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (set (mem/c:SI (plus:DI (reg/f:DI 29 x29)<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (=
const_int -256 [0xffffffffffffff00])) [1 redacted.pixel_value+0 S4 A128])<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (reg/v:SI 22 x22 =
[orig:141 color ] [141]))<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]) &quot;TOPDIR/BU=
ILD/work/redacted/redacted/redacted/git/redacted.c&quot;:2903:45 -1<br>=C2=
=A0 =C2=A0 =C2=A0(expr_list:REG_DEAD (reg/v:SI 22 x22 [orig:141 color ] [14=
1])<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 (nil)))<br>during RTL pass: cprop_hardre=
g<br>TOPDIR/BUILD/work/redacted/redacted/redacted/git/redacted.c:2923:1: in=
ternal compiler error: in extract_insn, at recog.cc:2791<br>0x191624a inter=
nal_error(char const*, ...)<br>	???:0<br>0x6bee26 fancy_abort(char const*, =
int, char const*)<br>	???:0<br>0x697469 _fatal_insn(char const*, rtx_def co=
nst*, char const*, int, char const*)<br>	???:0<br>0x697485 _fatal_insn_not_=
found(rtx_def const*, char const*, int, char const*)<br>	???:0<br>0xbef198 =
extract_constrain_insn(rtx_insn*)<br>	???:0<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 12, 2023=
 at 7:24=E2=80=AFPM Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com">=
ross.burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">From: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.=
com" target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
<br>
This series of patches fixes deficiencies in GCC&#39;s -fstack-protector<br=
>
implementation for AArch64 when using dynamically allocated stack space.<br=
>
This is CVE-2023-4039.=C2=A0 See:<br>
<br>
<a href=3D"https://developer.arm.com/Arm%20Security%20Center/GCC%20Stack%20=
Protector%20Vulnerability%20AArch64" rel=3D"noreferrer" target=3D"_blank">h=
ttps://developer.arm.com/Arm%20Security%20Center/GCC%20Stack%20Protector%20=
Vulnerability%20AArch64</a><br>
<a href=3D"https://github.com/metaredteam/external-disclosures/security/adv=
isories/GHSA-x7ch-h5rf-w2mf" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/metaredteam/external-disclosures/security/advisories/GHSA-x7ch-h5=
rf-w2mf</a><br>
<br>
for more details.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/gcc/gcc-12.3.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 1 +<br>
=C2=A0.../gcc/gcc/CVE-2023-4039.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 3093 +++++++++++++++++<br>
=C2=A02 files changed, 3094 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc/CVE-2023-4039.patch<=
br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-12.3.inc b/meta/recipes-devtools=
/gcc/gcc-12.3.inc<br>
index 4ec03f925c8..5896f26e1af 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-12.3.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-12.3.inc<br>
@@ -63,6 +63,7 @@ SRC_URI =3D &quot;${BASEURI} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0026-rust-recursion-limit.=
patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://prefix-map-realpath.patch =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://hardcoded-paths.patch \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-4039.patch \<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;949a5d4f99e786421a93b532b22ffab5578de732=
1369975b91aec97adfda8c3b&quot;<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc/CVE-2023-4039.patch b/meta/recip=
es-devtools/gcc/gcc/CVE-2023-4039.patch<br>
new file mode 100644<br>
index 00000000000..8cb52849cd3<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gcc/CVE-2023-4039.patch<br>
@@ -0,0 +1,3093 @@<br>
+From: Richard Sandiford &lt;<a href=3D"mailto:richard.sandiford@arm.com" t=
arget=3D"_blank">richard.sandiford@arm.com</a>&gt;<br>
+Subject: [PATCH 00/19] aarch64: Fix -fstack-protector issue<br>
+Date: Tue, 12 Sep 2023 16:25:10 +0100<br>
+<br>
+This series of patches fixes deficiencies in GCC&#39;s -fstack-protector<b=
r>
+implementation for AArch64 when using dynamically allocated stack space.<b=
r>
+This is CVE-2023-4039.=C2=A0 See:<br>
+<br>
+<a href=3D"https://developer.arm.com/Arm%20Security%20Center/GCC%20Stack%2=
0Protector%20Vulnerability%20AArch64" rel=3D"noreferrer" target=3D"_blank">=
https://developer.arm.com/Arm%20Security%20Center/GCC%20Stack%20Protector%2=
0Vulnerability%20AArch64</a><br>
+<a href=3D"https://github.com/metaredteam/external-disclosures/security/ad=
visories/GHSA-x7ch-h5rf-w2mf" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/metaredteam/external-disclosures/security/advisories/GHSA-x7ch-h=
5rf-w2mf</a><br>
+<br>
+for more details.<br>
+<br>
+The fix is to put the saved registers above the locals area when<br>
+-fstack-protector is used.<br>
+<br>
+The series also fixes a stack-clash problem that I found while working<br>
+on the CVE.=C2=A0 In unpatched sources, the stack-clash problem would only=
<br>
+trigger for unrealistic numbers of arguments (8K 64-bit arguments, or an<b=
r>
+equivalent).=C2=A0 But it would be a more significant issue with the new<b=
r>
+-fstack-protector frame layout.=C2=A0 It&#39;s therefore important that bo=
th<br>
+problems are fixed together.<br>
+<br>
+Some reorganisation of the code seemed necessary to fix the problems in a<=
br>
+cleanish way.=C2=A0 The series is therefore quite long, but only a handful=
 of<br>
+patches should have any effect on code generation.<br>
+<br>
+See the individual patches for a detailed description.<br>
+<br>
+Tested on aarch64-linux-gnu. Pushed to trunk and to all active branches.<b=
r>
+I&#39;ve also pushed backports to GCC 7+ to vendors/ARM/heads/CVE-2023-403=
9.<br>
+<br>
+CVE: CVE-2023-4039<br>
+Upstream-Status: Backport<br>
+Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
+=C2=A0 <br>
+=C2=A0 <br>
+From 62fbb215cc817e9f2c1ca80282a64f4ee30806bc Mon Sep 17 00:00:00 2001<br>
+From: Richard Sandiford &lt;<a href=3D"mailto:richard.sandiford@arm.com" t=
arget=3D"_blank">richard.sandiford@arm.com</a>&gt;<br>
+Date: Tue, 12 Sep 2023 16:08:48 +0100<br>
+Subject: [PATCH 01/19] aarch64: Use local frame vars in shrink-wrapping co=
de<br>
+<br>
+aarch64_layout_frame uses a shorthand for referring to<br>
+cfun-&gt;machine-&gt;frame:<br>
+<br>
+=C2=A0 aarch64_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;<br>
+<br>
+This patch does the same for some other heavy users of the structure.<br>
+No functional change intended.<br>
+<br>
+gcc/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.cc (aarch64_save_calle=
e_saves): Use<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0a local shorthand for cfun-&gt;machine-&gt;fram=
e.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_restore_callee_saves, aarch64_get_sepa=
rate_components):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_process_components): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_allocate_and_probe_stack_space): Likew=
ise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_expand_prologue, aarch64_expand_epilog=
ue): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_layout_frame): Use existing shorthand =
for one more case.<br>
+---<br>
+ gcc/config/aarch64/aarch64.cc | 123 ++++++++++++++++++----------------<br=
>
+ 1 file changed, 64 insertions(+), 59 deletions(-)<br>
+<br>
+diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.cc=
<br>
+index 226dc9dffd4..ae42ffdedbe 100644<br>
+--- a/gcc/config/aarch64/aarch64.cc<br>
++++ b/gcc/config/aarch64/aarch64.cc<br>
+@@ -8351,7 +8351,7 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0frame.is_scs_enabled<br>
+=C2=A0 =C2=A0 =C2=A0=3D (!crtl-&gt;calls_eh_return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; sanitize_flags_p (SANITIZE_SHADOW_C=
ALL_STACK)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; known_ge (cfun-&gt;machine-&gt;fram=
e.reg_offset[LR_REGNUM], 0));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; known_ge (frame.reg_offset[LR_REGNU=
M], 0));<br>
+ <br>
+=C2=A0 =C2=A0/* When shadow call stack is enabled, the scs_pop in the epil=
ogue will<br>
+=C2=A0 =C2=A0 =C2=A0 restore x30, and we don&#39;t need to pop x30 again i=
n the traditional<br>
+@@ -8763,6 +8763,7 @@ aarch64_save_callee_saves (poly_int64 start_offset,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 unsigned start, unsigned limit, bool skip_wb,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 bool hard_fp_valid_p)<br>
+ {<br>
++=C2=A0 aarch64_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;<br>
+=C2=A0 =C2=A0rtx_insn *insn;<br>
+=C2=A0 =C2=A0unsigned regno;<br>
+=C2=A0 =C2=A0unsigned regno2;<br>
+@@ -8777,8 +8778,8 @@ aarch64_save_callee_saves (poly_int64 start_offset,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool frame_related_p =3D aarch64_emit_cfi_for_r=
eg_p (regno);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (skip_wb<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (regno =3D=3D cfun-&gt;machine-&gt=
;frame.wb_push_candidate1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || regno =3D=3D cfun-&gt;machin=
e-&gt;frame.wb_push_candidate2))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (regno =3D=3D frame.wb_push_candid=
ate1<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || regno =3D=3D frame.wb_push_c=
andidate2))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (cfun-&gt;machine-&gt;reg_is_wrapped_separat=
ely[regno])<br>
+@@ -8786,7 +8787,7 @@ aarch64_save_callee_saves (poly_int64 start_offset,<=
br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0machine_mode mode =3D aarch64_reg_save_mode (re=
gno);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D gen_rtx_REG (mode, regno);<br>
+-=C2=A0 =C2=A0 =C2=A0 offset =3D start_offset + cfun-&gt;machine-&gt;frame=
.reg_offset[regno];<br>
++=C2=A0 =C2=A0 =C2=A0 offset =3D start_offset + frame.reg_offset[regno];<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rtx base_rtx =3D stack_pointer_rtx;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0poly_int64 sp_offset =3D offset;<br>
+ <br>
+@@ -8799,7 +8800,7 @@ aarch64_save_callee_saves (poly_int64 start_offset,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc_assert (known_eq (start_offset, 0));=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0poly_int64 fp_offset<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D cfun-&gt;machine-&gt;frame.below_h=
ard_fp_saved_regs_size;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D frame.below_hard_fp_saved_regs_siz=
e;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (hard_fp_valid_p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base_rtx =3D hard_frame_pointer_r=
tx;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+@@ -8821,8 +8822,7 @@ aarch64_save_callee_saves (poly_int64 start_offset,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; (regno2 =3D aarch64_next_call=
ee_save (regno + 1, limit)) &lt;=3D limit<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; !cfun-&gt;machine-&gt;reg_is_=
wrapped_separately[regno2]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; known_eq (GET_MODE_SIZE (mode=
),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cfun-&gt;machine-&gt;frame.reg_offset[regno2]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0- cfun-&gt;machine-&gt;frame.reg_offset[regno]))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0frame.reg_offset[regno2] - frame.reg_offset[regno]))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rtx reg2 =3D gen_rtx_REG (mode, regno2);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rtx mem2;<br>
+@@ -8872,6 +8872,7 @@ static void<br>
+ aarch64_restore_callee_saves (poly_int64 start_offset, unsigned start,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned limit, bool skip_wb, rtx *cfi_ops)<=
br>
+ {<br>
++=C2=A0 aarch64_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;<br>
+=C2=A0 =C2=A0unsigned regno;<br>
+=C2=A0 =C2=A0unsigned regno2;<br>
+=C2=A0 =C2=A0poly_int64 offset;<br>
+@@ -8888,13 +8889,13 @@ aarch64_restore_callee_saves (poly_int64 start_off=
set, unsigned start,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rtx reg, mem;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (skip_wb<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (regno =3D=3D cfun-&gt;machine-&gt=
;frame.wb_pop_candidate1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || regno =3D=3D cfun-&gt;machin=
e-&gt;frame.wb_pop_candidate2))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (regno =3D=3D frame.wb_pop_candida=
te1<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || regno =3D=3D frame.wb_pop_ca=
ndidate2))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0machine_mode mode =3D aarch64_reg_save_mode (re=
gno);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D gen_rtx_REG (mode, regno);<br>
+-=C2=A0 =C2=A0 =C2=A0 offset =3D start_offset + cfun-&gt;machine-&gt;frame=
.reg_offset[regno];<br>
++=C2=A0 =C2=A0 =C2=A0 offset =3D start_offset + frame.reg_offset[regno];<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rtx base_rtx =3D stack_pointer_rtx;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mode =3D=3D VNx2DImode &amp;&amp; BYTES_BIG=
_ENDIAN)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0aarch64_adjust_sve_callee_save_base (mode, base=
_rtx, anchor_reg,<br>
+@@ -8905,8 +8906,7 @@ aarch64_restore_callee_saves (poly_int64 start_offse=
t, unsigned start,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; (regno2 =3D aarch64_next_call=
ee_save (regno + 1, limit)) &lt;=3D limit<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; !cfun-&gt;machine-&gt;reg_is_=
wrapped_separately[regno2]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; known_eq (GET_MODE_SIZE (mode=
),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cfun-&gt;machine-&gt;frame.reg_offset[regno2]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0- cfun-&gt;machine-&gt;frame.reg_offset[regno]))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0frame.reg_offset[regno2] - frame.reg_offset[regno]))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rtx reg2 =3D gen_rtx_REG (mode, regno2);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rtx mem2;<br>
+@@ -9011,6 +9011,7 @@ offset_12bit_unsigned_scaled_p (machine_mode mode, p=
oly_int64 offset)<br>
+ static sbitmap<br>
+ aarch64_get_separate_components (void)<br>
+ {<br>
++=C2=A0 aarch64_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;<br>
+=C2=A0 =C2=A0sbitmap components =3D sbitmap_alloc (LAST_SAVED_REGNUM + 1);=
<br>
+=C2=A0 =C2=A0bitmap_clear (components);<br>
+ <br>
+@@ -9027,18 +9028,18 @@ aarch64_get_separate_components (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mode =3D=3D VNx2DImode &amp;&amp; BYTES_BIG=
_ENDIAN)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 poly_int64 offset =3D cfun-&gt;machine-&gt;frame.reg=
_offset[regno];<br>
++=C2=A0 =C2=A0 =C2=A0 poly_int64 offset =3D frame.reg_offset[regno];<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* If the register is saved in the first SVE sa=
ve slot, we use<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 it as a stack probe for -fstack-clash-p=
rotection.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (flag_stack_clash_protection<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; maybe_ne (cfun-&gt;machine-=
&gt;frame.below_hard_fp_saved_regs_size, 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; maybe_ne (frame.below_hard_=
fp_saved_regs_size, 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; known_eq (offset, 0))<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Get the offset relative to the register we&#=
39;ll use.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (frame_pointer_needed)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 offset -=3D cfun-&gt;machine-&gt;frame.below_=
hard_fp_saved_regs_size;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 offset -=3D frame.below_hard_fp_saved_regs_si=
ze;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset +=3D crtl-&gt;outgoing_args_size;=
<br>
+ <br>
+@@ -9057,11 +9058,11 @@ aarch64_get_separate_components (void)<br>
+=C2=A0 =C2=A0/* If the spare predicate register used by big-endian SVE cod=
e<br>
+=C2=A0 =C2=A0 =C2=A0 is call-preserved, it must be saved in the main prolo=
gue<br>
+=C2=A0 =C2=A0 =C2=A0 before any saves that use it.=C2=A0 */<br>
+-=C2=A0 if (cfun-&gt;machine-&gt;frame.spare_pred_reg !=3D INVALID_REGNUM)=
<br>
+-=C2=A0 =C2=A0 bitmap_clear_bit (components, cfun-&gt;machine-&gt;frame.sp=
are_pred_reg);<br>
++=C2=A0 if (frame.spare_pred_reg !=3D INVALID_REGNUM)<br>
++=C2=A0 =C2=A0 bitmap_clear_bit (components, frame.spare_pred_reg);<br>
+ <br>
+-=C2=A0 unsigned reg1 =3D cfun-&gt;machine-&gt;frame.wb_push_candidate1;<b=
r>
+-=C2=A0 unsigned reg2 =3D cfun-&gt;machine-&gt;frame.wb_push_candidate2;<b=
r>
++=C2=A0 unsigned reg1 =3D frame.wb_push_candidate1;<br>
++=C2=A0 unsigned reg2 =3D frame.wb_push_candidate2;<br>
+=C2=A0 =C2=A0/* If registers have been chosen to be stored/restored with<b=
r>
+=C2=A0 =C2=A0 =C2=A0 writeback don&#39;t interfere with them to avoid havi=
ng to output explicit<br>
+=C2=A0 =C2=A0 =C2=A0 stack adjustment instructions.=C2=A0 */<br>
+@@ -9170,6 +9171,7 @@ aarch64_get_next_set_bit (sbitmap bmp, unsigned int =
start)<br>
+ static void<br>
+ aarch64_process_components (sbitmap components, bool prologue_p)<br>
+ {<br>
++=C2=A0 aarch64_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;<br>
+=C2=A0 =C2=A0rtx ptr_reg =3D gen_rtx_REG (Pmode, frame_pointer_needed<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ? HARD_FRAME_POINTER_REGNUM<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 : STACK_POINTER_REGNUM);<br>
+@@ -9184,9 +9186,9 @@ aarch64_process_components (sbitmap components, bool=
 prologue_p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0machine_mode mode =3D aarch64_reg_save_mode (re=
gno);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rtx reg =3D gen_rtx_REG (mode, regno);<br>
+-=C2=A0 =C2=A0 =C2=A0 poly_int64 offset =3D cfun-&gt;machine-&gt;frame.reg=
_offset[regno];<br>
++=C2=A0 =C2=A0 =C2=A0 poly_int64 offset =3D frame.reg_offset[regno];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (frame_pointer_needed)<br>
+-=C2=A0 =C2=A0 =C2=A0 offset -=3D cfun-&gt;machine-&gt;frame.below_hard_fp=
_saved_regs_size;<br>
++=C2=A0 =C2=A0 =C2=A0 offset -=3D frame.below_hard_fp_saved_regs_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0offset +=3D crtl-&gt;outgoing_args_size;<br>
+ <br>
+@@ -9211,14 +9213,14 @@ aarch64_process_components (sbitmap components, bo=
ol prologue_p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 poly_int64 offset2 =3D cfun-&gt;machine-&gt;frame.re=
g_offset[regno2];<br>
++=C2=A0 =C2=A0 =C2=A0 poly_int64 offset2 =3D frame.reg_offset[regno2];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The next register is not of the same class o=
r its offset is not<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mergeable with the current one into a pair.=C2=
=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (aarch64_sve_mode_p (mode)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| !satisfies_constraint_Ump (mem)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| GP_REGNUM_P (regno) !=3D GP_REGNUM_P =
(regno2)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (crtl-&gt;abi-&gt;id () =3D=3D ARM_PC=
S_SIMD &amp;&amp; FP_REGNUM_P (regno))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 || maybe_ne ((offset2 - cfun-&gt;machine-&gt;=
frame.reg_offset[regno]),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 || maybe_ne ((offset2 - frame.reg_offset[regn=
o]),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 GET_MODE_SIZE (mode)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0insn =3D emit_insn (set);<br>
+@@ -9240,7 +9242,7 @@ aarch64_process_components (sbitmap components, bool=
 prologue_p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* REGNO2 can be saved/restored in a pair with =
REGNO.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rtx reg2 =3D gen_rtx_REG (mode, regno2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (frame_pointer_needed)<br>
+-=C2=A0 =C2=A0 =C2=A0 offset2 -=3D cfun-&gt;machine-&gt;frame.below_hard_f=
p_saved_regs_size;<br>
++=C2=A0 =C2=A0 =C2=A0 offset2 -=3D frame.below_hard_fp_saved_regs_size;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0offset2 +=3D crtl-&gt;outgoing_args_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rtx addr2 =3D plus_constant (Pmode, ptr_reg, of=
fset2);<br>
+@@ -9335,6 +9337,7 @@ aarch64_allocate_and_probe_stack_space (rtx temp1, r=
tx temp2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool fram=
e_related_p,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool fina=
l_adjustment_p)<br>
+ {<br>
++=C2=A0 aarch64_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;<br>
+=C2=A0 =C2=A0HOST_WIDE_INT guard_size<br>
+=C2=A0 =C2=A0 =C2=A0=3D 1 &lt;&lt; param_stack_clash_protection_guard_size=
;<br>
+=C2=A0 =C2=A0HOST_WIDE_INT guard_used_by_caller =3D STACK_CLASH_CALLER_GUA=
RD;<br>
+@@ -9355,25 +9358,25 @@ aarch64_allocate_and_probe_stack_space (rtx temp1,=
 rtx temp2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 register as a probe.=C2=A0 We can&#39;t assume=
 that LR was saved at position 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 though, so treat any space below it as unprobe=
d.=C2=A0 */<br>
+=C2=A0 =C2=A0if (final_adjustment_p<br>
+-=C2=A0 =C2=A0 =C2=A0 &amp;&amp; known_eq (cfun-&gt;machine-&gt;frame.belo=
w_hard_fp_saved_regs_size, 0))<br>
++=C2=A0 =C2=A0 =C2=A0 &amp;&amp; known_eq (frame.below_hard_fp_saved_regs_=
size, 0))<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 poly_int64 lr_offset =3D cfun-&gt;machine-&gt;frame.=
reg_offset[LR_REGNUM];<br>
++=C2=A0 =C2=A0 =C2=A0 poly_int64 lr_offset =3D frame.reg_offset[LR_REGNUM]=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (known_ge (lr_offset, 0))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0min_probe_threshold -=3D lr_offset.to_constant =
();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gcc_assert (!flag_stack_clash_protection || kno=
wn_eq (poly_size, 0));<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 poly_int64 frame_size =3D cfun-&gt;machine-&gt;frame.frame_size;<b=
r>
++=C2=A0 poly_int64 frame_size =3D frame.frame_size;<br>
+ <br>
+=C2=A0 =C2=A0/* We should always have a positive probe threshold.=C2=A0 */=
<br>
+=C2=A0 =C2=A0gcc_assert (min_probe_threshold &gt; 0);<br>
+ <br>
+=C2=A0 =C2=A0if (flag_stack_clash_protection &amp;&amp; !final_adjustment_=
p)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 poly_int64 initial_adjust =3D cfun-&gt;machine-&gt;f=
rame.initial_adjust;<br>
+-=C2=A0 =C2=A0 =C2=A0 poly_int64 sve_callee_adjust =3D cfun-&gt;machine-&g=
t;frame.sve_callee_adjust;<br>
+-=C2=A0 =C2=A0 =C2=A0 poly_int64 final_adjust =3D cfun-&gt;machine-&gt;fra=
me.final_adjust;<br>
++=C2=A0 =C2=A0 =C2=A0 poly_int64 initial_adjust =3D frame.initial_adjust;<=
br>
++=C2=A0 =C2=A0 =C2=A0 poly_int64 sve_callee_adjust =3D frame.sve_callee_ad=
just;<br>
++=C2=A0 =C2=A0 =C2=A0 poly_int64 final_adjust =3D frame.final_adjust;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (known_eq (frame_size, 0))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+@@ -9662,17 +9665,18 @@ aarch64_epilogue_uses (int regno)<br>
+ void<br>
+ aarch64_expand_prologue (void)<br>
+ {<br>
+-=C2=A0 poly_int64 frame_size =3D cfun-&gt;machine-&gt;frame.frame_size;<b=
r>
+-=C2=A0 poly_int64 initial_adjust =3D cfun-&gt;machine-&gt;frame.initial_a=
djust;<br>
+-=C2=A0 HOST_WIDE_INT callee_adjust =3D cfun-&gt;machine-&gt;frame.callee_=
adjust;<br>
+-=C2=A0 poly_int64 final_adjust =3D cfun-&gt;machine-&gt;frame.final_adjus=
t;<br>
+-=C2=A0 poly_int64 callee_offset =3D cfun-&gt;machine-&gt;frame.callee_off=
set;<br>
+-=C2=A0 poly_int64 sve_callee_adjust =3D cfun-&gt;machine-&gt;frame.sve_ca=
llee_adjust;<br>
++=C2=A0 aarch64_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;<br>
++=C2=A0 poly_int64 frame_size =3D frame.frame_size;<br>
++=C2=A0 poly_int64 initial_adjust =3D frame.initial_adjust;<br>
++=C2=A0 HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;<br>
++=C2=A0 poly_int64 final_adjust =3D frame.final_adjust;<br>
++=C2=A0 poly_int64 callee_offset =3D frame.callee_offset;<br>
++=C2=A0 poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;<br>
+=C2=A0 =C2=A0poly_int64 below_hard_fp_saved_regs_size<br>
+-=C2=A0 =C2=A0 =3D cfun-&gt;machine-&gt;frame.below_hard_fp_saved_regs_siz=
e;<br>
+-=C2=A0 unsigned reg1 =3D cfun-&gt;machine-&gt;frame.wb_push_candidate1;<b=
r>
+-=C2=A0 unsigned reg2 =3D cfun-&gt;machine-&gt;frame.wb_push_candidate2;<b=
r>
+-=C2=A0 bool emit_frame_chain =3D cfun-&gt;machine-&gt;frame.emit_frame_ch=
ain;<br>
++=C2=A0 =C2=A0 =3D frame.below_hard_fp_saved_regs_size;<br>
++=C2=A0 unsigned reg1 =3D frame.wb_push_candidate1;<br>
++=C2=A0 unsigned reg2 =3D frame.wb_push_candidate2;<br>
++=C2=A0 bool emit_frame_chain =3D frame.emit_frame_chain;<br>
+=C2=A0 =C2=A0rtx_insn *insn;<br>
+ <br>
+=C2=A0 =C2=A0if (flag_stack_clash_protection &amp;&amp; known_eq (callee_a=
djust, 0))<br>
+@@ -9703,7 +9707,7 @@ aarch64_expand_prologue (void)<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0/* Push return address to shadow call stack.=C2=A0 */<br>
+-=C2=A0 if (cfun-&gt;machine-&gt;frame.is_scs_enabled)<br>
++=C2=A0 if (frame.is_scs_enabled)<br>
+=C2=A0 =C2=A0 =C2=A0emit_insn (gen_scs_push ());<br>
+ <br>
+=C2=A0 =C2=A0if (flag_stack_usage_info)<br>
+@@ -9742,7 +9746,7 @@ aarch64_expand_prologue (void)<br>
+ <br>
+=C2=A0 =C2=A0/* The offset of the frame chain record (if any) from the cur=
rent SP.=C2=A0 */<br>
+=C2=A0 =C2=A0poly_int64 chain_offset =3D (initial_adjust + callee_adjust<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0- cfun-&gt;machine-&gt;frame.hard_fp_offset);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0- frame.hard_fp_offset);<br>
+=C2=A0 =C2=A0gcc_assert (known_ge (chain_offset, 0));<br>
+ <br>
+=C2=A0 =C2=A0/* The offset of the bottom of the save area from the current=
 SP.=C2=A0 */<br>
+@@ -9845,16 +9849,17 @@ aarch64_use_return_insn_p (void)<br>
+ void<br>
+ aarch64_expand_epilogue (bool for_sibcall)<br>
+ {<br>
+-=C2=A0 poly_int64 initial_adjust =3D cfun-&gt;machine-&gt;frame.initial_a=
djust;<br>
+-=C2=A0 HOST_WIDE_INT callee_adjust =3D cfun-&gt;machine-&gt;frame.callee_=
adjust;<br>
+-=C2=A0 poly_int64 final_adjust =3D cfun-&gt;machine-&gt;frame.final_adjus=
t;<br>
+-=C2=A0 poly_int64 callee_offset =3D cfun-&gt;machine-&gt;frame.callee_off=
set;<br>
+-=C2=A0 poly_int64 sve_callee_adjust =3D cfun-&gt;machine-&gt;frame.sve_ca=
llee_adjust;<br>
++=C2=A0 aarch64_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;<br>
++=C2=A0 poly_int64 initial_adjust =3D frame.initial_adjust;<br>
++=C2=A0 HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;<br>
++=C2=A0 poly_int64 final_adjust =3D frame.final_adjust;<br>
++=C2=A0 poly_int64 callee_offset =3D frame.callee_offset;<br>
++=C2=A0 poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;<br>
+=C2=A0 =C2=A0poly_int64 below_hard_fp_saved_regs_size<br>
+-=C2=A0 =C2=A0 =3D cfun-&gt;machine-&gt;frame.below_hard_fp_saved_regs_siz=
e;<br>
+-=C2=A0 unsigned reg1 =3D cfun-&gt;machine-&gt;frame.wb_pop_candidate1;<br=
>
+-=C2=A0 unsigned reg2 =3D cfun-&gt;machine-&gt;frame.wb_pop_candidate2;<br=
>
+-=C2=A0 unsigned int last_gpr =3D (cfun-&gt;machine-&gt;frame.is_scs_enabl=
ed<br>
++=C2=A0 =C2=A0 =3D frame.below_hard_fp_saved_regs_size;<br>
++=C2=A0 unsigned reg1 =3D frame.wb_pop_candidate1;<br>
++=C2=A0 unsigned reg2 =3D frame.wb_pop_candidate2;<br>
++=C2=A0 unsigned int last_gpr =3D (frame.is_scs_enabled<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ? R29_REGNUM : R30_REGNUM);<br>
+=C2=A0 =C2=A0rtx cfi_ops =3D NULL;<br>
+=C2=A0 =C2=A0rtx_insn *insn;<br>
+@@ -9888,7 +9893,7 @@ aarch64_expand_epilogue (bool for_sibcall)<br>
+=C2=A0 =C2=A0/* We need to add memory barrier to prevent read from dealloc=
ated stack.=C2=A0 */<br>
+=C2=A0 =C2=A0bool need_barrier_p<br>
+=C2=A0 =C2=A0 =C2=A0=3D maybe_ne (get_frame_size ()<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + cfun-&gt;machine-&gt;f=
rame.saved_varargs_size, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + frame.saved_varargs_si=
ze, 0);<br>
+ <br>
+=C2=A0 =C2=A0/* Emit a barrier to prevent loads from a deallocated stack.=
=C2=A0 */<br>
+=C2=A0 =C2=A0if (maybe_gt (final_adjust, crtl-&gt;outgoing_args_size)<br>
+@@ -9969,7 +9974,7 @@ aarch64_expand_epilogue (bool for_sibcall)<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0/* Pop return address from shadow call stack.=C2=A0 */<br>
+-=C2=A0 if (cfun-&gt;machine-&gt;frame.is_scs_enabled)<br>
++=C2=A0 if (frame.is_scs_enabled)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0machine_mode mode =3D aarch64_reg_save_mode (R3=
0_REGNUM);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rtx reg =3D gen_rtx_REG (mode, R30_REGNUM);<br>
+@@ -12564,24 +12569,24 @@ aarch64_can_eliminate (const int from ATTRIBUTE_=
UNUSED, const int to)<br>
+ poly_int64<br>
+ aarch64_initial_elimination_offset (unsigned from, unsigned to)<br>
+ {<br>
++=C2=A0 aarch64_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;<br>
++<br>
+=C2=A0 =C2=A0if (to =3D=3D HARD_FRAME_POINTER_REGNUM)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (from =3D=3D ARG_POINTER_REGNUM)<br>
+-=C2=A0 =C2=A0 =C2=A0 return cfun-&gt;machine-&gt;frame.hard_fp_offset;<br=
>
++=C2=A0 =C2=A0 =C2=A0 return frame.hard_fp_offset;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (from =3D=3D FRAME_POINTER_REGNUM)<br>
+-=C2=A0 =C2=A0 =C2=A0 return cfun-&gt;machine-&gt;frame.hard_fp_offset<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- cfun-&gt;machine-&gt;fr=
ame.locals_offset;<br>
++=C2=A0 =C2=A0 =C2=A0 return frame.hard_fp_offset - frame.locals_offset;<b=
r>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0if (to =3D=3D STACK_POINTER_REGNUM)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (from =3D=3D FRAME_POINTER_REGNUM)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return cfun-&gt;machine-&gt;frame.frame_size<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- cfun-&gt;machine=
-&gt;frame.locals_offset;<br>
++=C2=A0 =C2=A0 =C2=A0 return frame.frame_size - frame.locals_offset;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 return cfun-&gt;machine-&gt;frame.frame_size;<br>
++=C2=A0 return frame.frame_size;<br>
+ }<br>
+ <br>
+ <br>
+-- <br>
+2.34.1<br>
+<br>
+<br>
+From 12a8889de169f892d2e927584c00d20b8b7e456f Mon Sep 17 00:00:00 2001<br>
+From: Richard Sandiford &lt;<a href=3D"mailto:richard.sandiford@arm.com" t=
arget=3D"_blank">richard.sandiford@arm.com</a>&gt;<br>
+Date: Tue, 12 Sep 2023 16:08:49 +0100<br>
+Subject: [PATCH 02/19] aarch64: Avoid a use of callee_offset<br>
+<br>
+When we emit the frame chain, i.e. when we reach Here in this statement<br=
>
+of aarch64_expand_prologue:<br>
+<br>
+=C2=A0 if (emit_frame_chain)<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 // Here<br>
+=C2=A0 =C2=A0 =C2=A0 ...<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+the stack is in one of two states:<br>
+<br>
+- We&#39;ve allocated up to the frame chain, but no more.<br>
+<br>
+- We&#39;ve allocated the whole frame, and the frame chain is within easy<=
br>
+=C2=A0 reach of the new SP.<br>
+<br>
+The offset of the frame chain from the current SP is available<br>
+in aarch64_frame as callee_offset.=C2=A0 It is also available as the<br>
+chain_offset local variable, where the latter is calculated from other<br>
+data.=C2=A0 (However, chain_offset is not always equal to callee_offset wh=
en<br>
+!emit_frame_chain, so chain_offset isn&#39;t redundant.)<br>
+<br>
+In c600df9a4060da3c6121ff4d0b93f179eafd69d1 I switched to using<br>
+chain_offset for the initialisation of the hard frame pointer:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0aarch64_add_offset (Pmode, hard_frame_pointer_r=
tx,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0stack_pointer_rtx, callee_offset,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0stack_pointer_rtx, chain_offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 tmp1_rtx, tmp0_rtx, frame_pointer_needed);<br>
+<br>
+But the later REG_CFA_ADJUST_CFA handling still used callee_offset.<br>
+<br>
+I think the difference is harmless, but it&#39;s more logical for the<br>
+CFA note to be in sync, and it&#39;s more convenient for later patches<br>
+if it uses chain_offset.<br>
+<br>
+gcc/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.cc (aarch64_expand_pro=
logue): Use<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chain_offset rather than callee_offset.<br>
+---<br>
+ gcc/config/aarch64/aarch64.cc | 4 +---<br>
+ 1 file changed, 1 insertion(+), 3 deletions(-)<br>
+<br>
+diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.cc=
<br>
+index ae42ffdedbe..79253322fd7 100644<br>
+--- a/gcc/config/aarch64/aarch64.cc<br>
++++ b/gcc/config/aarch64/aarch64.cc<br>
+@@ -9670,7 +9670,6 @@ aarch64_expand_prologue (void)<br>
+=C2=A0 =C2=A0poly_int64 initial_adjust =3D frame.initial_adjust;<br>
+=C2=A0 =C2=A0HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;<br>
+=C2=A0 =C2=A0poly_int64 final_adjust =3D frame.final_adjust;<br>
+-=C2=A0 poly_int64 callee_offset =3D frame.callee_offset;<br>
+=C2=A0 =C2=A0poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;<br>
+=C2=A0 =C2=A0poly_int64 below_hard_fp_saved_regs_size<br>
+=C2=A0 =C2=A0 =C2=A0=3D frame.below_hard_fp_saved_regs_size;<br>
+@@ -9783,8 +9782,7 @@ aarch64_expand_prologue (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 implicit.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!find_reg_note (insn, REG_CFA_ADJUST=
_CFA, NULL_RTX))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rtx src =3D plus_constant (Pmod=
e, stack_pointer_rtx,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0callee_offset);<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rtx src =3D plus_constant (Pmod=
e, stack_pointer_rtx, chain_offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_reg_note (insn, REG_CF=
A_ADJUST_CFA,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0gen_rtx_SET (hard_frame_pointer_rtx, src));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-- <br>
+2.34.1<br>
+<br>
+<br>
+From 03d5e89e7f3be53fd7142556e8e0a2774c653dca Mon Sep 17 00:00:00 2001<br>
+From: Richard Sandiford &lt;<a href=3D"mailto:richard.sandiford@arm.com" t=
arget=3D"_blank">richard.sandiford@arm.com</a>&gt;<br>
+Date: Tue, 12 Sep 2023 16:08:49 +0100<br>
+Subject: [PATCH 03/19] aarch64: Explicitly handle frames with no saved<br>
+ registers<br>
+<br>
+If a frame has no saved registers, it can be allocated in one go.<br>
+There is no need to treat the areas below and above the saved<br>
+registers as separate.<br>
+<br>
+And if we allocate the frame in one go, it should be allocated<br>
+as the initial_adjust rather than the final_adjust.=C2=A0 This allows the<=
br>
+frame size to grow to guard_size - guard_used_by_caller before a stack<br>
+probe is needed.=C2=A0 (A frame with no register saves is necessarily a<br=
>
+leaf frame.)<br>
+<br>
+This is a no-op as thing stand, since a leaf function will have<br>
+no outgoing arguments, and so all the frame will be above where<br>
+the saved registers normally go.<br>
+<br>
+gcc/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.cc (aarch64_layout_fra=
me): Explicitly<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0allocate the frame in one go if there are no sa=
ved registers.<br>
+---<br>
+ gcc/config/aarch64/aarch64.cc | 8 +++++---<br>
+ 1 file changed, 5 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.cc=
<br>
+index 79253322fd7..e1f21230c15 100644<br>
+--- a/gcc/config/aarch64/aarch64.cc<br>
++++ b/gcc/config/aarch64/aarch64.cc<br>
+@@ -8378,9 +8378,11 @@ aarch64_layout_frame (void)<br>
+ <br>
+=C2=A0 =C2=A0HOST_WIDE_INT const_size, const_outgoing_args_size, const_fp_=
offset;<br>
+=C2=A0 =C2=A0HOST_WIDE_INT const_saved_regs_size;<br>
+-=C2=A0 if (frame.frame_size.is_constant (&amp;const_size)<br>
+-=C2=A0 =C2=A0 =C2=A0 &amp;&amp; const_size &lt; max_push_offset<br>
+-=C2=A0 =C2=A0 =C2=A0 &amp;&amp; known_eq (frame.hard_fp_offset, const_siz=
e))<br>
++=C2=A0 if (known_eq (frame.saved_regs_size, 0))<br>
++=C2=A0 =C2=A0 frame.initial_adjust =3D frame.frame_size;<br>
++=C2=A0 else if (frame.frame_size.is_constant (&amp;const_size)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; const_size &lt; max_push_off=
set<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; known_eq (frame.hard_fp_offs=
et, const_size))<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Simple, small frame with no outgoing argumen=
ts:<br>
+ <br>
+-- <br>
+2.34.1<br>
+<br>
+<br>
+From 49c2eb7616756c323b7f6b18d8616ec945eb1263 Mon Sep 17 00:00:00 2001<br>
+From: Richard Sandiford &lt;<a href=3D"mailto:richard.sandiford@arm.com" t=
arget=3D"_blank">richard.sandiford@arm.com</a>&gt;<br>
+Date: Tue, 12 Sep 2023 16:08:49 +0100<br>
+Subject: [PATCH 04/19] aarch64: Add bytes_below_saved_regs to frame info<b=
r>
+<br>
+The frame layout code currently hard-codes the assumption that<br>
+the number of bytes below the saved registers is equal to the<br>
+size of the outgoing arguments.=C2=A0 This patch abstracts that<br>
+value into a new field of aarch64_frame.<br>
+<br>
+gcc/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.h (aarch64_frame::byte=
s_below_saved_regs): New<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0field.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.cc (aarch64_layout_fra=
me): Initialize it,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0and use it instead of crtl-&gt;outgoing_args_si=
ze.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_get_separate_components): Use bytes_be=
low_saved_regs instead<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0of outgoing_args_size.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_process_components): Likewise.<br>
+---<br>
+ gcc/config/aarch64/aarch64.cc | 71 ++++++++++++++++++-----------------<br=
>
+ gcc/config/aarch64/aarch64.h=C2=A0 |=C2=A0 5 +++<br>
+ 2 files changed, 41 insertions(+), 35 deletions(-)<br>
+<br>
+diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.cc=
<br>
+index e1f21230c15..94e1b686584 100644<br>
+--- a/gcc/config/aarch64/aarch64.cc<br>
++++ b/gcc/config/aarch64/aarch64.cc<br>
+@@ -8217,6 +8217,8 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0gcc_assert (crtl-&gt;is_leaf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| maybe_ne (frame.reg_off=
set[R30_REGNUM], SLOT_NOT_REQUIRED));<br>
+ <br>
++=C2=A0 frame.bytes_below_saved_regs =3D crtl-&gt;outgoing_args_size;<br>
++<br>
+=C2=A0 =C2=A0/* Now assign stack slots for the registers.=C2=A0 Start with=
 the predicate<br>
+=C2=A0 =C2=A0 =C2=A0 registers, since predicate LDR and STR have a relativ=
ely small<br>
+=C2=A0 =C2=A0 =C2=A0 offset range.=C2=A0 These saves happen below the hard=
 frame pointer.=C2=A0 */<br>
+@@ -8321,18 +8323,18 @@ aarch64_layout_frame (void)<br>
+ <br>
+=C2=A0 =C2=A0poly_int64 varargs_and_saved_regs_size =3D offset + frame.sav=
ed_varargs_size;<br>
+ <br>
+-=C2=A0 poly_int64 above_outgoing_args<br>
++=C2=A0 poly_int64 saved_regs_and_above<br>
+=C2=A0 =C2=A0 =C2=A0=3D aligned_upper_bound (varargs_and_saved_regs_size<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 + get_frame_size (),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 STACK_BOUNDARY / BITS_PER_UNIT);<br>
+ <br>
+=C2=A0 =C2=A0frame.hard_fp_offset<br>
+-=C2=A0 =C2=A0 =3D above_outgoing_args - frame.below_hard_fp_saved_regs_si=
ze;<br>
++=C2=A0 =C2=A0 =3D saved_regs_and_above - frame.below_hard_fp_saved_regs_s=
ize;<br>
+ <br>
+=C2=A0 =C2=A0/* Both these values are already aligned.=C2=A0 */<br>
+-=C2=A0 gcc_assert (multiple_p (crtl-&gt;outgoing_args_size,<br>
++=C2=A0 gcc_assert (multiple_p (frame.bytes_below_saved_regs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0STACK_BOUNDARY / BITS_PER_UNIT));<br>
+-=C2=A0 frame.frame_size =3D above_outgoing_args + crtl-&gt;outgoing_args_=
size;<br>
++=C2=A0 frame.frame_size =3D saved_regs_and_above + frame.bytes_below_save=
d_regs;<br>
+ <br>
+=C2=A0 =C2=A0frame.locals_offset =3D frame.saved_varargs_size;<br>
+ <br>
+@@ -8376,7 +8378,7 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0else if (frame.wb_pop_candidate1 !=3D INVALID_REGNUM)<br>
+=C2=A0 =C2=A0 =C2=A0max_push_offset =3D 256;<br>
+ <br>
+-=C2=A0 HOST_WIDE_INT const_size, const_outgoing_args_size, const_fp_offse=
t;<br>
++=C2=A0 HOST_WIDE_INT const_size, const_below_saved_regs, const_fp_offset;=
<br>
+=C2=A0 =C2=A0HOST_WIDE_INT const_saved_regs_size;<br>
+=C2=A0 =C2=A0if (known_eq (frame.saved_regs_size, 0))<br>
+=C2=A0 =C2=A0 =C2=A0frame.initial_adjust =3D frame.frame_size;<br>
+@@ -8384,31 +8386,31 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; const_size &lt; max_push_off=
set<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; known_eq (frame.hard_fp_offs=
et, const_size))<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 /* Simple, small frame with no outgoing arguments:<b=
r>
++=C2=A0 =C2=A0 =C2=A0 /* Simple, small frame with no data below the saved =
registers.<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 stp reg1, reg2, [sp, -frame_size]!<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 stp reg3, reg4, [sp, 16]=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame.callee_adjust =3D const_size;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 else if (crtl-&gt;outgoing_args_size.is_constant (&amp;const_outgo=
ing_args_size)<br>
++=C2=A0 else if (frame.bytes_below_saved_regs.is_constant (&amp;const_belo=
w_saved_regs)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; frame.saved_regs_size.is_con=
stant (&amp;const_saved_regs_size)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; const_outgoing_args_size + c=
onst_saved_regs_size &lt; 512<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* We could handle this case even with =
outgoing args, provided<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 that the number of args left us=
 with valid offsets for all<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 predicate and vector save slots=
.=C2=A0 It&#39;s such a rare case that<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 it hardly seems worth the effor=
t though.=C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; (!saves_below_hard_fp_p || c=
onst_outgoing_args_size =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; const_below_saved_regs + con=
st_saved_regs_size &lt; 512<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* We could handle this case even with =
data below the saved<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 registers, provided that that d=
ata left us with valid offsets<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for all predicate and vector sa=
ve slots.=C2=A0 It&#39;s such a rare<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case that it hardly seems worth=
 the effort though.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; (!saves_below_hard_fp_p || c=
onst_below_saved_regs =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; !(cfun-&gt;calls_alloca<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; frame.ha=
rd_fp_offset.is_constant (&amp;const_fp_offset)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; const_fp=
_offset &lt; max_push_offset))<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 /* Frame with small outgoing arguments:<br>
++=C2=A0 =C2=A0 =C2=A0 /* Frame with small area below the saved registers:<=
br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sub sp, sp, frame_size<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0stp reg1, reg2, [sp, outgoing_args_size]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0stp reg3, reg4, [sp, outgoing_args_size + 16]=
=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0stp reg1, reg2, [sp, bytes_below_saved_regs]<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0stp reg3, reg4, [sp, bytes_below_saved_regs + =
16]=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame.initial_adjust =3D frame.frame_size;<br>
+-=C2=A0 =C2=A0 =C2=A0 frame.callee_offset =3D const_outgoing_args_size;<br=
>
++=C2=A0 =C2=A0 =C2=A0 frame.callee_offset =3D const_below_saved_regs;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0else if (saves_below_hard_fp_p<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; known_eq (frame.saved_regs_s=
ize,<br>
+@@ -8418,30 +8420,29 @@ aarch64_layout_frame (void)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sub sp, sp, hard_fp_offset + below_hard_fp_sav=
ed_regs_size<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 save SVE registers relative to SP<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0sub sp, sp, outgoing_args_size=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0sub sp, sp, bytes_below_saved_regs=C2=A0 */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame.initial_adjust =3D (frame.hard_fp_offset<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ frame.below_hard_fp_saved_regs_size);<br>
+-=C2=A0 =C2=A0 =C2=A0 frame.final_adjust =3D crtl-&gt;outgoing_args_size;<=
br>
++=C2=A0 =C2=A0 =C2=A0 frame.final_adjust =3D frame.bytes_below_saved_regs;=
<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0else if (frame.hard_fp_offset.is_constant (&amp;const_fp_offs=
et)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; const_fp_offset &lt; max_pus=
h_offset)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 /* Frame with large outgoing arguments or SVE saves,=
 but with<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0a small local area:<br>
++=C2=A0 =C2=A0 =C2=A0 /* Frame with large area below the saved registers, =
or with SVE saves,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0but with a small area above:<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 stp reg1, reg2, [sp, -hard_fp_offset]!<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 stp reg3, reg4, [sp, 16]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [sub sp, sp, below_hard_fp_saved_regs_size]<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [save SVE registers relative to SP]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0sub sp, sp, outgoing_args_size=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0sub sp, sp, bytes_below_saved_regs=C2=A0 */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame.callee_adjust =3D const_fp_offset;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame.sve_callee_adjust =3D frame.below_hard_fp=
_saved_regs_size;<br>
+-=C2=A0 =C2=A0 =C2=A0 frame.final_adjust =3D crtl-&gt;outgoing_args_size;<=
br>
++=C2=A0 =C2=A0 =C2=A0 frame.final_adjust =3D frame.bytes_below_saved_regs;=
<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 /* Frame with large local area and outgoing argument=
s or SVE saves,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0using frame pointer:<br>
++=C2=A0 =C2=A0 =C2=A0 /* General case:<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sub sp, sp, hard_fp_offset<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 stp x29, x30, [sp, 0]<br>
+@@ -8449,10 +8450,10 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 stp reg3, reg4, [sp, 16]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [sub sp, sp, below_hard_fp_saved_regs_size]<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [save SVE registers relative to SP]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0sub sp, sp, outgoing_args_size=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0sub sp, sp, bytes_below_saved_regs=C2=A0 */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame.initial_adjust =3D frame.hard_fp_offset;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame.sve_callee_adjust =3D frame.below_hard_fp=
_saved_regs_size;<br>
+-=C2=A0 =C2=A0 =C2=A0 frame.final_adjust =3D crtl-&gt;outgoing_args_size;<=
br>
++=C2=A0 =C2=A0 =C2=A0 frame.final_adjust =3D frame.bytes_below_saved_regs;=
<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0/* Make sure the individual adjustments add up to the full fr=
ame size.=C2=A0 */<br>
+@@ -9043,7 +9044,7 @@ aarch64_get_separate_components (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (frame_pointer_needed)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset -=3D frame.below_hard_fp_saved_re=
gs_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 offset +=3D crtl-&gt;outgoing_args_size;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 offset +=3D frame.bytes_below_saved_regs;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check that we can access the stack slot of t=
he register with one<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 direct load with no adjustments needed.=
=C2=A0 */<br>
+@@ -9192,7 +9193,7 @@ aarch64_process_components (sbitmap components, bool=
 prologue_p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (frame_pointer_needed)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0offset -=3D frame.below_hard_fp_saved_regs_size=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+-=C2=A0 =C2=A0 =C2=A0 offset +=3D crtl-&gt;outgoing_args_size;<br>
++=C2=A0 =C2=A0 =C2=A0 offset +=3D frame.bytes_below_saved_regs;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rtx addr =3D plus_constant (Pmode, ptr_reg, off=
set);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rtx mem =3D gen_frame_mem (mode, addr);<br>
+@@ -9246,7 +9247,7 @@ aarch64_process_components (sbitmap components, bool=
 prologue_p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (frame_pointer_needed)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0offset2 -=3D frame.below_hard_fp_saved_regs_siz=
e;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+-=C2=A0 =C2=A0 =C2=A0 offset2 +=3D crtl-&gt;outgoing_args_size;<br>
++=C2=A0 =C2=A0 =C2=A0 offset2 +=3D frame.bytes_below_saved_regs;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rtx addr2 =3D plus_constant (Pmode, ptr_reg, of=
fset2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rtx mem2 =3D gen_frame_mem (mode, addr2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rtx set2 =3D prologue_p ? gen_rtx_SET (mem2, re=
g2)<br>
+@@ -9320,10 +9321,10 @@ aarch64_stack_clash_protection_alloca_probe_range =
(void)<br>
+=C2=A0 =C2=A0 registers.=C2=A0 If POLY_SIZE is not large enough to require=
 a probe this function<br>
+=C2=A0 =C2=A0 will only adjust the stack.=C2=A0 When allocating the stack =
space<br>
+=C2=A0 =C2=A0 FRAME_RELATED_P is then used to indicate if the allocation i=
s frame related.<br>
+-=C2=A0 =C2=A0FINAL_ADJUSTMENT_P indicates whether we are allocating the o=
utgoing<br>
+-=C2=A0 =C2=A0arguments.=C2=A0 If we are then we ensure that any allocatio=
n larger than the ABI<br>
+-=C2=A0 =C2=A0defined buffer needs a probe so that the invariant of having=
 a 1KB buffer is<br>
+-=C2=A0 =C2=A0maintained.<br>
++=C2=A0 =C2=A0FINAL_ADJUSTMENT_P indicates whether we are allocating the a=
rea below<br>
++=C2=A0 =C2=A0the saved registers.=C2=A0 If we are then we ensure that any=
 allocation<br>
++=C2=A0 =C2=A0larger than the ABI defined buffer needs a probe so that the=
<br>
++=C2=A0 =C2=A0invariant of having a 1KB buffer is maintained.<br>
+ <br>
+=C2=A0 =C2=A0 We emit barriers after each stack adjustment to prevent opti=
mizations from<br>
+=C2=A0 =C2=A0 breaking the invariant that we never drop the stack more tha=
n a page.=C2=A0 This<br>
+@@ -9532,7 +9533,7 @@ aarch64_allocate_and_probe_stack_space (rtx temp1, r=
tx temp2,<br>
+=C2=A0 =C2=A0/* Handle any residuals.=C2=A0 Residuals of at least MIN_PROB=
E_THRESHOLD have to<br>
+=C2=A0 =C2=A0 =C2=A0 be probed.=C2=A0 This maintains the requirement that =
each page is probed at<br>
+=C2=A0 =C2=A0 =C2=A0 least once.=C2=A0 For initial probing we probe only i=
f the allocation is<br>
+-=C2=A0 =C2=A0 =C2=A0more than GUARD_SIZE - buffer, and for the outgoing a=
rguments we probe<br>
++=C2=A0 =C2=A0 =C2=A0more than GUARD_SIZE - buffer, and below the saved re=
gisters we probe<br>
+=C2=A0 =C2=A0 =C2=A0 if the amount is larger than buffer.=C2=A0 GUARD_SIZE=
 - buffer + buffer =3D=3D<br>
+=C2=A0 =C2=A0 =C2=A0 GUARD_SIZE.=C2=A0 This works that for any allocation =
that is large enough to<br>
+=C2=A0 =C2=A0 =C2=A0 trigger a probe here, we&#39;ll have at least one, an=
d if they&#39;re not large<br>
+diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h<b=
r>
+index 6834c3e9922..1e105e12db8 100644<br>
+--- a/gcc/config/aarch64/aarch64.h<br>
++++ b/gcc/config/aarch64/aarch64.h<br>
+@@ -871,6 +871,11 @@ struct GTY (()) aarch64_frame<br>
+=C2=A0 =C2=A0/* The size of the callee-save registers with a slot in REG_O=
FFSET.=C2=A0 */<br>
+=C2=A0 =C2=A0poly_int64 saved_regs_size;<br>
+ <br>
++=C2=A0 /* The number of bytes between the bottom of the static frame (the=
 bottom<br>
++=C2=A0 =C2=A0 =C2=A0of the outgoing arguments) and the bottom of the regi=
ster save area.<br>
++=C2=A0 =C2=A0 =C2=A0This value is always a multiple of STACK_BOUNDARY.=C2=
=A0 */<br>
++=C2=A0 poly_int64 bytes_below_saved_regs;<br>
++<br>
+=C2=A0 =C2=A0/* The size of the callee-save registers with a slot in REG_O=
FFSET that<br>
+=C2=A0 =C2=A0 =C2=A0 are saved below the hard frame pointer.=C2=A0 */<br>
+=C2=A0 =C2=A0poly_int64 below_hard_fp_saved_regs_size;<br>
+-- <br>
+2.34.1<br>
+<br>
+<br>
+From 34081079ea4de0c98331843f574b5f6f94d7b234 Mon Sep 17 00:00:00 2001<br>
+From: Richard Sandiford &lt;<a href=3D"mailto:richard.sandiford@arm.com" t=
arget=3D"_blank">richard.sandiford@arm.com</a>&gt;<br>
+Date: Tue, 12 Sep 2023 16:08:50 +0100<br>
+Subject: [PATCH 05/19] aarch64: Add bytes_below_hard_fp to frame info<br>
+<br>
+Following on from the previous bytes_below_saved_regs patch, this one<br>
+records the number of bytes that are below the hard frame pointer.<br>
+This eventually replaces below_hard_fp_saved_regs_size.<br>
+<br>
+If a frame pointer is not needed, the epilogue adds final_adjust<br>
+to the stack pointer before restoring registers:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0aarch64_add_sp (tmp1_rtx, tmp0_rtx, final_adjust, true=
);<br>
+<br>
+Therefore, if the epilogue needs to restore the stack pointer from<br>
+the hard frame pointer, the directly corresponding offset is:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0-bytes_below_hard_fp + final_adjust<br>
+<br>
+i.e. go from the hard frame pointer to the bottom of the frame,<br>
+then add the same amount as if we were using the stack pointer<br>
+from the outset.<br>
+<br>
+gcc/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.h (aarch64_frame::byte=
s_below_hard_fp): New<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0field.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.cc (aarch64_layout_fra=
me): Initialize it.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_expand_epilogue): Use it instead of<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0below_hard_fp_saved_regs_size.<br>
+---<br>
+ gcc/config/aarch64/aarch64.cc | 6 +++---<br>
+ gcc/config/aarch64/aarch64.h=C2=A0 | 5 +++++<br>
+ 2 files changed, 8 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.cc=
<br>
+index 94e1b686584..c7d84245fbf 100644<br>
+--- a/gcc/config/aarch64/aarch64.cc<br>
++++ b/gcc/config/aarch64/aarch64.cc<br>
+@@ -8269,6 +8269,7 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0 =C2=A0 of the callee save area.=C2=A0 */<br>
+=C2=A0 =C2=A0bool saves_below_hard_fp_p =3D maybe_ne (offset, 0);<br>
+=C2=A0 =C2=A0frame.below_hard_fp_saved_regs_size =3D offset;<br>
++=C2=A0 frame.bytes_below_hard_fp =3D offset + frame.bytes_below_saved_reg=
s;<br>
+=C2=A0 =C2=A0if (frame.emit_frame_chain)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* FP and LR are placed in the linkage record.=
=C2=A0 */<br>
+@@ -9856,8 +9857,7 @@ aarch64_expand_epilogue (bool for_sibcall)<br>
+=C2=A0 =C2=A0poly_int64 final_adjust =3D frame.final_adjust;<br>
+=C2=A0 =C2=A0poly_int64 callee_offset =3D frame.callee_offset;<br>
+=C2=A0 =C2=A0poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;<br>
+-=C2=A0 poly_int64 below_hard_fp_saved_regs_size<br>
+-=C2=A0 =C2=A0 =3D frame.below_hard_fp_saved_regs_size;<br>
++=C2=A0 poly_int64 bytes_below_hard_fp =3D frame.bytes_below_hard_fp;<br>
+=C2=A0 =C2=A0unsigned reg1 =3D frame.wb_pop_candidate1;<br>
+=C2=A0 =C2=A0unsigned reg2 =3D frame.wb_pop_candidate2;<br>
+=C2=A0 =C2=A0unsigned int last_gpr =3D (frame.is_scs_enabled<br>
+@@ -9915,7 +9915,7 @@ aarch64_expand_epilogue (bool for_sibcall)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 is restored on the instruction doing the write=
back.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0aarch64_add_offset (Pmode, stack_pointer_rtx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0hard_frame_pointer_rtx,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -callee_offset - below_hard_fp_saved_regs_size,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -bytes_below_hard_fp + final_adjust,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tmp1_rtx, tmp0_rtx, callee_adjust =3D=3D 0);<br>
+=C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 /* The case where we need to re-use the register here=
 is very rare, so<br>
+diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h<b=
r>
+index 1e105e12db8..de68ff7202f 100644<br>
+--- a/gcc/config/aarch64/aarch64.h<br>
++++ b/gcc/config/aarch64/aarch64.h<br>
+@@ -880,6 +880,11 @@ struct GTY (()) aarch64_frame<br>
+=C2=A0 =C2=A0 =C2=A0 are saved below the hard frame pointer.=C2=A0 */<br>
+=C2=A0 =C2=A0poly_int64 below_hard_fp_saved_regs_size;<br>
+ <br>
++=C2=A0 /* The number of bytes between the bottom of the static frame (the=
 bottom<br>
++=C2=A0 =C2=A0 =C2=A0of the outgoing arguments) and the hard frame pointer=
.=C2=A0 This value is<br>
++=C2=A0 =C2=A0 =C2=A0always a multiple of STACK_BOUNDARY.=C2=A0 */<br>
++=C2=A0 poly_int64 bytes_below_hard_fp;<br>
++<br>
+=C2=A0 =C2=A0/* Offset from the base of the frame (incomming SP) to the<br=
>
+=C2=A0 =C2=A0 =C2=A0 top of the locals area.=C2=A0 This value is always a =
multiple of<br>
+=C2=A0 =C2=A0 =C2=A0 STACK_BOUNDARY.=C2=A0 */<br>
+-- <br>
+2.34.1<br>
+<br>
+<br>
+From 187861af7c51db9eddc6f954b589c121b210fc74 Mon Sep 17 00:00:00 2001<br>
+From: Richard Sandiford &lt;<a href=3D"mailto:richard.sandiford@arm.com" t=
arget=3D"_blank">richard.sandiford@arm.com</a>&gt;<br>
+Date: Tue, 12 Sep 2023 16:08:50 +0100<br>
+Subject: [PATCH 06/19] aarch64: Tweak aarch64_save/restore_callee_saves<br=
>
+<br>
+aarch64_save_callee_saves and aarch64_restore_callee_saves took<br>
+a parameter called start_offset that gives the offset of the<br>
+bottom of the saved register area from the current stack pointer.<br>
+However, it&#39;s more convenient for later patches if we use the<br>
+bottom of the entire frame as the reference point, rather than<br>
+the bottom of the saved registers.<br>
+<br>
+Doing that removes the need for the callee_offset field.<br>
+Other than that, this is not a win on its own.=C2=A0 It only really<br>
+makes sense in combination with the follow-on patches.<br>
+<br>
+gcc/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.h (aarch64_frame::call=
ee_offset): Delete.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.cc (aarch64_layout_fra=
me): Remove<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0callee_offset handling.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_save_callee_saves): Replace the start_=
offset parameter<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0with a bytes_below_sp parameter.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_restore_callee_saves): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_expand_prologue): Update accordingly.<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_expand_epilogue): Likewise.<br>
+---<br>
+ gcc/config/aarch64/aarch64.cc | 56 +++++++++++++++++------------------<br=
>
+ gcc/config/aarch64/aarch64.h=C2=A0 |=C2=A0 4 ---<br>
+ 2 files changed, 28 insertions(+), 32 deletions(-)<br>
+<br>
+diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.cc=
<br>
+index c7d84245fbf..e79551af41d 100644<br>
+--- a/gcc/config/aarch64/aarch64.cc<br>
++++ b/gcc/config/aarch64/aarch64.cc<br>
+@@ -8343,7 +8343,6 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0frame.final_adjust =3D 0;<br>
+=C2=A0 =C2=A0frame.callee_adjust =3D 0;<br>
+=C2=A0 =C2=A0frame.sve_callee_adjust =3D 0;<br>
+-=C2=A0 frame.callee_offset =3D 0;<br>
+ <br>
+=C2=A0 =C2=A0frame.wb_pop_candidate1 =3D frame.wb_push_candidate1;<br>
+=C2=A0 =C2=A0frame.wb_pop_candidate2 =3D frame.wb_push_candidate2;<br>
+@@ -8411,7 +8410,6 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 stp reg1, reg2, [sp, bytes_below_saved_regs]<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 stp reg3, reg4, [sp, bytes_below_saved_regs + =
16]=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame.initial_adjust =3D frame.frame_size;<br>
+-=C2=A0 =C2=A0 =C2=A0 frame.callee_offset =3D const_below_saved_regs;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0else if (saves_below_hard_fp_p<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; known_eq (frame.saved_regs_s=
ize,<br>
+@@ -8758,12 +8756,13 @@ aarch64_add_cfa_expression (rtx_insn *insn, rtx re=
g,<br>
+ }<br>
+ <br>
+ /* Emit code to save the callee-saved registers from register number STAR=
T<br>
+-=C2=A0 =C2=A0to LIMIT to the stack at the location starting at offset STA=
RT_OFFSET,<br>
+-=C2=A0 =C2=A0skipping any write-back candidates if SKIP_WB is true.=C2=A0=
 HARD_FP_VALID_P<br>
+-=C2=A0 =C2=A0is true if the hard frame pointer has been set up.=C2=A0 */<=
br>
++=C2=A0 =C2=A0to LIMIT to the stack.=C2=A0 The stack pointer is currently =
BYTES_BELOW_SP<br>
++=C2=A0 =C2=A0bytes above the bottom of the static frame.=C2=A0 Skip any w=
rite-back<br>
++=C2=A0 =C2=A0candidates if SKIP_WB is true.=C2=A0 HARD_FP_VALID_P is true=
 if the hard<br>
++=C2=A0 =C2=A0frame pointer has been set up.=C2=A0 */<br>
+ <br>
+ static void<br>
+-aarch64_save_callee_saves (poly_int64 start_offset,<br>
++aarch64_save_callee_saves (poly_int64 bytes_below_sp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 unsigned start, unsigned limit, bool skip_wb,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 bool hard_fp_valid_p)<br>
+ {<br>
+@@ -8791,7 +8790,9 @@ aarch64_save_callee_saves (poly_int64 start_offset,<=
br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0machine_mode mode =3D aarch64_reg_save_mode (re=
gno);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D gen_rtx_REG (mode, regno);<br>
+-=C2=A0 =C2=A0 =C2=A0 offset =3D start_offset + frame.reg_offset[regno];<b=
r>
++=C2=A0 =C2=A0 =C2=A0 offset =3D (frame.reg_offset[regno]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + frame.bytes_below_save=
d_regs<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - bytes_below_sp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rtx base_rtx =3D stack_pointer_rtx;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0poly_int64 sp_offset =3D offset;<br>
+ <br>
+@@ -8802,9 +8803,7 @@ aarch64_save_callee_saves (poly_int64 start_offset,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (GP_REGNUM_P (regno)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (!offset.is_co=
nstant (&amp;const_offset) || const_offset &gt;=3D 512))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gcc_assert (known_eq (start_offset, 0));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 poly_int64 fp_offset<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D frame.below_hard_fp_saved_regs_siz=
e;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 poly_int64 fp_offset =3D frame.bytes_below_ha=
rd_fp - bytes_below_sp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (hard_fp_valid_p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base_rtx =3D hard_frame_pointer_r=
tx;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+@@ -8868,12 +8867,13 @@ aarch64_save_callee_saves (poly_int64 start_offset=
,<br>
+ }<br>
+ <br>
+ /* Emit code to restore the callee registers from register number START<b=
r>
+-=C2=A0 =C2=A0up to and including LIMIT.=C2=A0 Restore from the stack offs=
et START_OFFSET,<br>
+-=C2=A0 =C2=A0skipping any write-back candidates if SKIP_WB is true.=C2=A0=
 Write the<br>
+-=C2=A0 =C2=A0appropriate REG_CFA_RESTORE notes into CFI_OPS.=C2=A0 */<br>
++=C2=A0 =C2=A0up to and including LIMIT.=C2=A0 The stack pointer is curren=
tly BYTES_BELOW_SP<br>
++=C2=A0 =C2=A0bytes above the bottom of the static frame.=C2=A0 Skip any w=
rite-back<br>
++=C2=A0 =C2=A0candidates if SKIP_WB is true.=C2=A0 Write the appropriate R=
EG_CFA_RESTORE<br>
++=C2=A0 =C2=A0notes into CFI_OPS.=C2=A0 */<br>
+ <br>
+ static void<br>
+-aarch64_restore_callee_saves (poly_int64 start_offset, unsigned start,<br=
>
++aarch64_restore_callee_saves (poly_int64 bytes_below_sp, unsigned start,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned limit, bool skip_wb, rtx *cfi_ops)<=
br>
+ {<br>
+=C2=A0 =C2=A0aarch64_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;<br>
+@@ -8899,7 +8899,9 @@ aarch64_restore_callee_saves (poly_int64 start_offse=
t, unsigned start,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0machine_mode mode =3D aarch64_reg_save_mode (re=
gno);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D gen_rtx_REG (mode, regno);<br>
+-=C2=A0 =C2=A0 =C2=A0 offset =3D start_offset + frame.reg_offset[regno];<b=
r>
++=C2=A0 =C2=A0 =C2=A0 offset =3D (frame.reg_offset[regno]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + frame.bytes_below_save=
d_regs<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - bytes_below_sp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rtx base_rtx =3D stack_pointer_rtx;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mode =3D=3D VNx2DImode &amp;&amp; BYTES_BIG=
_ENDIAN)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0aarch64_adjust_sve_callee_save_base (mode, base=
_rtx, anchor_reg,<br>
+@@ -9675,8 +9677,6 @@ aarch64_expand_prologue (void)<br>
+=C2=A0 =C2=A0HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;<br>
+=C2=A0 =C2=A0poly_int64 final_adjust =3D frame.final_adjust;<br>
+=C2=A0 =C2=A0poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;<br>
+-=C2=A0 poly_int64 below_hard_fp_saved_regs_size<br>
+-=C2=A0 =C2=A0 =3D frame.below_hard_fp_saved_regs_size;<br>
+=C2=A0 =C2=A0unsigned reg1 =3D frame.wb_push_candidate1;<br>
+=C2=A0 =C2=A0unsigned reg2 =3D frame.wb_push_candidate2;<br>
+=C2=A0 =C2=A0bool emit_frame_chain =3D frame.emit_frame_chain;<br>
+@@ -9752,8 +9752,8 @@ aarch64_expand_prologue (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 - frame.hard_fp_offset);<br>
+=C2=A0 =C2=A0gcc_assert (known_ge (chain_offset, 0));<br>
+ <br>
+-=C2=A0 /* The offset of the bottom of the save area from the current SP.=
=C2=A0 */<br>
+-=C2=A0 poly_int64 saved_regs_offset =3D chain_offset - below_hard_fp_save=
d_regs_size;<br>
++=C2=A0 /* The offset of the current SP from the bottom of the static fram=
e.=C2=A0 */<br>
++=C2=A0 poly_int64 bytes_below_sp =3D frame_size - initial_adjust - callee=
_adjust;<br>
+ <br>
+=C2=A0 =C2=A0if (emit_frame_chain)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+@@ -9761,7 +9761,7 @@ aarch64_expand_prologue (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg1 =3D R29_REGNUM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg2 =3D R30_REGNUM;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 aarch64_save_callee_saves (saved_regs_offset,=
 reg1, reg2,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 aarch64_save_callee_saves (bytes_below_sp, re=
g1, reg2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 false, false);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+@@ -9801,7 +9801,7 @@ aarch64_expand_prologue (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0emit_insn (gen_stack_tie (stack_pointer_rtx, ha=
rd_frame_pointer_rtx));<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 aarch64_save_callee_saves (saved_regs_offset, R0_REGNUM, R30_REGNU=
M,<br>
++=C2=A0 aarch64_save_callee_saves (bytes_below_sp, R0_REGNUM, R30_REGNUM,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 callee_adjust !=3D 0 || emit_frame_chain,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 emit_frame_chain);<br>
+=C2=A0 =C2=A0if (maybe_ne (sve_callee_adjust, 0))<br>
+@@ -9811,16 +9811,17 @@ aarch64_expand_prologue (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0aarch64_allocate_and_probe_stack_space (tmp1_rt=
x, tmp0_rtx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0sve_callee_adjust,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0!frame_pointer_needed, false);<br>
+-=C2=A0 =C2=A0 =C2=A0 saved_regs_offset +=3D sve_callee_adjust;<br>
++=C2=A0 =C2=A0 =C2=A0 bytes_below_sp -=3D sve_callee_adjust;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 aarch64_save_callee_saves (saved_regs_offset, P0_REGNUM, P15_REGNU=
M,<br>
++=C2=A0 aarch64_save_callee_saves (bytes_below_sp, P0_REGNUM, P15_REGNUM,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 false, emit_frame_chain);<br>
+-=C2=A0 aarch64_save_callee_saves (saved_regs_offset, V0_REGNUM, V31_REGNU=
M,<br>
++=C2=A0 aarch64_save_callee_saves (bytes_below_sp, V0_REGNUM, V31_REGNUM,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 callee_adjust !=3D 0 || emit_frame_chain,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 emit_frame_chain);<br>
+ <br>
+=C2=A0 =C2=A0/* We may need to probe the final adjustment if it is larger =
than the guard<br>
+=C2=A0 =C2=A0 =C2=A0 that is assumed by the called.=C2=A0 */<br>
++=C2=A0 gcc_assert (known_eq (bytes_below_sp, final_adjust));<br>
+=C2=A0 =C2=A0aarch64_allocate_and_probe_stack_space (tmp1_rtx, tmp0_rtx, f=
inal_adjust,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!f=
rame_pointer_needed, true);<br>
+ }<br>
+@@ -9855,7 +9856,6 @@ aarch64_expand_epilogue (bool for_sibcall)<br>
+=C2=A0 =C2=A0poly_int64 initial_adjust =3D frame.initial_adjust;<br>
+=C2=A0 =C2=A0HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;<br>
+=C2=A0 =C2=A0poly_int64 final_adjust =3D frame.final_adjust;<br>
+-=C2=A0 poly_int64 callee_offset =3D frame.callee_offset;<br>
+=C2=A0 =C2=A0poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;<br>
+=C2=A0 =C2=A0poly_int64 bytes_below_hard_fp =3D frame.bytes_below_hard_fp;=
<br>
+=C2=A0 =C2=A0unsigned reg1 =3D frame.wb_pop_candidate1;<br>
+@@ -9925,9 +9925,9 @@ aarch64_expand_epilogue (bool for_sibcall)<br>
+ <br>
+=C2=A0 =C2=A0/* Restore the vector registers before the predicate register=
s,<br>
+=C2=A0 =C2=A0 =C2=A0 so that we can use P4 as a temporary for big-endian S=
VE frames.=C2=A0 */<br>
+-=C2=A0 aarch64_restore_callee_saves (callee_offset, V0_REGNUM, V31_REGNUM=
,<br>
++=C2=A0 aarch64_restore_callee_saves (final_adjust, V0_REGNUM, V31_REGNUM,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0callee_adjust !=3D 0, &amp;cfi_ops);<=
br>
+-=C2=A0 aarch64_restore_callee_saves (callee_offset, P0_REGNUM, P15_REGNUM=
,<br>
++=C2=A0 aarch64_restore_callee_saves (final_adjust, P0_REGNUM, P15_REGNUM,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0false, &amp;cfi_ops);<br>
+=C2=A0 =C2=A0if (maybe_ne (sve_callee_adjust, 0))<br>
+=C2=A0 =C2=A0 =C2=A0aarch64_add_sp (NULL_RTX, NULL_RTX, sve_callee_adjust,=
 true);<br>
+@@ -9935,7 +9935,7 @@ aarch64_expand_epilogue (bool for_sibcall)<br>
+=C2=A0 =C2=A0/* When shadow call stack is enabled, the scs_pop in the epil=
ogue will<br>
+=C2=A0 =C2=A0 =C2=A0 restore x30, we don&#39;t need to restore x30 again i=
n the traditional<br>
+=C2=A0 =C2=A0 =C2=A0 way.=C2=A0 */<br>
+-=C2=A0 aarch64_restore_callee_saves (callee_offset - sve_callee_adjust,<b=
r>
++=C2=A0 aarch64_restore_callee_saves (final_adjust + sve_callee_adjust,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0R0_REGNUM, last_gpr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0callee_adjust !=3D 0, &amp;cfi_ops);<=
br>
+ <br>
+diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h<b=
r>
+index de68ff7202f..94fca4b9471 100644<br>
+--- a/gcc/config/aarch64/aarch64.h<br>
++++ b/gcc/config/aarch64/aarch64.h<br>
+@@ -907,10 +907,6 @@ struct GTY (()) aarch64_frame<br>
+=C2=A0 =C2=A0 =C2=A0 It is zero when no push is used.=C2=A0 */<br>
+=C2=A0 =C2=A0HOST_WIDE_INT callee_adjust;<br>
+ <br>
+-=C2=A0 /* The offset from SP to the callee-save registers after initial_a=
djust.<br>
+-=C2=A0 =C2=A0 =C2=A0It may be non-zero if no push is used (ie. callee_adj=
ust =3D=3D 0).=C2=A0 */<br>
+-=C2=A0 poly_int64 callee_offset;<br>
+-<br>
+=C2=A0 =C2=A0/* The size of the stack adjustment before saving or after re=
storing<br>
+=C2=A0 =C2=A0 =C2=A0 SVE registers.=C2=A0 */<br>
+=C2=A0 =C2=A0poly_int64 sve_callee_adjust;<br>
+-- <br>
+2.34.1<br>
+<br>
+<br>
+From 2b983f9064d808daf909bde1d4a13980934a7e6e Mon Sep 17 00:00:00 2001<br>
+From: Richard Sandiford &lt;<a href=3D"mailto:richard.sandiford@arm.com" t=
arget=3D"_blank">richard.sandiford@arm.com</a>&gt;<br>
+Date: Tue, 12 Sep 2023 16:08:51 +0100<br>
+Subject: [PATCH 07/19] aarch64: Only calculate chain_offset if there is a<=
br>
+ chain<br>
+<br>
+After previous patches, it is no longer necessary to calculate<br>
+a chain_offset in cases where there is no chain record.<br>
+<br>
+gcc/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.cc (aarch64_expand_pro=
logue): Move the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0calculation of chain_offset into the emit_frame=
_chain block.<br>
+---<br>
+ gcc/config/aarch64/aarch64.cc | 10 +++++-----<br>
+ 1 file changed, 5 insertions(+), 5 deletions(-)<br>
+<br>
+diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.cc=
<br>
+index e79551af41d..d71a042d611 100644<br>
+--- a/gcc/config/aarch64/aarch64.cc<br>
++++ b/gcc/config/aarch64/aarch64.cc<br>
+@@ -9747,16 +9747,16 @@ aarch64_expand_prologue (void)<br>
+=C2=A0 =C2=A0if (callee_adjust !=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0aarch64_push_regs (reg1, reg2, callee_adjust);<br>
+ <br>
+-=C2=A0 /* The offset of the frame chain record (if any) from the current =
SP.=C2=A0 */<br>
+-=C2=A0 poly_int64 chain_offset =3D (initial_adjust + callee_adjust<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0- frame.hard_fp_offset);<br>
+-=C2=A0 gcc_assert (known_ge (chain_offset, 0));<br>
+-<br>
+=C2=A0 =C2=A0/* The offset of the current SP from the bottom of the static=
 frame.=C2=A0 */<br>
+=C2=A0 =C2=A0poly_int64 bytes_below_sp =3D frame_size - initial_adjust - c=
allee_adjust;<br>
+ <br>
+=C2=A0 =C2=A0if (emit_frame_chain)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 /* The offset of the frame chain record (if any) fro=
m the current SP.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 poly_int64 chain_offset =3D (initial_adjust + callee=
_adjust<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- frame.hard_fp_offset);<br>
++=C2=A0 =C2=A0 =C2=A0 gcc_assert (known_ge (chain_offset, 0));<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (callee_adjust =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg1 =3D R29_REGNUM;<br>
+-- <br>
+2.34.1<br>
+<br>
+<br>
+From 0a0a824808d1dec51004fb5805c1a0ae2a35433f Mon Sep 17 00:00:00 2001<br>
+From: Richard Sandiford &lt;<a href=3D"mailto:richard.sandiford@arm.com" t=
arget=3D"_blank">richard.sandiford@arm.com</a>&gt;<br>
+Date: Tue, 12 Sep 2023 16:08:51 +0100<br>
+Subject: [PATCH 08/19] aarch64: Rename locals_offset to bytes_above_locals=
<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+locals_offset was described as:<br>
+<br>
+=C2=A0 /* Offset from the base of the frame (incomming SP) to the<br>
+=C2=A0 =C2=A0 =C2=A0top of the locals area.=C2=A0 This value is always a m=
ultiple of<br>
+=C2=A0 =C2=A0 =C2=A0STACK_BOUNDARY.=C2=A0 */<br>
+<br>
+This is implicitly an =E2=80=9Cupside down=E2=80=9D view of the frame: the=
 incoming<br>
+SP is at offset 0, and anything N bytes below the incoming SP is at<br>
+offset N (rather than -N).<br>
+<br>
+However, reg_offset instead uses a =E2=80=9Cright way up=E2=80=9D view; th=
at is,<br>
+it views offsets in address terms.=C2=A0 Something above X is at a<br>
+positive offset from X and something below X is at a negative<br>
+offset from X.<br>
+<br>
+Also, even on FRAME_GROWS_DOWNWARD targets like AArch64,<br>
+target-independent code views offsets in address terms too:<br>
+locals are allocated at negative offsets to virtual_stack_vars.<br>
+<br>
+It seems confusing to have *_offset fields of the same structure<br>
+using different polarities like this.=C2=A0 This patch tries to avoid<br>
+that by renaming locals_offset to bytes_above_locals.<br>
+<br>
+gcc/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.h (aarch64_frame::loca=
ls_offset): Rename to...<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_frame::bytes_above_locals): ...this.<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.cc (aarch64_layout_fra=
me)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_initial_elimination_offset): Update ac=
cordingly.<br>
+---<br>
+ gcc/config/aarch64/aarch64.cc | 6 +++---<br>
+ gcc/config/aarch64/aarch64.h=C2=A0 | 6 +++---<br>
+ 2 files changed, 6 insertions(+), 6 deletions(-)<br>
+<br>
+diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.cc=
<br>
+index d71a042d611..d4ec352ba98 100644<br>
+--- a/gcc/config/aarch64/aarch64.cc<br>
++++ b/gcc/config/aarch64/aarch64.cc<br>
+@@ -8337,7 +8337,7 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0STACK_BOUNDARY / BITS_PER_UNIT));<br>
+=C2=A0 =C2=A0frame.frame_size =3D saved_regs_and_above + frame.bytes_below=
_saved_regs;<br>
+ <br>
+-=C2=A0 frame.locals_offset =3D frame.saved_varargs_size;<br>
++=C2=A0 frame.bytes_above_locals =3D frame.saved_varargs_size;<br>
+ <br>
+=C2=A0 =C2=A0frame.initial_adjust =3D 0;<br>
+=C2=A0 =C2=A0frame.final_adjust =3D 0;<br>
+@@ -12578,13 +12578,13 @@ aarch64_initial_elimination_offset (unsigned fro=
m, unsigned to)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return frame.hard_fp_offset;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (from =3D=3D FRAME_POINTER_REGNUM)<br>
+-=C2=A0 =C2=A0 =C2=A0 return frame.hard_fp_offset - frame.locals_offset;<b=
r>
++=C2=A0 =C2=A0 =C2=A0 return frame.hard_fp_offset - frame.bytes_above_loca=
ls;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0if (to =3D=3D STACK_POINTER_REGNUM)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (from =3D=3D FRAME_POINTER_REGNUM)<br>
+-=C2=A0 =C2=A0 =C2=A0 return frame.frame_size - frame.locals_offset;<br>
++=C2=A0 =C2=A0 =C2=A0 return frame.frame_size - frame.bytes_above_locals;<=
br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0return frame.frame_size;<br>
+diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h<b=
r>
+index 94fca4b9471..bf46e6124aa 100644<br>
+--- a/gcc/config/aarch64/aarch64.h<br>
++++ b/gcc/config/aarch64/aarch64.h<br>
+@@ -885,10 +885,10 @@ struct GTY (()) aarch64_frame<br>
+=C2=A0 =C2=A0 =C2=A0 always a multiple of STACK_BOUNDARY.=C2=A0 */<br>
+=C2=A0 =C2=A0poly_int64 bytes_below_hard_fp;<br>
+ <br>
+-=C2=A0 /* Offset from the base of the frame (incomming SP) to the<br>
+-=C2=A0 =C2=A0 =C2=A0top of the locals area.=C2=A0 This value is always a =
multiple of<br>
++=C2=A0 /* The number of bytes between the top of the locals area and the =
top<br>
++=C2=A0 =C2=A0 =C2=A0of the frame (the incomming SP).=C2=A0 This value is =
always a multiple of<br>
+=C2=A0 =C2=A0 =C2=A0 STACK_BOUNDARY.=C2=A0 */<br>
+-=C2=A0 poly_int64 locals_offset;<br>
++=C2=A0 poly_int64 bytes_above_locals;<br>
+ <br>
+=C2=A0 =C2=A0/* Offset from the base of the frame (incomming SP) to the<br=
>
+=C2=A0 =C2=A0 =C2=A0 hard_frame_pointer.=C2=A0 This value is always a mult=
iple of<br>
+-- <br>
+2.34.1<br>
+<br>
+<br>
+From 3fbf0789202b30a67b12e1fb785c7130f098d665 Mon Sep 17 00:00:00 2001<br>
+From: Richard Sandiford &lt;<a href=3D"mailto:richard.sandiford@arm.com" t=
arget=3D"_blank">richard.sandiford@arm.com</a>&gt;<br>
+Date: Tue, 12 Sep 2023 16:08:52 +0100<br>
+Subject: [PATCH 09/19] aarch64: Rename hard_fp_offset to bytes_above_hard_=
fp<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Similarly to the previous locals_offset patch, hard_fp_offset<br>
+was described as:<br>
+<br>
+=C2=A0 /* Offset from the base of the frame (incomming SP) to the<br>
+=C2=A0 =C2=A0 =C2=A0hard_frame_pointer.=C2=A0 This value is always a multi=
ple of<br>
+=C2=A0 =C2=A0 =C2=A0STACK_BOUNDARY.=C2=A0 */<br>
+=C2=A0 poly_int64 hard_fp_offset;<br>
+<br>
+which again took an =E2=80=9Cupside-down=E2=80=9D view: higher offsets mea=
nt lower<br>
+addresses.=C2=A0 This patch renames the field to bytes_above_hard_fp inste=
ad.<br>
+<br>
+gcc/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.h (aarch64_frame::hard=
_fp_offset): Rename<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0to...<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_frame::bytes_above_hard_fp): ...this.<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.cc (aarch64_layout_fra=
me)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_expand_prologue): Update accordingly.<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_initial_elimination_offset): Likewise.=
<br>
+---<br>
+ gcc/config/aarch64/aarch64.cc | 26 +++++++++++++-------------<br>
+ gcc/config/aarch64/aarch64.h=C2=A0 |=C2=A0 6 +++---<br>
+ 2 files changed, 16 insertions(+), 16 deletions(-)<br>
+<br>
+diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.cc=
<br>
+index d4ec352ba98..3c4052740e7 100644<br>
+--- a/gcc/config/aarch64/aarch64.cc<br>
++++ b/gcc/config/aarch64/aarch64.cc<br>
+@@ -8329,7 +8329,7 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 + get_frame_size (),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 STACK_BOUNDARY / BITS_PER_UNIT);<br>
+ <br>
+-=C2=A0 frame.hard_fp_offset<br>
++=C2=A0 frame.bytes_above_hard_fp<br>
+=C2=A0 =C2=A0 =C2=A0=3D saved_regs_and_above - frame.below_hard_fp_saved_r=
egs_size;<br>
+ <br>
+=C2=A0 =C2=A0/* Both these values are already aligned.=C2=A0 */<br>
+@@ -8378,13 +8378,13 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0else if (frame.wb_pop_candidate1 !=3D INVALID_REGNUM)<br>
+=C2=A0 =C2=A0 =C2=A0max_push_offset =3D 256;<br>
+ <br>
+-=C2=A0 HOST_WIDE_INT const_size, const_below_saved_regs, const_fp_offset;=
<br>
++=C2=A0 HOST_WIDE_INT const_size, const_below_saved_regs, const_above_fp;<=
br>
+=C2=A0 =C2=A0HOST_WIDE_INT const_saved_regs_size;<br>
+=C2=A0 =C2=A0if (known_eq (frame.saved_regs_size, 0))<br>
+=C2=A0 =C2=A0 =C2=A0frame.initial_adjust =3D frame.frame_size;<br>
+=C2=A0 =C2=A0else if (frame.frame_size.is_constant (&amp;const_size)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; const_size &lt; max_push_off=
set<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; known_eq (frame.hard_fp_offs=
et, const_size))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; known_eq (frame.bytes_above_=
hard_fp, const_size))<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Simple, small frame with no data below the s=
aved registers.<br>
+ <br>
+@@ -8401,8 +8401,8 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case that it hardly seems =
worth the effort though.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (!saves_below_hard_fp_p || c=
onst_below_saved_regs =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; !(cfun-&gt;calls_alloca<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; frame.hard_fp=
_offset.is_constant (&amp;const_fp_offset)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; const_fp_offs=
et &lt; max_push_offset))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; frame.bytes_a=
bove_hard_fp.is_constant (&amp;const_above_fp)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; const_above_f=
p &lt; max_push_offset))<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Frame with small area below the saved regist=
ers:<br>
+ <br>
+@@ -8420,12 +8420,12 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sub sp, sp, hard_fp_offset + below_hard_fp_sav=
ed_regs_size<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 save SVE registers relative to SP<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sub sp, sp, bytes_below_saved_regs=C2=A0 */<br=
>
+-=C2=A0 =C2=A0 =C2=A0 frame.initial_adjust =3D (frame.hard_fp_offset<br>
++=C2=A0 =C2=A0 =C2=A0 frame.initial_adjust =3D (frame.bytes_above_hard_fp<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ frame.below_hard_fp_saved_regs_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame.final_adjust =3D frame.bytes_below_saved_=
regs;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 else if (frame.hard_fp_offset.is_constant (&amp;const_fp_offset)<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; const_fp_offset &lt; max_pus=
h_offset)<br>
++=C2=A0 else if (frame.bytes_above_hard_fp.is_constant (&amp;const_above_f=
p)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; const_above_fp &lt; max_push=
_offset)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Frame with large area below the saved regist=
ers, or with SVE saves,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 but with a small area above:<br>
+@@ -8435,7 +8435,7 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [sub sp, sp, below_hard_fp_saved_regs_size]<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [save SVE registers relative to SP]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sub sp, sp, bytes_below_saved_regs=C2=A0 */<br=
>
+-=C2=A0 =C2=A0 =C2=A0 frame.callee_adjust =3D const_fp_offset;<br>
++=C2=A0 =C2=A0 =C2=A0 frame.callee_adjust =3D const_above_fp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame.sve_callee_adjust =3D frame.below_hard_fp=
_saved_regs_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame.final_adjust =3D frame.bytes_below_saved_=
regs;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+@@ -8450,7 +8450,7 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [sub sp, sp, below_hard_fp_saved_regs_size]<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [save SVE registers relative to SP]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sub sp, sp, bytes_below_saved_regs=C2=A0 */<br=
>
+-=C2=A0 =C2=A0 =C2=A0 frame.initial_adjust =3D frame.hard_fp_offset;<br>
++=C2=A0 =C2=A0 =C2=A0 frame.initial_adjust =3D frame.bytes_above_hard_fp;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame.sve_callee_adjust =3D frame.below_hard_fp=
_saved_regs_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame.final_adjust =3D frame.bytes_below_saved_=
regs;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+@@ -9754,7 +9754,7 @@ aarch64_expand_prologue (void)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The offset of the frame chain record (if any=
) from the current SP.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0poly_int64 chain_offset =3D (initial_adjust + c=
allee_adjust<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- frame.hard_fp_offset);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- frame.bytes_above_hard_fp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gcc_assert (known_ge (chain_offset, 0));<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (callee_adjust =3D=3D 0)<br>
+@@ -12575,10 +12575,10 @@ aarch64_initial_elimination_offset (unsigned fro=
m, unsigned to)<br>
+=C2=A0 =C2=A0if (to =3D=3D HARD_FRAME_POINTER_REGNUM)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (from =3D=3D ARG_POINTER_REGNUM)<br>
+-=C2=A0 =C2=A0 =C2=A0 return frame.hard_fp_offset;<br>
++=C2=A0 =C2=A0 =C2=A0 return frame.bytes_above_hard_fp;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (from =3D=3D FRAME_POINTER_REGNUM)<br>
+-=C2=A0 =C2=A0 =C2=A0 return frame.hard_fp_offset - frame.bytes_above_loca=
ls;<br>
++=C2=A0 =C2=A0 =C2=A0 return frame.bytes_above_hard_fp - frame.bytes_above=
_locals;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0if (to =3D=3D STACK_POINTER_REGNUM)<br>
+diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h<b=
r>
+index bf46e6124aa..dd1f403f939 100644<br>
+--- a/gcc/config/aarch64/aarch64.h<br>
++++ b/gcc/config/aarch64/aarch64.h<br>
+@@ -890,10 +890,10 @@ struct GTY (()) aarch64_frame<br>
+=C2=A0 =C2=A0 =C2=A0 STACK_BOUNDARY.=C2=A0 */<br>
+=C2=A0 =C2=A0poly_int64 bytes_above_locals;<br>
+ <br>
+-=C2=A0 /* Offset from the base of the frame (incomming SP) to the<br>
+-=C2=A0 =C2=A0 =C2=A0hard_frame_pointer.=C2=A0 This value is always a mult=
iple of<br>
++=C2=A0 /* The number of bytes between the hard_frame_pointer and the top =
of<br>
++=C2=A0 =C2=A0 =C2=A0the frame (the incomming SP).=C2=A0 This value is alw=
ays a multiple of<br>
+=C2=A0 =C2=A0 =C2=A0 STACK_BOUNDARY.=C2=A0 */<br>
+-=C2=A0 poly_int64 hard_fp_offset;<br>
++=C2=A0 poly_int64 bytes_above_hard_fp;<br>
+ <br>
+=C2=A0 =C2=A0/* The size of the frame.=C2=A0 This value is the offset from=
 base of the<br>
+=C2=A0 =C2=A0 =C2=A0 frame (incomming SP) to the stack_pointer.=C2=A0 This=
 value is always<br>
+-- <br>
+2.34.1<br>
+<br>
+<br>
+From aac8b31379ac3bbd14fc6427dce23f56e54e8485 Mon Sep 17 00:00:00 2001<br>
+From: Richard Sandiford &lt;<a href=3D"mailto:richard.sandiford@arm.com" t=
arget=3D"_blank">richard.sandiford@arm.com</a>&gt;<br>
+Date: Tue, 12 Sep 2023 16:08:52 +0100<br>
+Subject: [PATCH 10/19] aarch64: Tweak frame_size comment<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+This patch fixes another case in which a value was described with<br>
+an =E2=80=9Cupside-down=E2=80=9D view.<br>
+<br>
+gcc/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.h (aarch64_frame::fram=
e_size): Tweak comment.<br>
+---<br>
+ gcc/config/aarch64/aarch64.h | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h<b=
r>
+index dd1f403f939..700524ae22b 100644<br>
+--- a/gcc/config/aarch64/aarch64.h<br>
++++ b/gcc/config/aarch64/aarch64.h<br>
+@@ -895,8 +895,8 @@ struct GTY (()) aarch64_frame<br>
+=C2=A0 =C2=A0 =C2=A0 STACK_BOUNDARY.=C2=A0 */<br>
+=C2=A0 =C2=A0poly_int64 bytes_above_hard_fp;<br>
+ <br>
+-=C2=A0 /* The size of the frame.=C2=A0 This value is the offset from base=
 of the<br>
+-=C2=A0 =C2=A0 =C2=A0frame (incomming SP) to the stack_pointer.=C2=A0 This=
 value is always<br>
++=C2=A0 /* The size of the frame, i.e. the number of bytes between the bot=
tom<br>
++=C2=A0 =C2=A0 =C2=A0of the outgoing arguments and the incoming SP.=C2=A0 =
This value is always<br>
+=C2=A0 =C2=A0 =C2=A0 a multiple of STACK_BOUNDARY.=C2=A0 */<br>
+=C2=A0 =C2=A0poly_int64 frame_size;<br>
+ <br>
+-- <br>
+2.34.1<br>
+<br>
+<br>
+From 8d5506a8aeb8dd7e8b209a3663b07688478f76b9 Mon Sep 17 00:00:00 2001<br>
+From: Richard Sandiford &lt;<a href=3D"mailto:richard.sandiford@arm.com" t=
arget=3D"_blank">richard.sandiford@arm.com</a>&gt;<br>
+Date: Tue, 12 Sep 2023 16:08:53 +0100<br>
+Subject: [PATCH 11/19] aarch64: Measure reg_offset from the bottom of the<=
br>
+ frame<br>
+<br>
+reg_offset was measured from the bottom of the saved register area.<br>
+This made perfect sense with the original layout, since the bottom<br>
+of the saved register area was also the hard frame pointer address.<br>
+It became slightly less obvious with SVE, since we save SVE<br>
+registers below the hard frame pointer, but it still made sense.<br>
+<br>
+However, if we want to allow different frame layouts, it&#39;s more<br>
+convenient and obvious to measure reg_offset from the bottom of<br>
+the frame.=C2=A0 After previous patches, it&#39;s also a slight simplifica=
tion<br>
+in its own right.<br>
+<br>
+gcc/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.h (aarch64_frame): Add=
 comment above<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg_offset.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.cc (aarch64_layout_fra=
me): Walk offsets<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0from the bottom of the frame, rather than the b=
ottom of the saved<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0register area.=C2=A0 Measure reg_offset from th=
e bottom of the frame<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rather than the bottom of the saved register ar=
ea.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_save_callee_saves): Update accordingly=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_restore_callee_saves): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_get_separate_components): Likewise.<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_process_components): Likewise.<br>
+---<br>
+ gcc/config/aarch64/aarch64.cc | 53 ++++++++++++++++-------------------<br=
>
+ gcc/config/aarch64/aarch64.h=C2=A0 |=C2=A0 3 ++<br>
+ 2 files changed, 27 insertions(+), 29 deletions(-)<br>
+<br>
+diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.cc=
<br>
+index 3c4052740e7..97dd077844b 100644<br>
+--- a/gcc/config/aarch64/aarch64.cc<br>
++++ b/gcc/config/aarch64/aarch64.cc<br>
+@@ -8139,7 +8139,6 @@ aarch64_needs_frame_chain (void)<br>
+ static void<br>
+ aarch64_layout_frame (void)<br>
+ {<br>
+-=C2=A0 poly_int64 offset =3D 0;<br>
+=C2=A0 =C2=A0int regno, last_fp_reg =3D INVALID_REGNUM;<br>
+=C2=A0 =C2=A0machine_mode vector_save_mode =3D aarch64_reg_save_mode (V8_R=
EGNUM);<br>
+=C2=A0 =C2=A0poly_int64 vector_save_size =3D GET_MODE_SIZE (vector_save_mo=
de);<br>
+@@ -8217,7 +8216,9 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0gcc_assert (crtl-&gt;is_leaf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| maybe_ne (frame.reg_off=
set[R30_REGNUM], SLOT_NOT_REQUIRED));<br>
+ <br>
+-=C2=A0 frame.bytes_below_saved_regs =3D crtl-&gt;outgoing_args_size;<br>
++=C2=A0 poly_int64 offset =3D crtl-&gt;outgoing_args_size;<br>
++=C2=A0 gcc_assert (multiple_p (offset, STACK_BOUNDARY / BITS_PER_UNIT));<=
br>
++=C2=A0 frame.bytes_below_saved_regs =3D offset;<br>
+ <br>
+=C2=A0 =C2=A0/* Now assign stack slots for the registers.=C2=A0 Start with=
 the predicate<br>
+=C2=A0 =C2=A0 =C2=A0 registers, since predicate LDR and STR have a relativ=
ely small<br>
+@@ -8229,7 +8230,8 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0offset +=3D BYTES_PER_SVE_PRED;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 if (maybe_ne (offset, 0))<br>
++=C2=A0 poly_int64 saved_prs_size =3D offset - frame.bytes_below_saved_reg=
s;<br>
++=C2=A0 if (maybe_ne (saved_prs_size, 0))<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* If we have any vector registers to save abov=
e the predicate registers,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 the offset of the vector register save slots n=
eed to be a multiple<br>
+@@ -8247,10 +8249,10 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D aligned_upper_bound (offset, STACK_B=
OUNDARY / BITS_PER_UNIT);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (known_le (offset, vector_save_size))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset =3D vector_save_size;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (known_le (offset, vector_save_size *=
 2))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset =3D vector_save_size * 2;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (known_le (saved_prs_size, vector_save_siz=
e))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset =3D frame.bytes_below_saved_reg=
s + vector_save_size;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (known_le (saved_prs_size, vector_sav=
e_size * 2))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset =3D frame.bytes_below_saved_reg=
s + vector_save_size * 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc_unreachable ();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -8267,9 +8269,10 @@ aarch64_layout_frame (void)<br>
+ <br>
+=C2=A0 =C2=A0/* OFFSET is now the offset of the hard frame pointer from th=
e bottom<br>
+=C2=A0 =C2=A0 =C2=A0 of the callee save area.=C2=A0 */<br>
+-=C2=A0 bool saves_below_hard_fp_p =3D maybe_ne (offset, 0);<br>
+-=C2=A0 frame.below_hard_fp_saved_regs_size =3D offset;<br>
+-=C2=A0 frame.bytes_below_hard_fp =3D offset + frame.bytes_below_saved_reg=
s;<br>
++=C2=A0 frame.below_hard_fp_saved_regs_size =3D offset - frame.bytes_below=
_saved_regs;<br>
++=C2=A0 bool saves_below_hard_fp_p<br>
++=C2=A0 =C2=A0 =3D maybe_ne (frame.below_hard_fp_saved_regs_size, 0);<br>
++=C2=A0 frame.bytes_below_hard_fp =3D offset;<br>
+=C2=A0 =C2=A0if (frame.emit_frame_chain)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* FP and LR are placed in the linkage record.=
=C2=A0 */<br>
+@@ -8320,9 +8323,10 @@ aarch64_layout_frame (void)<br>
+ <br>
+=C2=A0 =C2=A0offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS=
_PER_UNIT);<br>
+ <br>
+-=C2=A0 frame.saved_regs_size =3D offset;<br>
++=C2=A0 frame.saved_regs_size =3D offset - frame.bytes_below_saved_regs;<b=
r>
+ <br>
+-=C2=A0 poly_int64 varargs_and_saved_regs_size =3D offset + frame.saved_va=
rargs_size;<br>
++=C2=A0 poly_int64 varargs_and_saved_regs_size<br>
++=C2=A0 =C2=A0 =3D frame.saved_regs_size + frame.saved_varargs_size;<br>
+ <br>
+=C2=A0 =C2=A0poly_int64 saved_regs_and_above<br>
+=C2=A0 =C2=A0 =C2=A0=3D aligned_upper_bound (varargs_and_saved_regs_size<b=
r>
+@@ -8790,9 +8794,7 @@ aarch64_save_callee_saves (poly_int64 bytes_below_sp=
,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0machine_mode mode =3D aarch64_reg_save_mode (re=
gno);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D gen_rtx_REG (mode, regno);<br>
+-=C2=A0 =C2=A0 =C2=A0 offset =3D (frame.reg_offset[regno]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + frame.bytes_below_save=
d_regs<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - bytes_below_sp);<br>
++=C2=A0 =C2=A0 =C2=A0 offset =3D frame.reg_offset[regno] - bytes_below_sp;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rtx base_rtx =3D stack_pointer_rtx;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0poly_int64 sp_offset =3D offset;<br>
+ <br>
+@@ -8899,9 +8901,7 @@ aarch64_restore_callee_saves (poly_int64 bytes_below=
_sp, unsigned start,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0machine_mode mode =3D aarch64_reg_save_mode (re=
gno);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D gen_rtx_REG (mode, regno);<br>
+-=C2=A0 =C2=A0 =C2=A0 offset =3D (frame.reg_offset[regno]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + frame.bytes_below_save=
d_regs<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - bytes_below_sp);<br>
++=C2=A0 =C2=A0 =C2=A0 offset =3D frame.reg_offset[regno] - bytes_below_sp;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rtx base_rtx =3D stack_pointer_rtx;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mode =3D=3D VNx2DImode &amp;&amp; BYTES_BIG=
_ENDIAN)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0aarch64_adjust_sve_callee_save_base (mode, base=
_rtx, anchor_reg,<br>
+@@ -9040,14 +9040,12 @@ aarch64_get_separate_components (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 it as a stack probe for -fstack-clash-p=
rotection.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (flag_stack_clash_protection<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; maybe_ne (frame.below_=
hard_fp_saved_regs_size, 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; known_eq (offset, 0))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; known_eq (offset, frame.byt=
es_below_saved_regs))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Get the offset relative to the register we&#=
39;ll use.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (frame_pointer_needed)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 offset -=3D frame.below_hard_fp_saved_regs_si=
ze;<br>
+-=C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 offset +=3D frame.bytes_below_saved_regs;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 offset -=3D frame.bytes_below_hard_fp;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check that we can access the stack slot of t=
he register with one<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 direct load with no adjustments needed.=
=C2=A0 */<br>
+@@ -9194,9 +9192,7 @@ aarch64_process_components (sbitmap components, bool=
 prologue_p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rtx reg =3D gen_rtx_REG (mode, regno);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0poly_int64 offset =3D frame.reg_offset[regno];<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (frame_pointer_needed)<br>
+-=C2=A0 =C2=A0 =C2=A0 offset -=3D frame.below_hard_fp_saved_regs_size;<br>
+-=C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 offset +=3D frame.bytes_below_saved_regs;<br>
++=C2=A0 =C2=A0 =C2=A0 offset -=3D frame.bytes_below_hard_fp;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rtx addr =3D plus_constant (Pmode, ptr_reg, off=
set);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rtx mem =3D gen_frame_mem (mode, addr);<br>
+@@ -9248,9 +9244,7 @@ aarch64_process_components (sbitmap components, bool=
 prologue_p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* REGNO2 can be saved/restored in a pair with =
REGNO.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rtx reg2 =3D gen_rtx_REG (mode, regno2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (frame_pointer_needed)<br>
+-=C2=A0 =C2=A0 =C2=A0 offset2 -=3D frame.below_hard_fp_saved_regs_size;<br=
>
+-=C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 offset2 +=3D frame.bytes_below_saved_regs;<br>
++=C2=A0 =C2=A0 =C2=A0 offset2 -=3D frame.bytes_below_hard_fp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rtx addr2 =3D plus_constant (Pmode, ptr_reg, of=
fset2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rtx mem2 =3D gen_frame_mem (mode, addr2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rtx set2 =3D prologue_p ? gen_rtx_SET (mem2, re=
g2)<br>
+@@ -9366,7 +9360,8 @@ aarch64_allocate_and_probe_stack_space (rtx temp1, r=
tx temp2,<br>
+=C2=A0 =C2=A0if (final_adjustment_p<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; known_eq (frame.below_hard_fp_saved_=
regs_size, 0))<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 poly_int64 lr_offset =3D frame.reg_offset[LR_REGNUM]=
;<br>
++=C2=A0 =C2=A0 =C2=A0 poly_int64 lr_offset =3D (frame.reg_offset[LR_REGNUM=
]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 - frame.bytes_below_saved_regs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (known_ge (lr_offset, 0))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0min_probe_threshold -=3D lr_offset.to_constant =
();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h<b=
r>
+index 700524ae22b..b6135837073 100644<br>
+--- a/gcc/config/aarch64/aarch64.h<br>
++++ b/gcc/config/aarch64/aarch64.h<br>
+@@ -860,6 +860,9 @@ extern enum aarch64_processor aarch64_tune;<br>
+ #ifdef HAVE_POLY_INT_H<br>
+ struct GTY (()) aarch64_frame<br>
+ {<br>
++=C2=A0 /* The offset from the bottom of the static frame (the bottom of t=
he<br>
++=C2=A0 =C2=A0 =C2=A0outgoing arguments) of each register save slot, or -2=
 if no save is<br>
++=C2=A0 =C2=A0 =C2=A0needed.=C2=A0 */<br>
+=C2=A0 =C2=A0poly_int64 reg_offset[LAST_SAVED_REGNUM + 1];<br>
+ <br>
+=C2=A0 =C2=A0/* The number of extra stack bytes taken up by register varar=
gs.<br>
+-- <br>
+2.34.1<br>
+<br>
+<br>
+From b47766614df3b9df878262efb2ad73aaac108363 Mon Sep 17 00:00:00 2001<br>
+From: Richard Sandiford &lt;<a href=3D"mailto:richard.sandiford@arm.com" t=
arget=3D"_blank">richard.sandiford@arm.com</a>&gt;<br>
+Date: Tue, 12 Sep 2023 16:08:53 +0100<br>
+Subject: [PATCH 12/19] aarch64: Simplify top of frame allocation<br>
+<br>
+After previous patches, it no longer really makes sense to allocate<br>
+the top of the frame in terms of varargs_and_saved_regs_size and<br>
+saved_regs_and_above.<br>
+<br>
+gcc/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.cc (aarch64_layout_fra=
me): Simplify<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0the allocation of the top of the frame.<br>
+---<br>
+ gcc/config/aarch64/aarch64.cc | 23 ++++++++---------------<br>
+ 1 file changed, 8 insertions(+), 15 deletions(-)<br>
+<br>
+diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.cc=
<br>
+index 97dd077844b..81935852d5b 100644<br>
+--- a/gcc/config/aarch64/aarch64.cc<br>
++++ b/gcc/config/aarch64/aarch64.cc<br>
+@@ -8325,23 +8325,16 @@ aarch64_layout_frame (void)<br>
+ <br>
+=C2=A0 =C2=A0frame.saved_regs_size =3D offset - frame.bytes_below_saved_re=
gs;<br>
+ <br>
+-=C2=A0 poly_int64 varargs_and_saved_regs_size<br>
+-=C2=A0 =C2=A0 =3D frame.saved_regs_size + frame.saved_varargs_size;<br>
+-<br>
+-=C2=A0 poly_int64 saved_regs_and_above<br>
+-=C2=A0 =C2=A0 =3D aligned_upper_bound (varargs_and_saved_regs_size<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0+ get_frame_size (),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0STACK_BOUNDARY / BITS_PER_UNIT);<br>
+-<br>
+-=C2=A0 frame.bytes_above_hard_fp<br>
+-=C2=A0 =C2=A0 =3D saved_regs_and_above - frame.below_hard_fp_saved_regs_s=
ize;<br>
++=C2=A0 offset +=3D get_frame_size ();<br>
++=C2=A0 offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_=
UNIT);<br>
++=C2=A0 auto top_of_locals =3D offset;<br>
+ <br>
+-=C2=A0 /* Both these values are already aligned.=C2=A0 */<br>
+-=C2=A0 gcc_assert (multiple_p (frame.bytes_below_saved_regs,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 STACK_BOUNDARY / BITS_PER_UNIT));<br>
+-=C2=A0 frame.frame_size =3D saved_regs_and_above + frame.bytes_below_save=
d_regs;<br>
++=C2=A0 offset +=3D frame.saved_varargs_size;<br>
++=C2=A0 gcc_assert (multiple_p (offset, STACK_BOUNDARY / BITS_PER_UNIT));<=
br>
++=C2=A0 frame.frame_size =3D offset;<br>
+ <br>
+-=C2=A0 frame.bytes_above_locals =3D frame.saved_varargs_size;<br>
++=C2=A0 frame.bytes_above_hard_fp =3D frame.frame_size - frame.bytes_below=
_hard_fp;<br>
++=C2=A0 frame.bytes_above_locals =3D frame.frame_size - top_of_locals;<br>
+ <br>
+=C2=A0 =C2=A0frame.initial_adjust =3D 0;<br>
+=C2=A0 =C2=A0frame.final_adjust =3D 0;<br>
+-- <br>
+2.34.1<br>
+<br>
+<br>
+From 08f71b4bb28fb74d20e8d2927a557e8119ce9f4d Mon Sep 17 00:00:00 2001<br>
+From: Richard Sandiford &lt;<a href=3D"mailto:richard.sandiford@arm.com" t=
arget=3D"_blank">richard.sandiford@arm.com</a>&gt;<br>
+Date: Tue, 12 Sep 2023 16:08:54 +0100<br>
+Subject: [PATCH 13/19] aarch64: Minor initial adjustment tweak<br>
+<br>
+This patch just changes a calculation of initial_adjust<br>
+to one that makes it slightly more obvious that the total<br>
+adjustment is frame.frame_size.<br>
+<br>
+gcc/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.cc (aarch64_layout_fra=
me): Tweak<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0calculation of initial_adjust for frames in whi=
ch all saves<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0are SVE saves.<br>
+---<br>
+ gcc/config/aarch64/aarch64.cc | 5 ++---<br>
+ 1 file changed, 2 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.cc=
<br>
+index 81935852d5b..4d9fcf3d162 100644<br>
+--- a/gcc/config/aarch64/aarch64.cc<br>
++++ b/gcc/config/aarch64/aarch64.cc<br>
+@@ -8414,11 +8414,10 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Frame in which all saves are SVE saves:<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0sub sp, sp, hard_fp_offset + below_hard_fp_sav=
ed_regs_size<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0sub sp, sp, frame_size - bytes_below_saved_reg=
s<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 save SVE registers relative to SP<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sub sp, sp, bytes_below_saved_regs=C2=A0 */<br=
>
+-=C2=A0 =C2=A0 =C2=A0 frame.initial_adjust =3D (frame.bytes_above_hard_fp<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 + frame.below_hard_fp_saved_regs_size);<br>
++=C2=A0 =C2=A0 =C2=A0 frame.initial_adjust =3D frame.frame_size - frame.by=
tes_below_saved_regs;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame.final_adjust =3D frame.bytes_below_saved_=
regs;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0else if (frame.bytes_above_hard_fp.is_constant (&amp;const_ab=
ove_fp)<br>
+-- <br>
+2.34.1<br>
+<br>
+<br>
+From f22315d5c19e8310e4dc880fd509678fd291fca8 Mon Sep 17 00:00:00 2001<br>
+From: Richard Sandiford &lt;<a href=3D"mailto:richard.sandiford@arm.com" t=
arget=3D"_blank">richard.sandiford@arm.com</a>&gt;<br>
+Date: Tue, 12 Sep 2023 16:08:54 +0100<br>
+Subject: [PATCH 14/19] aarch64: Tweak stack clash boundary condition<br>
+<br>
+The AArch64 ABI says that, when stack clash protection is used,<br>
+there can be a maximum of 1KiB of unprobed space at sp on entry<br>
+to a function.=C2=A0 Therefore, we need to probe when allocating<br>
+&gt;=3D guard_size - 1KiB of data (&gt;=3D rather than &gt;).=C2=A0 This i=
s what<br>
+GCC does.<br>
+<br>
+If an allocation is exactly guard_size bytes, it is enough to allocate<br>
+those bytes and probe once at offset 1024.=C2=A0 It isn&#39;t possible to =
use a<br>
+single probe at any other offset: higher would conmplicate later code,<br>
+by leaving more unprobed space than usual, while lower would risk<br>
+leaving an entire page unprobed.=C2=A0 For simplicity, the code probes all=
<br>
+allocations at offset 1024.<br>
+<br>
+Some register saves also act as probes.=C2=A0 If we need to allocate<br>
+more space below the last such register save probe, we need to<br>
+probe the allocation if it is &gt; 1KiB.=C2=A0 Again, this allocation is<b=
r>
+then sometimes (but not always) probed at offset 1024.=C2=A0 This sort of<=
br>
+allocation is currently only used for outgoing arguments, which are<br>
+rarely this big.<br>
+<br>
+However, the code also probed if this final outgoing-arguments<br>
+allocation was =3D=3D 1KiB, rather than just &gt; 1KiB.=C2=A0 This isn&#39=
;t<br>
+necessary, since the register save then probes at offset 1024<br>
+as required.=C2=A0 Continuing to probe allocations of exactly 1KiB<br>
+would complicate later patches.<br>
+<br>
+gcc/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.cc (aarch64_allocate_a=
nd_probe_stack_space):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Don&#39;t probe final allocations that are exac=
tly 1KiB in size (after<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unprobed space above the final allocation has b=
een deducted).<br>
+<br>
+gcc/testsuite/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/aarch64/stack-check-prologue-17.c:=
 New test.<br>
+---<br>
+ gcc/config/aarch64/aarch64.cc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
+ .../aarch64/stack-check-prologue-17.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
55 +++++++++++++++++++<br>
+ 2 files changed, 58 insertions(+), 1 deletion(-)<br>
+ create mode 100644 gcc/testsuite/gcc.target/aarch64/stack-check-prologue-=
17.c<br>
+<br>
+diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.cc=
<br>
+index 4d9fcf3d162..34c1d8614cd 100644<br>
+--- a/gcc/config/aarch64/aarch64.cc<br>
++++ b/gcc/config/aarch64/aarch64.cc<br>
+@@ -9333,9 +9333,11 @@ aarch64_allocate_and_probe_stack_space (rtx temp1, =
rtx temp2,<br>
+=C2=A0 =C2=A0HOST_WIDE_INT guard_size<br>
+=C2=A0 =C2=A0 =C2=A0=3D 1 &lt;&lt; param_stack_clash_protection_guard_size=
;<br>
+=C2=A0 =C2=A0HOST_WIDE_INT guard_used_by_caller =3D STACK_CLASH_CALLER_GUA=
RD;<br>
++=C2=A0 HOST_WIDE_INT byte_sp_alignment =3D STACK_BOUNDARY / BITS_PER_UNIT=
;<br>
++=C2=A0 gcc_assert (multiple_p (poly_size, byte_sp_alignment));<br>
+=C2=A0 =C2=A0HOST_WIDE_INT min_probe_threshold<br>
+=C2=A0 =C2=A0 =C2=A0=3D (final_adjustment_p<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0? guard_used_by_caller<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0? guard_used_by_caller + byte_sp_alignment<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 : guard_size - guard_used_by_caller);<br>
+=C2=A0 =C2=A0/* When doing the final adjustment for the outgoing arguments=
, take into<br>
+=C2=A0 =C2=A0 =C2=A0 account any unprobed space there is above the current=
 SP.=C2=A0 There are<br>
+diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c b/=
gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c<br>
+new file mode 100644<br>
+index 00000000000..0d8a25d73a2<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c<br>
+@@ -0,0 +1,55 @@<br>
++/* { dg-options &quot;-O2 -fstack-clash-protection -fomit-frame-pointer -=
-param stack-clash-protection-guard-size=3D12&quot; } */<br>
++/* { dg-final { check-function-bodies &quot;**&quot; &quot;&quot; } } */<=
br>
++<br>
++void f(int, ...);<br>
++void g();<br>
++<br>
++/*<br>
++** test1:<br>
++**=C2=A0 =C2=A0 ...<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0x30, \[sp\]<br>
++**=C2=A0 =C2=A0 sub=C2=A0 =C2=A0 =C2=A0sp, sp, #1024<br>
++**=C2=A0 =C2=A0 cbnz=C2=A0 =C2=A0 w0, .*<br>
++**=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 =C2=A0 g<br>
++**=C2=A0 =C2=A0 ...<br>
++*/<br>
++int test1(int z) {<br>
++=C2=A0 __uint128_t x =3D 0;<br>
++=C2=A0 int y[0x400];<br>
++=C2=A0 if (z)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 f(0, 0, 0, 0, 0, 0, 0, &amp;y,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 g();<br>
++=C2=A0 return 1;<br>
++}<br>
++<br>
++/*<br>
++** test2:<br>
++**=C2=A0 =C2=A0 ...<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0x30, \[sp\]<br>
++**=C2=A0 =C2=A0 sub=C2=A0 =C2=A0 =C2=A0sp, sp, #1040<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0xzr, \[sp\]<br>
++**=C2=A0 =C2=A0 cbnz=C2=A0 =C2=A0 w0, .*<br>
++**=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 =C2=A0 g<br>
++**=C2=A0 =C2=A0 ...<br>
++*/<br>
++int test2(int z) {<br>
++=C2=A0 __uint128_t x =3D 0;<br>
++=C2=A0 int y[0x400];<br>
++=C2=A0 if (z)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 f(0, 0, 0, 0, 0, 0, 0, &amp;y,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 g();<br>
++=C2=A0 return 1;<br>
++}<br>
+-- <br>
+2.34.1<br>
+<br>
+<br>
+From 15e18831bf98fd25af098b970ebf0c9a6200a34b Mon Sep 17 00:00:00 2001<br>
+From: Richard Sandiford &lt;<a href=3D"mailto:richard.sandiford@arm.com" t=
arget=3D"_blank">richard.sandiford@arm.com</a>&gt;<br>
+Date: Tue, 12 Sep 2023 16:08:55 +0100<br>
+Subject: [PATCH 15/19] aarch64: Put LR save probe in first 16 bytes<br>
+<br>
+-fstack-clash-protection uses the save of LR as a probe for the next<br>
+allocation.=C2=A0 The next allocation could be:<br>
+<br>
+* another part of the static frame, e.g. when allocating SVE save slots<br=
>
+=C2=A0 or outgoing arguments<br>
+<br>
+* an alloca in the same function<br>
+<br>
+* an allocation made by a callee function<br>
+<br>
+However, when -fomit-frame-pointer is used, the LR save slot is placed<br>
+above the other GPR save slots.=C2=A0 It could therefore be up to 80 bytes=
<br>
+above the base of the GPR save area (which is also the hard fp address).<b=
r>
+<br>
+aarch64_allocate_and_probe_stack_space took this into account when<br>
+deciding how much subsequent space could be allocated without needing<br>
+a probe.=C2=A0 However, it interacted badly with:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 /* If doing a small final adjustment, we always probe=
 at offset 0.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 This is done to avoid issues when LR is not at=
 position 0 or when<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 the final adjustment is smaller than the probi=
ng offset.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 else if (final_adjustment_p &amp;&amp; rounded_size =
=3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0residual_probe_offset =3D 0;<br>
+<br>
+which forces any allocation that is smaller than the guard page size<br>
+to be probed at offset 0 rather than the usual offset 1024.=C2=A0 It was<b=
r>
+therefore possible to construct cases in which we had:<br>
+<br>
+* a probe using LR at SP + 80 bytes (or some other value &gt;=3D 16)<br>
+* an allocation of the guard page size - 16 bytes<br>
+* a probe at SP + 0<br>
+<br>
+which allocates guard page size + 64 consecutive unprobed bytes.<br>
+<br>
+This patch requires the LR probe to be in the first 16 bytes of the<br>
+save area when stack clash protection is active.=C2=A0 Doing it<br>
+unconditionally would cause code-quality regressions.<br>
+<br>
+Putting LR before other registers prevents push/pop allocation<br>
+when shadow call stacks are enabled, since LR is restored<br>
+separately from the other callee-saved registers.<br>
+<br>
+The new comment doesn&#39;t say that the probe register is required<br>
+to be LR, since a later patch removes that restriction.<br>
+<br>
+gcc/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.cc (aarch64_layout_fra=
me): Ensure that<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0the LR save slot is in the first 16 bytes of th=
e register save area.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Only form STP/LDP push/pop candidates if both r=
egisters are valid.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_allocate_and_probe_stack_space): Remov=
e workaround for<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0when LR was not in the first 16 bytes.<br>
+<br>
+gcc/testsuite/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/aarch64/stack-check-prologue-18.c:=
 New test.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/aarch64/stack-check-prologue-19.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/aarch64/stack-check-prologue-20.c:=
 Likewise.<br>
+---<br>
+ gcc/config/aarch64/aarch64.cc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 72 ++++++-------<br>
+ .../aarch64/stack-check-prologue-18.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
100 ++++++++++++++++++<br>
+ .../aarch64/stack-check-prologue-19.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
100 ++++++++++++++++++<br>
+ .../aarch64/stack-check-prologue-20.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A03 +<br>
+ 4 files changed, 233 insertions(+), 42 deletions(-)<br>
+ create mode 100644 gcc/testsuite/gcc.target/aarch64/stack-check-prologue-=
18.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/aarch64/stack-check-prologue-=
19.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/aarch64/stack-check-prologue-=
20.c<br>
+<br>
+diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.cc=
<br>
+index 34c1d8614cd..16433fb70f4 100644<br>
+--- a/gcc/config/aarch64/aarch64.cc<br>
++++ b/gcc/config/aarch64/aarch64.cc<br>
+@@ -8273,26 +8273,34 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0bool saves_below_hard_fp_p<br>
+=C2=A0 =C2=A0 =C2=A0=3D maybe_ne (frame.below_hard_fp_saved_regs_size, 0);=
<br>
+=C2=A0 =C2=A0frame.bytes_below_hard_fp =3D offset;<br>
++<br>
++=C2=A0 auto allocate_gpr_slot =3D [&amp;](unsigned int regno)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 frame.reg_offset[regno] =3D offset;<br>
++=C2=A0 =C2=A0 =C2=A0 if (frame.wb_push_candidate1 =3D=3D INVALID_REGNUM)<=
br>
++=C2=A0 =C2=A0 =C2=A0 frame.wb_push_candidate1 =3D regno;<br>
++=C2=A0 =C2=A0 =C2=A0 else if (frame.wb_push_candidate2 =3D=3D INVALID_REG=
NUM)<br>
++=C2=A0 =C2=A0 =C2=A0 frame.wb_push_candidate2 =3D regno;<br>
++=C2=A0 =C2=A0 =C2=A0 offset +=3D UNITS_PER_WORD;<br>
++=C2=A0 =C2=A0 };<br>
++<br>
+=C2=A0 =C2=A0if (frame.emit_frame_chain)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* FP and LR are placed in the linkage record.=
=C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 frame.reg_offset[R29_REGNUM] =3D offset;<br>
+-=C2=A0 =C2=A0 =C2=A0 frame.wb_push_candidate1 =3D R29_REGNUM;<br>
+-=C2=A0 =C2=A0 =C2=A0 frame.reg_offset[R30_REGNUM] =3D offset + UNITS_PER_=
WORD;<br>
+-=C2=A0 =C2=A0 =C2=A0 frame.wb_push_candidate2 =3D R30_REGNUM;<br>
+-=C2=A0 =C2=A0 =C2=A0 offset +=3D 2 * UNITS_PER_WORD;<br>
++=C2=A0 =C2=A0 =C2=A0 allocate_gpr_slot (R29_REGNUM);<br>
++=C2=A0 =C2=A0 =C2=A0 allocate_gpr_slot (R30_REGNUM);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 else if (flag_stack_clash_protection<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; known_eq (frame.reg_offset[R=
30_REGNUM], SLOT_REQUIRED))<br>
++=C2=A0 =C2=A0 /* Put the LR save slot first, since it makes a good choice=
 of probe<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0for stack clash purposes.=C2=A0 The idea is th=
at the link register usually<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0has to be saved before a call anyway, and so w=
e lose little by<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0stopping it from being individually shrink-wra=
pped.=C2=A0 */<br>
++=C2=A0 =C2=A0 allocate_gpr_slot (R30_REGNUM);<br>
+ <br>
+=C2=A0 =C2=A0for (regno =3D R0_REGNUM; regno &lt;=3D R30_REGNUM; regno++)<=
br>
+=C2=A0 =C2=A0 =C2=A0if (known_eq (frame.reg_offset[regno], SLOT_REQUIRED))=
<br>
+-=C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 frame.reg_offset[regno] =3D offset;<br>
+-=C2=A0 =C2=A0 =C2=A0 if (frame.wb_push_candidate1 =3D=3D INVALID_REGNUM)<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 frame.wb_push_candidate1 =3D regno;<br>
+-=C2=A0 =C2=A0 =C2=A0 else if (frame.wb_push_candidate2 =3D=3D INVALID_REG=
NUM)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 frame.wb_push_candidate2 =3D regno;<br>
+-=C2=A0 =C2=A0 =C2=A0 offset +=3D UNITS_PER_WORD;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 allocate_gpr_slot (regno);<br>
+ <br>
+=C2=A0 =C2=A0poly_int64 max_int_offset =3D offset;<br>
+=C2=A0 =C2=A0offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS=
_PER_UNIT);<br>
+@@ -8370,10 +8378,13 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0 =C2=A0 max_push_offset to 0, because no registers are popped=
 at this time,<br>
+=C2=A0 =C2=A0 =C2=A0 so callee_adjust cannot be adjusted.=C2=A0 */<br>
+=C2=A0 =C2=A0HOST_WIDE_INT max_push_offset =3D 0;<br>
+-=C2=A0 if (frame.wb_pop_candidate2 !=3D INVALID_REGNUM)<br>
+-=C2=A0 =C2=A0 max_push_offset =3D 512;<br>
+-=C2=A0 else if (frame.wb_pop_candidate1 !=3D INVALID_REGNUM)<br>
+-=C2=A0 =C2=A0 max_push_offset =3D 256;<br>
++=C2=A0 if (frame.wb_pop_candidate1 !=3D INVALID_REGNUM)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 if (frame.wb_pop_candidate2 !=3D INVALID_REGNUM)<br>
++=C2=A0 =C2=A0 =C2=A0 max_push_offset =3D 512;<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 max_push_offset =3D 256;<br>
++=C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0HOST_WIDE_INT const_size, const_below_saved_regs, const_above=
_fp;<br>
+=C2=A0 =C2=A0HOST_WIDE_INT const_saved_regs_size;<br>
+@@ -9339,29 +9350,6 @@ aarch64_allocate_and_probe_stack_space (rtx temp1, =
rtx temp2,<br>
+=C2=A0 =C2=A0 =C2=A0=3D (final_adjustment_p<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ? guard_used_by_caller + byte_sp_alignment<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 : guard_size - guard_used_by_caller);<br>
+-=C2=A0 /* When doing the final adjustment for the outgoing arguments, tak=
e into<br>
+-=C2=A0 =C2=A0 =C2=A0account any unprobed space there is above the current=
 SP.=C2=A0 There are<br>
+-=C2=A0 =C2=A0 =C2=A0two cases:<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0- When saving SVE registers below the hard frame poin=
ter, we force<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0the lowest save to take place in the prologue =
before doing the final<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0adjustment (i.e. we don&#39;t allow the save t=
o be shrink-wrapped).<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0This acts as a probe at SP, so there is no unp=
robed space.<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0- When there are no SVE register saves, we use the st=
ore of the link<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0register as a probe.=C2=A0 We can&#39;t assume=
 that LR was saved at position 0<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0though, so treat any space below it as unprobe=
d.=C2=A0 */<br>
+-=C2=A0 if (final_adjustment_p<br>
+-=C2=A0 =C2=A0 =C2=A0 &amp;&amp; known_eq (frame.below_hard_fp_saved_regs_=
size, 0))<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 poly_int64 lr_offset =3D (frame.reg_offset[LR_REGNUM=
]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 - frame.bytes_below_saved_regs);<br>
+-=C2=A0 =C2=A0 =C2=A0 if (known_ge (lr_offset, 0))<br>
+-=C2=A0 =C2=A0 =C2=A0 min_probe_threshold -=3D lr_offset.to_constant ();<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 gcc_assert (!flag_stack_clash_protection || known_eq=
 (poly_size, 0));<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+=C2=A0 =C2=A0poly_int64 frame_size =3D frame.frame_size;<br>
+ <br>
+=C2=A0 =C2=A0/* We should always have a positive probe threshold.=C2=A0 */=
<br>
+@@ -9541,8 +9529,8 @@ aarch64_allocate_and_probe_stack_space (rtx temp1, r=
tx temp2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (final_adjustment_p &amp;&amp; rounded_size =
!=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0min_probe_threshold =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* If doing a small final adjustment, we always=
 probe at offset 0.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0This is done to avoid issues when LR is not at=
 position 0 or when<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0the final adjustment is smaller than the probi=
ng offset.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0This is done to avoid issues when the final ad=
justment is smaller<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0than the probing offset.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (final_adjustment_p &amp;&amp; rounded_=
size =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0residual_probe_offset =3D 0;<br>
+ <br>
+diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c b/=
gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c<br>
+new file mode 100644<br>
+index 00000000000..82447d20fff<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c<br>
+@@ -0,0 +1,100 @@<br>
++/* { dg-options &quot;-O2 -fstack-clash-protection -fomit-frame-pointer -=
-param stack-clash-protection-guard-size=3D12&quot; } */<br>
++/* { dg-final { check-function-bodies &quot;**&quot; &quot;&quot; } } */<=
br>
++<br>
++void f(int, ...);<br>
++void g();<br>
++<br>
++/*<br>
++** test1:<br>
++**=C2=A0 =C2=A0 ...<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0x30, \[sp\]<br>
++**=C2=A0 =C2=A0 sub=C2=A0 =C2=A0 =C2=A0sp, sp, #4064<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0xzr, \[sp\]<br>
++**=C2=A0 =C2=A0 cbnz=C2=A0 =C2=A0 w0, .*<br>
++**=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 =C2=A0 g<br>
++**=C2=A0 =C2=A0 ...<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0x26, \[sp, #?4128\]<br>
++**=C2=A0 =C2=A0 ...<br>
++*/<br>
++int test1(int z) {<br>
++=C2=A0 __uint128_t x =3D 0;<br>
++=C2=A0 int y[0x400];<br>
++=C2=A0 if (z)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 asm volatile (&quot;&quot; :::<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;x19&=
quot;, &quot;x20&quot;, &quot;x21&quot;, &quot;x22&quot;, &quot;x23&quot;, =
&quot;x24&quot;, &quot;x25&quot;, &quot;x26&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 f(0, 0, 0, 0, 0, 0, 0, &amp;y,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 g();<br>
++=C2=A0 return 1;<br>
++}<br>
++<br>
++/*<br>
++** test2:<br>
++**=C2=A0 =C2=A0 ...<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0x30, \[sp\]<br>
++**=C2=A0 =C2=A0 sub=C2=A0 =C2=A0 =C2=A0sp, sp, #1040<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0xzr, \[sp\]<br>
++**=C2=A0 =C2=A0 cbnz=C2=A0 =C2=A0 w0, .*<br>
++**=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 =C2=A0 g<br>
++**=C2=A0 =C2=A0 ...<br>
++*/<br>
++int test2(int z) {<br>
++=C2=A0 __uint128_t x =3D 0;<br>
++=C2=A0 int y[0x400];<br>
++=C2=A0 if (z)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 asm volatile (&quot;&quot; :::<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;x19&=
quot;, &quot;x20&quot;, &quot;x21&quot;, &quot;x22&quot;, &quot;x23&quot;, =
&quot;x24&quot;, &quot;x25&quot;, &quot;x26&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 f(0, 0, 0, 0, 0, 0, 0, &amp;y,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 g();<br>
++=C2=A0 return 1;<br>
++}<br>
++<br>
++/*<br>
++** test3:<br>
++**=C2=A0 =C2=A0 ...<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0x30, \[sp\]<br>
++**=C2=A0 =C2=A0 sub=C2=A0 =C2=A0 =C2=A0sp, sp, #1024<br>
++**=C2=A0 =C2=A0 cbnz=C2=A0 =C2=A0 w0, .*<br>
++**=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 =C2=A0 g<br>
++**=C2=A0 =C2=A0 ...<br>
++*/<br>
++int test3(int z) {<br>
++=C2=A0 __uint128_t x =3D 0;<br>
++=C2=A0 int y[0x400];<br>
++=C2=A0 if (z)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 asm volatile (&quot;&quot; :::<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;x19&=
quot;, &quot;x20&quot;, &quot;x21&quot;, &quot;x22&quot;, &quot;x23&quot;, =
&quot;x24&quot;, &quot;x25&quot;, &quot;x26&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 f(0, 0, 0, 0, 0, 0, 0, &amp;y,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 g();<br>
++=C2=A0 return 1;<br>
++}<br>
+diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-19.c b/=
gcc/testsuite/gcc.target/aarch64/stack-check-prologue-19.c<br>
+new file mode 100644<br>
+index 00000000000..73ac3e4e4eb<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-19.c<br>
+@@ -0,0 +1,100 @@<br>
++/* { dg-options &quot;-O2 -fstack-clash-protection -fomit-frame-pointer -=
-param stack-clash-protection-guard-size=3D12 -fsanitize=3Dshadow-call-stac=
k -ffixed-x18&quot; } */<br>
++/* { dg-final { check-function-bodies &quot;**&quot; &quot;&quot; } } */<=
br>
++<br>
++void f(int, ...);<br>
++void g();<br>
++<br>
++/*<br>
++** test1:<br>
++**=C2=A0 =C2=A0 ...<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0x30, \[sp\]<br>
++**=C2=A0 =C2=A0 sub=C2=A0 =C2=A0 =C2=A0sp, sp, #4064<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0xzr, \[sp\]<br>
++**=C2=A0 =C2=A0 cbnz=C2=A0 =C2=A0 w0, .*<br>
++**=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 =C2=A0 g<br>
++**=C2=A0 =C2=A0 ...<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0x26, \[sp, #?4128\]<br>
++**=C2=A0 =C2=A0 ...<br>
++*/<br>
++int test1(int z) {<br>
++=C2=A0 __uint128_t x =3D 0;<br>
++=C2=A0 int y[0x400];<br>
++=C2=A0 if (z)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 asm volatile (&quot;&quot; :::<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;x19&=
quot;, &quot;x20&quot;, &quot;x21&quot;, &quot;x22&quot;, &quot;x23&quot;, =
&quot;x24&quot;, &quot;x25&quot;, &quot;x26&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 f(0, 0, 0, 0, 0, 0, 0, &amp;y,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 g();<br>
++=C2=A0 return 1;<br>
++}<br>
++<br>
++/*<br>
++** test2:<br>
++**=C2=A0 =C2=A0 ...<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0x30, \[sp\]<br>
++**=C2=A0 =C2=A0 sub=C2=A0 =C2=A0 =C2=A0sp, sp, #1040<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0xzr, \[sp\]<br>
++**=C2=A0 =C2=A0 cbnz=C2=A0 =C2=A0 w0, .*<br>
++**=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 =C2=A0 g<br>
++**=C2=A0 =C2=A0 ...<br>
++*/<br>
++int test2(int z) {<br>
++=C2=A0 __uint128_t x =3D 0;<br>
++=C2=A0 int y[0x400];<br>
++=C2=A0 if (z)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 asm volatile (&quot;&quot; :::<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;x19&=
quot;, &quot;x20&quot;, &quot;x21&quot;, &quot;x22&quot;, &quot;x23&quot;, =
&quot;x24&quot;, &quot;x25&quot;, &quot;x26&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 f(0, 0, 0, 0, 0, 0, 0, &amp;y,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 g();<br>
++=C2=A0 return 1;<br>
++}<br>
++<br>
++/*<br>
++** test3:<br>
++**=C2=A0 =C2=A0 ...<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0x30, \[sp\]<br>
++**=C2=A0 =C2=A0 sub=C2=A0 =C2=A0 =C2=A0sp, sp, #1024<br>
++**=C2=A0 =C2=A0 cbnz=C2=A0 =C2=A0 w0, .*<br>
++**=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 =C2=A0 g<br>
++**=C2=A0 =C2=A0 ...<br>
++*/<br>
++int test3(int z) {<br>
++=C2=A0 __uint128_t x =3D 0;<br>
++=C2=A0 int y[0x400];<br>
++=C2=A0 if (z)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 asm volatile (&quot;&quot; :::<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;x19&=
quot;, &quot;x20&quot;, &quot;x21&quot;, &quot;x22&quot;, &quot;x23&quot;, =
&quot;x24&quot;, &quot;x25&quot;, &quot;x26&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 f(0, 0, 0, 0, 0, 0, 0, &amp;y,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,<br>
++=C2=A0 =C2=A0 =C2=A0 x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 g();<br>
++=C2=A0 return 1;<br>
++}<br>
+diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-20.c b/=
gcc/testsuite/gcc.target/aarch64/stack-check-prologue-20.c<br>
+new file mode 100644<br>
+index 00000000000..690aae8dfd5<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-20.c<br>
+@@ -0,0 +1,3 @@<br>
++/* { dg-options &quot;-O2 -fstack-protector-all -fstack-clash-protection =
-fomit-frame-pointer --param stack-clash-protection-guard-size=3D12 -fsanit=
ize=3Dshadow-call-stack -ffixed-x18&quot; } */<br>
++<br>
++#include &quot;stack-check-prologue-19.c&quot;<br>
+-- <br>
+2.34.1<br>
+<br>
+<br>
+From c4f0e121faa36342f1d21919e54a05ad841c4f86 Mon Sep 17 00:00:00 2001<br>
+From: Richard Sandiford &lt;<a href=3D"mailto:richard.sandiford@arm.com" t=
arget=3D"_blank">richard.sandiford@arm.com</a>&gt;<br>
+Date: Tue, 12 Sep 2023 16:08:55 +0100<br>
+Subject: [PATCH 16/19] aarch64: Simplify probe of final frame allocation<b=
r>
+<br>
+Previous patches ensured that the final frame allocation only needs<br>
+a probe when the size is strictly greater than 1KiB.=C2=A0 It&#39;s theref=
ore<br>
+safe to use the normal 1024 probe offset in all cases.<br>
+<br>
+The main motivation for doing this is to simplify the code and<br>
+remove the number of special cases.<br>
+<br>
+gcc/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.cc (aarch64_allocate_a=
nd_probe_stack_space):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Always probe the residual allocation at offset =
1024, asserting<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0that that is in range.<br>
+<br>
+gcc/testsuite/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/aarch64/stack-check-prologue-17.c:=
 Expect the probe<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0to be at offset 1024 rather than offset 0.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/aarch64/stack-check-prologue-18.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/aarch64/stack-check-prologue-19.c:=
 Likewise.<br>
+---<br>
+ gcc/config/aarch64/aarch64.cc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 ++++--------<br>
+ .../gcc.target/aarch64/stack-check-prologue-17.c=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 +-<br>
+ .../gcc.target/aarch64/stack-check-prologue-18.c=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 4 ++--<br>
+ .../gcc.target/aarch64/stack-check-prologue-19.c=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 4 ++--<br>
+ 4 files changed, 9 insertions(+), 13 deletions(-)<br>
+<br>
+diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.cc=
<br>
+index 16433fb70f4..8abf3d7a1e2 100644<br>
+--- a/gcc/config/aarch64/aarch64.cc<br>
++++ b/gcc/config/aarch64/aarch64.cc<br>
+@@ -9523,16 +9523,12 @@ aarch64_allocate_and_probe_stack_space (rtx temp1,=
 rtx temp2,<br>
+=C2=A0 =C2=A0 =C2=A0 are still safe.=C2=A0 */<br>
+=C2=A0 =C2=A0if (residual)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_WIDE_INT residual_probe_offset =3D guard_used_b=
y_caller;<br>
++=C2=A0 =C2=A0 =C2=A0 gcc_assert (guard_used_by_caller + byte_sp_alignment=
 &lt;=3D size);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* If we&#39;re doing final adjustments, and we=
&#39;ve done any full page<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 allocations then any residual needs to be prob=
ed.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (final_adjustment_p &amp;&amp; rounded_size =
!=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0min_probe_threshold =3D 0;<br>
+-=C2=A0 =C2=A0 =C2=A0 /* If doing a small final adjustment, we always prob=
e at offset 0.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0This is done to avoid issues when the final ad=
justment is smaller<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0than the probing offset.=C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 else if (final_adjustment_p &amp;&amp; rounded_size =
=3D=3D 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 residual_probe_offset =3D 0;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0aarch64_sub_sp (temp1, temp2, residual, frame_r=
elated_p);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (residual &gt;=3D min_probe_threshold)<br>
+@@ -9543,8 +9539,8 @@ aarch64_allocate_and_probe_stack_space (rtx temp1, r=
tx temp2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HOST=
_WIDE_INT_PRINT_DEC &quot; bytes, probing will be required.&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;\n&quot;, residual);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 emit_stack_probe (plus_constant (Pmode=
, stack_pointer_rtx,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0residual_probe_offset));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 emit_stack_probe (plus_constant (Pmode, stack=
_pointer_rtx,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gu=
ard_used_by_caller));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0emit_insn (gen_blockage ());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c b/=
gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c<br>
+index 0d8a25d73a2..f0ec1389771 100644<br>
+--- a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c<br>
++++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c<br>
+@@ -33,7 +33,7 @@ int test1(int z) {<br>
+ **=C2=A0 =C2=A0 ...<br>
+ **=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0x30, \[sp\]<br>
+ **=C2=A0 =C2=A0 sub=C2=A0 =C2=A0 =C2=A0sp, sp, #1040<br>
+-**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0xzr, \[sp\]<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0xzr, \[sp, #?1024\]<br>
+ **=C2=A0 =C2=A0 cbnz=C2=A0 =C2=A0 w0, .*<br>
+ **=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 =C2=A0 g<br>
+ **=C2=A0 =C2=A0 ...<br>
+diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c b/=
gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c<br>
+index 82447d20fff..6383bec5ebc 100644<br>
+--- a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c<br>
++++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c<br>
+@@ -9,7 +9,7 @@ void g();<br>
+ **=C2=A0 =C2=A0 ...<br>
+ **=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0x30, \[sp\]<br>
+ **=C2=A0 =C2=A0 sub=C2=A0 =C2=A0 =C2=A0sp, sp, #4064<br>
+-**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0xzr, \[sp\]<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0xzr, \[sp, #?1024\]<br>
+ **=C2=A0 =C2=A0 cbnz=C2=A0 =C2=A0 w0, .*<br>
+ **=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 =C2=A0 g<br>
+ **=C2=A0 =C2=A0 ...<br>
+@@ -50,7 +50,7 @@ int test1(int z) {<br>
+ **=C2=A0 =C2=A0 ...<br>
+ **=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0x30, \[sp\]<br>
+ **=C2=A0 =C2=A0 sub=C2=A0 =C2=A0 =C2=A0sp, sp, #1040<br>
+-**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0xzr, \[sp\]<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0xzr, \[sp, #?1024\]<br>
+ **=C2=A0 =C2=A0 cbnz=C2=A0 =C2=A0 w0, .*<br>
+ **=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 =C2=A0 g<br>
+ **=C2=A0 =C2=A0 ...<br>
+diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-19.c b/=
gcc/testsuite/gcc.target/aarch64/stack-check-prologue-19.c<br>
+index 73ac3e4e4eb..562039b5e9b 100644<br>
+--- a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-19.c<br>
++++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-19.c<br>
+@@ -9,7 +9,7 @@ void g();<br>
+ **=C2=A0 =C2=A0 ...<br>
+ **=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0x30, \[sp\]<br>
+ **=C2=A0 =C2=A0 sub=C2=A0 =C2=A0 =C2=A0sp, sp, #4064<br>
+-**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0xzr, \[sp\]<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0xzr, \[sp, #?1024\]<br>
+ **=C2=A0 =C2=A0 cbnz=C2=A0 =C2=A0 w0, .*<br>
+ **=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 =C2=A0 g<br>
+ **=C2=A0 =C2=A0 ...<br>
+@@ -50,7 +50,7 @@ int test1(int z) {<br>
+ **=C2=A0 =C2=A0 ...<br>
+ **=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0x30, \[sp\]<br>
+ **=C2=A0 =C2=A0 sub=C2=A0 =C2=A0 =C2=A0sp, sp, #1040<br>
+-**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0xzr, \[sp\]<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0xzr, \[sp, #?1024\]<br>
+ **=C2=A0 =C2=A0 cbnz=C2=A0 =C2=A0 w0, .*<br>
+ **=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 =C2=A0 g<br>
+ **=C2=A0 =C2=A0 ...<br>
+-- <br>
+2.34.1<br>
+<br>
+<br>
+From 6f0ab0a9f46a17b68349ff6035aa776bf65f0575 Mon Sep 17 00:00:00 2001<br>
+From: Richard Sandiford &lt;<a href=3D"mailto:richard.sandiford@arm.com" t=
arget=3D"_blank">richard.sandiford@arm.com</a>&gt;<br>
+Date: Tue, 12 Sep 2023 16:08:56 +0100<br>
+Subject: [PATCH 17/19] aarch64: Explicitly record probe registers in frame=
<br>
+ info<br>
+<br>
+The stack frame is currently divided into three areas:<br>
+<br>
+A: the area above the hard frame pointer<br>
+B: the SVE saves below the hard frame pointer<br>
+C: the outgoing arguments<br>
+<br>
+If the stack frame is allocated in one chunk, the allocation needs a<br>
+probe if the frame size is &gt;=3D guard_size - 1KiB.=C2=A0 In addition, i=
f the<br>
+function is not a leaf function, it must probe an address no more than<br>
+1KiB above the outgoing SP.=C2=A0 We ensured the second condition by<br>
+<br>
+(1) using single-chunk allocations for non-leaf functions only if<br>
+=C2=A0 =C2=A0 the link register save slot is within 512 bytes of the botto=
m<br>
+=C2=A0 =C2=A0 of the frame; and<br>
+<br>
+(2) using the link register save as a probe (meaning, for instance,<br>
+=C2=A0 =C2=A0 that it can&#39;t be individually shrink wrapped)<br>
+<br>
+If instead the stack is allocated in multiple chunks, then:<br>
+<br>
+* an allocation involving only the outgoing arguments (C above) requires<b=
r>
+=C2=A0 a probe if the allocation size is &gt; 1KiB<br>
+<br>
+* any other allocation requires a probe if the allocation size<br>
+=C2=A0 is &gt;=3D guard_size - 1KiB<br>
+<br>
+* second and subsequent allocations require the previous allocation<br>
+=C2=A0 to probe at the bottom of the allocated area, regardless of the siz=
e<br>
+=C2=A0 of that previous allocation<br>
+<br>
+The final point means that, unlike for single allocations,<br>
+it can be necessary to have both a non-SVE register probe and<br>
+an SVE register probe.=C2=A0 For example:<br>
+<br>
+* allocate A, probe using a non-SVE register save<br>
+* allocate B, probe using an SVE register save<br>
+* allocate C<br>
+<br>
+The non-SVE register used in this case was again the link register.<br>
+It was previously used even if the link register save slot was some<br>
+bytes above the bottom of the non-SVE register saves, but an earlier<br>
+patch avoided that by putting the link register save slot first.<br>
+<br>
+As a belt-and-braces fix, this patch explicitly records which<br>
+probe registers we&#39;re using and allows the non-SVE probe to be<br>
+whichever register comes first (as for SVE).<br>
+<br>
+The patch also avoids unnecessary probes in sve/pcs/stack_clash_3.c.<br>
+<br>
+gcc/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.h (aarch64_frame::sve_=
save_and_probe)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_frame::hard_fp_save_and_probe): New fi=
elds.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.cc (aarch64_layout_fra=
me): Initialize them.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Rather than asserting that a leaf function save=
s LR, instead assert<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0that a leaf function saves something.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_get_separate_components): Prevent the =
chosen probe<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0registers from being individually shrink-wrappe=
d.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_allocate_and_probe_stack_space): Remov=
e workaround for<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0probe registers that aren&#39;t at the bottom o=
f the previous allocation.<br>
+<br>
+gcc/testsuite/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/aarch64/sve/pcs/stack_clash_3.c: A=
void redundant probes.<br>
+---<br>
+ gcc/config/aarch64/aarch64.cc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 68 +++++++++++++++----<br>
+ gcc/config/aarch64/aarch64.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 8 +++<br>
+ .../aarch64/sve/pcs/stack_clash_3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 6 +-<br>
+ 3 files changed, 64 insertions(+), 18 deletions(-)<br>
+<br>
+diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.cc=
<br>
+index 8abf3d7a1e2..a8d907df884 100644<br>
+--- a/gcc/config/aarch64/aarch64.cc<br>
++++ b/gcc/config/aarch64/aarch64.cc<br>
+@@ -8210,15 +8210,11 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; !crtl-&gt;abi-&gt;clobbers_full_reg_=
p (regno))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame.reg_offset[regno] =3D SLOT_REQUIRED;<br>
+ <br>
+-=C2=A0 /* With stack-clash, LR must be saved in non-leaf functions.=C2=A0=
 The saving of<br>
+-=C2=A0 =C2=A0 =C2=A0LR counts as an implicit probe which allows us to mai=
ntain the invariant<br>
+-=C2=A0 =C2=A0 =C2=A0described in the comment at expand_prologue.=C2=A0 */=
<br>
+-=C2=A0 gcc_assert (crtl-&gt;is_leaf<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || maybe_ne (frame.reg_offset[R=
30_REGNUM], SLOT_NOT_REQUIRED));<br>
+ <br>
+=C2=A0 =C2=A0poly_int64 offset =3D crtl-&gt;outgoing_args_size;<br>
+=C2=A0 =C2=A0gcc_assert (multiple_p (offset, STACK_BOUNDARY / BITS_PER_UNI=
T));<br>
+=C2=A0 =C2=A0frame.bytes_below_saved_regs =3D offset;<br>
++=C2=A0 frame.sve_save_and_probe =3D INVALID_REGNUM;<br>
+ <br>
+=C2=A0 =C2=A0/* Now assign stack slots for the registers.=C2=A0 Start with=
 the predicate<br>
+=C2=A0 =C2=A0 =C2=A0 registers, since predicate LDR and STR have a relativ=
ely small<br>
+@@ -8226,6 +8222,8 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0for (regno =3D P0_REGNUM; regno &lt;=3D P15_REGNUM; regno++)<=
br>
+=C2=A0 =C2=A0 =C2=A0if (known_eq (frame.reg_offset[regno], SLOT_REQUIRED))=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 if (frame.sve_save_and_probe =3D=3D INVALID_REGNUM)<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 frame.sve_save_and_probe =3D regno;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame.reg_offset[regno] =3D offset;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0offset +=3D BYTES_PER_SVE_PRED;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -8263,6 +8261,8 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0 =C2=A0for (regno =3D V0_REGNUM; regno &lt;=3D V31_REGNUM; re=
gno++)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (known_eq (frame.reg_offset[regno], SLOT_REQ=
UIRED))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (frame.sve_save_and_probe =3D=3D INVALID_R=
EGNUM)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 frame.sve_save_and_probe =3D regno;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0frame.reg_offset[regno] =3D offset;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset +=3D vector_save_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -8272,10 +8272,18 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0frame.below_hard_fp_saved_regs_size =3D offset - frame.bytes_=
below_saved_regs;<br>
+=C2=A0 =C2=A0bool saves_below_hard_fp_p<br>
+=C2=A0 =C2=A0 =C2=A0=3D maybe_ne (frame.below_hard_fp_saved_regs_size, 0);=
<br>
++=C2=A0 gcc_assert (!saves_below_hard_fp_p<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (frame.sve_save_and_probe !=
=3D INVALID_REGNUM<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; known_=
eq (frame.reg_offset[frame.sve_save_and_probe],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0frame.bytes_below_saved_regs)));<br>
++<br>
+=C2=A0 =C2=A0frame.bytes_below_hard_fp =3D offset;<br>
++=C2=A0 frame.hard_fp_save_and_probe =3D INVALID_REGNUM;<br>
+ <br>
+=C2=A0 =C2=A0auto allocate_gpr_slot =3D [&amp;](unsigned int regno)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 if (frame.hard_fp_save_and_probe =3D=3D INVALID_REGN=
UM)<br>
++=C2=A0 =C2=A0 =C2=A0 frame.hard_fp_save_and_probe =3D regno;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame.reg_offset[regno] =3D offset;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (frame.wb_push_candidate1 =3D=3D INVALID_REG=
NUM)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame.wb_push_candidate1 =3D regno;<br>
+@@ -8309,6 +8317,8 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0for (regno =3D V0_REGNUM; regno &lt;=3D V31_REGNUM; regno++)<=
br>
+=C2=A0 =C2=A0 =C2=A0if (known_eq (frame.reg_offset[regno], SLOT_REQUIRED))=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 if (frame.hard_fp_save_and_probe =3D=3D INVALID_REGN=
UM)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 frame.hard_fp_save_and_probe =3D regno;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* If there is an alignment gap between integer=
 and fp callee-saves,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allocate the last fp register to it if =
possible.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (regno =3D=3D last_fp_reg<br>
+@@ -8332,6 +8342,17 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS=
_PER_UNIT);<br>
+ <br>
+=C2=A0 =C2=A0frame.saved_regs_size =3D offset - frame.bytes_below_saved_re=
gs;<br>
++=C2=A0 gcc_assert (known_eq (frame.saved_regs_size,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 frame.below_hard_fp_saved_regs_size)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (frame.hard_fp_save_and_prob=
e !=3D INVALID_REGNUM<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; known_=
eq (frame.reg_offset[frame.hard_fp_save_and_probe],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0frame.bytes_below_hard_fp)));<br>
++<br>
++=C2=A0 /* With stack-clash, a register must be saved in non-leaf function=
s.<br>
++=C2=A0 =C2=A0 =C2=A0The saving of the bottommost register counts as an im=
plicit probe,<br>
++=C2=A0 =C2=A0 =C2=A0which allows us to maintain the invariant described i=
n the comment<br>
++=C2=A0 =C2=A0 =C2=A0at expand_prologue.=C2=A0 */<br>
++=C2=A0 gcc_assert (crtl-&gt;is_leaf || maybe_ne (frame.saved_regs_size, 0=
));<br>
+ <br>
+=C2=A0 =C2=A0offset +=3D get_frame_size ();<br>
+=C2=A0 =C2=A0offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS=
_PER_UNIT);<br>
+@@ -8462,6 +8483,25 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame.final_adjust =3D frame.bytes_below_saved_=
regs;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
++=C2=A0 /* The frame is allocated in pieces, with each non-final piece<br>
++=C2=A0 =C2=A0 =C2=A0including a register save at offset 0 that acts as a =
probe for<br>
++=C2=A0 =C2=A0 =C2=A0the following piece.=C2=A0 In addition, the save of t=
he bottommost register<br>
++=C2=A0 =C2=A0 =C2=A0acts as a probe for callees and allocas.=C2=A0 Roll b=
ack any probes that<br>
++=C2=A0 =C2=A0 =C2=A0aren&#39;t needed.<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0A probe isn&#39;t needed if it is associated with the=
 final allocation<br>
++=C2=A0 =C2=A0 =C2=A0(including callees and allocas) that happens before t=
he epilogue is<br>
++=C2=A0 =C2=A0 =C2=A0executed.=C2=A0 */<br>
++=C2=A0 if (crtl-&gt;is_leaf<br>
++=C2=A0 =C2=A0 =C2=A0 &amp;&amp; !cfun-&gt;calls_alloca<br>
++=C2=A0 =C2=A0 =C2=A0 &amp;&amp; known_eq (frame.final_adjust, 0))<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 if (maybe_ne (frame.sve_callee_adjust, 0))<br>
++=C2=A0 =C2=A0 =C2=A0 frame.sve_save_and_probe =3D INVALID_REGNUM;<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 frame.hard_fp_save_and_probe =3D INVALID_REGNUM;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0/* Make sure the individual adjustments add up to the full fr=
ame size.=C2=A0 */<br>
+=C2=A0 =C2=A0gcc_assert (known_eq (frame.initial_adjust<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0+ frame.callee_adjust<br>
+@@ -9039,13 +9079,6 @@ aarch64_get_separate_components (void)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0poly_int64 offset =3D frame.reg_offset[regno];<=
br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 /* If the register is saved in the first SVE save sl=
ot, we use<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0it as a stack probe for -fstack-clash-p=
rotection.=C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 if (flag_stack_clash_protection<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; maybe_ne (frame.below_hard_=
fp_saved_regs_size, 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; known_eq (offset, frame.byt=
es_below_saved_regs))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Get the offset relative to the register we&#=
39;ll use.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (frame_pointer_needed)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset -=3D frame.bytes_below_hard_fp;<b=
r>
+@@ -9080,6 +9113,13 @@ aarch64_get_separate_components (void)<br>
+ <br>
+=C2=A0 =C2=A0bitmap_clear_bit (components, LR_REGNUM);<br>
+=C2=A0 =C2=A0bitmap_clear_bit (components, SP_REGNUM);<br>
++=C2=A0 if (flag_stack_clash_protection)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 if (frame.sve_save_and_probe !=3D INVALID_REGNUM)<br=
>
++=C2=A0 =C2=A0 =C2=A0 bitmap_clear_bit (components, frame.sve_save_and_pro=
be);<br>
++=C2=A0 =C2=A0 =C2=A0 if (frame.hard_fp_save_and_probe !=3D INVALID_REGNUM=
)<br>
++=C2=A0 =C2=A0 =C2=A0 bitmap_clear_bit (components, frame.hard_fp_save_and=
_probe);<br>
++=C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0return components;<br>
+ }<br>
+@@ -9616,8 +9656,8 @@ aarch64_epilogue_uses (int regno)<br>
+=C2=A0 =C2=A0 When probing is needed, we emit a probe at the start of the =
prologue<br>
+=C2=A0 =C2=A0 and every PARAM_STACK_CLASH_PROTECTION_GUARD_SIZE bytes ther=
eafter.<br>
+ <br>
+-=C2=A0 =C2=A0We have to track how much space has been allocated and the o=
nly stores<br>
+-=C2=A0 =C2=A0to the stack we track as implicit probes are the FP/LR store=
s.<br>
++=C2=A0 =C2=A0We can also use register saves as probes.=C2=A0 These are st=
ored in<br>
++=C2=A0 =C2=A0sve_save_and_probe and hard_fp_save_and_probe.<br>
+ <br>
+=C2=A0 =C2=A0 For outgoing arguments we probe if the size is larger than 1=
KB, such that<br>
+=C2=A0 =C2=A0 the ABI specified buffer is maintained for the next callee.<=
br>
+diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h<b=
r>
+index b6135837073..46d4693e206 100644<br>
+--- a/gcc/config/aarch64/aarch64.h<br>
++++ b/gcc/config/aarch64/aarch64.h<br>
+@@ -957,6 +957,14 @@ struct GTY (()) aarch64_frame<br>
+=C2=A0 =C2=A0 =C2=A0 This is the register they should use.=C2=A0 */<br>
+=C2=A0 =C2=A0unsigned spare_pred_reg;<br>
+ <br>
++=C2=A0 /* An SVE register that is saved below the hard frame pointer and =
that acts<br>
++=C2=A0 =C2=A0 =C2=A0as a probe for later allocations, or INVALID_REGNUM i=
f none.=C2=A0 */<br>
++=C2=A0 unsigned sve_save_and_probe;<br>
++<br>
++=C2=A0 /* A register that is saved at the hard frame pointer and that act=
s<br>
++=C2=A0 =C2=A0 =C2=A0as a probe for later allocations, or INVALID_REGNUM i=
f none.=C2=A0 */<br>
++=C2=A0 unsigned hard_fp_save_and_probe;<br>
++<br>
+=C2=A0 =C2=A0bool laid_out;<br>
+ <br>
+=C2=A0 =C2=A0/* True if shadow call stack should be enabled for the curren=
t function.=C2=A0 */<br>
+diff --git a/gcc/testsuite/gcc.target/aarch64/sve/pcs/stack_clash_3.c b/gc=
c/testsuite/gcc.target/aarch64/sve/pcs/stack_clash_3.c<br>
+index 3e01ec36c3a..3530a0d504b 100644<br>
+--- a/gcc/testsuite/gcc.target/aarch64/sve/pcs/stack_clash_3.c<br>
++++ b/gcc/testsuite/gcc.target/aarch64/sve/pcs/stack_clash_3.c<br>
+@@ -11,11 +11,10 @@<br>
+ **=C2=A0 =C2=A0 mov=C2=A0 =C2=A0 =C2=A0x11, sp<br>
+ **=C2=A0 =C2=A0 ...<br>
+ **=C2=A0 =C2=A0 sub=C2=A0 =C2=A0 =C2=A0sp, sp, x13<br>
+-**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0p4, \[sp\]<br>
+ **=C2=A0 =C2=A0 cbz=C2=A0 =C2=A0 =C2=A0w0, [^\n]*<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0p4, \[sp\]<br>
+ **=C2=A0 =C2=A0 ...<br>
+ **=C2=A0 =C2=A0 ptrue=C2=A0 =C2=A0p0\.b, all<br>
+-**=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0 =C2=A0p4, \[sp\]<br>
+ **=C2=A0 =C2=A0 addvl=C2=A0 =C2=A0sp, sp, #1<br>
+ **=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0 =C2=A0x24, \[sp\], 32<br>
+ **=C2=A0 =C2=A0 ret<br>
+@@ -39,13 +38,12 @@ test_1 (int n)<br>
+ **=C2=A0 =C2=A0 mov=C2=A0 =C2=A0 =C2=A0x11, sp<br>
+ **=C2=A0 =C2=A0 ...<br>
+ **=C2=A0 =C2=A0 sub=C2=A0 =C2=A0 =C2=A0sp, sp, x13<br>
+-**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0p4, \[sp\]<br>
+ **=C2=A0 =C2=A0 cbz=C2=A0 =C2=A0 =C2=A0w0, [^\n]*<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0p4, \[sp\]<br>
+ **=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0p5, \[sp, #1, mul vl\]<br>
+ **=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0p6, \[sp, #2, mul vl\]<br>
+ **=C2=A0 =C2=A0 ...<br>
+ **=C2=A0 =C2=A0 ptrue=C2=A0 =C2=A0p0\.b, all<br>
+-**=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0 =C2=A0p4, \[sp\]<br>
+ **=C2=A0 =C2=A0 addvl=C2=A0 =C2=A0sp, sp, #1<br>
+ **=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0 =C2=A0x24, \[sp\], 32<br>
+ **=C2=A0 =C2=A0 ret<br>
+-- <br>
+2.34.1<br>
+<br>
+<br>
+From 8254e1b9cd500e0c278465a3657543477e9d1250 Mon Sep 17 00:00:00 2001<br>
+From: Richard Sandiford &lt;<a href=3D"mailto:richard.sandiford@arm.com" t=
arget=3D"_blank">richard.sandiford@arm.com</a>&gt;<br>
+Date: Tue, 12 Sep 2023 16:08:56 +0100<br>
+Subject: [PATCH 18/19] aarch64: Remove below_hard_fp_saved_regs_size<br>
+<br>
+After previous patches, it&#39;s no longer necessary to store<br>
+saved_regs_size and below_hard_fp_saved_regs_size in the frame info.<br>
+All measurements instead use the top or bottom of the frame as<br>
+reference points.<br>
+<br>
+gcc/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.h (aarch64_frame::save=
d_regs_size)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_frame::below_hard_fp_saved_regs_size):=
 Delete.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.cc (aarch64_layout_fra=
me): Update accordingly.<br>
+---<br>
+ gcc/config/aarch64/aarch64.cc | 45 ++++++++++++++++-------------------<br=
>
+ gcc/config/aarch64/aarch64.h=C2=A0 |=C2=A0 7 ------<br>
+ 2 files changed, 21 insertions(+), 31 deletions(-)<br>
+<br>
+diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.cc=
<br>
+index a8d907df884..ac3d3b336a3 100644<br>
+--- a/gcc/config/aarch64/aarch64.cc<br>
++++ b/gcc/config/aarch64/aarch64.cc<br>
+@@ -8269,9 +8269,8 @@ aarch64_layout_frame (void)<br>
+ <br>
+=C2=A0 =C2=A0/* OFFSET is now the offset of the hard frame pointer from th=
e bottom<br>
+=C2=A0 =C2=A0 =C2=A0 of the callee save area.=C2=A0 */<br>
+-=C2=A0 frame.below_hard_fp_saved_regs_size =3D offset - frame.bytes_below=
_saved_regs;<br>
+-=C2=A0 bool saves_below_hard_fp_p<br>
+-=C2=A0 =C2=A0 =3D maybe_ne (frame.below_hard_fp_saved_regs_size, 0);<br>
++=C2=A0 auto below_hard_fp_saved_regs_size =3D offset - frame.bytes_below_=
saved_regs;<br>
++=C2=A0 bool saves_below_hard_fp_p =3D maybe_ne (below_hard_fp_saved_regs_=
size, 0);<br>
+=C2=A0 =C2=A0gcc_assert (!saves_below_hard_fp_p<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (frame.sve_save_and_pro=
be !=3D INVALID_REGNUM<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; k=
nown_eq (frame.reg_offset[frame.sve_save_and_probe],<br>
+@@ -8341,9 +8340,8 @@ aarch64_layout_frame (void)<br>
+ <br>
+=C2=A0 =C2=A0offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS=
_PER_UNIT);<br>
+ <br>
+-=C2=A0 frame.saved_regs_size =3D offset - frame.bytes_below_saved_regs;<b=
r>
+-=C2=A0 gcc_assert (known_eq (frame.saved_regs_size,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 frame.below_hard_fp_saved_regs_size)<br>
++=C2=A0 auto saved_regs_size =3D offset - frame.bytes_below_saved_regs;<br=
>
++=C2=A0 gcc_assert (known_eq (saved_regs_size, below_hard_fp_saved_regs_si=
ze)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (frame.hard_fp_save_and=
_probe !=3D INVALID_REGNUM<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; k=
nown_eq (frame.reg_offset[frame.hard_fp_save_and_probe],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 frame.bytes_below_hard_fp)));<br>
+@@ -8352,7 +8350,7 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0 =C2=A0 The saving of the bottommost register counts as an im=
plicit probe,<br>
+=C2=A0 =C2=A0 =C2=A0 which allows us to maintain the invariant described i=
n the comment<br>
+=C2=A0 =C2=A0 =C2=A0 at expand_prologue.=C2=A0 */<br>
+-=C2=A0 gcc_assert (crtl-&gt;is_leaf || maybe_ne (frame.saved_regs_size, 0=
));<br>
++=C2=A0 gcc_assert (crtl-&gt;is_leaf || maybe_ne (saved_regs_size, 0));<br=
>
+ <br>
+=C2=A0 =C2=A0offset +=3D get_frame_size ();<br>
+=C2=A0 =C2=A0offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS=
_PER_UNIT);<br>
+@@ -8409,7 +8407,7 @@ aarch64_layout_frame (void)<br>
+ <br>
+=C2=A0 =C2=A0HOST_WIDE_INT const_size, const_below_saved_regs, const_above=
_fp;<br>
+=C2=A0 =C2=A0HOST_WIDE_INT const_saved_regs_size;<br>
+-=C2=A0 if (known_eq (frame.saved_regs_size, 0))<br>
++=C2=A0 if (known_eq (saved_regs_size, 0))<br>
+=C2=A0 =C2=A0 =C2=A0frame.initial_adjust =3D frame.frame_size;<br>
+=C2=A0 =C2=A0else if (frame.frame_size.is_constant (&amp;const_size)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; const_size &lt; max_push_off=
set<br>
+@@ -8422,7 +8420,7 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame.callee_adjust =3D const_size;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0else if (frame.bytes_below_saved_regs.is_constant (&amp;const=
_below_saved_regs)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; frame.saved_regs_size.is_con=
stant (&amp;const_saved_regs_size)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; saved_regs_size.is_constant =
(&amp;const_saved_regs_size)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; const_below_saved_regs + con=
st_saved_regs_size &lt; 512<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We could handle this case even with =
data below the saved<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0registers, provided that t=
hat data left us with valid offsets<br>
+@@ -8441,8 +8439,7 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame.initial_adjust =3D frame.frame_size;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0else if (saves_below_hard_fp_p<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; known_eq (frame.saved_regs_s=
ize,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 frame.below_hard_fp_saved_regs_size))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; known_eq (saved_regs_size, b=
elow_hard_fp_saved_regs_size))<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Frame in which all saves are SVE saves:<br>
+ <br>
+@@ -8464,7 +8461,7 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [save SVE registers relative to SP]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sub sp, sp, bytes_below_saved_regs=C2=A0 */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame.callee_adjust =3D const_above_fp;<br>
+-=C2=A0 =C2=A0 =C2=A0 frame.sve_callee_adjust =3D frame.below_hard_fp_save=
d_regs_size;<br>
++=C2=A0 =C2=A0 =C2=A0 frame.sve_callee_adjust =3D below_hard_fp_saved_regs=
_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame.final_adjust =3D frame.bytes_below_saved_=
regs;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0else<br>
+@@ -8479,7 +8476,7 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [save SVE registers relative to SP]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sub sp, sp, bytes_below_saved_regs=C2=A0 */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame.initial_adjust =3D frame.bytes_above_hard=
_fp;<br>
+-=C2=A0 =C2=A0 =C2=A0 frame.sve_callee_adjust =3D frame.below_hard_fp_save=
d_regs_size;<br>
++=C2=A0 =C2=A0 =C2=A0 frame.sve_callee_adjust =3D below_hard_fp_saved_regs=
_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame.final_adjust =3D frame.bytes_below_saved_=
regs;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+@@ -9621,17 +9618,17 @@ aarch64_epilogue_uses (int regno)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 local variables=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | &lt;-- frame_pointer_rtx<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0+-------------------------------+<br>
+-=C2=A0 =C2=A0 =C2=A0 |=C2=A0 padding=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | \<br>
+-=C2=A0 =C2=A0 =C2=A0 +-------------------------------+=C2=A0 |<br>
+-=C2=A0 =C2=A0 =C2=A0 |=C2=A0 callee-saved registers=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 | frame.saved_regs_size<br>
+-=C2=A0 =C2=A0 =C2=A0 +-------------------------------+=C2=A0 |<br>
+-=C2=A0 =C2=A0 =C2=A0 |=C2=A0 LR&#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 |<br>
+-=C2=A0 =C2=A0 =C2=A0 +-------------------------------+=C2=A0 |<br>
+-=C2=A0 =C2=A0 =C2=A0 |=C2=A0 FP&#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 |<br>
+-=C2=A0 =C2=A0 =C2=A0 +-------------------------------+=C2=A0 |&lt;- hard_=
frame_pointer_rtx (aligned)<br>
+-=C2=A0 =C2=A0 =C2=A0 |=C2=A0 SVE vector registers=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 | \<br>
+-=C2=A0 =C2=A0 =C2=A0 +-------------------------------+=C2=A0 |=C2=A0 | be=
low_hard_fp_saved_regs_size<br>
+-=C2=A0 =C2=A0 =C2=A0 |=C2=A0 SVE predicate registers=C2=A0 =C2=A0 =C2=A0 =
| /=C2=A0 /<br>
++=C2=A0 =C2=A0 =C2=A0 |=C2=A0 padding=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0 +-------------------------------+<br>
++=C2=A0 =C2=A0 =C2=A0 |=C2=A0 callee-saved registers=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|<br>
++=C2=A0 =C2=A0 =C2=A0 +-------------------------------+<br>
++=C2=A0 =C2=A0 =C2=A0 |=C2=A0 LR&#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0 +-------------------------------+<br>
++=C2=A0 =C2=A0 =C2=A0 |=C2=A0 FP&#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0 +-------------------------------+ &lt;-- hard_frame_=
pointer_rtx (aligned)<br>
++=C2=A0 =C2=A0 =C2=A0 |=C2=A0 SVE vector registers=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|<br>
++=C2=A0 =C2=A0 =C2=A0 +-------------------------------+<br>
++=C2=A0 =C2=A0 =C2=A0 |=C2=A0 SVE predicate registers=C2=A0 =C2=A0 =C2=A0 =
|<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0+-------------------------------+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 dynamic allocation=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0+-------------------------------+<br>
+diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h<b=
r>
+index 46d4693e206..01f7751bc78 100644<br>
+--- a/gcc/config/aarch64/aarch64.h<br>
++++ b/gcc/config/aarch64/aarch64.h<br>
+@@ -871,18 +871,11 @@ struct GTY (()) aarch64_frame<br>
+=C2=A0 =C2=A0 =C2=A0 STACK_BOUNDARY.=C2=A0 */<br>
+=C2=A0 =C2=A0HOST_WIDE_INT saved_varargs_size;<br>
+ <br>
+-=C2=A0 /* The size of the callee-save registers with a slot in REG_OFFSET=
.=C2=A0 */<br>
+-=C2=A0 poly_int64 saved_regs_size;<br>
+-<br>
+=C2=A0 =C2=A0/* The number of bytes between the bottom of the static frame=
 (the bottom<br>
+=C2=A0 =C2=A0 =C2=A0 of the outgoing arguments) and the bottom of the regi=
ster save area.<br>
+=C2=A0 =C2=A0 =C2=A0 This value is always a multiple of STACK_BOUNDARY.=C2=
=A0 */<br>
+=C2=A0 =C2=A0poly_int64 bytes_below_saved_regs;<br>
+ <br>
+-=C2=A0 /* The size of the callee-save registers with a slot in REG_OFFSET=
 that<br>
+-=C2=A0 =C2=A0 =C2=A0are saved below the hard frame pointer.=C2=A0 */<br>
+-=C2=A0 poly_int64 below_hard_fp_saved_regs_size;<br>
+-<br>
+=C2=A0 =C2=A0/* The number of bytes between the bottom of the static frame=
 (the bottom<br>
+=C2=A0 =C2=A0 =C2=A0 of the outgoing arguments) and the hard frame pointer=
.=C2=A0 This value is<br>
+=C2=A0 =C2=A0 =C2=A0 always a multiple of STACK_BOUNDARY.=C2=A0 */<br>
+-- <br>
+2.34.1<br>
+<br>
+<br>
+From 75c37e031408262263442f5b4cdb83d3777b6422 Mon Sep 17 00:00:00 2001<br>
+From: Richard Sandiford &lt;<a href=3D"mailto:richard.sandiford@arm.com" t=
arget=3D"_blank">richard.sandiford@arm.com</a>&gt;<br>
+Date: Tue, 12 Sep 2023 16:08:57 +0100<br>
+Subject: [PATCH 19/19] aarch64: Make stack smash canary protect saved<br>
+ registers<br>
+<br>
+AArch64 normally puts the saved registers near the bottom of the frame,<br=
>
+immediately above any dynamic allocations.=C2=A0 But this means that a<br>
+stack-smash attack on those dynamic allocations could overwrite the<br>
+saved registers without needing to reach as far as the stack smash<br>
+canary.<br>
+<br>
+The same thing could also happen for variable-sized arguments that are<br>
+passed by value, since those are allocated before a call and popped on<br>
+return.<br>
+<br>
+This patch avoids that by putting the locals (and thus the canary) below<b=
r>
+the saved registers when stack smash protection is active.<br>
+<br>
+The patch fixes CVE-2023-4039.<br>
+<br>
+gcc/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/aarch64/aarch64.cc (aarch64_save_regs_=
above_locals_p):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0New function.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_layout_frame): Use it to decide whethe=
r locals should<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0go above or below the saved registers.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(aarch64_expand_prologue): Update stack layout =
comment.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Emit a stack tie after the final adjustment.<br=
>
+<br>
+gcc/testsuite/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/aarch64/stack-protector-8.c: New t=
est.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/aarch64/stack-protector-9.c: Likew=
ise.<br>
+---<br>
+ gcc/config/aarch64/aarch64.cc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 46 +++++++--<br>
+ .../gcc.target/aarch64/stack-protector-8.c=C2=A0 =C2=A0 | 95 ++++++++++++=
+++++++<br>
+ .../gcc.target/aarch64/stack-protector-9.c=C2=A0 =C2=A0 | 33 +++++++<br>
+ 3 files changed, 168 insertions(+), 6 deletions(-)<br>
+ create mode 100644 gcc/testsuite/gcc.target/aarch64/stack-protector-8.c<b=
r>
+ create mode 100644 gcc/testsuite/gcc.target/aarch64/stack-protector-9.c<b=
r>
+<br>
+diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.cc=
<br>
+index ac3d3b336a3..96c3f48fdc4 100644<br>
+--- a/gcc/config/aarch64/aarch64.cc<br>
++++ b/gcc/config/aarch64/aarch64.cc<br>
+@@ -8133,6 +8133,20 @@ aarch64_needs_frame_chain (void)<br>
+=C2=A0 =C2=A0return aarch64_use_frame_pointer;<br>
+ }<br>
+ <br>
++/* Return true if the current function should save registers above<br>
++=C2=A0 =C2=A0the locals area, rather than below it.=C2=A0 */<br>
++<br>
++static bool<br>
++aarch64_save_regs_above_locals_p ()<br>
++{<br>
++=C2=A0 /* When using stack smash protection, make sure that the canary sl=
ot<br>
++=C2=A0 =C2=A0 =C2=A0comes between the locals and the saved registers.=C2=
=A0 Otherwise,<br>
++=C2=A0 =C2=A0 =C2=A0it would be possible for a carefully sized smash atta=
ck to change<br>
++=C2=A0 =C2=A0 =C2=A0the saved registers (particularly LR and FP) without =
reaching the<br>
++=C2=A0 =C2=A0 =C2=A0canary.=C2=A0 */<br>
++=C2=A0 return crtl-&gt;stack_protect_guard;<br>
++}<br>
++<br>
+ /* Mark the registers that need to be saved by the callee and calculate<b=
r>
+=C2=A0 =C2=A0 the size of the callee-saved registers area and frame record=
 (both FP<br>
+=C2=A0 =C2=A0 and LR may be omitted).=C2=A0 */<br>
+@@ -8144,6 +8158,7 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0poly_int64 vector_save_size =3D GET_MODE_SIZE (vector_save_mo=
de);<br>
+=C2=A0 =C2=A0bool frame_related_fp_reg_p =3D false;<br>
+=C2=A0 =C2=A0aarch64_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;<br>
++=C2=A0 poly_int64 top_of_locals =3D -1;<br>
+ <br>
+=C2=A0 =C2=A0frame.emit_frame_chain =3D aarch64_needs_frame_chain ();<br>
+ <br>
+@@ -8210,9 +8225,16 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; !crtl-&gt;abi-&gt;clobbers_full_reg_=
p (regno))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame.reg_offset[regno] =3D SLOT_REQUIRED;<br>
+ <br>
++=C2=A0 bool regs_at_top_p =3D aarch64_save_regs_above_locals_p ();<br>
+ <br>
+=C2=A0 =C2=A0poly_int64 offset =3D crtl-&gt;outgoing_args_size;<br>
+=C2=A0 =C2=A0gcc_assert (multiple_p (offset, STACK_BOUNDARY / BITS_PER_UNI=
T));<br>
++=C2=A0 if (regs_at_top_p)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 offset +=3D get_frame_size ();<br>
++=C2=A0 =C2=A0 =C2=A0 offset =3D aligned_upper_bound (offset, STACK_BOUNDA=
RY / BITS_PER_UNIT);<br>
++=C2=A0 =C2=A0 =C2=A0 top_of_locals =3D offset;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0frame.bytes_below_saved_regs =3D offset;<br>
+=C2=A0 =C2=A0frame.sve_save_and_probe =3D INVALID_REGNUM;<br>
+ <br>
+@@ -8352,15 +8374,18 @@ aarch64_layout_frame (void)<br>
+=C2=A0 =C2=A0 =C2=A0 at expand_prologue.=C2=A0 */<br>
+=C2=A0 =C2=A0gcc_assert (crtl-&gt;is_leaf || maybe_ne (saved_regs_size, 0)=
);<br>
+ <br>
+-=C2=A0 offset +=3D get_frame_size ();<br>
+-=C2=A0 offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_=
UNIT);<br>
+-=C2=A0 auto top_of_locals =3D offset;<br>
+-<br>
++=C2=A0 if (!regs_at_top_p)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 offset +=3D get_frame_size ();<br>
++=C2=A0 =C2=A0 =C2=A0 offset =3D aligned_upper_bound (offset, STACK_BOUNDA=
RY / BITS_PER_UNIT);<br>
++=C2=A0 =C2=A0 =C2=A0 top_of_locals =3D offset;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0offset +=3D frame.saved_varargs_size;<br>
+=C2=A0 =C2=A0gcc_assert (multiple_p (offset, STACK_BOUNDARY / BITS_PER_UNI=
T));<br>
+=C2=A0 =C2=A0frame.frame_size =3D offset;<br>
+ <br>
+=C2=A0 =C2=A0frame.bytes_above_hard_fp =3D frame.frame_size - frame.bytes_=
below_hard_fp;<br>
++=C2=A0 gcc_assert (known_ge (top_of_locals, 0));<br>
+=C2=A0 =C2=A0frame.bytes_above_locals =3D frame.frame_size - top_of_locals=
;<br>
+ <br>
+=C2=A0 =C2=A0frame.initial_adjust =3D 0;<br>
+@@ -9615,10 +9640,10 @@ aarch64_epilogue_uses (int regno)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 for register varargs=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0+-------------------------------+<br>
+-=C2=A0 =C2=A0 =C2=A0 |=C2=A0 local variables=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | &lt;-- frame_pointer_rtx<br>
++=C2=A0 =C2=A0 =C2=A0 |=C2=A0 local variables (1)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | &lt;-- frame_pointer_rtx<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0+-------------------------------+<br>
+-=C2=A0 =C2=A0 =C2=A0 |=C2=A0 padding=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0 |=C2=A0 padding (1)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0+-------------------------------+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 callee-saved registers=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0+-------------------------------+<br>
+@@ -9630,6 +9655,10 @@ aarch64_epilogue_uses (int regno)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0+-------------------------------+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 SVE predicate registers=C2=A0 =C2=A0 =
=C2=A0 |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0+-------------------------------+<br>
++=C2=A0 =C2=A0 =C2=A0 |=C2=A0 local variables (2)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0 +-------------------------------+<br>
++=C2=A0 =C2=A0 =C2=A0 |=C2=A0 padding (2)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0 +-------------------------------+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 dynamic allocation=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0+-------------------------------+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 padding=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
+@@ -9639,6 +9668,9 @@ aarch64_epilogue_uses (int regno)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0+-------------------------------+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| &lt;-- =
stack_pointer_rtx (aligned)<br>
+ <br>
++=C2=A0 =C2=A0The regions marked (1) and (2) are mutually exclusive.=C2=A0=
 (2) is used<br>
++=C2=A0 =C2=A0when aarch64_save_regs_above_locals_p is true.<br>
++<br>
+=C2=A0 =C2=A0 Dynamic stack allocations via alloca() decrease stack_pointe=
r_rtx<br>
+=C2=A0 =C2=A0 but leave frame_pointer_rtx and hard_frame_pointer_rtx<br>
+=C2=A0 =C2=A0 unchanged.<br>
+@@ -9834,6 +9866,8 @@ aarch64_expand_prologue (void)<br>
+=C2=A0 =C2=A0gcc_assert (known_eq (bytes_below_sp, final_adjust));<br>
+=C2=A0 =C2=A0aarch64_allocate_and_probe_stack_space (tmp1_rtx, tmp0_rtx, f=
inal_adjust,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!f=
rame_pointer_needed, true);<br>
++=C2=A0 if (emit_frame_chain &amp;&amp; maybe_ne (final_adjust, 0))<br>
++=C2=A0 =C2=A0 emit_insn (gen_stack_tie (stack_pointer_rtx, hard_frame_poi=
nter_rtx));<br>
+ }<br>
+ <br>
+ /* Return TRUE if we can use a simple_return insn.<br>
+diff --git a/gcc/testsuite/gcc.target/aarch64/stack-protector-8.c b/gcc/te=
stsuite/gcc.target/aarch64/stack-protector-8.c<br>
+new file mode 100644<br>
+index 00000000000..e71d820e365<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/aarch64/stack-protector-8.c<br>
+@@ -0,0 +1,95 @@<br>
++/* { dg-options &quot; -O -fstack-protector-strong -mstack-protector-guar=
d=3Dsysreg -mstack-protector-guard-reg=3Dtpidr2_el0 -mstack-protector-guard=
-offset=3D16&quot; } */<br>
++/* { dg-final { check-function-bodies &quot;**&quot; &quot;&quot; } } */<=
br>
++<br>
++void g(void *);<br>
++__SVBool_t *h(void *);<br>
++<br>
++/*<br>
++** test1:<br>
++**=C2=A0 =C2=A0 sub=C2=A0 =C2=A0 =C2=A0sp, sp, #288<br>
++**=C2=A0 =C2=A0 stp=C2=A0 =C2=A0 =C2=A0x29, x30, \[sp, #?272\]<br>
++**=C2=A0 =C2=A0 add=C2=A0 =C2=A0 =C2=A0x29, sp, #?272<br>
++**=C2=A0 =C2=A0 mrs=C2=A0 =C2=A0 =C2=A0(x[0-9]+), tpidr2_el0<br>
++**=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0 =C2=A0(x[0-9]+), \[\1, #?16\]<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0\2, \[sp, #?264\]<br>
++**=C2=A0 =C2=A0 mov=C2=A0 =C2=A0 =C2=A0\2, #?0<br>
++**=C2=A0 =C2=A0 add=C2=A0 =C2=A0 =C2=A0x0, sp, #?8<br>
++**=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 =C2=A0 g<br>
++**=C2=A0 =C2=A0 ...<br>
++**=C2=A0 =C2=A0 mrs=C2=A0 =C2=A0 =C2=A0.*<br>
++**=C2=A0 =C2=A0 ...<br>
++**=C2=A0 =C2=A0 bne=C2=A0 =C2=A0 =C2=A0.*<br>
++**=C2=A0 =C2=A0 ...<br>
++**=C2=A0 =C2=A0 ldp=C2=A0 =C2=A0 =C2=A0x29, x30, \[sp, #?272\]<br>
++**=C2=A0 =C2=A0 add=C2=A0 =C2=A0 =C2=A0sp, sp, #?288<br>
++**=C2=A0 =C2=A0 ret<br>
++**=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 =C2=A0 __stack_chk_fail<br>
++*/<br>
++int test1() {<br>
++=C2=A0 int y[0x40];<br>
++=C2=A0 g(y);<br>
++=C2=A0 return 1;<br>
++}<br>
++<br>
++/*<br>
++** test2:<br>
++**=C2=A0 =C2=A0 stp=C2=A0 =C2=A0 =C2=A0x29, x30, \[sp, #?-16\]!<br>
++**=C2=A0 =C2=A0 mov=C2=A0 =C2=A0 =C2=A0x29, sp<br>
++**=C2=A0 =C2=A0 sub=C2=A0 =C2=A0 =C2=A0sp, sp, #1040<br>
++**=C2=A0 =C2=A0 mrs=C2=A0 =C2=A0 =C2=A0(x[0-9]+), tpidr2_el0<br>
++**=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0 =C2=A0(x[0-9]+), \[\1, #?16\]<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0\2, \[sp, #?1032\]<br>
++**=C2=A0 =C2=A0 mov=C2=A0 =C2=A0 =C2=A0\2, #?0<br>
++**=C2=A0 =C2=A0 add=C2=A0 =C2=A0 =C2=A0x0, sp, #?8<br>
++**=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 =C2=A0 g<br>
++**=C2=A0 =C2=A0 ...<br>
++**=C2=A0 =C2=A0 mrs=C2=A0 =C2=A0 =C2=A0.*<br>
++**=C2=A0 =C2=A0 ...<br>
++**=C2=A0 =C2=A0 bne=C2=A0 =C2=A0 =C2=A0.*<br>
++**=C2=A0 =C2=A0 ...<br>
++**=C2=A0 =C2=A0 add=C2=A0 =C2=A0 =C2=A0sp, sp, #?1040<br>
++**=C2=A0 =C2=A0 ldp=C2=A0 =C2=A0 =C2=A0x29, x30, \[sp\], #?16<br>
++**=C2=A0 =C2=A0 ret<br>
++**=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 =C2=A0 __stack_chk_fail<br>
++*/<br>
++int test2() {<br>
++=C2=A0 int y[0x100];<br>
++=C2=A0 g(y);<br>
++=C2=A0 return 1;<br>
++}<br>
++<br>
++#pragma GCC target &quot;+sve&quot;<br>
++<br>
++/*<br>
++** test3:<br>
++**=C2=A0 =C2=A0 stp=C2=A0 =C2=A0 =C2=A0x29, x30, \[sp, #?-16\]!<br>
++**=C2=A0 =C2=A0 mov=C2=A0 =C2=A0 =C2=A0x29, sp<br>
++**=C2=A0 =C2=A0 addvl=C2=A0 =C2=A0sp, sp, #-18<br>
++**=C2=A0 =C2=A0 ...<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0p4, \[sp\]<br>
++**=C2=A0 =C2=A0 ...<br>
++**=C2=A0 =C2=A0 sub=C2=A0 =C2=A0 =C2=A0sp, sp, #272<br>
++**=C2=A0 =C2=A0 mrs=C2=A0 =C2=A0 =C2=A0(x[0-9]+), tpidr2_el0<br>
++**=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0 =C2=A0(x[0-9]+), \[\1, #?16\]<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0\2, \[sp, #?264\]<br>
++**=C2=A0 =C2=A0 mov=C2=A0 =C2=A0 =C2=A0\2, #?0<br>
++**=C2=A0 =C2=A0 add=C2=A0 =C2=A0 =C2=A0x0, sp, #?8<br>
++**=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 =C2=A0 h<br>
++**=C2=A0 =C2=A0 ...<br>
++**=C2=A0 =C2=A0 mrs=C2=A0 =C2=A0 =C2=A0.*<br>
++**=C2=A0 =C2=A0 ...<br>
++**=C2=A0 =C2=A0 bne=C2=A0 =C2=A0 =C2=A0.*<br>
++**=C2=A0 =C2=A0 ...<br>
++**=C2=A0 =C2=A0 add=C2=A0 =C2=A0 =C2=A0sp, sp, #?272<br>
++**=C2=A0 =C2=A0 ...<br>
++**=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0 =C2=A0p4, \[sp\]<br>
++**=C2=A0 =C2=A0 ...<br>
++**=C2=A0 =C2=A0 addvl=C2=A0 =C2=A0sp, sp, #18<br>
++**=C2=A0 =C2=A0 ldp=C2=A0 =C2=A0 =C2=A0x29, x30, \[sp\], #?16<br>
++**=C2=A0 =C2=A0 ret<br>
++**=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 =C2=A0 __stack_chk_fail<br>
++*/<br>
++__SVBool_t test3() {<br>
++=C2=A0 int y[0x40];<br>
++=C2=A0 return *h(y);<br>
++}<br>
+diff --git a/gcc/testsuite/gcc.target/aarch64/stack-protector-9.c b/gcc/te=
stsuite/gcc.target/aarch64/stack-protector-9.c<br>
+new file mode 100644<br>
+index 00000000000..58f322aa480<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/aarch64/stack-protector-9.c<br>
+@@ -0,0 +1,33 @@<br>
++/* { dg-options &quot;-O2 -mcpu=3Dneoverse-v1 -fstack-protector-all&quot;=
 } */<br>
++/* { dg-final { check-function-bodies &quot;**&quot; &quot;&quot; } } */<=
br>
++<br>
++/*<br>
++** main:<br>
++**=C2=A0 =C2=A0 ...<br>
++**=C2=A0 =C2=A0 stp=C2=A0 =C2=A0 =C2=A0x29, x30, \[sp, #?-[0-9]+\]!<br>
++**=C2=A0 =C2=A0 ...<br>
++**=C2=A0 =C2=A0 sub=C2=A0 =C2=A0 =C2=A0sp, sp, #[0-9]+<br>
++**=C2=A0 =C2=A0 ...<br>
++**=C2=A0 =C2=A0 str=C2=A0 =C2=A0 =C2=A0x[0-9]+, \[x29, #?-8\]<br>
++**=C2=A0 =C2=A0 ...<br>
++*/<br>
++int f(const char *);<br>
++void g(void *);<br>
++int main(int argc, char* argv[])<br>
++{<br>
++=C2=A0 int a;<br>
++=C2=A0 int b;<br>
++=C2=A0 char c[2+f(argv[1])];<br>
++=C2=A0 int d[0x100];<br>
++=C2=A0 char y;<br>
++<br>
++=C2=A0 y=3D42; a=3D4; b=3D10;<br>
++=C2=A0 c[0] =3D &#39;h&#39;; c[1] =3D &#39;\0&#39;;<br>
++<br>
++=C2=A0 c[f(argv[2])] =3D &#39;\0&#39;;<br>
++<br>
++=C2=A0 __builtin_printf(&quot;%d %d\n%s\n&quot;, a, b, c);<br>
++=C2=A0 g(d);<br>
++<br>
++=C2=A0 return 0;<br>
++}<br>
+-- <br>
+2.34.1<br>
+<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#187543): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/187543" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/187543</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101319990/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101319990/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000008f299b06054e0339--

