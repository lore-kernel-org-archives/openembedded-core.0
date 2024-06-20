Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F7BC27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 15:07:21 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.49899.1718896036472464304
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 08:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FfzpoKmM;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-25982aa59efso515294fac.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 08:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718896036; x=1719500836; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xETW2RMNxfJt1sgtCQmt+H8cD0b4kwFMp4FcEPSd/8s=;
        b=FfzpoKmMiJYGrV0k+Zcz4w22L40/jpDaWbodYKgQ6EEE77Ox7js8droWNZW1BIQDR8
         4dKtEeOtg3ClhTPsh9VXhSW8qhlzB7VJeAr0VD88AE48wOF4o8bD8RJlpA7iiKS482dV
         rp9s99sqYmvkrxxi3vKokrXSEmzMh5x8E3nA6/L924dzmXMF66CJsVqq4kPzaNmPdxuP
         CGwW+uqBRpC8gwdQ6mP2kOreouhrLRGUn6nNU4/5k7kzaEWqlaD6/YwswPfcE9ceT3+w
         T9159jHsbuXuMw0uqsWkeSAC6HcAkVaSM8JoLBM49smSoLS6sq5nIUKnvW/+ZZVi/fK3
         K08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718896036; x=1719500836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xETW2RMNxfJt1sgtCQmt+H8cD0b4kwFMp4FcEPSd/8s=;
        b=pg4EJx6ly5pmWl9aP2Gcbn2BMrD0UlFxmLWj5oNa0sCk/nPNHcziI2mcTzDuynPm5L
         CZGESWaPM9t73fez3CSZ+/Z+hlhpxFlmzKLtRvKpvibSMQgpbYPl1tpq+4Uld4isT4qQ
         RVeii+cMrSToYRvJKqpSR6w/fZt72ouYbh0YCi70E1eIj5UDJ32cgtJY1laEGgzZ6w6D
         fl3tXqrGZROZtSQpASGxSKXLS72m2R2a3czpXtjNlLvoYQ7MiwtFqugRpP22wfCZf3eY
         9oHVbT2k7LS0pZqx4DyVozcqsWtO9t7pvFUC4RCNQQGsX3j7OnAWSR03MBqiJiFsBiYM
         zwZA==
X-Gm-Message-State: AOJu0YyMJprMLC9U3TGphk9zy0fxiIQuNH3hWbyOFz90AurMRoo8tr0p
	kPaqYfNtfOv/rEolKxb4JMKEmucdhhlExq8duDxXhxkzq/yzd4FR+/GowZESC8sHWOKb1tSa0u7
	mzFmW6Jq9cEkKkL4kpXMblE7xB/0nVw==
X-Google-Smtp-Source: AGHT+IHyK8oKjt8cQsmf1kBkLkbOl84EijYIiHtzsoFOu0Ml41tmATDS2WFqo9D3KmR3ouPHOVL8086jwnYNunX6UW0=
X-Received: by 2002:a05:6870:c696:b0:25b:e1fa:6720 with SMTP id
 586e51a60fabf-25c94901724mr5939618fac.2.1718896035380; Thu, 20 Jun 2024
 08:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240620062244.3853363-1-sundeep.kokkonda@windriver.com>
In-Reply-To: <20240620062244.3853363-1-sundeep.kokkonda@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Jun 2024 08:06:48 -0700
Message-ID: <CAMKF1soLVxNXeJ0feV03XmnfvR+w60N0i5sxPLFt1HS7VPacOw@mail.gmail.com>
Subject: Re: [PATCH] binutils: stable 2.42 branch updates
To: sundeep.kokkonda@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com, 
	naveen.gowda@windriver.com, shivaprasad.moodalappa@windriver.com, 
	yash.shinde@windriver.com, deepthi.hemraj@windriver.com, 
	harish.sadineni@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 15:07:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200963

lgtm

