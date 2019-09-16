Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8495C7F383
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 20:28:13 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id k1so394879pls.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 13:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=uqeK3UFi8kFC5HudfKQnNpONs5qljtNDVfKxvKqz2ns=;
	b=Pcb3GwnMS1+JEjZao5gW3iTLV1REPQgJLQE9wy0kdNjD87KNtEc9+H6gvevLPF5VhA
	1XcdAOlgEAg98Za5w5UuJfzI8viYlAZUBQPRm12ifHtC1BkTeTNQCjL0C6i8DhN+Rw8S
	nIjS4NRRCXKQwjtz0x88m79oIPRCJ/SKyLpXwLYOBCEL6FYmvxpoiSNtOsit5M8BKskH
	PSJcfAQC4IWooS92q/UHKInmaZi2/nNX2k4mzilRpSJxko6JAHLrzcTJ/URvGmu241fs
	6Ue3LHRzwcWCWFEZ7nnsXx8V4cVumyEsDzyr5W1JHwKSBtTC8ugHx5KZBO375u2PEB2n
	cZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=uqeK3UFi8kFC5HudfKQnNpONs5qljtNDVfKxvKqz2ns=;
	b=OR1pxiJy5XRx0be6Z7nR3ST1Brn67G7r88jZWs1i71L8fRTgUM2sM6I/jnxrD6oDYe
	nr+s1T1WLsUOT1Y1Ojnqvw7QmqR80w30tP9Z4gLABqFoHVIa1Th0CXRklyFHpIkh+zsi
	00cAeucCJp+2JJ8UST3T1cEuMxREApjVWZ//bltPHK2pUFD4TPkJYviOSQQEUPHpQcCX
	N2rSVwmmq7gjlWq+ldTXUzmCtqReU3npYqfLWdcGXvd085jfLQ4IqqpTsR9vsRSsgpts
	BB2YEVGBXafVAXtZ1u9jPpkFPmX+JaHKKcs+gvEqE0BCGXsds7SRBMgIlIxZaYkxMf+Y
	EPDQ==
X-Gm-Message-State: APjAAAVfWddKBfIkTEFZB6XVEBXOxj87JcMi0FY8mrvyfRBlO5EiWWPk
	m3+N/H+BZkA2TlOunuFqwNIoJIb0SnY=
X-Google-Smtp-Source: APXvYqyK+c0NtSIJPouD6oEBsCYPfgNIaxckzES792jPSBLsO+oLW0q4oK4gOCBzd5qjhvdx+wE30w==
X-Received: by 2002:a17:902:467:: with SMTP id
	94mr1693970ple.208.1568665694093; 
	Mon, 16 Sep 2019 13:28:14 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:ac6a:3cec:ecd7:6ae1?
	([2601:202:4180:c33:ac6a:3cec:ecd7:6ae1])
	by smtp.gmail.com with ESMTPSA id r6sm8626743pfh.1.2019.09.16.13.28.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Sep 2019 13:28:13 -0700 (PDT)
To: muislam@microsoft.com, openembedded-core@lists.openembedded.org
References: <20190916175323.19104-1-muislam@microsoft.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <368ad44a-0420-f66d-8392-923d88ae84e5@gmail.com>
Date: Mon, 16 Sep 2019 13:28:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916175323.19104-1-muislam@microsoft.com>
Subject: Re: [thud][PATCH] gcc: CVE fix <CVE-2019-15847>
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
X-List-Received-Date: Mon, 16 Sep 2019 20:28:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/16/19 10:53 AM, Muminul Islam wrote:
> Signed-off-by: Muminul Islam <muislam@microsoft.com>
> ---
>  .../gcc/gcc/CVE-2019-15847.patch              | 642 ++++++++++++++++++
>  meta/recipes-devtools/gcc/gcc_8.2.bb          |   4 +
>  2 files changed, 646 insertions(+)

Is there a master and warrior fix in the OE queues? I may have missed it

