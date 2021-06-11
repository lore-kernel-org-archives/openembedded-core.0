Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web09.415.1623450813378544429
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jun 2021 15:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hhQmxJ0J;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id j62so18821258qke.10
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Jun 2021 15:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6vllED/Kfyr8amNqoejGm8EYUVdCeV4hK/QgfKBwXIs=;
        b=hhQmxJ0Jiod+nAd4bbm7DzsCy+tP/R5jY/W49XeXStVW8HuphbSR9y8o+NdIBiDX6R
         6cFHqlYnT4gQNBshlJodsOgrceLfYdi+1dAb1sxqzKpQvT4DhB/TC9QhWn4HaIfwy0Vq
         lZx3acGP71yZrYmSYNSpNfXdOF3Fl4JuFQKimK1Sb/TyIlqZYSPr9ZZYON/nQ8eIDF/4
         +h8dYz0luTBzMpNsxRp4Yd35Ten/peLh152occ2M0u2TDXBB+GZdieC1K1/HnzZn1Y8A
         rjGnGZfBWQij2JQbTobak3i001PH7WRuWFmFL7yyKIN/YbpznfWlrlMB6v0FHblE92of
         icqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6vllED/Kfyr8amNqoejGm8EYUVdCeV4hK/QgfKBwXIs=;
        b=lrXdqAN6bfCPX9Bjj8+VPzjgz3ZXf4/Guxo7Jx7jlPJ0RGRXU2g2u48hYeMlqqVCYE
         Iek1EOnGxvrTGs/jTa4IkMwY8ZrZTUXklb3pHv4z4Crnq7LmnH8VNU0SFl67SX3ebNJH
         YjgWw3cNCHwiM2fEp8pSBVdf1GsIKgljDlvy9/gb9xqoJDthNcSxiegwnBlsCZJrlO27
         jR/QUd1MdQNTqsovqD11EDiIFyjIr/cYrmBKp2Df+apOx4dDxWwPi+d9Nr0brBqQKW8E
         SVX8z5z157z/IaxR9RojmxI6pzfr4thWpadLSvGyFr7Jdj0KJKXJeXP0CnlaKSHIyXSn
         dJow==
X-Gm-Message-State: AOAM532xiXDax/qJKJnd0QYlR8qc0EVxL6LYn43/el77aBnX8QNORrHB
	Ve/xZA6XycMvUjud21LUbTUT9oZfsxNGFN+oE6k=
X-Google-Smtp-Source: ABdhPJwdwwcEDBOJqb7/xPFXv/GnydlDTg61bdZh0P8uM8whGMGjnc+z566J9mmNX8sgaASbeNvfHEp9M/ZFyjMNqTo=
X-Received: by 2002:a37:855:: with SMTP id 82mr6320939qki.25.1623450812169;
 Fri, 11 Jun 2021 15:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210611175344.26796-1-abrodkin@synopsys.com>
In-Reply-To: <20210611175344.26796-1-abrodkin@synopsys.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 11 Jun 2021 15:33:21 -0700
Message-ID: <CAMKF1sqf7aw72Cc3LMqpwWFw-itUupiMRS1rRQ+dB70yNdNO=A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: Fixes for ARC
To: abrodkin@synopsys.com
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-snps-arc@lists.infradead.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f8404705c485182b"

--000000000000f8404705c485182b
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 11, 2021 at 10:54 AM Alexey Brodkin via lists.openembedded.org
<abrodkin=synopsys.com@lists.openembedded.org> wrote:

> A couple of fixes to be a part of 11.2 whenever it happens
>
> 1.
> https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=0061fabeb9393c362601486105202cfe837a5a68
>    Fixes "harfbuzz" build, see
> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/issues/382
>    for all the gory details.
>
> 2.
> https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=4186b7e93be73f8d68dc0fcc00a4cc8cc83e99a8
>    Fixes ext4 run-time issue:
>    ------------------------->8---------------------------
>    Path: /bin/busybox
>    CPU: 0 PID: 1 Comm: init Not tainted 5.13.0-rc2-dirty #23
>    Invalid Read @ 0x41c9e600 by insn @ __bio_try_merge_page+0x4e/0xfc
>    ECR: 0x00050100 EFA: 0x41c9e600 ERET: 0x80159656
>    STAT: 0x80080202 [IE K     ]   BTA: 0x80159648
>     SP: 0x80821b88  FP: 0x00000008 BLK: bio_add_page+0x22/0x5c
>    LPS: 0x801a6a94 LPE: 0x801a6a98 LPC: 0x00000000
>    r00: 0x80823300 r01: 0xbfb85e38 r02: 0x00002000
>    r03: 0x00000000 r04: 0x80821b9b r05: 0x80821bfc
>    r06: 0x00000000 r07: 0x00000700 r08: 0x00000000
>    r09: 0xffffffff r10: 0x00000000 r11: 0x00000000
>    r12: 0x8080b300
>    Stack Trace:
>      __bio_try_merge_page+0x4e/0xfc
>      bio_add_page+0x22/0x5c
>      do_mpage_readpage+0x534/0x65c
>      mpage_readahead+0x30/0xdc
>      read_pages+0x34/0x194
>      page_cache_ra_unbounded+0x56/0x154
>      filemap_fault+0x25a/0x5d8
>      __do_fault+0x94/0xe8
>      handle_mm_fault+0x4de/0xbd4
>      do_page_fault+0x108/0x21c
>      ret_from_exception+0x0/0x8
>    ------------------------->8---------------------------
>
> 3.
> https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=5a9b6a004f89fdd95b0470e1324dc4dee8c41d24
>    Precautious fix for rare corner cases which we don't wnat to really
> end-up in.
>

This looks fine to me



> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  meta/recipes-devtools/gcc/gcc-11.1.inc             |   3 +
>  ...0038-arc-Update-64bit-move-split-patterns.patch | 290
> +++++++++++++++++++++
>  .../gcc/gcc/0039-arc-Fix-u-maddhisi-patterns.patch | 127 +++++++++
>  .../gcc/0040-arc-Update-doloop_end-patterns.patch  | 105 ++++++++
>  4 files changed, 525 insertions(+)
>  create mode 100644
> meta/recipes-devtools/gcc/gcc/0038-arc-Update-64bit-move-split-patterns.patch
>  create mode 100644
> meta/recipes-devtools/gcc/gcc/0039-arc-Fix-u-maddhisi-patterns.patch
>  create mode 100644
> meta/recipes-devtools/gcc/gcc/0040-arc-Update-doloop_end-patterns.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-11.1.inc
> b/meta/recipes-devtools/gcc/gcc-11.1.inc
> index bf29879ded..69e4c8bacc 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.1.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.1.inc
> @@ -69,6 +69,9 @@ SRC_URI = "\
>             file://0036-mingw32-Enable-operation_not_supported.patch \
>             file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
>
> file://0001-Revert-libstdc-Install-libstdc-gdb.py-more-robustly-.patch \
> +           file://0038-arc-Update-64bit-move-split-patterns.patch \
> +           file://0039-arc-Fix-u-maddhisi-patterns.patch \
> +           file://0040-arc-Update-doloop_end-patterns.patch \
>  "
>  SRC_URI[sha256sum] =
> "4c4a6fb8a8396059241c2e674b85b351c26a5d678274007f076957afa1cc9ddf"
>  SRC_URI[backports.sha256sum] =
> "69274bebd6c069a13443d4af61070e854740a639ec4d66eedf3e80070363587b"
> diff --git
> a/meta/recipes-devtools/gcc/gcc/0038-arc-Update-64bit-move-split-patterns.patch
> b/meta/recipes-devtools/gcc/gcc/0038-arc-Update-64bit-move-split-patterns.patch
> new file mode 100644
> index 0000000000..37fe95d711
> --- /dev/null
> +++
> b/meta/recipes-devtools/gcc/gcc/0038-arc-Update-64bit-move-split-patterns.patch
> @@ -0,0 +1,290 @@
> +From 0061fabeb9393c362601486105202cfe837a5a68 Mon Sep 17 00:00:00 2001
> +From: Claudiu Zissulescu <claziss@synopsys.com>
> +Date: Wed, 9 Jun 2021 12:12:57 +0300
> +Subject: [PATCH] arc: Update 64bit move split patterns.
> +
> +ARCv2HS can use a limited number of instructions to implement 64bit
> +moves. The VADD2 is used as a 64bit move, the LDD/STD are 64 bit loads
> +and stores. All those instructions are not baseline, hence we need to
> +provide alternatives when they are not available or cannot be generate
> +due to instruction restriction.
> +
> +This patch is cleaning up those move patterns, and updates splits
> +instruction lengths.
> +
> +This is a backport from mainline gcc.
> +
> +gcc/
> +2021-06-09  Claudiu Zissulescu  <claziss@synopsys.com>
> +
> +       * config/arc/arc-protos.h (arc_split_move_p): New prototype.
> +       * config/arc/arc.c (arc_split_move_p): New function.
> +       (arc_split_move): Clean up.
> +       * config/arc/arc.md (movdi_insn): Clean up, use arc_split_move_p.
> +       (movdf_insn): Likewise.
> +       * config/arc/simdext.md (mov<VWH>_insn): Likewise.
> +
> +Upstream-Status: Backport [
> https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=0061fabeb9393c362601486105202cfe837a5a68
> ]
> +
> +Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
> +(cherry picked from commit c0ba7a8af5366c37241f20e8be41e362f7260389)
> +Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> +---
> + gcc/config/arc/arc-protos.h |  1 +
> + gcc/config/arc/arc.c        | 44 ++++++++++++----------
> + gcc/config/arc/arc.md       | 91
> +++++++++------------------------------------
> + gcc/config/arc/simdext.md   | 38 ++++---------------
> + 4 files changed, 52 insertions(+), 122 deletions(-)
> +
> +diff --git a/gcc/config/arc/arc-protos.h b/gcc/config/arc/arc-protos.h
> +index 1f56a0d82e4..62d7e45d29d 100644
> +--- a/gcc/config/arc/arc-protos.h
> ++++ b/gcc/config/arc/arc-protos.h
> +@@ -50,6 +50,7 @@ extern void arc_split_ior (rtx *);
> + extern bool arc_check_mov_const (HOST_WIDE_INT );
> + extern bool arc_split_mov_const (rtx *);
> + extern bool arc_can_use_return_insn (void);
> ++extern bool arc_split_move_p (rtx *);
> + #endif /* RTX_CODE */
> +
> + extern bool arc_ccfsm_branch_deleted_p (void);
> +diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
> +index 3201c3fefd7..db541bc11f5 100644
> +--- a/gcc/config/arc/arc.c
> ++++ b/gcc/config/arc/arc.c
> +@@ -10129,6 +10129,31 @@ arc_process_double_reg_moves (rtx *operands)
> +   return true;
> + }
> +
> ++
> ++/* Check if we need to split a 64bit move.  We do not need to split it
> if we can
> ++   use vadd2 or ldd/std instructions.  */
> ++
> ++bool
> ++arc_split_move_p (rtx *operands)
> ++{
> ++  machine_mode mode = GET_MODE (operands[0]);
> ++
> ++  if (TARGET_LL64
> ++      && ((memory_operand (operands[0], mode)
> ++         && (even_register_operand (operands[1], mode)
> ++             || satisfies_constraint_Cm3 (operands[1])))
> ++        || (memory_operand (operands[1], mode)
> ++            && even_register_operand (operands[0], mode))))
> ++    return false;
> ++
> ++  if (TARGET_PLUS_QMACW
> ++      && even_register_operand (operands[0], mode)
> ++      && even_register_operand (operands[1], mode))
> ++    return false;
> ++
> ++  return true;
> ++}
> ++
> + /* operands 0..1 are the operands of a 64 bit move instruction.
> +    split it into two moves with operands 2/3 and 4/5.  */
> +
> +@@ -10146,25 +10171,6 @@ arc_split_move (rtx *operands)
> +       return;
> +   }
> +
> +-  if (TARGET_LL64
> +-      && ((memory_operand (operands[0], mode)
> +-         && (even_register_operand (operands[1], mode)
> +-             || satisfies_constraint_Cm3 (operands[1])))
> +-        || (memory_operand (operands[1], mode)
> +-            && even_register_operand (operands[0], mode))))
> +-    {
> +-      emit_move_insn (operands[0], operands[1]);
> +-      return;
> +-    }
> +-
> +-  if (TARGET_PLUS_QMACW
> +-      && even_register_operand (operands[0], mode)
> +-      && even_register_operand (operands[1], mode))
> +-    {
> +-      emit_move_insn (operands[0], operands[1]);
> +-      return;
> +-    }
> +-
> +   if (TARGET_PLUS_QMACW
> +       && GET_CODE (operands[1]) == CONST_VECTOR)
> +     {
> +diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
> +index 7a52551eef5..91a838a38e4 100644
> +--- a/gcc/config/arc/arc.md
> ++++ b/gcc/config/arc/arc.md
> +@@ -1329,47 +1329,20 @@ core_3, archs4x, archs4xd, archs4xd_slow"
> +   "register_operand (operands[0], DImode)
> +    || register_operand (operands[1], DImode)
> +    || (satisfies_constraint_Cm3 (operands[1])
> +-      && memory_operand (operands[0], DImode))"
> +-  "*
> +-{
> +-  switch (which_alternative)
> +-    {
> +-    default:
> +-      return \"#\";
> +-
> +-    case 0:
> +-    if (TARGET_PLUS_QMACW
> +-      && even_register_operand (operands[0], DImode)
> +-      && even_register_operand (operands[1], DImode))
> +-      return \"vadd2%?\\t%0,%1,0\";
> +-    return \"#\";
> +-
> +-    case 2:
> +-    if (TARGET_LL64
> +-        && memory_operand (operands[1], DImode)
> +-      && even_register_operand (operands[0], DImode))
> +-      return \"ldd%U1%V1 %0,%1%&\";
> +-    return \"#\";
> +-
> +-    case 3:
> +-    if (TARGET_LL64
> +-      && memory_operand (operands[0], DImode)
> +-      && (even_register_operand (operands[1], DImode)
> +-          || satisfies_constraint_Cm3 (operands[1])))
> +-     return \"std%U0%V0 %1,%0\";
> +-    return \"#\";
> +-    }
> +-}"
> +-  "&& reload_completed"
> ++       && memory_operand (operands[0], DImode))"
> ++  "@
> ++   vadd2\\t%0,%1,0
> ++   #
> ++   ldd%U1%V1\\t%0,%1
> ++   std%U0%V0\\t%1,%0"
> ++  "&& reload_completed && arc_split_move_p (operands)"
> +   [(const_int 0)]
> +   {
> +    arc_split_move (operands);
> +    DONE;
> +   }
> +   [(set_attr "type" "move,move,load,store")
> +-   ;; ??? The ld/st values could be 4 if it's [reg,bignum].
> +-   (set_attr "length" "8,16,*,*")])
> +-
> ++   (set_attr "length" "8,16,16,16")])
> +
> + ;; Floating point move insns.
> +
> +@@ -1408,50 +1381,22 @@ core_3, archs4x, archs4xd, archs4xd_slow"
> + (define_insn_and_split "*movdf_insn"
> +   [(set (match_operand:DF 0 "move_dest_operand"      "=D,r,r,r,r,m")
> +       (match_operand:DF 1 "move_double_src_operand" "r,D,r,E,m,r"))]
> +-  "register_operand (operands[0], DFmode)
> +-   || register_operand (operands[1], DFmode)"
> +-  "*
> +-{
> +- switch (which_alternative)
> +-   {
> +-    default:
> +-      return \"#\";
> +-
> +-    case 2:
> +-    if (TARGET_PLUS_QMACW
> +-      && even_register_operand (operands[0], DFmode)
> +-      && even_register_operand (operands[1], DFmode))
> +-      return \"vadd2%?\\t%0,%1,0\";
> +-    return \"#\";
> +-
> +-    case 4:
> +-    if (TARGET_LL64
> +-      && ((even_register_operand (operands[0], DFmode)
> +-           && memory_operand (operands[1], DFmode))
> +-          || (memory_operand (operands[0], DFmode)
> +-              && even_register_operand (operands[1], DFmode))))
> +-      return \"ldd%U1%V1 %0,%1%&\";
> +-    return \"#\";
> +-
> +-    case 5:
> +-    if (TARGET_LL64
> +-      && ((even_register_operand (operands[0], DFmode)
> +-           && memory_operand (operands[1], DFmode))
> +-          || (memory_operand (operands[0], DFmode)
> +-              && even_register_operand (operands[1], DFmode))))
> +-     return \"std%U0%V0 %1,%0\";
> +-    return \"#\";
> +-   }
> +-}"
> +-  "reload_completed"
> ++  "(register_operand (operands[0], DFmode)
> ++    || register_operand (operands[1], DFmode))"
> ++  "@
> ++   #
> ++   #
> ++   vadd2\\t%0,%1,0
> ++   #
> ++   ldd%U1%V1\\t%0,%1
> ++   std%U0%V0\\t%1,%0"
> ++  "&& reload_completed && arc_split_move_p (operands)"
> +   [(const_int 0)]
> +   {
> +    arc_split_move (operands);
> +    DONE;
> +   }
> +   [(set_attr "type" "move,move,move,move,load,store")
> +-   (set_attr "predicable" "no,no,no,yes,no,no")
> +-   ;; ??? The ld/st values could be 16 if it's [reg,bignum].
> +    (set_attr "length" "4,16,8,16,16,16")])
> +
> + (define_insn_and_split "*movdf_insn_nolrsr"
> +diff --git a/gcc/config/arc/simdext.md b/gcc/config/arc/simdext.md
> +index f0900757452..36f41a5c3d0 100644
> +--- a/gcc/config/arc/simdext.md
> ++++ b/gcc/config/arc/simdext.md
> +@@ -1402,41 +1402,19 @@
> +       (match_operand:VWH 1 "general_operand"    "i,r,m,r"))]
> +   "(register_operand (operands[0], <MODE>mode)
> +        || register_operand (operands[1], <MODE>mode))"
> +-  "*
> +-{
> +-  switch (which_alternative)
> +-    {
> +-     default:
> +-       return \"#\";
> +-
> +-     case 1:
> +-       if (TARGET_PLUS_QMACW
> +-           && even_register_operand (operands[0], <MODE>mode)
> +-         && even_register_operand (operands[1], <MODE>mode))
> +-         return \"vadd2%?\\t%0,%1,0\";
> +-       return \"#\";
> +-
> +-     case 2:
> +-       if (TARGET_LL64)
> +-         return \"ldd%U1%V1 %0,%1\";
> +-       return \"#\";
> +-
> +-     case 3:
> +-       if (TARGET_LL64)
> +-         return \"std%U0%V0 %1,%0\";
> +-       return \"#\";
> +-    }
> +-}"
> +-  "reload_completed"
> ++  "@
> ++   #
> ++   vadd2\\t%0,%1,0
> ++   ldd%U1%V1\\t%0,%1
> ++   std%U0%V0\\t%1,%0"
> ++  "&& reload_completed && arc_split_move_p (operands)"
> +   [(const_int 0)]
> +   {
> +    arc_split_move (operands);
> +    DONE;
> +   }
> +-  [(set_attr "type" "move,multi,load,store")
> +-   (set_attr "predicable" "no,no,no,no")
> +-   (set_attr "iscompact"  "false,false,false,false")
> +-   ])
> ++  [(set_attr "type" "move,move,load,store")
> ++   (set_attr "length" "16,8,16,16")])
> +
> + (define_expand "movmisalign<mode>"
> +  [(set (match_operand:VWH 0 "general_operand" "")
> +--
> +2.16.2
> +
> diff --git
> a/meta/recipes-devtools/gcc/gcc/0039-arc-Fix-u-maddhisi-patterns.patch
> b/meta/recipes-devtools/gcc/gcc/0039-arc-Fix-u-maddhisi-patterns.patch
> new file mode 100644
> index 0000000000..9c5a2b8b33
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0039-arc-Fix-u-maddhisi-patterns.patch
> @@ -0,0 +1,127 @@
> +From 4186b7e93be73f8d68dc0fcc00a4cc8cc83e99a8 Mon Sep 17 00:00:00 2001
> +From: Claudiu Zissulescu <claziss@synopsys.com>
> +Date: Wed, 9 Jun 2021 12:12:57 +0300
> +Subject: [PATCH] arc: Fix (u)maddhisi patterns
> +
> +Rework the (u)maddhisi4 patterns and use VMAC2H(U) instruction instead
> +of the 64bit MAC(U) instruction.
> +This fixes the next execute.exp failures:
> +     arith-rand-ll.c   -O2  execution test
> +     arith-rand-ll.c   -O3  execution test
> +     pr78726.c   -O2  execution test
> +     pr78726.c   -O3  execution test
> +
> +gcc/
> +2021-06-09  Claudiu Zissulescu  <claziss@synopsys.com>
> +
> +       * config/arc/arc.md (maddhisi4): Use VMAC2H instruction.
> +       (machi): New pattern.
> +       (umaddhisi4): Use VMAC2HU instruction.
> +       (umachi): New pattern.
> +
> +Upstream-Status: Backport [
> https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=4186b7e93be73f8d68dc0fcc00a4cc8cc83e99a8
> ]
> +
> +Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
> +(cherry picked from commit dd4778a59b4693777c732075021375e19eee6a76)
> +Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> +---
> + gcc/config/arc/arc.md | 66
> ++++++++++++++++++++++++++++++++-------------------
> + 1 file changed, 41 insertions(+), 25 deletions(-)
> +
> +diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
> +index 91a838a38e4..2a7e087ff72 100644
> +--- a/gcc/config/arc/arc.md
> ++++ b/gcc/config/arc/arc.md
> +@@ -6053,48 +6053,64 @@ core_3, archs4x, archs4xd, archs4xd_slow"
> +
> + ;; MAC and DMPY instructions
> +
> +-; Use MAC instruction to emulate 16bit mac.
> ++; Use VMAC2H(U) instruction to emulate scalar 16bit mac.
> + (define_expand "maddhisi4"
> +   [(match_operand:SI 0 "register_operand" "")
> +    (match_operand:HI 1 "register_operand" "")
> +    (match_operand:HI 2 "extend_operand"   "")
> +    (match_operand:SI 3 "register_operand" "")]
> +-  "TARGET_PLUS_DMPY"
> ++  "TARGET_PLUS_MACD"
> +   "{
> +-   rtx acc_reg = gen_rtx_REG (DImode, ACC_REG_FIRST);
> +-   rtx tmp1 = gen_reg_rtx (SImode);
> +-   rtx tmp2 = gen_reg_rtx (SImode);
> +-   rtx accl = gen_lowpart (SImode, acc_reg);
> +-
> +-   emit_move_insn (accl, operands[3]);
> +-   emit_insn (gen_rtx_SET (tmp1, gen_rtx_SIGN_EXTEND (SImode,
> operands[1])));
> +-   emit_insn (gen_rtx_SET (tmp2, gen_rtx_SIGN_EXTEND (SImode,
> operands[2])));
> +-   emit_insn (gen_mac (tmp1, tmp2));
> +-   emit_move_insn (operands[0], accl);
> ++   rtx acc_reg = gen_rtx_REG (SImode, ACC_REG_FIRST);
> ++
> ++   emit_move_insn (acc_reg, operands[3]);
> ++   emit_insn (gen_machi (operands[1], operands[2]));
> ++   emit_move_insn (operands[0], acc_reg);
> +    DONE;
> +   }")
> +
> +-; The same for the unsigned variant, but using MACU instruction.
> ++(define_insn "machi"
> ++  [(set (reg:SI ARCV2_ACC)
> ++      (plus:SI
> ++       (mult:SI (sign_extend:SI (match_operand:HI 0 "register_operand"
> "%r"))
> ++                (sign_extend:SI (match_operand:HI 1 "register_operand"
> "r")))
> ++       (reg:SI ARCV2_ACC)))]
> ++  "TARGET_PLUS_MACD"
> ++  "vmac2h\\t0,%0,%1"
> ++  [(set_attr "length" "4")
> ++   (set_attr "type" "multi")
> ++   (set_attr "predicable" "no")
> ++   (set_attr "cond" "nocond")])
> ++
> ++; The same for the unsigned variant, but using VMAC2HU instruction.
> + (define_expand "umaddhisi4"
> +   [(match_operand:SI 0 "register_operand" "")
> +    (match_operand:HI 1 "register_operand" "")
> +-   (match_operand:HI 2 "extend_operand"   "")
> ++   (match_operand:HI 2 "register_operand" "")
> +    (match_operand:SI 3 "register_operand" "")]
> +-  "TARGET_PLUS_DMPY"
> ++  "TARGET_PLUS_MACD"
> +   "{
> +-   rtx acc_reg = gen_rtx_REG (DImode, ACC_REG_FIRST);
> +-   rtx tmp1 = gen_reg_rtx (SImode);
> +-   rtx tmp2 = gen_reg_rtx (SImode);
> +-   rtx accl = gen_lowpart (SImode, acc_reg);
> +-
> +-   emit_move_insn (accl, operands[3]);
> +-   emit_insn (gen_rtx_SET (tmp1, gen_rtx_ZERO_EXTEND (SImode,
> operands[1])));
> +-   emit_insn (gen_rtx_SET (tmp2, gen_rtx_ZERO_EXTEND (SImode,
> operands[2])));
> +-   emit_insn (gen_macu (tmp1, tmp2));
> +-   emit_move_insn (operands[0], accl);
> ++   rtx acc_reg = gen_rtx_REG (SImode, ACC_REG_FIRST);
> ++
> ++   emit_move_insn (acc_reg, operands[3]);
> ++   emit_insn (gen_umachi (operands[1], operands[2]));
> ++   emit_move_insn (operands[0], acc_reg);
> +    DONE;
> +   }")
> +
> ++(define_insn "umachi"
> ++  [(set (reg:SI ARCV2_ACC)
> ++      (plus:SI
> ++       (mult:SI (zero_extend:SI (match_operand:HI 0 "register_operand"
> "%r"))
> ++                (zero_extend:SI (match_operand:HI 1 "register_operand"
> "r")))
> ++       (reg:SI ARCV2_ACC)))]
> ++  "TARGET_PLUS_MACD"
> ++  "vmac2hu\\t0,%0,%1"
> ++  [(set_attr "length" "4")
> ++   (set_attr "type" "multi")
> ++   (set_attr "predicable" "no")
> ++   (set_attr "cond" "nocond")])
> ++
> + (define_expand "maddsidi4"
> +   [(match_operand:DI 0 "register_operand" "")
> +    (match_operand:SI 1 "register_operand" "")
> +--
> +2.16.2
> +
> diff --git
> a/meta/recipes-devtools/gcc/gcc/0040-arc-Update-doloop_end-patterns.patch
> b/meta/recipes-devtools/gcc/gcc/0040-arc-Update-doloop_end-patterns.patch
> new file mode 100644
> index 0000000000..5f0bf8df8f
> --- /dev/null
> +++
> b/meta/recipes-devtools/gcc/gcc/0040-arc-Update-doloop_end-patterns.patch
> @@ -0,0 +1,105 @@
> +From 5a9b6a004f89fdd95b0470e1324dc4dee8c41d24 Mon Sep 17 00:00:00 2001
> +From: Claudiu Zissulescu <claziss@synopsys.com>
> +Date: Wed, 9 Jun 2021 12:12:57 +0300
> +Subject: [PATCH] arc: Update doloop_end patterns
> +
> +ARC processor can use LP instruction to implement zero overlay loops.
> +The current inplementation doesn't handle the unlikely situation when
> +the loop iterator is located in memory.  Refurbish the loop_end insn
> +pattern into a define_insn_and_split pattern.
> +
> +gcc/
> +2021-07-09  Claudiu Zissulescu  <claziss@synopsys.com>
> +
> +       * config/arc/arc.md (loop_end): Change it to
> +       define_insn_and_split.
> +
> +Upstream-Status: Backport [
> https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=5a9b6a004f89fdd95b0470e1324dc4dee8c41d24
> ]
> +
> +Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
> +(cherry picked from commit 174e75a210753b68de0f2c398a13ace0f512e35b)
> +Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> +---
> + gcc/config/arc/arc.md | 46 ++++++++++++++++++++--------------------------
> + 1 file changed, 20 insertions(+), 26 deletions(-)
> +
> +diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
> +index 2a7e087ff72..d704044c13f 100644
> +--- a/gcc/config/arc/arc.md
> ++++ b/gcc/config/arc/arc.md
> +@@ -4986,7 +4986,7 @@ core_3, archs4x, archs4xd, archs4xd_slow"
> + (define_expand "doloop_end"
> +   [(parallel [(set (pc)
> +                  (if_then_else
> +-                  (ne (match_operand 0 "" "")
> ++                  (ne (match_operand 0 "nonimmediate_operand")
> +                       (const_int 1))
> +                   (label_ref (match_operand 1 "" ""))
> +                   (pc)))
> +@@ -5012,44 +5012,38 @@ core_3, archs4x, archs4xd, archs4xd_slow"
> +
> + ;; if by any chance the lp_count is not used, then use an 'r'
> + ;; register, instead of going to memory.
> +-(define_insn "loop_end"
> +-  [(set (pc)
> +-      (if_then_else (ne (match_operand:SI 2 "nonimmediate_operand" "0,m")
> +-                        (const_int 1))
> +-                    (label_ref (match_operand 1 "" ""))
> +-                    (pc)))
> +-   (set (match_operand:SI 0 "nonimmediate_operand" "=r,m")
> +-      (plus (match_dup 2) (const_int -1)))
> +-   (unspec [(const_int 0)] UNSPEC_ARC_LP)
> +-   (clobber (match_scratch:SI 3 "=X,&r"))]
> +-  ""
> +-  "; ZOL_END, begins @%l1"
> +-  [(set_attr "length" "0")
> +-   (set_attr "predicable" "no")
> +-   (set_attr "type" "loop_end")])
> +-
> + ;; split pattern for the very slim chance when the loop register is
> + ;; memory.
> +-(define_split
> ++(define_insn_and_split "loop_end"
> +   [(set (pc)
> +-      (if_then_else (ne (match_operand:SI 0 "memory_operand")
> ++      (if_then_else (ne (match_operand:SI 0 "nonimmediate_operand"
> "+r,!m")
> +                         (const_int 1))
> +-                    (label_ref (match_operand 1 ""))
> ++                    (label_ref (match_operand 1 "" ""))
> +                     (pc)))
> +    (set (match_dup 0) (plus (match_dup 0) (const_int -1)))
> +    (unspec [(const_int 0)] UNSPEC_ARC_LP)
> +-   (clobber (match_scratch:SI 2))]
> +-  "memory_operand (operands[0], SImode)"
> ++   (clobber (match_scratch:SI 2 "=X,&r"))]
> ++  ""
> ++  "@
> ++   ; ZOL_END, begins @%l1
> ++   #"
> ++  "reload_completed && memory_operand (operands[0], Pmode)"
> +   [(set (match_dup 2) (match_dup 0))
> +-   (set (match_dup 2) (plus:SI (match_dup 2) (const_int -1)))
> ++   (parallel
> ++    [(set (reg:CC_ZN CC_REG)
> ++        (compare:CC_ZN (plus:SI (match_dup 2) (const_int -1))
> ++                       (const_int 0)))
> ++     (set (match_dup 2) (plus:SI (match_dup 2) (const_int -1)))])
> +    (set (match_dup 0) (match_dup 2))
> +-   (set (reg:CC CC_REG) (compare:CC (match_dup 2) (const_int 0)))
> +    (set (pc)
> +-      (if_then_else (ne (reg:CC CC_REG)
> ++      (if_then_else (ne (reg:CC_ZN CC_REG)
> +                         (const_int 0))
> +                     (label_ref (match_dup 1))
> +                     (pc)))]
> +-  "")
> ++  ""
> ++  [(set_attr "length" "0,24")
> ++   (set_attr "predicable" "no")
> ++   (set_attr "type" "loop_end")])
> +
> + (define_insn "loop_fail"
> +   [(set (reg:SI LP_COUNT)
> +--
> +2.16.2
> +
> --
> 2.16.2
>
>
> 
>
>

--000000000000f8404705c485182b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jun 11, 2021 at 10:54 AM Alexey Brodkin via <a hre=
f=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;abrodkin=
=
=3D<a href=3D"mailto:synopsys.com@lists.openembedded.org">synopsys.com@lis=
ts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
A couple of fixes to be a part of 11.2 whenever it happens<br>
<br>
1. <a href=3D"https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D0061fabe=
b9393c362601486105202cfe837a5a68" rel=3D"noreferrer" target=3D"_blank">http=
s://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D0061fabeb9393c3626014861052=
02cfe837a5a68</a><br>
=C2=A0 =C2=A0Fixes &quot;harfbuzz&quot; build, see <a href=3D"https://gith=
ub.com/foss-for-synopsys-dwc-arc-processors/toolchain/issues/382" rel=3D"no=
referrer" target=3D"_blank">https://github.com/foss-for-synopsys-dwc-arc-pr=
ocessors/toolchain/issues/382</a><br>
=C2=A0 =C2=A0for all the gory details.<br>
<br>
2. <a href=3D"https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D4186b7e9=
3be73f8d68dc0fcc00a4cc8cc83e99a8" rel=3D"noreferrer" target=3D"_blank">http=
s://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D4186b7e93be73f8d68dc0fcc00a=
4cc8cc83e99a8</a><br>
=C2=A0 =C2=A0Fixes ext4 run-time issue:<br>
=C2=A0 =C2=A0-------------------------&gt;8---------------------------<br>
=C2=A0 =C2=A0Path: /bin/busybox<br>
=C2=A0 =C2=A0CPU: 0 PID: 1 Comm: init Not tainted 5.13.0-rc2-dirty #23<br>
=C2=A0 =C2=A0Invalid Read @ 0x41c9e600 by insn @ __bio_try_merge_page+0x4e=
/0xfc<br>
=C2=A0 =C2=A0ECR: 0x00050100 EFA: 0x41c9e600 ERET: 0x80159656<br>
=C2=A0 =C2=A0STAT: 0x80080202 [IE K=C2=A0 =C2=A0 =C2=A0]=C2=A0 =C2=A0BTA: =
0x80159648<br>
=C2=A0 =C2=A0 SP: 0x80821b88=C2=A0 FP: 0x00000008 BLK: bio_add_page+0x22/0=
x5c<br>
=C2=A0 =C2=A0LPS: 0x801a6a94 LPE: 0x801a6a98 LPC: 0x00000000<br>
=C2=A0 =C2=A0r00: 0x80823300 r01: 0xbfb85e38 r02: 0x00002000<br>
=C2=A0 =C2=A0r03: 0x00000000 r04: 0x80821b9b r05: 0x80821bfc<br>
=C2=A0 =C2=A0r06: 0x00000000 r07: 0x00000700 r08: 0x00000000<br>
=C2=A0 =C2=A0r09: 0xffffffff r10: 0x00000000 r11: 0x00000000<br>
=C2=A0 =C2=A0r12: 0x8080b300<br>
=C2=A0 =C2=A0Stack Trace:<br>
=C2=A0 =C2=A0 =C2=A0__bio_try_merge_page+0x4e/0xfc<br>
=C2=A0 =C2=A0 =C2=A0bio_add_page+0x22/0x5c<br>
=C2=A0 =C2=A0 =C2=A0do_mpage_readpage+0x534/0x65c<br>
=C2=A0 =C2=A0 =C2=A0mpage_readahead+0x30/0xdc<br>
=C2=A0 =C2=A0 =C2=A0read_pages+0x34/0x194<br>
=C2=A0 =C2=A0 =C2=A0page_cache_ra_unbounded+0x56/0x154<br>
=C2=A0 =C2=A0 =C2=A0filemap_fault+0x25a/0x5d8<br>
=C2=A0 =C2=A0 =C2=A0__do_fault+0x94/0xe8<br>
=C2=A0 =C2=A0 =C2=A0handle_mm_fault+0x4de/0xbd4<br>
=C2=A0 =C2=A0 =C2=A0do_page_fault+0x108/0x21c<br>
=C2=A0 =C2=A0 =C2=A0ret_from_exception+0x0/0x8<br>
=C2=A0 =C2=A0-------------------------&gt;8---------------------------<br>
<br>
3. <a href=3D"https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D5a9b6a00=
4f89fdd95b0470e1324dc4dee8c41d24" rel=3D"noreferrer" target=3D"_blank">http=
s://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D5a9b6a004f89fdd95b0470e1324=
dc4dee8c41d24</a><br>
=C2=A0 =C2=A0Precautious fix for rare corner cases which we don&#39;t wnat=
 to really end-up in.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">This looks fine=
 to me=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><br>
Signed-off-by: Alexey Brodkin &lt;<a href=3D"mailto:abrodkin@synopsys.com"=
 target=3D"_blank">abrodkin@synopsys.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/gcc/gcc-11.1.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0...0038-arc-Update-64bit-move-split-patterns.patch | 290 +++++++++++=
++++++++++<br>
=C2=A0.../gcc/gcc/0039-arc-Fix-u-maddhisi-patterns.patch | 127 +++++++++<b=
r>
=C2=A0.../gcc/0040-arc-Update-doloop_end-patterns.patch=C2=A0 | 105 ++++++=
++<br>
=C2=A04 files changed, 525 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc/0038-arc-Update-64b=
it-move-split-patterns.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc/0039-arc-Fix-u-madd=
hisi-patterns.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc/0040-arc-Update-dol=
oop_end-patterns.patch<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-11.1.inc b/meta/recipes-devtool=
s/gcc/gcc-11.1.inc<br>
index bf29879ded..69e4c8bacc 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-11.1.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-11.1.inc<br>
@@ -69,6 +69,9 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0036-mingw32-Enable-opera=
tion_not_supported.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0037-libatomic-Do-not-enf=
orce-march-on-aarch64.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Revert-libstdc-Insta=
ll-libstdc-gdb.py-more-robustly-.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0038-arc-Update-64bit-mov=
e-split-patterns.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0039-arc-Fix-u-maddhisi-p=
atterns.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0040-arc-Update-doloop_en=
d-patterns.patch \<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;4c4a6fb8a8396059241c2e674b85b351c26a5d6=
78274007f076957afa1cc9ddf&quot;<br>
=C2=A0SRC_URI[backports.sha256sum] =3D &quot;69274bebd6c069a13443d4af61070=
e854740a639ec4d66eedf3e80070363587b&quot;<br>
diff --git a/meta/recipes-devtools/gcc/gcc/0038-arc-Update-64bit-move-spli=
t-patterns.patch b/meta/recipes-devtools/gcc/gcc/0038-arc-Update-64bit-move=
-split-patterns.patch<br>
new file mode 100644<br>
index 0000000000..37fe95d711<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gcc/0038-arc-Update-64bit-move-split-patte=
rns.patch<br>
@@ -0,0 +1,290 @@<br>
+From 0061fabeb9393c362601486105202cfe837a5a68 Mon Sep 17 00:00:00 2001<br=
>
+From: Claudiu Zissulescu &lt;<a href=3D"mailto:claziss@synopsys.com" targ=
et=3D"_blank">claziss@synopsys.com</a>&gt;<br>
+Date: Wed, 9 Jun 2021 12:12:57 +0300<br>
+Subject: [PATCH] arc: Update 64bit move split patterns.<br>
+<br>
+ARCv2HS can use a limited number of instructions to implement 64bit<br>
+moves. The VADD2 is used as a 64bit move, the LDD/STD are 64 bit loads<br=
>
+and stores. All those instructions are not baseline, hence we need to<br>
+provide alternatives when they are not available or cannot be generate<br=
>
+due to instruction restriction.<br>
+<br>
+This patch is cleaning up those move patterns, and updates splits<br>
+instruction lengths.<br>
+<br>
+This is a backport from mainline gcc.<br>
+<br>
+gcc/<br>
+2021-06-09=C2=A0 Claudiu Zissulescu=C2=A0 &lt;<a href=3D"mailto:claziss@s=
ynopsys.com" target=3D"_blank">claziss@synopsys.com</a>&gt;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/arc/arc-protos.h (arc_split_move_p): =
New prototype.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/arc/arc.c (arc_split_move_p): New fun=
ction.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(arc_split_move): Clean up.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/arc/arc.md (movdi_insn): Clean up, us=
e arc_split_move_p.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(movdf_insn): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/arc/simdext.md (mov&lt;VWH&gt;_insn):=
 Likewise.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://gcc.gnu.org/git/?p=3Dgcc.gi=
t;a=3Dcommit;h=3D0061fabeb9393c362601486105202cfe837a5a68" rel=3D"noreferre=
r" target=3D"_blank">https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D00=
61fabeb9393c362601486105202cfe837a5a68</a>]<br>
+<br>
+Signed-off-by: Claudiu Zissulescu &lt;<a href=3D"mailto:claziss@synopsys.=
com" target=3D"_blank">claziss@synopsys.com</a>&gt;<br>
+(cherry picked from commit c0ba7a8af5366c37241f20e8be41e362f7260389)<br>
+Signed-off-by: Alexey Brodkin &lt;<a href=3D"mailto:abrodkin@synopsys.com=
" target=3D"_blank">abrodkin@synopsys.com</a>&gt;<br>
+---<br>
+ gcc/config/arc/arc-protos.h |=C2=A0 1 +<br>
+ gcc/config/arc/arc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 44 ++++++++++++-------=
---<br>
+ gcc/config/arc/arc.md=C2=A0 =C2=A0 =C2=A0 =C2=A0| 91 +++++++++----------=
--------------------------<br>
+ gcc/config/arc/simdext.md=C2=A0 =C2=A0| 38 ++++---------------<br>
+ 4 files changed, 52 insertions(+), 122 deletions(-)<br>
+<br>
+diff --git a/gcc/config/arc/arc-protos.h b/gcc/config/arc/arc-protos.h<br=
>
+index 1f56a0d82e4..62d7e45d29d 100644<br>
+--- a/gcc/config/arc/arc-protos.h<br>
++++ b/gcc/config/arc/arc-protos.h<br>
+@@ -50,6 +50,7 @@ extern void arc_split_ior (rtx *);<br>
+ extern bool arc_check_mov_const (HOST_WIDE_INT );<br>
+ extern bool arc_split_mov_const (rtx *);<br>
+ extern bool arc_can_use_return_insn (void);<br>
++extern bool arc_split_move_p (rtx *);<br>
+ #endif /* RTX_CODE */<br>
+ <br>
+ extern bool arc_ccfsm_branch_deleted_p (void);<br>
+diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c<br>
+index 3201c3fefd7..db541bc11f5 100644<br>
+--- a/gcc/config/arc/arc.c<br>
++++ b/gcc/config/arc/arc.c<br>
+@@ -10129,6 +10129,31 @@ arc_process_double_reg_moves (rtx *operands)<br>
+=C2=A0 =C2=A0return true;<br>
+ }<br>
+ <br>
++<br>
++/* Check if we need to split a 64bit move.=C2=A0 We do not need to split=
 it if we can<br>
++=C2=A0 =C2=A0use vadd2 or ldd/std instructions.=C2=A0 */<br>
++<br>
++bool<br>
++arc_split_move_p (rtx *operands)<br>
++{<br>
++=C2=A0 machine_mode mode =3D GET_MODE (operands[0]);<br>
++<br>
++=C2=A0 if (TARGET_LL64<br>
++=C2=A0 =C2=A0 =C2=A0 &amp;&amp; ((memory_operand (operands[0], mode)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; (even_register_operand (ope=
rands[1], mode)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| satisfies_constraint_=
Cm3 (operands[1])))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 || (memory_operand (operands[1], mode)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; even_register_opera=
nd (operands[0], mode))))<br>
++=C2=A0 =C2=A0 return false;<br>
++<br>
++=C2=A0 if (TARGET_PLUS_QMACW<br>
++=C2=A0 =C2=A0 =C2=A0 &amp;&amp; even_register_operand (operands[0], mode=
)<br>
++=C2=A0 =C2=A0 =C2=A0 &amp;&amp; even_register_operand (operands[1], mode=
))<br>
++=C2=A0 =C2=A0 return false;<br>
++<br>
++=C2=A0 return true;<br>
++}<br>
++<br>
+ /* operands 0..1 are the operands of a 64 bit move instruction.<br>
+=C2=A0 =C2=A0 split it into two moves with operands 2/3 and 4/5.=C2=A0 */=
<br>
+ <br>
+@@ -10146,25 +10171,6 @@ arc_split_move (rtx *operands)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 if (TARGET_LL64<br>
+-=C2=A0 =C2=A0 =C2=A0 &amp;&amp; ((memory_operand (operands[0], mode)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; (even_register_operand (ope=
rands[1], mode)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| satisfies_constraint_=
Cm3 (operands[1])))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 || (memory_operand (operands[1], mode)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; even_register_opera=
nd (operands[0], mode))))<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 emit_move_insn (operands[0], operands[1]);<br>
+-=C2=A0 =C2=A0 =C2=A0 return;<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 if (TARGET_PLUS_QMACW<br>
+-=C2=A0 =C2=A0 =C2=A0 &amp;&amp; even_register_operand (operands[0], mode=
)<br>
+-=C2=A0 =C2=A0 =C2=A0 &amp;&amp; even_register_operand (operands[1], mode=
))<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 emit_move_insn (operands[0], operands[1]);<br>
+-=C2=A0 =C2=A0 =C2=A0 return;<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+=C2=A0 =C2=A0if (TARGET_PLUS_QMACW<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; GET_CODE (operands[1]) =3D=3D CONST=
_VECTOR)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md<br>
+index 7a52551eef5..91a838a38e4 100644<br>
+--- a/gcc/config/arc/arc.md<br>
++++ b/gcc/config/arc/arc.md<br>
+@@ -1329,47 +1329,20 @@ core_3, archs4x, archs4xd, archs4xd_slow&quot;<br=
>
+=C2=A0 =C2=A0&quot;register_operand (operands[0], DImode)<br>
+=C2=A0 =C2=A0 || register_operand (operands[1], DImode)<br>
+=C2=A0 =C2=A0 || (satisfies_constraint_Cm3 (operands[1])<br>
+-=C2=A0 =C2=A0 =C2=A0 &amp;&amp; memory_operand (operands[0], DImode))&qu=
ot;<br>
+-=C2=A0 &quot;*<br>
+-{<br>
+-=C2=A0 switch (which_alternative)<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 default:<br>
+-=C2=A0 =C2=A0 =C2=A0 return \&quot;#\&quot;;<br>
+-<br>
+-=C2=A0 =C2=A0 case 0:<br>
+-=C2=A0 =C2=A0 if (TARGET_PLUS_QMACW<br>
+-=C2=A0 =C2=A0 =C2=A0 &amp;&amp; even_register_operand (operands[0], DImo=
de)<br>
+-=C2=A0 =C2=A0 =C2=A0 &amp;&amp; even_register_operand (operands[1], DImo=
de))<br>
+-=C2=A0 =C2=A0 =C2=A0 return \&quot;vadd2%?\\t%0,%1,0\&quot;;<br>
+-=C2=A0 =C2=A0 return \&quot;#\&quot;;<br>
+-<br>
+-=C2=A0 =C2=A0 case 2:<br>
+-=C2=A0 =C2=A0 if (TARGET_LL64<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; memory_operand (operands[1], DImo=
de)<br>
+-=C2=A0 =C2=A0 =C2=A0 &amp;&amp; even_register_operand (operands[0], DImo=
de))<br>
+-=C2=A0 =C2=A0 =C2=A0 return \&quot;ldd%U1%V1 %0,%1%&amp;\&quot;;<br>
+-=C2=A0 =C2=A0 return \&quot;#\&quot;;<br>
+-<br>
+-=C2=A0 =C2=A0 case 3:<br>
+-=C2=A0 =C2=A0 if (TARGET_LL64<br>
+-=C2=A0 =C2=A0 =C2=A0 &amp;&amp; memory_operand (operands[0], DImode)<br>
+-=C2=A0 =C2=A0 =C2=A0 &amp;&amp; (even_register_operand (operands[1], DIm=
ode)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || satisfies_constraint_Cm3 (operands=
[1])))<br>
+-=C2=A0 =C2=A0 =C2=A0return \&quot;std%U0%V0 %1,%0\&quot;;<br>
+-=C2=A0 =C2=A0 return \&quot;#\&quot;;<br>
+-=C2=A0 =C2=A0 }<br>
+-}&quot;<br>
+-=C2=A0 &quot;&amp;&amp; reload_completed&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; memory_operand (operands[0], DImod=
e))&quot;<br>
++=C2=A0 &quot;@<br>
++=C2=A0 =C2=A0vadd2\\t%0,%1,0<br>
++=C2=A0 =C2=A0#<br>
++=C2=A0 =C2=A0ldd%U1%V1\\t%0,%1<br>
++=C2=A0 =C2=A0std%U0%V0\\t%1,%0&quot;<br>
++=C2=A0 &quot;&amp;&amp; reload_completed &amp;&amp; arc_split_move_p (op=
erands)&quot;<br>
+=C2=A0 =C2=A0[(const_int 0)]<br>
+=C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 arc_split_move (operands);<br>
+=C2=A0 =C2=A0 DONE;<br>
+=C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0[(set_attr &quot;type&quot; &quot;move,move,load,store&quot;=
)<br>
+-=C2=A0 =C2=A0;; ??? The ld/st values could be 4 if it&#39;s [reg,bignum]=
.<br>
+-=C2=A0 =C2=A0(set_attr &quot;length&quot; &quot;8,16,*,*&quot;)])<br>
+-<br>
++=C2=A0 =C2=A0(set_attr &quot;length&quot; &quot;8,16,16,16&quot;)])<br>
+ <br>
+ ;; Floating point move insns.<br>
+ <br>
+@@ -1408,50 +1381,22 @@ core_3, archs4x, archs4xd, archs4xd_slow&quot;<br=
>
+ (define_insn_and_split &quot;*movdf_insn&quot;<br>
+=C2=A0 =C2=A0[(set (match_operand:DF 0 &quot;move_dest_operand&quot;=C2=
=A0 =C2=A0 =C2=A0 &quot;=3DD,r,r,r,r,m&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(match_operand:DF 1 &quot;move_double_src_oper=
and&quot; &quot;r,D,r,E,m,r&quot;))]<br>
+-=C2=A0 &quot;register_operand (operands[0], DFmode)<br>
+-=C2=A0 =C2=A0|| register_operand (operands[1], DFmode)&quot;<br>
+-=C2=A0 &quot;*<br>
+-{<br>
+- switch (which_alternative)<br>
+-=C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 default:<br>
+-=C2=A0 =C2=A0 =C2=A0 return \&quot;#\&quot;;<br>
+-<br>
+-=C2=A0 =C2=A0 case 2:<br>
+-=C2=A0 =C2=A0 if (TARGET_PLUS_QMACW<br>
+-=C2=A0 =C2=A0 =C2=A0 &amp;&amp; even_register_operand (operands[0], DFmo=
de)<br>
+-=C2=A0 =C2=A0 =C2=A0 &amp;&amp; even_register_operand (operands[1], DFmo=
de))<br>
+-=C2=A0 =C2=A0 =C2=A0 return \&quot;vadd2%?\\t%0,%1,0\&quot;;<br>
+-=C2=A0 =C2=A0 return \&quot;#\&quot;;<br>
+-<br>
+-=C2=A0 =C2=A0 case 4:<br>
+-=C2=A0 =C2=A0 if (TARGET_LL64<br>
+-=C2=A0 =C2=A0 =C2=A0 &amp;&amp; ((even_register_operand (operands[0], DF=
mode)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; memory_operand (oper=
ands[1], DFmode))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (memory_operand (operands[0], DFmo=
de)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; even_registe=
r_operand (operands[1], DFmode))))<br>
+-=C2=A0 =C2=A0 =C2=A0 return \&quot;ldd%U1%V1 %0,%1%&amp;\&quot;;<br>
+-=C2=A0 =C2=A0 return \&quot;#\&quot;;<br>
+-<br>
+-=C2=A0 =C2=A0 case 5:<br>
+-=C2=A0 =C2=A0 if (TARGET_LL64<br>
+-=C2=A0 =C2=A0 =C2=A0 &amp;&amp; ((even_register_operand (operands[0], DF=
mode)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; memory_operand (oper=
ands[1], DFmode))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (memory_operand (operands[0], DFmo=
de)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; even_registe=
r_operand (operands[1], DFmode))))<br>
+-=C2=A0 =C2=A0 =C2=A0return \&quot;std%U0%V0 %1,%0\&quot;;<br>
+-=C2=A0 =C2=A0 return \&quot;#\&quot;;<br>
+-=C2=A0 =C2=A0}<br>
+-}&quot;<br>
+-=C2=A0 &quot;reload_completed&quot;<br>
++=C2=A0 &quot;(register_operand (operands[0], DFmode)<br>
++=C2=A0 =C2=A0 || register_operand (operands[1], DFmode))&quot;<br>
++=C2=A0 &quot;@<br>
++=C2=A0 =C2=A0#<br>
++=C2=A0 =C2=A0#<br>
++=C2=A0 =C2=A0vadd2\\t%0,%1,0<br>
++=C2=A0 =C2=A0#<br>
++=C2=A0 =C2=A0ldd%U1%V1\\t%0,%1<br>
++=C2=A0 =C2=A0std%U0%V0\\t%1,%0&quot;<br>
++=C2=A0 &quot;&amp;&amp; reload_completed &amp;&amp; arc_split_move_p (op=
erands)&quot;<br>
+=C2=A0 =C2=A0[(const_int 0)]<br>
+=C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 arc_split_move (operands);<br>
+=C2=A0 =C2=A0 DONE;<br>
+=C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0[(set_attr &quot;type&quot; &quot;move,move,move,move,load,s=
tore&quot;)<br>
+-=C2=A0 =C2=A0(set_attr &quot;predicable&quot; &quot;no,no,no,yes,no,no&q=
uot;)<br>
+-=C2=A0 =C2=A0;; ??? The ld/st values could be 16 if it&#39;s [reg,bignum=
].<br>
+=C2=A0 =C2=A0 (set_attr &quot;length&quot; &quot;4,16,8,16,16,16&quot;)])=
<br>
+ <br>
+ (define_insn_and_split &quot;*movdf_insn_nolrsr&quot;<br>
+diff --git a/gcc/config/arc/simdext.md b/gcc/config/arc/simdext.md<br>
+index f0900757452..36f41a5c3d0 100644<br>
+--- a/gcc/config/arc/simdext.md<br>
++++ b/gcc/config/arc/simdext.md<br>
+@@ -1402,41 +1402,19 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(match_operand:VWH 1 &quot;general_operand&quo=
t;=C2=A0 =C2=A0 &quot;i,r,m,r&quot;))]<br>
+=C2=A0 =C2=A0&quot;(register_operand (operands[0], &lt;MODE&gt;mode)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 || register_operand (operands[1], &lt;MODE&gt=
;mode))&quot;<br>
+-=C2=A0 &quot;*<br>
+-{<br>
+-=C2=A0 switch (which_alternative)<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0default:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0return \&quot;#\&quot;;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0case 1:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TARGET_PLUS_QMACW<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; even_register_operan=
d (operands[0], &lt;MODE&gt;mode)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; even_register_operand (oper=
ands[1], &lt;MODE&gt;mode))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return \&quot;vadd2%?\\t%0,%1,0\&quot;=
;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0return \&quot;#\&quot;;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0case 2:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TARGET_LL64)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return \&quot;ldd%U1%V1 %0,%1\&quot;;<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0return \&quot;#\&quot;;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0case 3:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TARGET_LL64)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return \&quot;std%U0%V0 %1,%0\&quot;;<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0return \&quot;#\&quot;;<br>
+-=C2=A0 =C2=A0 }<br>
+-}&quot;<br>
+-=C2=A0 &quot;reload_completed&quot;<br>
++=C2=A0 &quot;@<br>
++=C2=A0 =C2=A0#<br>
++=C2=A0 =C2=A0vadd2\\t%0,%1,0<br>
++=C2=A0 =C2=A0ldd%U1%V1\\t%0,%1<br>
++=C2=A0 =C2=A0std%U0%V0\\t%1,%0&quot;<br>
++=C2=A0 &quot;&amp;&amp; reload_completed &amp;&amp; arc_split_move_p (op=
erands)&quot;<br>
+=C2=A0 =C2=A0[(const_int 0)]<br>
+=C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 arc_split_move (operands);<br>
+=C2=A0 =C2=A0 DONE;<br>
+=C2=A0 =C2=A0}<br>
+-=C2=A0 [(set_attr &quot;type&quot; &quot;move,multi,load,store&quot;)<br=
>
+-=C2=A0 =C2=A0(set_attr &quot;predicable&quot; &quot;no,no,no,no&quot;)<b=
r>
+-=C2=A0 =C2=A0(set_attr &quot;iscompact&quot;=C2=A0 &quot;false,false,fal=
se,false&quot;)<br>
+-=C2=A0 =C2=A0])<br>
++=C2=A0 [(set_attr &quot;type&quot; &quot;move,move,load,store&quot;)<br>
++=C2=A0 =C2=A0(set_attr &quot;length&quot; &quot;16,8,16,16&quot;)])<br>
+ <br>
+ (define_expand &quot;movmisalign&lt;mode&gt;&quot;<br>
+=C2=A0 [(set (match_operand:VWH 0 &quot;general_operand&quot; &quot;&quot=
;)<br>
+-- <br>
+2.16.2<br>
+<br>
diff --git a/meta/recipes-devtools/gcc/gcc/0039-arc-Fix-u-maddhisi-pattern=
s.patch b/meta/recipes-devtools/gcc/gcc/0039-arc-Fix-u-maddhisi-patterns.pa=
tch<br>
new file mode 100644<br>
index 0000000000..9c5a2b8b33<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gcc/0039-arc-Fix-u-maddhisi-patterns.patch=
<br>
@@ -0,0 +1,127 @@<br>
+From 4186b7e93be73f8d68dc0fcc00a4cc8cc83e99a8 Mon Sep 17 00:00:00 2001<br=
>
+From: Claudiu Zissulescu &lt;<a href=3D"mailto:claziss@synopsys.com" targ=
et=3D"_blank">claziss@synopsys.com</a>&gt;<br>
+Date: Wed, 9 Jun 2021 12:12:57 +0300<br>
+Subject: [PATCH] arc: Fix (u)maddhisi patterns<br>
+<br>
+Rework the (u)maddhisi4 patterns and use VMAC2H(U) instruction instead<br=
>
+of the 64bit MAC(U) instruction.<br>
+This fixes the next execute.exp failures:<br>
+=C2=A0 =C2=A0 =C2=A0arith-rand-ll.c=C2=A0 =C2=A0-O2=C2=A0 execution test<=
br>
+=C2=A0 =C2=A0 =C2=A0arith-rand-ll.c=C2=A0 =C2=A0-O3=C2=A0 execution test<=
br>
+=C2=A0 =C2=A0 =C2=A0pr78726.c=C2=A0 =C2=A0-O2=C2=A0 execution test<br>
+=C2=A0 =C2=A0 =C2=A0pr78726.c=C2=A0 =C2=A0-O3=C2=A0 execution test<br>
+<br>
+gcc/<br>
+2021-06-09=C2=A0 Claudiu Zissulescu=C2=A0 &lt;<a href=3D"mailto:claziss@s=
ynopsys.com" target=3D"_blank">claziss@synopsys.com</a>&gt;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/arc/arc.md (maddhisi4): Use VMAC2H in=
struction.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(machi): New pattern.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(umaddhisi4): Use VMAC2HU instruction.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(umachi): New pattern.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://gcc.gnu.org/git/?p=3Dgcc.gi=
t;a=3Dcommit;h=3D4186b7e93be73f8d68dc0fcc00a4cc8cc83e99a8" rel=3D"noreferre=
r" target=3D"_blank">https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D41=
86b7e93be73f8d68dc0fcc00a4cc8cc83e99a8</a>]<br>
+<br>
+Signed-off-by: Claudiu Zissulescu &lt;<a href=3D"mailto:claziss@synopsys.=
com" target=3D"_blank">claziss@synopsys.com</a>&gt;<br>
+(cherry picked from commit dd4778a59b4693777c732075021375e19eee6a76)<br>
+Signed-off-by: Alexey Brodkin &lt;<a href=3D"mailto:abrodkin@synopsys.com=
" target=3D"_blank">abrodkin@synopsys.com</a>&gt;<br>
+---<br>
+ gcc/config/arc/arc.md | 66 ++++++++++++++++++++++++++++++++-------------=
------<br>
+ 1 file changed, 41 insertions(+), 25 deletions(-)<br>
+<br>
+diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md<br>
+index 91a838a38e4..2a7e087ff72 100644<br>
+--- a/gcc/config/arc/arc.md<br>
++++ b/gcc/config/arc/arc.md<br>
+@@ -6053,48 +6053,64 @@ core_3, archs4x, archs4xd, archs4xd_slow&quot;<br=
>
+ <br>
+ ;; MAC and DMPY instructions<br>
+ <br>
+-; Use MAC instruction to emulate 16bit mac.<br>
++; Use VMAC2H(U) instruction to emulate scalar 16bit mac.<br>
+ (define_expand &quot;maddhisi4&quot;<br>
+=C2=A0 =C2=A0[(match_operand:SI 0 &quot;register_operand&quot; &quot;&quo=
t;)<br>
+=C2=A0 =C2=A0 (match_operand:HI 1 &quot;register_operand&quot; &quot;&quo=
t;)<br>
+=C2=A0 =C2=A0 (match_operand:HI 2 &quot;extend_operand&quot;=C2=A0 =C2=A0=
&quot;&quot;)<br>
+=C2=A0 =C2=A0 (match_operand:SI 3 &quot;register_operand&quot; &quot;&quo=
t;)]<br>
+-=C2=A0 &quot;TARGET_PLUS_DMPY&quot;<br>
++=C2=A0 &quot;TARGET_PLUS_MACD&quot;<br>
+=C2=A0 =C2=A0&quot;{<br>
+-=C2=A0 =C2=A0rtx acc_reg =3D gen_rtx_REG (DImode, ACC_REG_FIRST);<br>
+-=C2=A0 =C2=A0rtx tmp1 =3D gen_reg_rtx (SImode);<br>
+-=C2=A0 =C2=A0rtx tmp2 =3D gen_reg_rtx (SImode);<br>
+-=C2=A0 =C2=A0rtx accl =3D gen_lowpart (SImode, acc_reg);<br>
+-<br>
+-=C2=A0 =C2=A0emit_move_insn (accl, operands[3]);<br>
+-=C2=A0 =C2=A0emit_insn (gen_rtx_SET (tmp1, gen_rtx_SIGN_EXTEND (SImode, =
operands[1])));<br>
+-=C2=A0 =C2=A0emit_insn (gen_rtx_SET (tmp2, gen_rtx_SIGN_EXTEND (SImode, =
operands[2])));<br>
+-=C2=A0 =C2=A0emit_insn (gen_mac (tmp1, tmp2));<br>
+-=C2=A0 =C2=A0emit_move_insn (operands[0], accl);<br>
++=C2=A0 =C2=A0rtx acc_reg =3D gen_rtx_REG (SImode, ACC_REG_FIRST);<br>
++<br>
++=C2=A0 =C2=A0emit_move_insn (acc_reg, operands[3]);<br>
++=C2=A0 =C2=A0emit_insn (gen_machi (operands[1], operands[2]));<br>
++=C2=A0 =C2=A0emit_move_insn (operands[0], acc_reg);<br>
+=C2=A0 =C2=A0 DONE;<br>
+=C2=A0 =C2=A0}&quot;)<br>
+ <br>
+-; The same for the unsigned variant, but using MACU instruction.<br>
++(define_insn &quot;machi&quot;<br>
++=C2=A0 [(set (reg:SI ARCV2_ACC)<br>
++=C2=A0 =C2=A0 =C2=A0 (plus:SI<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0(mult:SI (sign_extend:SI (match_operand:HI 0 =
&quot;register_operand&quot; &quot;%r&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (sign_extend:SI =
(match_operand:HI 1 &quot;register_operand&quot; &quot;r&quot;)))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0(reg:SI ARCV2_ACC)))]<br>
++=C2=A0 &quot;TARGET_PLUS_MACD&quot;<br>
++=C2=A0 &quot;vmac2h\\t0,%0,%1&quot;<br>
++=C2=A0 [(set_attr &quot;length&quot; &quot;4&quot;)<br>
++=C2=A0 =C2=A0(set_attr &quot;type&quot; &quot;multi&quot;)<br>
++=C2=A0 =C2=A0(set_attr &quot;predicable&quot; &quot;no&quot;)<br>
++=C2=A0 =C2=A0(set_attr &quot;cond&quot; &quot;nocond&quot;)])<br>
++<br>
++; The same for the unsigned variant, but using VMAC2HU instruction.<br>
+ (define_expand &quot;umaddhisi4&quot;<br>
+=C2=A0 =C2=A0[(match_operand:SI 0 &quot;register_operand&quot; &quot;&quo=
t;)<br>
+=C2=A0 =C2=A0 (match_operand:HI 1 &quot;register_operand&quot; &quot;&quo=
t;)<br>
+-=C2=A0 =C2=A0(match_operand:HI 2 &quot;extend_operand&quot;=C2=A0 =C2=A0=
&quot;&quot;)<br>
++=C2=A0 =C2=A0(match_operand:HI 2 &quot;register_operand&quot; &quot;&quo=
t;)<br>
+=C2=A0 =C2=A0 (match_operand:SI 3 &quot;register_operand&quot; &quot;&quo=
t;)]<br>
+-=C2=A0 &quot;TARGET_PLUS_DMPY&quot;<br>
++=C2=A0 &quot;TARGET_PLUS_MACD&quot;<br>
+=C2=A0 =C2=A0&quot;{<br>
+-=C2=A0 =C2=A0rtx acc_reg =3D gen_rtx_REG (DImode, ACC_REG_FIRST);<br>
+-=C2=A0 =C2=A0rtx tmp1 =3D gen_reg_rtx (SImode);<br>
+-=C2=A0 =C2=A0rtx tmp2 =3D gen_reg_rtx (SImode);<br>
+-=C2=A0 =C2=A0rtx accl =3D gen_lowpart (SImode, acc_reg);<br>
+-<br>
+-=C2=A0 =C2=A0emit_move_insn (accl, operands[3]);<br>
+-=C2=A0 =C2=A0emit_insn (gen_rtx_SET (tmp1, gen_rtx_ZERO_EXTEND (SImode, =
operands[1])));<br>
+-=C2=A0 =C2=A0emit_insn (gen_rtx_SET (tmp2, gen_rtx_ZERO_EXTEND (SImode, =
operands[2])));<br>
+-=C2=A0 =C2=A0emit_insn (gen_macu (tmp1, tmp2));<br>
+-=C2=A0 =C2=A0emit_move_insn (operands[0], accl);<br>
++=C2=A0 =C2=A0rtx acc_reg =3D gen_rtx_REG (SImode, ACC_REG_FIRST);<br>
++<br>
++=C2=A0 =C2=A0emit_move_insn (acc_reg, operands[3]);<br>
++=C2=A0 =C2=A0emit_insn (gen_umachi (operands[1], operands[2]));<br>
++=C2=A0 =C2=A0emit_move_insn (operands[0], acc_reg);<br>
+=C2=A0 =C2=A0 DONE;<br>
+=C2=A0 =C2=A0}&quot;)<br>
+ <br>
++(define_insn &quot;umachi&quot;<br>
++=C2=A0 [(set (reg:SI ARCV2_ACC)<br>
++=C2=A0 =C2=A0 =C2=A0 (plus:SI<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0(mult:SI (zero_extend:SI (match_operand:HI 0 =
&quot;register_operand&quot; &quot;%r&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (zero_extend:SI =
(match_operand:HI 1 &quot;register_operand&quot; &quot;r&quot;)))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0(reg:SI ARCV2_ACC)))]<br>
++=C2=A0 &quot;TARGET_PLUS_MACD&quot;<br>
++=C2=A0 &quot;vmac2hu\\t0,%0,%1&quot;<br>
++=C2=A0 [(set_attr &quot;length&quot; &quot;4&quot;)<br>
++=C2=A0 =C2=A0(set_attr &quot;type&quot; &quot;multi&quot;)<br>
++=C2=A0 =C2=A0(set_attr &quot;predicable&quot; &quot;no&quot;)<br>
++=C2=A0 =C2=A0(set_attr &quot;cond&quot; &quot;nocond&quot;)])<br>
++<br>
+ (define_expand &quot;maddsidi4&quot;<br>
+=C2=A0 =C2=A0[(match_operand:DI 0 &quot;register_operand&quot; &quot;&quo=
t;)<br>
+=C2=A0 =C2=A0 (match_operand:SI 1 &quot;register_operand&quot; &quot;&quo=
t;)<br>
+-- <br>
+2.16.2<br>
+<br>
diff --git a/meta/recipes-devtools/gcc/gcc/0040-arc-Update-doloop_end-patt=
erns.patch b/meta/recipes-devtools/gcc/gcc/0040-arc-Update-doloop_end-patte=
rns.patch<br>
new file mode 100644<br>
index 0000000000..5f0bf8df8f<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gcc/0040-arc-Update-doloop_end-patterns.pa=
tch<br>
@@ -0,0 +1,105 @@<br>
+From 5a9b6a004f89fdd95b0470e1324dc4dee8c41d24 Mon Sep 17 00:00:00 2001<br=
>
+From: Claudiu Zissulescu &lt;<a href=3D"mailto:claziss@synopsys.com" targ=
et=3D"_blank">claziss@synopsys.com</a>&gt;<br>
+Date: Wed, 9 Jun 2021 12:12:57 +0300<br>
+Subject: [PATCH] arc: Update doloop_end patterns<br>
+<br>
+ARC processor can use LP instruction to implement zero overlay loops.<br>
+The current inplementation doesn&#39;t handle the unlikely situation when=
<br>
+the loop iterator is located in memory.=C2=A0 Refurbish the loop_end insn=
<br>
+pattern into a define_insn_and_split pattern.<br>
+<br>
+gcc/<br>
+2021-07-09=C2=A0 Claudiu Zissulescu=C2=A0 &lt;<a href=3D"mailto:claziss@s=
ynopsys.com" target=3D"_blank">claziss@synopsys.com</a>&gt;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/arc/arc.md (loop_end): Change it to<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0define_insn_and_split.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://gcc.gnu.org/git/?p=3Dgcc.gi=
t;a=3Dcommit;h=3D5a9b6a004f89fdd95b0470e1324dc4dee8c41d24" rel=3D"noreferre=
r" target=3D"_blank">https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D5a=
9b6a004f89fdd95b0470e1324dc4dee8c41d24</a>]<br>
+<br>
+Signed-off-by: Claudiu Zissulescu &lt;<a href=3D"mailto:claziss@synopsys.=
com" target=3D"_blank">claziss@synopsys.com</a>&gt;<br>
+(cherry picked from commit 174e75a210753b68de0f2c398a13ace0f512e35b)<br>
+Signed-off-by: Alexey Brodkin &lt;<a href=3D"mailto:abrodkin@synopsys.com=
" target=3D"_blank">abrodkin@synopsys.com</a>&gt;<br>
+---<br>
+ gcc/config/arc/arc.md | 46 ++++++++++++++++++++-------------------------=
-<br>
+ 1 file changed, 20 insertions(+), 26 deletions(-)<br>
+<br>
+diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md<br>
+index 2a7e087ff72..d704044c13f 100644<br>
+--- a/gcc/config/arc/arc.md<br>
++++ b/gcc/config/arc/arc.md<br>
+@@ -4986,7 +4986,7 @@ core_3, archs4x, archs4xd, archs4xd_slow&quot;<br>
+ (define_expand &quot;doloop_end&quot;<br>
+=C2=A0 =C2=A0[(parallel [(set (pc)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (if_then_e=
lse<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (ne (matc=
h_operand 0 &quot;&quot; &quot;&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (ne (matc=
h_operand 0 &quot;nonimmediate_operand&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0(const_int 1))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(lab=
el_ref (match_operand 1 &quot;&quot; &quot;&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(pc)=
))<br>
+@@ -5012,44 +5012,38 @@ core_3, archs4x, archs4xd, archs4xd_slow&quot;<br=
>
+ <br>
+ ;; if by any chance the lp_count is not used, then use an &#39;r&#39;<br=
>
+ ;; register, instead of going to memory.<br>
+-(define_insn &quot;loop_end&quot;<br>
+-=C2=A0 [(set (pc)<br>
+-=C2=A0 =C2=A0 =C2=A0 (if_then_else (ne (match_operand:SI 2 &quot;nonimme=
diate_operand&quot; &quot;0,m&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (const_int 1))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (l=
abel_ref (match_operand 1 &quot;&quot; &quot;&quot;))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (p=
c)))<br>
+-=C2=A0 =C2=A0(set (match_operand:SI 0 &quot;nonimmediate_operand&quot; &=
quot;=3Dr,m&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 (plus (match_dup 2) (const_int -1)))<br>
+-=C2=A0 =C2=A0(unspec [(const_int 0)] UNSPEC_ARC_LP)<br>
+-=C2=A0 =C2=A0(clobber (match_scratch:SI 3 &quot;=3DX,&amp;r&quot;))]<br>
+-=C2=A0 &quot;&quot;<br>
+-=C2=A0 &quot;; ZOL_END, begins @%l1&quot;<br>
+-=C2=A0 [(set_attr &quot;length&quot; &quot;0&quot;)<br>
+-=C2=A0 =C2=A0(set_attr &quot;predicable&quot; &quot;no&quot;)<br>
+-=C2=A0 =C2=A0(set_attr &quot;type&quot; &quot;loop_end&quot;)])<br>
+-<br>
+ ;; split pattern for the very slim chance when the loop register is<br>
+ ;; memory.<br>
+-(define_split<br>
++(define_insn_and_split &quot;loop_end&quot;<br>
+=C2=A0 =C2=A0[(set (pc)<br>
+-=C2=A0 =C2=A0 =C2=A0 (if_then_else (ne (match_operand:SI 0 &quot;memory_=
operand&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 (if_then_else (ne (match_operand:SI 0 &quot;nonimme=
diate_operand&quot; &quot;+r,!m&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0(const_int 1))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (l=
abel_ref (match_operand 1 &quot;&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (l=
abel_ref (match_operand 1 &quot;&quot; &quot;&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0(pc)))<br>
+=C2=A0 =C2=A0 (set (match_dup 0) (plus (match_dup 0) (const_int -1)))<br>
+=C2=A0 =C2=A0 (unspec [(const_int 0)] UNSPEC_ARC_LP)<br>
+-=C2=A0 =C2=A0(clobber (match_scratch:SI 2))]<br>
+-=C2=A0 &quot;memory_operand (operands[0], SImode)&quot;<br>
++=C2=A0 =C2=A0(clobber (match_scratch:SI 2 &quot;=3DX,&amp;r&quot;))]<br>
++=C2=A0 &quot;&quot;<br>
++=C2=A0 &quot;@<br>
++=C2=A0 =C2=A0; ZOL_END, begins @%l1<br>
++=C2=A0 =C2=A0#&quot;<br>
++=C2=A0 &quot;reload_completed &amp;&amp; memory_operand (operands[0], Pm=
ode)&quot;<br>
+=C2=A0 =C2=A0[(set (match_dup 2) (match_dup 0))<br>
+-=C2=A0 =C2=A0(set (match_dup 2) (plus:SI (match_dup 2) (const_int -1)))<=
br>
++=C2=A0 =C2=A0(parallel<br>
++=C2=A0 =C2=A0 [(set (reg:CC_ZN CC_REG)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 (compare:CC_ZN (plus:SI (match_dup 2) (const=
_int -1))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0(const_int 0)))<br>
++=C2=A0 =C2=A0 =C2=A0(set (match_dup 2) (plus:SI (match_dup 2) (const_int=
 -1)))])<br>
+=C2=A0 =C2=A0 (set (match_dup 0) (match_dup 2))<br>
+-=C2=A0 =C2=A0(set (reg:CC CC_REG) (compare:CC (match_dup 2) (const_int 0=
)))<br>
+=C2=A0 =C2=A0 (set (pc)<br>
+-=C2=A0 =C2=A0 =C2=A0 (if_then_else (ne (reg:CC CC_REG)<br>
++=C2=A0 =C2=A0 =C2=A0 (if_then_else (ne (reg:CC_ZN CC_REG)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0(const_int 0))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0(label_ref (match_dup 1))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0(pc)))]<br>
+-=C2=A0 &quot;&quot;)<br>
++=C2=A0 &quot;&quot;<br>
++=C2=A0 [(set_attr &quot;length&quot; &quot;0,24&quot;)<br>
++=C2=A0 =C2=A0(set_attr &quot;predicable&quot; &quot;no&quot;)<br>
++=C2=A0 =C2=A0(set_attr &quot;type&quot; &quot;loop_end&quot;)])<br>
+ <br>
+ (define_insn &quot;loop_fail&quot;<br>
+=C2=A0 =C2=A0[(set (reg:SI LP_COUNT)<br>
+-- <br>
+2.16.2<br>
+<br>
-- <br>
2.16.2<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000f8404705c485182b--