On Wed, Jun 19, 2024 at 11:23=E2=80=AFPM <sundeep.kokkonda@windriver.com> w=
rote:
>
> From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
>
> Below commits on binutils-2.42 stable branch are updated.
>
> 6c360d37662 PR31898 bug in processing DW_RLE_startx_endx
> bfda03eed33 aarch64: Remove asserts from operand qualifier decoders
>
> Dropped: 0016-aarch64-Remove-asserts-from-operand-qualifier-decode.patch
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> ---
>  .../binutils/binutils-2.42.inc                |   3 +-
>  ...sserts-from-operand-qualifier-decode.patch | 382 ------------------
>  2 files changed, 1 insertion(+), 384 deletions(-)
>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0016-aarch64-=
Remove-asserts-from-operand-qualifier-decode.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/reci=
pes-devtools/binutils/binutils-2.42.inc
> index d4e94d0162..c8f526b5c7 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.42.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
> @@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "binutils-(?P<pver>\d+_(=
\d_?)*)"
>
>  CVE_STATUS[CVE-2023-25584] =3D "cpe-incorrect: Applies only for version =
2.40 and earlier"
>
> -SRCREV ?=3D "73b22b4481e85635eb978585f405c4433bcc0174"
> +SRCREV ?=3D "cbec9028dd3fa9b49e0204f1a989cea67cae32c6"
>  BINUTILS_GIT_URI ?=3D "git://sourceware.org/git/binutils-gdb.git;branch=
=3D${SRCBRANCH};protocol=3Dhttps"
>  SRC_URI =3D "\
>       ${BINUTILS_GIT_URI} \
> @@ -36,6 +36,5 @@ SRC_URI =3D "\
>       file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.pa=
tch \
>       file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.pa=
tch \
>       file://0015-gprofng-change-use-of-bignum-to-bigint.patch \
> -     file://0016-aarch64-Remove-asserts-from-operand-qualifier-decode.pa=
tch \
>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0016-aarch64-Remove-=
asserts-from-operand-qualifier-decode.patch b/meta/recipes-devtools/binutil=
s/binutils/0016-aarch64-Remove-asserts-from-operand-qualifier-decode.patch
> deleted file mode 100644
> index 7b52425a38..0000000000
> --- a/meta/recipes-devtools/binutils/binutils/0016-aarch64-Remove-asserts=
-from-operand-qualifier-decode.patch
> +++ /dev/null
> @@ -1,382 +0,0 @@
> -From 5b1c70bfe0d8f84dc28237d6150b7b9d57c791a8 Mon Sep 17 00:00:00 2001
> -From: Victor Do Nascimento <victor.donascimento@arm.com>
> -Date: Tue, 16 Apr 2024 11:49:15 +0100
> -Subject: [PATCH] aarch64: Remove asserts from operand qualifier decoders
> - [PR31595]
> -
> -Given that the disassembler should never abort when decoding
> -(potentially random) data, assertion statements in the
> -`get_*reg_qualifier_from_value' function family prove problematic.
> -
> -Consider the random 32-bit word W, encoded in a data segment and
> -encountered on execution of `objdump -D <obj_name>'.
> -
> -If:
> -
> -  (W & ~opcode_mask) =3D=3D valid instruction
> -
> -Then before `print_insn_aarch64_word' has a chance to report the
> -instruction as potentially undefined, an attempt will be made to have
> -the qualifiers for the instruction's register operands (if any)
> -decoded.  If the relevant bits do not map onto a valid qualifier for
> -the matched instruction-like word, an abort will be triggered and the
> -execution of objdump aborted.
> -
> -As this scenario is perfectly feasible and, in light of the fact that
> -objdump must successfully decode all sections of a given object file,
> -it is not appropriate to assert in this family of functions.
> -
> -Therefore, we add a new pseudo-qualifier `AARCH64_OPND_QLF_ERR' for
> -handling invalid qualifier-associated values and re-purpose the
> -assertion conditions in qualifier-retrieving functions to be the
> -predicate guarding the returning of the calculated qualifier type.
> -If the predicate fails, we return this new qualifier and allow the
> -caller to handle the error as appropriate.
> -
> -As these functions are called either from within
> -`aarch64_extract_operand' or `do_special_decoding', both of which are
> -expected to return non-zero values, it suffices that callers return
> -zero upon encountering `AARCH64_OPND_QLF_ERR'.
> -
> -Ar present the error presented in the hypothetical scenario has been
> -encountered in `get_sreg_qualifier_from_value', but the change is made
> -to the whole family to keep the interface consistent.
> -
> -Bug: https://sourceware.org/PR31595
> -
> -Upstream-Status: Backport [commit 2601b201e95ea0edab89342ee7137c74e88a8a=
79]
> -
> -Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> ----
> - .../testsuite/binutils-all/aarch64/illegal.d  |  1 +
> - .../testsuite/binutils-all/aarch64/illegal.s  |  3 +
> - include/opcode/aarch64.h                      |  3 +
> - opcodes/aarch64-dis.c                         | 98 +++++++++++++++----
> - 4 files changed, 87 insertions(+), 18 deletions(-)
> -
> -diff --git a/binutils/testsuite/binutils-all/aarch64/illegal.d b/binutil=
s/testsuite/binutils-all/aarch64/illegal.d
> -index 4b90a1d9f39..b69318aec85 100644
> ---- a/binutils/testsuite/binutils-all/aarch64/illegal.d
> -+++ b/binutils/testsuite/binutils-all/aarch64/illegal.d
> -@@ -8,5 +8,6 @@ Disassembly of section \.text:
> -
> - 0+000 <.*>:
> - [     ]+0:[   ]+68ea18cc[     ]+.inst[        ]+0x68ea18cc ; undefined
> -+[     ]+4:[   ]+9dc39839[     ]+.inst[        ]+0x9dc39839 ; undefined
> - #pass
> -
> -diff --git a/binutils/testsuite/binutils-all/aarch64/illegal.s b/binutil=
s/testsuite/binutils-all/aarch64/illegal.s
> -index 216cbe6f265..43668c6db55 100644
> ---- a/binutils/testsuite/binutils-all/aarch64/illegal.s
> -+++ b/binutils/testsuite/binutils-all/aarch64/illegal.s
> -@@ -4,4 +4,7 @@
> -       # ldpsw   x12, x6, [x6],#-8 ; illegal because one of the dest reg=
s is also the address reg
> -       .inst 0x68ea18cc
> -
> -+      # illegal, resembles the opcode `ldapur' with invalid qualifier b=
its
> -+      .inst 0x9dc39839
> -+
> -       # FIXME: Add more illegal instructions here.
> -diff --git a/include/opcode/aarch64.h b/include/opcode/aarch64.h
> -index 2fca9528c20..e8fe93ef127 100644
> ---- a/include/opcode/aarch64.h
> -+++ b/include/opcode/aarch64.h
> -@@ -894,6 +894,9 @@ enum aarch64_opnd_qualifier
> -   /* Special qualifier helping retrieve qualifier information during th=
e
> -      decoding time (currently not in use).  */
> -   AARCH64_OPND_QLF_RETRIEVE,
> -+
> -+  /* Special qualifier used for indicating error in qualifier retrieval=
.  */
> -+  AARCH64_OPND_QLF_ERR,
> - };
> -
> - /* Instruction class.  */
> -diff --git a/opcodes/aarch64-dis.c b/opcodes/aarch64-dis.c
> -index 96f42ae862a..b70e6da9eb7 100644
> ---- a/opcodes/aarch64-dis.c
> -+++ b/opcodes/aarch64-dis.c
> -@@ -219,9 +219,10 @@ static inline enum aarch64_opnd_qualifier
> - get_greg_qualifier_from_value (aarch64_insn value)
> - {
> -   enum aarch64_opnd_qualifier qualifier =3D AARCH64_OPND_QLF_W + value;
> --  assert (value <=3D 0x1
> --        && aarch64_get_qualifier_standard_value (qualifier) =3D=3D valu=
e);
> --  return qualifier;
> -+  if (value <=3D 0x1
> -+      && aarch64_get_qualifier_standard_value (qualifier) =3D=3D value)
> -+    return qualifier;
> -+  return AARCH64_OPND_QLF_ERR;
> - }
> -
> - /* Given VALUE, return qualifier for a vector register.  This does not =
support
> -@@ -237,9 +238,10 @@ get_vreg_qualifier_from_value (aarch64_insn value)
> -   if (qualifier >=3D AARCH64_OPND_QLF_V_2H)
> -     qualifier +=3D 1;
> -
> --  assert (value <=3D 0x8
> --        && aarch64_get_qualifier_standard_value (qualifier) =3D=3D valu=
e);
> --  return qualifier;
> -+  if (value <=3D 0x8
> -+      && aarch64_get_qualifier_standard_value (qualifier) =3D=3D value)
> -+    return qualifier;
> -+  return AARCH64_OPND_QLF_ERR;
> - }
> -
> - /* Given VALUE, return qualifier for an FP or AdvSIMD scalar register. =
 */