- armin
>  create mode 100644 meta/recipes-devtools/gcc/gcc/CVE-2019-15847.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc/CVE-2019-15847.patch b/meta/recipes-devtools/gcc/gcc/CVE-2019-15847.patch
> new file mode 100644
> index 0000000000..a18d8175a2
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/CVE-2019-15847.patch
> @@ -0,0 +1,642 @@
> +From 9fc82916580cba45734bc6325d38a0d29956de95 Mon Sep 17 00:00:00 2001
> +From: segher <segher@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Thu, 22 Aug 2019 19:36:21 +0000
> +Subject: [PATCH 1/2] rs6000: Use unspec_volatile for darn (PR91481)
> +Reply-To: muislam@microsoft.com
> +
> +Every call to darn should deliver a *new* random number; such calls
> +should not be CSEd together.  So they should be unspec_volatile, not
> +plain unspec.
> +
> +	PR target/91481
> +	* config/rs6000/rs6000.md (unspec): Delete UNSPEC_DARN, UNSPEC_DARN_32,
> +	and UNSPEC_DARN_RAW.
> +	(unspecv): New enumerator values UNSPECV_DARN, UNSPECV_DARN_32, and
> +	UNSPECV_DARN_RAW.
> +	(darn_32): Use an unspec_volatile, and UNSPECV_DARN_32.
> +	(darn_raw): Use an unspec_volatile, and UNSPECV_DARN_RAW.
> +	(darn): Use an unspec_volatile, and UNSPECV_DARN.
> +
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@274835 138bc75d-0d04-0410-961f-82ee72b054a4
> +Signed-off-by: Muminul Islam <muislam@microsoft.com>
> +
> +CVE: CVE-2019-15847
> +Upstream-Status: Backport
> +---
> + gcc/ChangeLog               | 337 +++++++++++++++++++++++++++++++++++-
> + gcc/config/rs6000/rs6000.md | 170 ++++++++++++++++++
> + 2 files changed, 506 insertions(+), 1 deletion(-)
> +
> +diff --git a/gcc/ChangeLog b/gcc/ChangeLog
> +index b93dae5dfb0..f3de9bb65e3 100644
> +--- a/gcc/ChangeLog
> ++++ b/gcc/ChangeLog
> +@@ -1,4 +1,339 @@
> +-2018-07-26  Release Manager
> ++2019-08-22  Segher Boessenkool  <segher@kernel.crashing.org>
> ++
> ++	PR target/91481
> ++	* config/rs6000/rs6000.md (unspec): Delete UNSPEC_DARN, UNSPEC_DARN_32,
> ++	and UNSPEC_DARN_RAW.
> ++	(unspecv): New enumerator values UNSPECV_DARN, UNSPECV_DARN_32, and
> ++	UNSPECV_DARN_RAW.
> ++	(darn_32): Use an unspec_volatile, and UNSPECV_DARN_32.
> ++	(darn_raw): Use an unspec_volatile, and UNSPECV_DARN_RAW.
> ++	(darn): Use an unspec_volatile, and UNSPECV_DARN.
> ++
> ++2019-08-22  Segher Boessenkool  <segher@kernel.crashing.org>
> ++
> ++	* config/rs6000/altivec.md (unspec): Delete UNSPEC_DARN, UNSPEC_DARN_32,
> ++	UNSPEC_DARN_RAW, UNSPEC_CMPRB, UNSPEC_CMPRB2, UNSPEC_CMPEQB; move to...
> ++	* config/rs6000/rs6000.md (unspec): ... here.
> ++	* config/rs6000/altivec.md (darn_32, darn_raw, darn, cmprb,
> ++	*cmprb_internal, setb_signed, setb_unsigned, cmprb2, *cmprb2_internal,
> ++	cmpeqb, *cmpeqb_internal): Delete, move to...
> ++	* config/rs6000/rs6000.md (darn_32, darn_raw, darn, cmprb,
> ++	*cmprb_internal, setb_signed, setb_unsigned, cmprb2, *cmprb2_internal,
> ++	cmpeqb, *cmpeqb_internal): ... here.
> ++
> ++2019-08-22  Kyrylo Tkachov <kyrylo.tkachov@arm.com>
> ++
> ++	* config/arm/arm_acle.h: Use arch=armv8-a+crc+simd pragma for CRC32
> ++	intrinsics if __ARM_FP.
> ++	Use __ARM_FEATURE_CRC32 ifdef guard.
> ++
> ++2019-08-22  Wilco Dijkstra  <wdijkstr@arm.com>
> ++
> ++	* config/arm/arm.md (neon_for_64bits): Remove.
> ++	(avoid_neon_for_64bits): Remove.
> ++	(arm_adddi3): Always split early.
> ++	(arm_subdi3): Always split early.
> ++	(negdi2): Remove Neon expansion.
> ++	(split zero_extend): Split before reload.
> ++	(split sign_extend): Split before reload.
> ++
> ++2019-08-22  Wilco Dijkstra  <wdijkstr@arm.com>
> ++
> ++	* config/arm/iterators.md (qhs_extenddi_cstr): Update.
> ++	(qhs_extenddi_cstr): Likewise.
> ++	* config/arm/arm.md (ashldi3): Always expand early.
> ++	(ashlsi3): Likewise.
> ++	(ashrsi3): Likewise.
> ++	(zero_extend<mode>di2): Remove Neon variants.
> ++	(extend<mode>di2): Likewise.
> ++	* config/arm/neon.md (ashldi3_neon_noclobber): Remove.
> ++	(signed_shift_di3_neon): Likewise.
> ++	(unsigned_shift_di3_neon): Likewise.
> ++	(ashrdi3_neon_imm_noclobber): Likewise.
> ++	(lshrdi3_neon_imm_noclobber): Likewise.
> ++	(<shift>di3_neon): Likewise.
> ++	(split extend): Remove DI extend split patterns.
> ++
> ++2019-08-22  Wilco Dijkstra  <wdijkstr@arm.com>
> ++
> ++	* config/arm/arm.md (split and/eor/ior): Remove Neon check.
> ++	(split not): Add DImode not splitter.
> ++	(anddi3): Remove pattern.
> ++	(anddi3_insn): Likewise.
> ++	(anddi_zesidi_di): Likewise.
> ++	(anddi_sesdi_di): Likewise.
> ++	(anddi_notdi_di): Likewise.
> ++	(anddi_notzesidi_di): Likewise.
> ++	(anddi_notsesidi_di): Likewise.
> ++	(iordi3): Likewise.
> ++	(iordi3_insn): Likewise.
> ++	(iordi_zesidi_di): Likewise.
> ++	(iordi_sesidi_di): Likewise.
> ++	(xordi3): Likewise.
> ++	(xordi3_insn): Likewise.
> ++	(xordi_sesidi_di): Likewise.
> ++	(xordi_zesidi_di): Likewise.
> ++	(one_cmpldi2): Likewise.
> ++	(one_cmpldi2_insn): Likewise.
> ++	* config/arm/constraints.md: Remove De, Df, Dg constraints.
> ++	* config/arm/iwmmxt.md (iwmmxt_iordi3): Remove general register
> ++	alternative.
> ++	(iwmmxt_xordi3): Likewise.
> ++	(iwmmxt_anddi3): Likewise.
> ++	* config/arm/neon.md (orndi3_neon): Remove pattern.
> ++	(anddi_notdi_di): Likewise.
> ++	* config/arm/predicates.md (arm_anddi_operand_neon): Remove.
> ++	(arm_iordi_operand_neon): Likewise.
> ++	(arm_xordi_operand_neon): Likewise.
> ++	* config/arm/thumb2.md(iordi_notdi_di): Remove pattern.
> ++	(iordi_notzesidi_di): Likewise.
> ++	(iordi_notdi_zesidi): Likewise.
> ++	(iordi_notsesidi_di): Likewise.
> ++
> ++2019-08-22  Richard Earnshaw  <rearnsha@arm.com>
> ++
> ++	* config/arm/arm.md (iorsi3_compare0): Add alternative for 16-bit thumb
> ++	insn.
> ++	(iorsi3_compare0_scratch): Likewise.
> ++
> ++2019-08-22  Sylvia Taylor  <sylvia.taylor@arm.com>
> ++
> ++	* config/aarch64/aarch64-simd-builtins.def:
> ++	(ld1x4): New.
> ++	(st1x4): Likewise.
> ++	* config/aarch64/aarch64-simd.md:
> ++	(aarch64_ld1x4<VALLDIF:mode>): New pattern.
> ++	(aarch64_st1x4<VALLDIF:mode>): Likewise.
> ++	(aarch64_ld1_x4_<mode>): Likewise.
> ++	(aarch64_st1_x4_<mode>): Likewise.
> ++	* config/aarch64/arm_neon.h:
> ++	(vld1_s8_x4): New function.
> ++	(vld1q_s8_x4): Likewise.
> ++	(vld1_s16_x4): Likewise.
> ++	(vld1q_s16_x4): Likewise.
> ++	(vld1_s32_x4): Likewise.
> ++	(vld1q_s32_x4): Likewise.
> ++	(vld1_u8_x4): Likewise.
> ++	(vld1q_u8_x4): Likewise.
> ++	(vld1_u16_x4): Likewise.
> ++	(vld1q_u16_x4): Likewise.
> ++	(vld1_u32_x4): Likewise.
> ++	(vld1q_u32_x4): Likewise.
> ++	(vld1_f16_x4): Likewise.
> ++	(vld1q_f16_x4): Likewise.
> ++	(vld1_f32_x4): Likewise.
> ++	(vld1q_f32_x4): Likewise.
> ++	(vld1_p8_x4): Likewise.
> ++	(vld1q_p8_x4): Likewise.
> ++	(vld1_p16_x4): Likewise.
> ++	(vld1q_p16_x4): Likewise.
> ++	(vld1_s64_x4): Likewise.
> ++	(vld1_u64_x4): Likewise.
> ++	(vld1_p64_x4): Likewise.
> ++	(vld1q_s64_x4): Likewise.
> ++	(vld1q_u64_x4): Likewise.
> ++	(vld1q_p64_x4): Likewise.
> ++	(vld1_f64_x4): Likewise.
> ++	(vld1q_f64_x4): Likewise.
> ++	(vst1_s8_x4): Likewise.
> ++	(vst1q_s8_x4): Likewise.
> ++	(vst1_s16_x4): Likewise.
> ++	(vst1q_s16_x4): Likewise.
> ++	(vst1_s32_x4): Likewise.
> ++	(vst1q_s32_x4): Likewise.
> ++	(vst1_u8_x4): Likewise.
> ++	(vst1q_u8_x4): Likewise.
> ++	(vst1_u16_x4): Likewise.
> ++	(vst1q_u16_x4): Likewise.
> ++	(vst1_u32_x4): Likewise.
> ++	(vst1q_u32_x4): Likewise.
> ++	(vst1_f16_x4): Likewise.
> ++	(vst1q_f16_x4): Likewise.
> ++	(vst1_f32_x4): Likewise.
> ++	(vst1q_f32_x4): Likewise.
> ++	(vst1_p8_x4): Likewise.
> ++	(vst1q_p8_x4): Likewise.
> ++	(vst1_p16_x4): Likewise.
> ++	(vst1q_p16_x4): Likewise.
> ++	(vst1_s64_x4): Likewise.
> ++	(vst1_u64_x4): Likewise.
> ++	(vst1_p64_x4): Likewise.
> ++	(vst1q_s64_x4): Likewise.
> ++	(vst1q_u64_x4): Likewise.
> ++	(vst1q_p64_x4): Likewise.
> ++	(vst1_f64_x4): Likewise.
> ++	(vst1q_f64_x4): Likewise.
> ++
> ++2019-08-22  Prathamesh Kulkarni  <prathamesh.kulkarni@linaro.org>
> ++
> ++	* config/aarch64/aarch64-sve.md (vcond_mask): Add "@".
> ++
> ++2019-08-22  Prathamesh Kulkarni  <prathamesh.kulkarni@linaro.org>
> ++	    Richard Sandiford  <richard.sandiford@arm.com>
> ++
> ++	PR target/88839
> ++	* config/aarch64/aarch64.c (aarch64_evpc_sel): New function.
> ++	(aarch64_expand_vec_perm_const_1): Call aarch64_evpc_sel.
> ++
> ++2019-08-21  Prathamesh Kulkarni  <prathamesh.kulkarni@linaro.org>
> ++
> ++	PR target/90724
> ++	* config/aarch64/aarch64.c (aarch64_gen_compare_reg_maybe_ze): Force y
> ++	in reg if it fails aarch64_plus_operand predicate.
> ++
> ++2019-08-21  Richard Biener  <rguenther@suse.de>
> ++
> ++	PR tree-optimization/91482
> ++	* tree-ssa-ccp.c (ccp_folder::fold_stmt): Remove useless
> ++	BUILT_IN_ASSUME_ALIGNED calls.
> ++
> ++2019-08-21  Richard Biener  <rguenther@suse.de>
> ++
> ++	PR target/91498
> ++	PR target/91503
> ++	* config/i386/i386-features.c
> ++	(general_scalar_chain::make_vector_copies): Copy stack temporary
> ++	rtx when using it multiple times.
> ++	(general_scalar_chain::convert_reg): Likewise.
> ++
> ++2019-08-20  Bernd Edlinger  <bernd.edlinger@hotmail.de>
> ++
> ++	* function.c (assign_parm_find_stack_rtl): Use known_eq instead of ==.
> ++
> ++2019-08-20  Matthew Beliveau  <mbelivea@redhat.com>
> ++
> ++	* tree-ssa-dse.c (dse_optimize_redundant_stores): Improved check to
> ++	catch more redundant zero initialization cases.
> ++	(dse_dom_walker::dse_optimize_stmt): Likewise.
> ++
> ++2019-08-20  Richard Biener  <rguenther@suse.de>
> ++
> ++	PR lto/91307
> ++	* ipa.c (cgraph_build_static_cdtor_1): Use names not recognizable
> ++	by collect2 when targetm.have_ctors_dtors which avoids dragging
> ++	in temporary filenames from LTO input objects.
> ++
> ++2019-08-20  Richard Biener  <rguenther@suse.de>
> ++
> ++	PR tree-optimization/37242
> ++	* tree-ssa-sccvn.c (visit_nary_op): Also CSE (T)(a + b)
> ++	to (T)a + (T)b if we know that a + b does not overflow.
> ++
> ++2019-08-20  Eric Botcazou  <ebotcazou@adacore.com>
> ++
> ++	PR rtl-optimization/91347
> ++	* dse.c (scan_insn): Call add_wild_read for non-const/memset tail calls
> ++	before reload if HARD_FRAME_POINTER_IS_ARG_POINTER.
> ++
> ++2019-08-20  Richard Sandiford  <richard.sandiford@arm.com>
> ++
> ++	* calls.h (function_arg_info): Add a pass_by_reference field,
> ++	defaulting to false.
> ++	* calls.c (apply_pass_by_reference_rules): Set pass_by_reference
> ++	when applying pass-by-reference semantics.
> ++	(initialize_argument_information): Likewise.
> ++	(emit_library_call_value_1): Likewise.
> ++	* function.c (assign_parm_data_one): Remove passed_pointer field.
> ++	(assign_parm_find_data_types): Don't set it.
> ++	(assign_parm_find_stack_rtl, assign_parm_adjust_stack_rtl)
> ++	(assign_parm_setup_reg, assign_parms, gimplify_parameters): Use
> ++	arg.pass_by_reference instead of passed_pointer.
> ++
> ++2019-08-20  Richard Sandiford  <richard.sandiford@arm.com>
> ++
> ++	* calls.c (emit_library_call_value_1): Merge arg and orig_arg
> ++	into a single function_arg_info, updating its fields when we
> ++	apply pass-by-reference and promotion semantics.  Use the
> ++	function_arg_info to track the mode rather than keeping it in
> ++	a separate local variable.
> ++	(initialize_argument_information): Likewise.  Base the final
> ++	arg_to_skip on this new function_arg_info rather than creating
> ++	a new one from scratch.
> ++
> ++2019-08-20  Richard Sandiford  <richard.sandiford@arm.com>
> ++
> ++	* function.c (assign_parm_data_one): Replace passed_type,
> ++	promoted_mode and named_arg with a function_arg_info field.
> ++	(assign_parm_find_data_types): Remove local variables and
> ++	assign directly to "data".  Make data->passed_mode shadow
> ++	data->arg.mode until promotion, then assign the promoted
> ++	mode to data->arg.mode.
> ++	(assign_parms_setup_varargs, assign_parm_find_entry_rtl)
> ++	(assign_parm_find_stack_rtl, assign_parm_adjust_entry_rtl)
> ++	(assign_parm_remove_parallels, assign_parm_setup_block_p)
> ++	(assign_parm_setup_block, assign_parm_setup_reg)
> ++	(assign_parm_setup_stack, assign_parms, gimplify_parameters): Use
> ++	arg.mode instead of promoted_mode, arg.type instead of passed_type
> ++	and arg.named instead of named_arg.  Use data->arg for
> ++	function_arg_info structures that had the field values passed_type,
> ++	promoted_mode and named_arg.  Base other function_arg_infos on
> ++	data->arg, changing the necessary properties.
> ++
> ++2019-08-20  Richard Sandiford  <richard.sandiford@arm.com>
> ++
> ++	* calls.h (apply_pass_by_reference_rules): Declare.
> ++	* calls.c (apply_pass_by_reference_rules): New function.
> ++	* config/c6x/c6x.c (c6x_call_saved_register_used): Use it.
> ++	* config/rs6000/rs6000-call.c (rs6000_parm_needs_stack): Likewise.
> ++	* config/s390/s390.c (s390_call_saved_register_used): Likewise.
> ++	* function.c (assign_parm_find_data_types): Likewise.
> ++	* var-tracking.c (prepare_call_arguments): Likewise.
> ++
> ++2019-08-20  Richard Sandiford  <richard.sandiford@arm.com>
> ++
> ++	* target.def (must_pass_in_stack): Take a function_arg_info instead
> ++	of a mode and a type.
> ++	* doc/tm.texi: Regenerate.
> ++	* calls.h (must_pass_in_stack_var_size): Take a function_arg_info
> ++	instead of a mode and a type.
> ++	(must_pass_in_stack_var_size_or_pad): Likewise.
> ++	* calls.c (must_pass_in_stack_var_size): Likewise.
> ++	(must_pass_in_stack_var_size_or_pad): Likewise.
> ++	(initialize_argument_information): Update call to
> ++	targetm.calls.must_pass_in_stack.
> ++	(must_pass_va_arg_on_stack): Likewise.
> ++	* function.c (assign_parm_find_entry_rtl): Likewise.
> ++	* targhooks.c (hook_pass_by_reference_must_pass_in_stack): Likewise.
> ++	* config/alpha/alpha.c (alpha_function_arg): Likewise.
> ++	(alpha_function_arg_advance): Likewise.
> ++	* config/cr16/cr16.c (cr16_function_arg): Likewise.
> ++	(cr16_function_arg_advance): Likewise.
> ++	* config/cris/cris.c (cris_pass_by_reference): Likewise.
> ++	(cris_arg_partial_bytes): Likewise.
> ++	* config/iq2000/iq2000.c (iq2000_pass_by_reference): Likewise.
> ++	* config/lm32/lm32.c (lm32_function_arg): Likewise.
> ++	* config/mcore/mcore.c (mcore_num_arg_regs): Likewise.
> ++	(mcore_function_arg, mcore_arg_partial_bytes): Likewise.
> ++	* config/mips/mips.c (mips_pass_by_reference): Likewise.
> ++	* config/mmix/mmix.c (mmix_function_arg_advance): Likewise.
> ++	(mmix_function_arg_1, mmix_pass_by_reference): Likewise.
> ++	* config/sh/sh.c (sh_pass_by_reference): Likewise.
> ++	* config/stormy16/stormy16.c (xstormy16_function_arg): Likewise.
> ++	* config/xtensa/xtensa.c (xtensa_function_arg_advance): Likewise.
> ++	* config/arm/arm.c (arm_must_pass_in_stack): Take a function_arg_info
> ++	instead of a mode and a type.
> ++	* config/fr30/fr30.c (fr30_must_pass_in_stack): Likewise.
> ++	(fr30_num_arg_regs): Likewise.
> ++	(fr30_setup_incoming_varargs): Update calls accordingly.
> ++	(fr30_arg_partial_bytes, fr30_function_arg): Likewise.
> ++	(fr30_function_arg_advance): Likewise.
> ++	* config/frv/frv.c (frv_must_pass_in_stack): Take a function_arg_info
> ++	instead of a mode and a type.
> ++	* config/gcn/gcn.c (num_arg_regs): Likewise.
> ++	(gcn_function_arg, gcn_function_arg_advance): Update calls to
> ++	num_arg_regs and targetm.calls.must_pass_in_stack.
> ++	(gcn_arg_partial_bytes): Likewise.
> ++	* config/i386/i386.c (ix86_must_pass_in_stack): Take a
> ++	function_arg_info instead of a mode and a type.
> ++	(classify_argument): Update call accordingly.
> ++	* config/nds32/nds32.c (nds32_must_pass_in_stack): Take a
> ++	function_arg_info instead of a mode and a type.
> ++	* config/rs6000/rs6000-internal.h (rs6000_must_pass_in_stack):
> ++	Likewise.
> ++	* config/rs6000/rs6000-call.c (rs6000_must_pass_in_stack): Likewise.
> ++	(rs6000_parm_needs_stack): Update call accordingly.
> ++	(setup_incoming_varargs): Likewise.
> ++>>>>>>> 0708e6fa34a... rs6000: Use unspec_volatile for darn (PR91481)
> + 
> + 	* GCC 8.2.0 released.
> + 
> +diff --git a/gcc/config/rs6000/rs6000.md b/gcc/config/rs6000/rs6000.md
> +index 60058814b8a..5d783e6c669 100644
> +--- a/gcc/config/rs6000/rs6000.md
> ++++ b/gcc/config/rs6000/rs6000.md
> +@@ -138,6 +138,9 @@
> +    UNSPEC_STACK_CHECK
> +    UNSPEC_FUSION_P9
> +    UNSPEC_FUSION_ADDIS
> ++   UNSPEC_CMPRB
> ++   UNSPEC_CMPRB2
> ++   UNSPEC_CMPEQB
> +    UNSPEC_ADD_ROUND_TO_ODD
> +    UNSPEC_SUB_ROUND_TO_ODD
> +    UNSPEC_MUL_ROUND_TO_ODD
> +@@ -162,6 +165,9 @@
> +    UNSPECV_EH_RR		; eh_reg_restore
> +    UNSPECV_ISYNC		; isync instruction
> +    UNSPECV_MFTB			; move from time base
> ++   UNSPECV_DARN			; darn 1 (deliver a random number)
> ++   UNSPECV_DARN_32		; darn 2
> ++   UNSPECV_DARN_RAW		; darn 0
> +    UNSPECV_NLGR			; non-local goto receiver
> +    UNSPECV_MFFS			; Move from FPSCR
> +    UNSPECV_MTFSF		; Move to FPSCR Fields
> +@@ -14603,6 +14609,170 @@
> +   [(set_attr "type" "veccmp")
> +    (set_attr "size" "128")])
> + 
> ++;; Miscellaneous ISA 3.0 (power9) instructions
> ++
> ++(define_insn "darn_32"
> ++  [(set (match_operand:SI 0 "register_operand" "=r")
> ++        (unspec_volatile:SI [(const_int 0)] UNSPECV_DARN_32))]
> ++  "TARGET_P9_MISC"
> ++  "darn %0,0"
> ++  [(set_attr "type" "integer")])
> ++
> ++(define_insn "darn_raw"
> ++  [(set (match_operand:DI 0 "register_operand" "=r")
> ++        (unspec_volatile:DI [(const_int 0)] UNSPECV_DARN_RAW))]
> ++  "TARGET_P9_MISC && TARGET_64BIT"
> ++  "darn %0,2"
> ++  [(set_attr "type" "integer")])
> ++
> ++(define_insn "darn"
> ++  [(set (match_operand:DI 0 "register_operand" "=r")
> ++        (unspec_volatile:DI [(const_int 0)] UNSPECV_DARN))]
> ++  "TARGET_P9_MISC && TARGET_64BIT"
> ++  "darn %0,1"
> ++  [(set_attr "type" "integer")])
> ++
> ++;; Test byte within range.
> ++;;
> ++;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
> ++;; represents a byte whose value is ignored in this context and
> ++;; vv, the least significant byte, holds the byte value that is to
> ++;; be tested for membership within the range specified by operand 2.
> ++;; The bytes of operand 2 are organized as xx:xx:hi:lo.
> ++;;
> ++;; Return in target register operand 0 a value of 1 if lo <= vv and
> ++;; vv <= hi.  Otherwise, set register operand 0 to 0.
> ++;;
> ++;; Though the instructions to which this expansion maps operate on
> ++;; 64-bit registers, the current implementation only operates on
> ++;; SI-mode operands as the high-order bits provide no information
> ++;; that is not already available in the low-order bits.  To avoid the
> ++;; costs of data widening operations, future enhancements might allow
> ++;; DI mode for operand 0 and/or might allow operand 1 to be QI mode.
> ++(define_expand "cmprb"
> ++  [(set (match_dup 3)
> ++	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
> ++		    (match_operand:SI 2 "gpc_reg_operand" "r")]
> ++	 UNSPEC_CMPRB))
> ++   (set (match_operand:SI 0 "gpc_reg_operand" "=r")
> ++	(if_then_else:SI (lt (match_dup 3)
> ++			     (const_int 0))
> ++			 (const_int -1)
> ++			 (if_then_else (gt (match_dup 3)
> ++					   (const_int 0))
> ++				       (const_int 1)
> ++				       (const_int 0))))]
> ++  "TARGET_P9_MISC"
> ++{
> ++  operands[3] = gen_reg_rtx (CCmode);
> ++})
> ++
> ++;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
> ++;; represents a byte whose value is ignored in this context and
> ++;; vv, the least significant byte, holds the byte value that is to
> ++;; be tested for membership within the range specified by operand 2.
> ++;; The bytes of operand 2 are organized as xx:xx:hi:lo.
> ++;;
> ++;; Set bit 1 (the GT bit, 0x4) of CR register operand 0 to 1 if
> ++;; lo <= vv and vv <= hi.  Otherwise, set the GT bit to 0.  The other
> ++;; 3 bits of the target CR register are all set to 0.
> ++(define_insn "*cmprb_internal"
> ++  [(set (match_operand:CC 0 "cc_reg_operand" "=y")
> ++	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
> ++		    (match_operand:SI 2 "gpc_reg_operand" "r")]
> ++	 UNSPEC_CMPRB))]
> ++  "TARGET_P9_MISC"
> ++  "cmprb %0,0,%1,%2"
> ++  [(set_attr "type" "logical")])
> ++
> ++;; Set operand 0 register to -1 if the LT bit (0x8) of condition
> ++;; register operand 1 is on.  Otherwise, set operand 0 register to 1
> ++;; if the GT bit (0x4) of condition register operand 1 is on.
> ++;; Otherwise, set operand 0 to 0.  Note that the result stored into
> ++;; register operand 0 is non-zero iff either the LT or GT bits are on
> ++;; within condition register operand 1.
> ++(define_insn "setb_signed"
> ++   [(set (match_operand:SI 0 "gpc_reg_operand" "=r")
> ++	 (if_then_else:SI (lt (match_operand:CC 1 "cc_reg_operand" "y")
> ++			      (const_int 0))
> ++			  (const_int -1)
> ++			  (if_then_else (gt (match_dup 1)
> ++					    (const_int 0))
> ++					(const_int 1)
> ++					(const_int 0))))]
> ++  "TARGET_P9_MISC"
> ++  "setb %0,%1"
> ++  [(set_attr "type" "logical")])
> ++
> ++(define_insn "setb_unsigned"
> ++   [(set (match_operand:SI 0 "gpc_reg_operand" "=r")
> ++	 (if_then_else:SI (ltu (match_operand:CCUNS 1 "cc_reg_operand" "y")
> ++			      (const_int 0))
> ++			  (const_int -1)
> ++			  (if_then_else (gtu (match_dup 1)
> ++					    (const_int 0))
> ++					(const_int 1)
> ++					(const_int 0))))]
> ++  "TARGET_P9_MISC"
> ++  "setb %0,%1"
> ++  [(set_attr "type" "logical")])
> ++
> ++;; Test byte within two ranges.
> ++;;
> ++;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
> ++;; represents a byte whose value is ignored in this context and
> ++;; vv, the least significant byte, holds the byte value that is to
> ++;; be tested for membership within the range specified by operand 2.
> ++;; The bytes of operand 2 are organized as hi_1:lo_1:hi_2:lo_2.
> ++;;
> ++;; Return in target register operand 0 a value of 1 if (lo_1 <= vv and
> ++;; vv <= hi_1) or if (lo_2 <= vv and vv <= hi_2).  Otherwise, set register
> ++;; operand 0 to 0.
> ++;;
> ++;; Though the instructions to which this expansion maps operate on
> ++;; 64-bit registers, the current implementation only operates on
> ++;; SI-mode operands as the high-order bits provide no information
> ++;; that is not already available in the low-order bits.  To avoid the
> ++;; costs of data widening operations, future enhancements might allow
> ++;; DI mode for operand 0 and/or might allow operand 1 to be QI mode.
> ++(define_expand "cmprb2"
> ++  [(set (match_dup 3)
> ++	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
> ++		    (match_operand:SI 2 "gpc_reg_operand" "r")]
> ++	 UNSPEC_CMPRB2))
> ++   (set (match_operand:SI 0 "gpc_reg_operand" "=r")
> ++	(if_then_else:SI (lt (match_dup 3)
> ++			     (const_int 0))
> ++			 (const_int -1)
> ++			 (if_then_else (gt (match_dup 3)
> ++					   (const_int 0))
> ++				       (const_int 1)
> ++				       (const_int 0))))]
> ++  "TARGET_P9_MISC"
> ++{
> ++  operands[3] = gen_reg_rtx (CCmode);
> ++})
> ++
> ++;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
> ++;; represents a byte whose value is ignored in this context and
> ++;; vv, the least significant byte, holds the byte value that is to
> ++;; be tested for membership within the ranges specified by operand 2.
> ++;; The bytes of operand 2 are organized as hi_1:lo_1:hi_2:lo_2.
> ++;;
> ++;; Set bit 1 (the GT bit, 0x4) of CR register operand 0 to 1 if
> ++;; (lo_1 <= vv and vv <= hi_1) or if (lo_2 <= vv and vv <= hi_2).
> ++;; Otherwise, set the GT bit to 0.  The other 3 bits of the target
> ++;; CR register are all set to 0.
> ++(define_insn "*cmprb2_internal"
> ++  [(set (match_operand:CC 0 "cc_reg_operand" "=y")
> ++	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
> ++		    (match_operand:SI 2 "gpc_reg_operand" "r")]
> ++	 UNSPEC_CMPRB2))]
> ++  "TARGET_P9_MISC"
> ++  "cmprb %0,1,%1,%2"
> ++  [(set_attr "type" "logical")])
> ++>>>>>>> 0708e6fa34a... rs6000: Use unspec_volatile for darn (PR91481)
> ++
> + 
> + 
> + (include "sync.md")
> +-- 
> +2.23.0
> +
> +
> +From 4f16ac67f7974fd118d084de8ffd829864c213c4 Mon Sep 17 00:00:00 2001
> +From: segher <segher@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Fri, 23 Aug 2019 22:19:40 +0000
> +Subject: [PATCH 2/2] rs6000: New darn testcase (PR91481)
> +Reply-To: muislam@microsoft.com
> +
> +We used to implement darn with unspecs, not unspec_volatiles, which
> +means two darn instructions could be CSEd together.
> +
> +This testcase tests it by adding together four random numbers.  If all
> +is well that means we get four darn instructions, because such a small
> +loop is unrolled fine at -O2 already.  If things go bad, combine will
> +combine it all to one darn and a shift left by two.
> +
> +gcc/testsuite/
> +	PR target/91481
> +	* gcc.target/powerpc/darn-3.c: New testcase.
> +
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@274889 138bc75d-0d04-0410-961f-82ee72b054a4
> +Signed-off-by: Muminul Islam <muislam@microsoft.com>
> +
> +CVE: CVE-2019-15847
> +Upstream-Status: Backport
> +---
> + gcc/testsuite/ChangeLog                   |  7 ++++++-
> + gcc/testsuite/gcc.target/powerpc/darn-3.c | 16 ++++++++++++++++
> + 2 files changed, 22 insertions(+), 1 deletion(-)
> + create mode 100644 gcc/testsuite/gcc.target/powerpc/darn-3.c
> +
> +diff --git a/gcc/testsuite/ChangeLog b/gcc/testsuite/ChangeLog
> +index b80ff889f15..47ed83e50e6 100644
> +--- a/gcc/testsuite/ChangeLog
> ++++ b/gcc/testsuite/ChangeLog
> +@@ -1,4 +1,9 @@
> +-2018-07-26  Release Manager
> ++2019-08-23  Segher Boessenkool  <segher@kernel.crashing.org>
> ++
> ++	PR target/91481
> ++	* gcc.target/powerpc/darn-3.c: New testcase.
> ++
> ++2019-08-23  Marek Polacek  <polacek@redhat.com>
> + 
> + 	* GCC 8.2.0 released.
> + 
> +diff --git a/gcc/testsuite/gcc.target/powerpc/darn-3.c b/gcc/testsuite/gcc.target/powerpc/darn-3.c
> +new file mode 100644
> +index 00000000000..477901fde70
> +--- /dev/null
> ++++ b/gcc/testsuite/gcc.target/powerpc/darn-3.c
> +@@ -0,0 +1,16 @@
> ++/* { dg-do compile { target { powerpc*-*-* } } } */
> ++/* { dg-skip-if "" { powerpc*-*-aix* } } */
> ++/* { dg-options "-O2 -mdejagnu-cpu=power9" } */
> ++
> ++static int darn32(void) { return __builtin_darn_32(); }
> ++
> ++int four(void)
> ++{
> ++	int sum = 0;
> ++	int i;
> ++	for (i = 0; i < 4; i++)
> ++		sum += darn32();
> ++	return sum;
> ++}
> ++
> ++/* { dg-final { scan-assembler-times {(?n)\mdarn .*,0\M} 4 } } */
> +-- 
> +2.23.0
> +
> diff --git a/meta/recipes-devtools/gcc/gcc_8.2.bb b/meta/recipes-devtools/gcc/gcc_8.2.bb
> index 7d93590588..484bd05f66 100644
> --- a/meta/recipes-devtools/gcc/gcc_8.2.bb
> +++ b/meta/recipes-devtools/gcc/gcc_8.2.bb
> @@ -12,3 +12,7 @@ ARMFPARCHEXT_armv7a = "${@'+fp' if d.getVar('TARGET_FPU') == 'hard' else ''}"
>  ARMFPARCHEXT_armv7ve = "${@'+fp' if d.getVar('TARGET_FPU') == 'hard' else ''}"
>  
>  BBCLASSEXTEND = "nativesdk"
> +
> +SRC_URI += "\
> +            file:///CVE-2019-15847.patch \
> +	   "


