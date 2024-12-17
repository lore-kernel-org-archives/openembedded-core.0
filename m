Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5EB1E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 17:21:29 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.86962.1734456079705045486
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 09:21:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hYvI8jV3;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3eb7e725aa0so2585733b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 09:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734456079; x=1735060879; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QHwf9yL0t4RVjf0dcP38op98yglTwnch932wVojhxO8=;
        b=hYvI8jV30TTZob4G+Zo5CWHsnXmKaRmgiZim9cscyr4/u67ucY72q2CIcgV1aEisEO
         zfHPgdEZaZHfirPTHURmNN8uXPGZs2PtynSMMMZ9DlEkYU2W4HxVdL6BsTGA27Gj04Ls
         Dl4zL6FdmI6EZyli8aZrlvde1PxkN0RcMOEs43TzR5R/CGiY6B4ajZflpsUhZMk2C8X8
         6kd+E6YMcZQByVndNXzCbp5kVCX4KqjKLkVX3Z6gGZeGMutQhmYdI3MkTuDmhlAQHQKv
         Z8CaPQ8TpvoWoAP4E4zwDijEc53QcM7AHbdu1CVrtVShWB35ArAV/NgTMOppI+gpt4yu
         nNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734456079; x=1735060879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QHwf9yL0t4RVjf0dcP38op98yglTwnch932wVojhxO8=;
        b=dSuhoBUQqENcbN24GuaChTnjUlT3PplG5QmO0OfYRJe0E/la7P/7fSTFKy+ufZALVZ
         LYi6Myrm9YX4FSazy3zZPsgEoLho43PB0i5YN4zG9LeeQjM2NECWooWEIcoUsLp8cBKd
         Fk7LniLGVKb/b7o6RMGULBdC+r0ruJmafPkZhJg9TdkDEDg71XA5A/fJFhxHAB13Htje
         xEY6dD4Nss0QPrIwD8Q6hhnXE2NT5JHSe2muWkIi5YoG97rZn7aKYT10pICWWGYwAtYa
         PYJQTRbjcEsj0XD5SbKexkFLNV/9MzUxdo/b5k0dJFQgK+20ifA6Ez1IOkgFQX+jaZYs
         fhOQ==
X-Gm-Message-State: AOJu0Yx0v9pCuHSmMXEMhTowHIPWxcr7Gfeyzzmhn4KAgprAZ2+MZfIs
	RyJJs1ufpg5Z2SjhDDvKO5Y6f+g/euXnxt3b881lF8p4di0YpAp/5tYjmJSAZFpRFUCFxpbrQaR
	yZKZCsWoKcmPcSvRXkA51zlpGqlsKU7Jl
X-Gm-Gg: ASbGnctjcE9uZrnDbmpov/qiIJkVU0opXffAUhNTkBoPT3gNeVeJWx0B1UiZoWfF9R2
	WH4QTtqKAE0FUyrxeX2pAmwvMMrGgLe/uHEkW
X-Google-Smtp-Source: AGHT+IEMLeheNTroKTDjsgv0GRsB4cAW2QDWNxRCwbo1wRhKTz1PDUX25It70YC29IyN7YOVjMU8sXw93HbySGzQp34=
X-Received: by 2002:a05:6870:9722:b0:270:1884:9db1 with SMTP id
 586e51a60fabf-2a3ac49fc85mr8182483fac.7.1734456078460; Tue, 17 Dec 2024
 09:21:18 -0800 (PST)
MIME-Version: 1.0
References: <20241217104729.4115134-1-bin.lan.cn@windriver.com>
In-Reply-To: <20241217104729.4115134-1-bin.lan.cn@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Dec 2024 09:20:52 -0800
Message-ID: <CAMKF1so72XWNdOaF0MFYJrAC7SLrx7TWDHiCO2iSybj6ksc_Yw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] gcc: backport patch to fix data relocation to
 !ENDBR: stpcpy
To: bin.lan.cn@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:21:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208844

On Tue, Dec 17, 2024 at 2:47=E2=80=AFAM Bin Lan via lists.openembedded.org
<bin.lan.cn=3Dwindriver.com@lists.openembedded.org> wrote:
>
> There is the following warning when building linux-yocto with
> default configuration on x86-64 with gcc-14.2:
>   AR      built-in.a
>   AR      vmlinux.a
>   LD      vmlinux.o
>   vmlinux.o: warning: objtool: .export_symbol+0x332a0: data relocation to=
 !ENDBR: stpcpy+0x0