> -@@ -248,9 +250,10 @@ get_sreg_qualifier_from_value (aarch64_insn value)
> - {
> -   enum aarch64_opnd_qualifier qualifier =3D AARCH64_OPND_QLF_S_B + valu=
e;
> -
> --  assert (value <=3D 0x4
> --        && aarch64_get_qualifier_standard_value (qualifier) =3D=3D valu=
e);
> --  return qualifier;
> -+  if (value <=3D 0x4
> -+      && aarch64_get_qualifier_standard_value (qualifier) =3D=3D value)
> -+    return qualifier;
> -+  return AARCH64_OPND_QLF_ERR;
> - }
> -
> - /* Given the instruction in *INST which is probably half way through th=
e
> -@@ -263,13 +266,17 @@ get_expected_qualifier (const aarch64_inst *inst, =
int i)
> - {
> -   aarch64_opnd_qualifier_seq_t qualifiers;
> -   /* Should not be called if the qualifier is known.  */
> --  assert (inst->operands[i].qualifier =3D=3D AARCH64_OPND_QLF_NIL);
> --  int invalid_count;
> --  if (aarch64_find_best_match (inst, inst->opcode->qualifiers_list,
> --                             i, qualifiers, &invalid_count))
> --    return qualifiers[i];
> -+  if (inst->operands[i].qualifier =3D=3D AARCH64_OPND_QLF_NIL)
> -+    {
> -+      int invalid_count;
> -+      if (aarch64_find_best_match (inst, inst->opcode->qualifiers_list,
> -+                                 i, qualifiers, &invalid_count))
> -+      return qualifiers[i];
> -+      else
> -+      return AARCH64_OPND_QLF_NIL;
> -+    }
> -   else
> --    return AARCH64_OPND_QLF_NIL;
> -+    return AARCH64_OPND_QLF_ERR;
> - }
> -
> - /* Operand extractors.  */
> -@@ -355,6 +362,8 @@ aarch64_ext_reglane (const aarch64_operand *self, aa=
rch64_opnd_info *info,
> -         aarch64_insn value =3D extract_field (FLD_imm4_11, code, 0);
> -         /* Depend on AARCH64_OPND_Ed to determine the qualifier.  */
> -         info->qualifier =3D get_expected_qualifier (inst, info->idx);
> -+        if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
> -+          return 0;
> -         shift =3D get_logsz (aarch64_get_qualifier_esize (info->qualifi=
er));
> -         info->reglane.index =3D value >> shift;
> -       }
> -@@ -374,6 +383,8 @@ aarch64_ext_reglane (const aarch64_operand *self, aa=
rch64_opnd_info *info,
> -         if (pos > 3)
> -           return false;
> -         info->qualifier =3D get_sreg_qualifier_from_value (pos);
> -+        if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
> -+          return 0;
> -         info->reglane.index =3D (unsigned) (value >> 1);
> -       }
> -     }
> -@@ -381,6 +392,8 @@ aarch64_ext_reglane (const aarch64_operand *self, aa=
rch64_opnd_info *info,
> -     {
> -       /* Need information in other operand(s) to help decoding.  */
> -       info->qualifier =3D get_expected_qualifier (inst, info->idx);
> -+      if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
> -+      return 0;
> -       switch (info->qualifier)
> -       {
> -       case AARCH64_OPND_QLF_S_4B:
> -@@ -405,6 +418,8 @@ aarch64_ext_reglane (const aarch64_operand *self, aa=
rch64_opnd_info *info,
> -
> -       /* Need information in other operand(s) to help decoding.  */
> -       info->qualifier =3D get_expected_qualifier (inst, info->idx);
> -+      if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
> -+      return 0;
> -       switch (info->qualifier)
> -       {
> -       case AARCH64_OPND_QLF_S_H:
> -@@ -644,9 +659,15 @@ aarch64_ext_advsimd_imm_shift (const aarch64_operan=
d *self ATTRIBUTE_UNUSED,
> -        1xxx   1       2D  */
> -       info->qualifier =3D
> -       get_vreg_qualifier_from_value ((pos << 1) | (int) Q);
> -+      if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
> -+      return false;
> -     }
> -   else
> --    info->qualifier =3D get_sreg_qualifier_from_value (pos);
> -+    {
> -+      info->qualifier =3D get_sreg_qualifier_from_value (pos);
> -+      if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
> -+      return 0;
> -+    }
> -
> -   if (info->type =3D=3D AARCH64_OPND_IMM_VLSR)
> -     /* immh   <shift>
> -@@ -773,6 +794,8 @@ aarch64_ext_advsimd_imm_modified (const aarch64_oper=
and *self ATTRIBUTE_UNUSED,
> -
> -   /* cmode */
> -   info->qualifier =3D get_expected_qualifier (inst, info->idx);
> -+  if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
> -+    return 0;
> -   switch (info->qualifier)
> -     {
> -     case AARCH64_OPND_QLF_NIL:
> -@@ -1014,6 +1037,8 @@ aarch64_ext_ft (const aarch64_operand *self ATTRIB=
UTE_UNUSED,
> -       if (value > 0x4)
> -       return false;
> -       info->qualifier =3D get_sreg_qualifier_from_value (value);
> -+      if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
> -+      return 0;
> -     }
> -
> -   return true;
> -@@ -1086,6 +1111,8 @@ aarch64_ext_rcpc3_addr_offset (const aarch64_opera=
nd *self ATTRIBUTE_UNUSED,
> -                              aarch64_operand_error *errors ATTRIBUTE_UN=
USED)
> - {
> -   info->qualifier =3D get_expected_qualifier (inst, info->idx);
> -+  if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
> -+    return 0;
> -
> -   /* Rn */
> -   info->addr.base_regno =3D extract_field (self->fields[0], code, 0);
> -@@ -1105,6 +1132,8 @@ aarch64_ext_addr_offset (const aarch64_operand *se=
lf ATTRIBUTE_UNUSED,
> -                        aarch64_operand_error *errors ATTRIBUTE_UNUSED)
> - {
> -   info->qualifier =3D get_expected_qualifier (inst, info->idx);
> -+  if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
> -+    return 0;
> -
> -   /* Rn */
> -   info->addr.base_regno =3D extract_field (self->fields[0], code, 0);
> -@@ -1154,6 +1183,8 @@ aarch64_ext_addr_regoff (const aarch64_operand *se=
lf ATTRIBUTE_UNUSED,
> -       /* Need information in other operand(s) to help achieve the decod=
ing
> -        from 'S' field.  */
> -       info->qualifier =3D get_expected_qualifier (inst, info->idx);
> -+      if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
> -+      return 0;
> -       /* Get the size of the data element that is accessed, which may b=
e
> -        different from that of the source register size, e.g. in strb/ld=
rb.  */
> -       size =3D aarch64_get_qualifier_esize (info->qualifier);
> -@@ -1172,6 +1203,8 @@ aarch64_ext_addr_simm (const aarch64_operand *self=
, aarch64_opnd_info *info,
> - {
> -   aarch64_insn imm;
> -   info->qualifier =3D get_expected_qualifier (inst, info->idx);
> -+  if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
> -+    return 0;
> -
> -   /* Rn */
> -   info->addr.base_regno =3D extract_field (FLD_Rn, code, 0);
> -@@ -1210,6 +1243,8 @@ aarch64_ext_addr_uimm12 (const aarch64_operand *se=
lf, aarch64_opnd_info *info,
> - {
> -   int shift;
> -   info->qualifier =3D get_expected_qualifier (inst, info->idx);
> -+  if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
> -+    return 0;
> -   shift =3D get_logsz (aarch64_get_qualifier_esize (info->qualifier));
> -   /* Rn */
> -   info->addr.base_regno =3D extract_field (self->fields[0], code, 0);
> -@@ -1228,6 +1263,8 @@ aarch64_ext_addr_simm10 (const aarch64_operand *se=
lf, aarch64_opnd_info *info,
> -   aarch64_insn imm;
> -
> -   info->qualifier =3D get_expected_qualifier (inst, info->idx);
> -+  if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
> -+    return 0;
> -   /* Rn */
> -   info->addr.base_regno =3D extract_field (self->fields[0], code, 0);
> -   /* simm10 */
> -@@ -2467,6 +2504,8 @@ decode_sizeq (aarch64_inst *inst)
> -   if (mask =3D=3D 0x7)
> -     {
> -       inst->operands[idx].qualifier =3D get_vreg_qualifier_from_value (=
value);
> -+      if (inst->operands[idx].qualifier =3D=3D AARCH64_OPND_QLF_ERR)
> -+      return 0;
> -       return 1;
> -     }
> -
> -@@ -2649,6 +2688,8 @@ do_special_decoding (aarch64_inst *inst)
> -       idx =3D select_operand_for_sf_field_coding (inst->opcode);
> -       value =3D extract_field (FLD_sf, inst->value, 0);
> -       inst->operands[idx].qualifier =3D get_greg_qualifier_from_value (=
value);
> -+      if (inst->operands[idx].qualifier =3D=3D AARCH64_OPND_QLF_ERR)
> -+      return 0;
> -       if ((inst->opcode->flags & F_N)
> -         && extract_field (FLD_N, inst->value, 0) !=3D value)
> -       return 0;
> -@@ -2659,6 +2700,8 @@ do_special_decoding (aarch64_inst *inst)
> -       idx =3D select_operand_for_sf_field_coding (inst->opcode);
> -       value =3D extract_field (FLD_lse_sz, inst->value, 0);
> -       inst->operands[idx].qualifier =3D get_greg_qualifier_from_value (=
value);
> -+      if (inst->operands[idx].qualifier =3D=3D AARCH64_OPND_QLF_ERR)
> -+      return 0;
> -     }
> -   /* rcpc3 'size' field.  */
> -   if (inst->opcode->flags & F_RCPC3_SIZE)
> -@@ -2670,12 +2713,18 @@ do_special_decoding (aarch64_inst *inst)
> -       {
> -         if (aarch64_operands[inst->operands[i].type].op_class
> -             =3D=3D AARCH64_OPND_CLASS_INT_REG)
> --          inst->operands[i].qualifier =3D get_greg_qualifier_from_value=
 (value & 1);
> -+          {
> -+            inst->operands[i].qualifier =3D get_greg_qualifier_from_val=
ue (value & 1);
> -+            if (inst->operands[i].qualifier =3D=3D AARCH64_OPND_QLF_ERR=
)
> -+              return 0;
> -+          }
> -         else if (aarch64_operands[inst->operands[i].type].op_class
> -             =3D=3D AARCH64_OPND_CLASS_FP_REG)
> -           {
> -             value +=3D (extract_field (FLD_opc1, inst->value, 0) << 2);
> -             inst->operands[i].qualifier =3D get_sreg_qualifier_from_val=
ue (value);
> -+            if (inst->operands[i].qualifier =3D=3D AARCH64_OPND_QLF_ERR=
)
> -+              return 0;
> -           }
> -       }
> -     }
> -@@ -2709,7 +2758,11 @@ do_special_decoding (aarch64_inst *inst)
> -       /* For most related instruciton, the 'size' field is fully availa=
ble for
> -        operand encoding.  */
> -       if (mask =3D=3D 0x3)
> --      inst->operands[idx].qualifier =3D get_sreg_qualifier_from_value (=
value);
> -+      {
> -+        inst->operands[idx].qualifier =3D get_sreg_qualifier_from_value=
 (value);
> -+        if (inst->operands[idx].qualifier =3D=3D AARCH64_OPND_QLF_ERR)
> -+          return 0;
> -+      }
> -       else
> -       {
> -         get_operand_possible_qualifiers (idx, inst->opcode->qualifiers_=
list,
> -@@ -2744,6 +2797,9 @@ do_special_decoding (aarch64_inst *inst)
> -       Q =3D (unsigned) extract_field (FLD_Q, inst->value, inst->opcode-=
>mask);
> -       inst->operands[0].qualifier =3D
> -       get_vreg_qualifier_from_value ((num << 1) | Q);
> -+      if (inst->operands[0].qualifier =3D=3D AARCH64_OPND_QLF_ERR)
> -+      return 0;
> -+
> -     }
> -
> -   if ((inst->opcode->flags & F_OPD_SIZE) && inst->opcode->iclass =3D=3D=
 sve2_urqvs)
> -@@ -2753,7 +2809,11 @@ do_special_decoding (aarch64_inst *inst)
> -                                      inst->opcode->mask);
> -       inst->operands[0].qualifier
> -       =3D get_vreg_qualifier_from_value (1 + (size << 1));
> -+      if (inst->operands[0].qualifier =3D=3D AARCH64_OPND_QLF_ERR)
> -+      return 0;
> -       inst->operands[2].qualifier =3D get_sreg_qualifier_from_value (si=
ze);
> -+      if (inst->operands[2].qualifier =3D=3D AARCH64_OPND_QLF_ERR)
> -+      return 0;
> -     }
> -
> -   if (inst->opcode->flags & F_GPRSIZE_IN_Q)
> -@@ -2772,6 +2832,8 @@ do_special_decoding (aarch64_inst *inst)
> -       assert (idx =3D=3D 0 || idx =3D=3D 1);
> -       value =3D extract_field (FLD_Q, inst->value, 0);
> -       inst->operands[idx].qualifier =3D get_greg_qualifier_from_value (=
value);
> -+      if (inst->operands[idx].qualifier =3D=3D AARCH64_OPND_QLF_ERR)
> -+      return 0;
> -     }
> -
> -   if (inst->opcode->flags & F_LDS_SIZE)
> ---
> -2.34.1
> -
> --
> 2.43.0
>