>
> This change set removes the warning.
>
> PR target/116174 [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D116174]
>
> Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-14.2.inc        |   1 +
>  ...ch-to-fix-data-relocation-to-ENDBR-s.patch | 447 ++++++++++++++++++
>  2 files changed, 448 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc/0027-gcc-backport-patch=
-to-fix-data-relocation-to-ENDBR-s.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-14.2.inc b/meta/recipes-devtoo=
ls/gcc/gcc-14.2.inc
> index 4f505bef68..a25bc019e5 100644
> --- a/meta/recipes-devtools/gcc/gcc-14.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-14.2.inc
> @@ -69,6 +69,7 @@ SRC_URI =3D "${BASEURI} \
>             file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch=
 \
>             file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
>            file://0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch \
> +           file://0027-gcc-backport-patch-to-fix-data-relocation-to-ENDB=
R-s.patch \

tiny nit.
is this tab vs spaces ? can you fix this.

>             file://gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch=
 \
>  "
>
> diff --git a/meta/recipes-devtools/gcc/gcc/0027-gcc-backport-patch-to-fix=
-data-relocation-to-ENDBR-s.patch b/meta/recipes-devtools/gcc/gcc/0027-gcc-=
backport-patch-to-fix-data-relocation-to-ENDBR-s.patch
> new file mode 100644
> index 0000000000..5bede60816
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0027-gcc-backport-patch-to-fix-data-r=
elocation-to-ENDBR-s.patch
> @@ -0,0 +1,447 @@
> +From 4e7735a8d87559bbddfe3a985786996e22241f8d Mon Sep 17 00:00:00 2001
> +From: liuhongt <hongtao.liu@intel.com>
> +Date: Mon, 12 Aug 2024 14:35:31 +0800
> +Subject: [PATCH] Move ix86_align_loops into a separate pass and insert t=
he
> + pass after pass_endbr_and_patchable_area.
> +
> +gcc/ChangeLog:
> +
> +       PR target/116174
> +       * config/i386/i386.cc (ix86_align_loops): Move this to ..
> +       * config/i386/i386-features.cc (ix86_align_loops): .. here.
> +       (class pass_align_tight_loops): New class.
> +       (make_pass_align_tight_loops): New function.
> +       * config/i386/i386-passes.def: Insert pass_align_tight_loops
> +       after pass_insert_endbr_and_patchable_area.
> +       * config/i386/i386-protos.h (make_pass_align_tight_loops): New
> +       declare.
> +
> +gcc/testsuite/ChangeLog:
> +
> +       * gcc.target/i386/pr116174.c: New test.
> +
> +(cherry picked from commit c3c83d22d212a35cb1bfb8727477819463f0dcd8)
> +
> +Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dpatc=
h;h=3D4e7735a8d87559bbddfe3a985786996e22241f8d]
> +
> +Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> +---
> + gcc/config/i386/i386-features.cc         | 191 +++++++++++++++++++++++
> + gcc/config/i386/i386-passes.def          |   3 +
> + gcc/config/i386/i386-protos.h            |   1 +
> + gcc/config/i386/i386.cc                  | 146 -----------------
> + gcc/testsuite/gcc.target/i386/pr116174.c |  12 ++
> + 5 files changed, 207 insertions(+), 146 deletions(-)
> + create mode 100644 gcc/testsuite/gcc.target/i386/pr116174.c
> +
> +diff --git a/gcc/config/i386/i386-features.cc b/gcc/config/i386/i386-fea=
tures.cc
> +index e3e004d55267..7de19d423637 100644
> +--- a/gcc/config/i386/i386-features.cc
> ++++ b/gcc/config/i386/i386-features.cc
> +@@ -3253,6 +3253,197 @@ make_pass_remove_partial_avx_dependency (gcc::co=
ntext *ctxt)
> +   return new pass_remove_partial_avx_dependency (ctxt);
> + }
> +
> ++/* When a hot loop can be fit into one cacheline,
> ++   force align the loop without considering the max skip.  */
> ++static void
> ++ix86_align_loops ()
> ++{
> ++  basic_block bb;
> ++
> ++  /* Don't do this when we don't know cache line size.  */
> ++  if (ix86_cost->prefetch_block =3D=3D 0)
> ++    return;
> ++
> ++  loop_optimizer_init (AVOID_CFG_MODIFICATIONS);
> ++  profile_count count_threshold =3D cfun->cfg->count_max / param_align_=
threshold;
> ++  FOR_EACH_BB_FN (bb, cfun)
> ++    {
> ++      rtx_insn *label =3D BB_HEAD (bb);
> ++      bool has_fallthru =3D 0;
> ++      edge e;
> ++      edge_iterator ei;
> ++
> ++      if (!LABEL_P (label))
> ++      continue;
> ++
> ++      profile_count fallthru_count =3D profile_count::zero ();
> ++      profile_count branch_count =3D profile_count::zero ();
> ++
> ++      FOR_EACH_EDGE (e, ei, bb->preds)
> ++      {
> ++        if (e->flags & EDGE_FALLTHRU)
> ++          has_fallthru =3D 1, fallthru_count +=3D e->count ();
> ++        else
> ++          branch_count +=3D e->count ();
> ++      }
> ++
> ++      if (!fallthru_count.initialized_p () || !branch_count.initialized=
_p ())
> ++      continue;
> ++
> ++      if (bb->loop_father
> ++        && bb->loop_father->latch !=3D EXIT_BLOCK_PTR_FOR_FN (cfun)
> ++        && (has_fallthru
> ++            ? (!(single_succ_p (bb)
> ++                 && single_succ (bb) =3D=3D EXIT_BLOCK_PTR_FOR_FN (cfun=
))
> ++               && optimize_bb_for_speed_p (bb)
> ++               && branch_count + fallthru_count > count_threshold
> ++               && (branch_count > fallthru_count * param_align_loop_ite=
rations))
> ++            /* In case there'no fallthru for the loop.
> ++               Nops inserted won't be executed.  */
> ++            : (branch_count > count_threshold
> ++               || (bb->count > bb->prev_bb->count * 10
> ++                   && (bb->prev_bb->count
> ++                       <=3D ENTRY_BLOCK_PTR_FOR_FN (cfun)->count / 2)))=
))
> ++      {
> ++        rtx_insn* insn, *end_insn;
> ++        HOST_WIDE_INT size =3D 0;
> ++        bool padding_p =3D true;
> ++        basic_block tbb =3D bb;
> ++        unsigned cond_branch_num =3D 0;
> ++        bool detect_tight_loop_p =3D false;
> ++
> ++        for (unsigned int i =3D 0; i !=3D bb->loop_father->num_nodes;
> ++             i++, tbb =3D tbb->next_bb)
> ++          {
> ++            /* Only handle continuous cfg layout. */
> ++            if (bb->loop_father !=3D tbb->loop_father)
> ++              {
> ++                padding_p =3D false;
> ++                break;
> ++              }
> ++
> ++            FOR_BB_INSNS (tbb, insn)
> ++              {
> ++                if (!NONDEBUG_INSN_P (insn))
> ++                  continue;
> ++                size +=3D ix86_min_insn_size (insn);
> ++
> ++                /* We don't know size of inline asm.
> ++                   Don't align loop for call.  */
> ++                if (asm_noperands (PATTERN (insn)) >=3D 0
> ++                    || CALL_P (insn))
> ++                  {
> ++                    size =3D -1;
> ++                    break;
> ++                  }
> ++              }
> ++
> ++            if (size =3D=3D -1 || size > ix86_cost->prefetch_block)
> ++              {
> ++                padding_p =3D false;
> ++                break;
> ++              }
> ++
> ++            FOR_EACH_EDGE (e, ei, tbb->succs)
> ++              {
> ++                /* It could be part of the loop.  */
> ++                if (e->dest =3D=3D bb)
> ++                  {
> ++                    detect_tight_loop_p =3D true;
> ++                    break;
> ++                  }
> ++              }
> ++
> ++            if (detect_tight_loop_p)
> ++              break;
> ++
> ++            end_insn =3D BB_END (tbb);
> ++            if (JUMP_P (end_insn))
> ++              {
> ++                /* For decoded icache:
> ++                   1. Up to two branches are allowed per Way.
> ++                   2. A non-conditional branch is the last micro-op in =
a Way.
> ++                */
> ++                if (onlyjump_p (end_insn)
> ++                    && (any_uncondjump_p (end_insn)
> ++                        || single_succ_p (tbb)))
> ++                  {
> ++                    padding_p =3D false;
> ++                    break;
> ++                  }
> ++                else if (++cond_branch_num >=3D 2)
> ++                  {
> ++                    padding_p =3D false;
> ++                    break;
> ++                  }
> ++              }
> ++
> ++          }
> ++
> ++        if (padding_p && detect_tight_loop_p)
> ++          {
> ++            emit_insn_before (gen_max_skip_align (GEN_INT (ceil_log2 (s=
ize)),
> ++                                                  GEN_INT (0)), label);
> ++            /* End of function.  */
> ++            if (!tbb || tbb =3D=3D EXIT_BLOCK_PTR_FOR_FN (cfun))
> ++              break;
> ++            /* Skip bb which already fits into one cacheline.  */
> ++            bb =3D tbb;
> ++          }
> ++      }
> ++    }
> ++
> ++  loop_optimizer_finalize ();
> ++  free_dominance_info (CDI_DOMINATORS);
> ++}
> ++
> ++namespace {
> ++
> ++const pass_data pass_data_align_tight_loops =3D
> ++{
> ++  RTL_PASS, /* type */
> ++  "align_tight_loops", /* name */
> ++  OPTGROUP_NONE, /* optinfo_flags */
> ++  TV_MACH_DEP, /* tv_id */
> ++  0, /* properties_required */
> ++  0, /* properties_provided */
> ++  0, /* properties_destroyed */
> ++  0, /* todo_flags_start */
> ++  0, /* todo_flags_finish */
> ++};
> ++
> ++class pass_align_tight_loops : public rtl_opt_pass
> ++{
> ++public:
> ++  pass_align_tight_loops (gcc::context *ctxt)
> ++    : rtl_opt_pass (pass_data_align_tight_loops, ctxt)
> ++  {}
> ++
> ++  /* opt_pass methods: */
> ++  bool gate (function *) final override
> ++    {
> ++      return optimize && optimize_function_for_speed_p (cfun);
> ++    }
> ++
> ++  unsigned int execute (function *) final override
> ++    {
> ++      timevar_push (TV_MACH_DEP);
> ++#ifdef ASM_OUTPUT_MAX_SKIP_ALIGN
> ++      ix86_align_loops ();
> ++#endif
> ++      timevar_pop (TV_MACH_DEP);
> ++      return 0;
> ++    }
> ++}; // class pass_align_tight_loops
> ++
> ++} // anon namespace
> ++
> ++rtl_opt_pass *
> ++make_pass_align_tight_loops (gcc::context *ctxt)
> ++{
> ++  return new pass_align_tight_loops (ctxt);
> ++}
> ++
> + /* This compares the priority of target features in function DECL1
> +    and DECL2.  It returns positive value if DECL1 is higher priority,
> +    negative value if DECL2 is higher priority and 0 if they are the
> +diff --git a/gcc/config/i386/i386-passes.def b/gcc/config/i386/i386-pass=
es.def
> +index 7d96766f7b96..e500f15c9971 100644
> +--- a/gcc/config/i386/i386-passes.def
> ++++ b/gcc/config/i386/i386-passes.def
> +@@ -31,5 +31,8 @@ along with GCC; see the file COPYING3.  If not see
> +   INSERT_PASS_BEFORE (pass_cse2, 1, pass_stv, true /* timode_p */);
> +
> +   INSERT_PASS_BEFORE (pass_shorten_branches, 1, pass_insert_endbr_and_p=
atchable_area);
> ++  /* pass_align_tight_loops must be after pass_insert_endbr_and_patchab=
le_area.
> ++     PR116174.  */
> ++  INSERT_PASS_BEFORE (pass_shorten_branches, 1, pass_align_tight_loops)=
;
> +
> +   INSERT_PASS_AFTER (pass_combine, 1, pass_remove_partial_avx_dependenc=
y);
> +diff --git a/gcc/config/i386/i386-protos.h b/gcc/config/i386/i386-protos=
.h
> +index 46214a63974d..36c7b1aed42b 100644
> +--- a/gcc/config/i386/i386-protos.h
> ++++ b/gcc/config/i386/i386-protos.h
> +@@ -419,6 +419,7 @@ extern rtl_opt_pass *make_pass_insert_endbr_and_patc=
hable_area
> +   (gcc::context *);
> + extern rtl_opt_pass *make_pass_remove_partial_avx_dependency
> +   (gcc::context *);
> ++extern rtl_opt_pass *make_pass_align_tight_loops (gcc::context *);
> +
> + extern bool ix86_has_no_direct_extern_access;
> +
> +diff --git a/gcc/config/i386/i386.cc b/gcc/config/i386/i386.cc
> +index 6f89891d3cb5..288c69467d62 100644
> +--- a/gcc/config/i386/i386.cc
> ++++ b/gcc/config/i386/i386.cc
> +@@ -23444,150 +23444,6 @@ ix86_split_stlf_stall_load ()
> +     }
> + }
> +
> +-/* When a hot loop can be fit into one cacheline,
> +-   force align the loop without considering the max skip.  */
> +-static void
> +-ix86_align_loops ()
> +-{
> +-  basic_block bb;
> +-
> +-  /* Don't do this when we don't know cache line size.  */
> +-  if (ix86_cost->prefetch_block =3D=3D 0)
> +-    return;
> +-
> +-  loop_optimizer_init (AVOID_CFG_MODIFICATIONS);
> +-  profile_count count_threshold =3D cfun->cfg->count_max / param_align_=
threshold;
> +-  FOR_EACH_BB_FN (bb, cfun)
> +-    {
> +-      rtx_insn *label =3D BB_HEAD (bb);
> +-      bool has_fallthru =3D 0;
> +-      edge e;
> +-      edge_iterator ei;
> +-
> +-      if (!LABEL_P (label))
> +-      continue;
> +-
> +-      profile_count fallthru_count =3D profile_count::zero ();
> +-      profile_count branch_count =3D profile_count::zero ();
> +-
> +-      FOR_EACH_EDGE (e, ei, bb->preds)
> +-      {
> +-        if (e->flags & EDGE_FALLTHRU)
> +-          has_fallthru =3D 1, fallthru_count +=3D e->count ();
> +-        else
> +-          branch_count +=3D e->count ();
> +-      }
> +-
> +-      if (!fallthru_count.initialized_p () || !branch_count.initialized=
_p ())
> +-      continue;
> +-
> +-      if (bb->loop_father
> +-        && bb->loop_father->latch !=3D EXIT_BLOCK_PTR_FOR_FN (cfun)
> +-        && (has_fallthru
> +-            ? (!(single_succ_p (bb)
> +-                 && single_succ (bb) =3D=3D EXIT_BLOCK_PTR_FOR_FN (cfun=
))
> +-               && optimize_bb_for_speed_p (bb)
> +-               && branch_count + fallthru_count > count_threshold
> +-               && (branch_count > fallthru_count * param_align_loop_ite=
rations))
> +-            /* In case there'no fallthru for the loop.
> +-               Nops inserted won't be executed.  */
> +-            : (branch_count > count_threshold
> +-               || (bb->count > bb->prev_bb->count * 10
> +-                   && (bb->prev_bb->count
> +-                       <=3D ENTRY_BLOCK_PTR_FOR_FN (cfun)->count / 2)))=
))
> +-      {
> +-        rtx_insn* insn, *end_insn;
> +-        HOST_WIDE_INT size =3D 0;
> +-        bool padding_p =3D true;
> +-        basic_block tbb =3D bb;
> +-        unsigned cond_branch_num =3D 0;
> +-        bool detect_tight_loop_p =3D false;
> +-
> +-        for (unsigned int i =3D 0; i !=3D bb->loop_father->num_nodes;
> +-             i++, tbb =3D tbb->next_bb)
> +-          {
> +-            /* Only handle continuous cfg layout. */
> +-            if (bb->loop_father !=3D tbb->loop_father)
> +-              {
> +-                padding_p =3D false;
> +-                break;
> +-              }
> +-
> +-            FOR_BB_INSNS (tbb, insn)
> +-              {
> +-                if (!NONDEBUG_INSN_P (insn))
> +-                  continue;
> +-                size +=3D ix86_min_insn_size (insn);
> +-
> +-                /* We don't know size of inline asm.
> +-                   Don't align loop for call.  */
> +-                if (asm_noperands (PATTERN (insn)) >=3D 0
> +-                    || CALL_P (insn))
> +-                  {
> +-                    size =3D -1;
> +-                    break;
> +-                  }
> +-              }
> +-
> +-            if (size =3D=3D -1 || size > ix86_cost->prefetch_block)
> +-              {
> +-                padding_p =3D false;
> +-                break;
> +-              }
> +-
> +-            FOR_EACH_EDGE (e, ei, tbb->succs)
> +-              {
> +-                /* It could be part of the loop.  */
> +-                if (e->dest =3D=3D bb)
> +-                  {
> +-                    detect_tight_loop_p =3D true;
> +-                    break;
> +-                  }
> +-              }
> +-
> +-            if (detect_tight_loop_p)
> +-              break;
> +-
> +-            end_insn =3D BB_END (tbb);
> +-            if (JUMP_P (end_insn))
> +-              {
> +-                /* For decoded icache:
> +-                   1. Up to two branches are allowed per Way.
> +-                   2. A non-conditional branch is the last micro-op in =
a Way.
> +-                */
> +-                if (onlyjump_p (end_insn)
> +-                    && (any_uncondjump_p (end_insn)
> +-                        || single_succ_p (tbb)))
> +-                  {
> +-                    padding_p =3D false;
> +-                    break;
> +-                  }
> +-                else if (++cond_branch_num >=3D 2)
> +-                  {
> +-                    padding_p =3D false;
> +-                    break;
> +-                  }
> +-              }
> +-
> +-          }
> +-
> +-        if (padding_p && detect_tight_loop_p)
> +-          {
> +-            emit_insn_before (gen_max_skip_align (GEN_INT (ceil_log2 (s=
ize)),
> +-                                                  GEN_INT (0)), label);
> +-            /* End of function.  */
> +-            if (!tbb || tbb =3D=3D EXIT_BLOCK_PTR_FOR_FN (cfun))
> +-              break;
> +-            /* Skip bb which already fits into one cacheline.  */
> +-            bb =3D tbb;
> +-          }
> +-      }
> +-    }
> +-
> +-  loop_optimizer_finalize ();
> +-  free_dominance_info (CDI_DOMINATORS);
> +-}
> +-
> + /* Implement machine specific optimizations.  We implement padding of r=
eturns
> +    for K8 CPUs and pass to avoid 4 jumps in the single 16 byte window. =
 */
> + static void
> +@@ -23611,8 +23467,6 @@ ix86_reorg (void)
> + #ifdef ASM_OUTPUT_MAX_SKIP_ALIGN
> +       if (TARGET_FOUR_JUMP_LIMIT)
> +       ix86_avoid_jump_mispredicts ();
> +-
> +-      ix86_align_loops ();
> + #endif
> +     }
> + }
> +diff --git a/gcc/testsuite/gcc.target/i386/pr116174.c b/gcc/testsuite/gc=
c.target/i386/pr116174.c
> +new file mode 100644
> +index 000000000000..8877d0b51af1
> +--- /dev/null
> ++++ b/gcc/testsuite/gcc.target/i386/pr116174.c
> +@@ -0,0 +1,12 @@
> ++/* { dg-do compile { target *-*-linux* } } */
> ++/* { dg-options "-O2 -fcf-protection=3Dbranch" } */
> ++
> ++char *
> ++foo (char *dest, const char *src)
> ++{
> ++  while ((*dest++ =3D *src++) !=3D '\0')
> ++    /* nothing */;
> ++  return --dest;
> ++}
> ++
> ++/* { dg-final { scan-assembler "\t\.cfi_startproc\n\tendbr(32|64)\n" } =
} */
> +--
> +2.43.5
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208831): https://lists.openembedded.org/g/openembedde=
d-core/message/208831
> Mute This Topic: https://lists.openembedded.org/mt/110160747/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

