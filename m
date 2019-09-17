Return-Path: <prvs=1562a60c8=Mikko.Rapeli@bmw.de>
Received: from esa7.bmw.c3s2.iphmx.com (esa7.bmw.c3s2.iphmx.com
	[68.232.133.109])
	by mail.openembedded.org (Postfix) with ESMTP id 9CAFA7F8B9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 05:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1568698321; x=1600234321;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=35TK6PXwmNPaBEnbY7kKm2OROE6IqXVqkgork1IaYtI=;
	b=Wfs7B9Qb5xXIUEbFFmRox9W8FXTszdLxkQ6sQdBhPZS1bfjBlQWIebNg
	UX61AxWbCfx3ofgE1C4/i3Iylu1fAul4CDMPMjUS3Ro5bktPH35Y3BoCy
	Jz8pRj6rlZD4xFmTli8IWT1AGRT32+jozXC0WaeqN4nCIWiTfAWUtFh+W 8=;
IronPort-SDR: Of2SevNQTpRKpmuUg6yvgWLY7+r1ni7DhZcEgsXAnym/xe5c1O3NVN9aQehtnPlzze8eZlMVX9
	Wp7srUERNxzb9dFpPsZ9PA4iEgfzkVwWOBoNFMIV48+qSlpSHgCFTi9RH+so+zlx6LE/L6yBXM
	a0UoZAQv0Qr44rYgfCPHdUmjmqg13K0KS8fcm3ExZF1D+nPjYPWaC+Jht6XWjos3HvqHsZfOWg
	4RJvsVA15gurV+t8vdPAOilemxMwt8237wyphKW2PnEeqWaUy+uBSt6K/KzbnfiV1OPbekyJ60
	WWY=
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa7.bmw.c3s2.iphmx.com with ESMTP/TLS; 17 Sep 2019 07:31:58 +0200
Received: from esabb6.muc ([160.50.100.50])  by esagw5.muc with ESMTP/TLS;
	17 Sep 2019 07:31:58 +0200
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp)
	([160.48.96.48])
	by esabb6.muc with ESMTP/TLS; 17 Sep 2019 07:31:58 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10l.europe.bmw.corp
	(160.48.96.48) with Microsoft SMTP Server (TLS;
	Tue, 17 Sep 2019 07:31:58 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Tue, 17 Sep 2019 07:31:58 +0200
From: <Mikko.Rapeli@bmw.de>
To: <muislam@microsoft.com>
Thread-Topic: [OE-core] [thud][PATCH v2] gcc:  CVE fix for gcc <CVE-2019-15847>
Thread-Index: AQHVbM6dOYJx0AzSAkykromqSk3XUacvN0qA
Date: Tue, 17 Sep 2019 05:31:57 +0000
Message-ID: <20190917053155.GR6154@hiutale>
References: <20190916203728.64590-1-muislam@microsoft.com>
In-Reply-To: <20190916203728.64590-1-muislam@microsoft.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.42]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [thud][PATCH v2] gcc: CVE fix for gcc <CVE-2019-15847>
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
X-List-Received-Date: Tue, 17 Sep 2019 05:32:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7816AD240E90784AB1B1C589AE0F1511@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2019 at 08:37:28PM +0000, Muminul Islam wrote:
> Signed-off-by: Muminul Islam <muislam@microsoft.com>
> ---
>  meta/recipes-devtools/gcc/gcc-8.2.inc         |   2 +
>  .../gcc/gcc/0042-CVE-2019-15847_1.patch       | 570 ++++++++++++++++
>  .../gcc/gcc/0043-CVE-2019-15847_2.patch       | 640 ++++++++++++++++++
>  3 files changed, 1212 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc/0042-CVE-2019-15847_1.p=
atch
>  create mode 100644 meta/recipes-devtools/gcc/gcc/0043-CVE-2019-15847_2.p=
atch
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-8.2.inc b/meta/recipes-devtool=
s/gcc/gcc-8.2.inc
> index 866a77558b..cab494989e 100644
> --- a/meta/recipes-devtools/gcc/gcc-8.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-8.2.inc
> @@ -70,6 +70,8 @@ SRC_URI =3D "\
>             file://0039-Fix-for-testsuite-failure.patch \
>             file://0040-Re-introduce-spe-commandline-options.patch \
>             file://0041-ARC-fix-spec-gen.patch \
> +           file://0042-CVE-2019-15847_1.patch \
> +           file://0043-CVE-2019-15847_2.patch \
>             ${BACKPORTS} \
>  "
>  BACKPORTS =3D "\
> diff --git a/meta/recipes-devtools/gcc/gcc/0042-CVE-2019-15847_1.patch b/=
meta/recipes-devtools/gcc/gcc/0042-CVE-2019-15847_1.patch
> new file mode 100644
> index 0000000000..edebf2fb41
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0042-CVE-2019-15847_1.patch
> @@ -0,0 +1,570 @@
> +From 3efdb8c4afcbc5e07d33b05ab8c2bf88f42f4890 Mon Sep 17 00:00:00 2001
> +From: segher <segher@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Thu, 22 Aug 2019 19:36:21 +0000
> +Subject: [PATCH] rs6000: Use unspec_volatile for darn (PR91481)
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
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@274835 138bc75d-0d04-041=
0-961f-82ee72b054a4
> +Signed-off-by: Muminul Islam <muislam@microsoft.com>
> +
> +CVE: CVE-2019-15847
> +Upstream-Status: Backport
> +---
> + gcc/ChangeLog               | 336 +++++++++++++++++++++++++++++++++++-
> + gcc/config/rs6000/rs6000.md | 169 +++++++++++++++++-
> + 2 files changed, 503 insertions(+), 2 deletions(-)
> +
> +diff --git a/gcc/ChangeLog b/gcc/ChangeLog
> +index b93dae5dfb0..dc22d7e43b7 100644
> +--- a/gcc/ChangeLog
> ++++ b/gcc/ChangeLog

This changelog is not correct for only fixing PR 91481.

Because every upstream commit basically adds to the changelog and makes
all cherry-picks and backports fail, I would be fine in omitting
any changes to it in patches like this.

-Mikko

> +@@ -1,4 +1,338 @@
> +-2018-07-26  Release Manager
> ++2019-08-22  Segher Boessenkool  <segher@kernel.crashing.org>
> ++
> ++	PR target/91481
> ++	* config/rs6000/rs6000.md (unspec): Delete UNSPEC_DARN, UNSPEC_DARN_32=
,
> ++	and UNSPEC_DARN_RAW.
> ++	(unspecv): New enumerator values UNSPECV_DARN, UNSPECV_DARN_32, and
> ++	UNSPECV_DARN_RAW.
> ++	(darn_32): Use an unspec_volatile, and UNSPECV_DARN_32.
> ++	(darn_raw): Use an unspec_volatile, and UNSPECV_DARN_RAW.
> ++	(darn): Use an unspec_volatile, and UNSPECV_DARN.
> ++
> ++2019-08-22  Segher Boessenkool  <segher@kernel.crashing.org>
> ++
> ++	* config/rs6000/altivec.md (unspec): Delete UNSPEC_DARN, UNSPEC_DARN_3=
2,
> ++	UNSPEC_DARN_RAW, UNSPEC_CMPRB, UNSPEC_CMPRB2, UNSPEC_CMPEQB; move to..=
.
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
> ++	* config/arm/arm_acle.h: Use arch=3Darmv8-a+crc+simd pragma for CRC32
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
> ++	* config/arm/arm.md (iorsi3_compare0): Add alternative for 16-bit thum=
b
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
> ++	* function.c (assign_parm_find_stack_rtl): Use known_eq instead of =3D=
=3D.
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
> ++	* dse.c (scan_insn): Call add_wild_read for non-const/memset tail call=
s
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
> +=20
> + 	* GCC 8.2.0 released.
> +=20
> +diff --git a/gcc/config/rs6000/rs6000.md b/gcc/config/rs6000/rs6000.md
> +index 60058814b8a..d706c6ecd1a 100644
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
> +@@ -14603,7 +14609,168 @@
> +   [(set_attr "type" "veccmp")
> +    (set_attr "size" "128")])
> +=20
> +-=0C
> ++;; Miscellaneous ISA 3.0 (power9) instructions
> ++(define_insn "darn_32"
> ++  [(set (match_operand:SI 0 "register_operand" "=3Dr")
> ++        (unspec_volatile:SI [(const_int 0)] UNSPECV_DARN_32))]
> ++  "TARGET_P9_MISC"
> ++  "darn %0,0"
> ++  [(set_attr "type" "integer")])
> ++
> ++(define_insn "darn_raw"
> ++  [(set (match_operand:DI 0 "register_operand" "=3Dr")
> ++        (unspec_volatile:DI [(const_int 0)] UNSPECV_DARN_RAW))]
> ++  "TARGET_P9_MISC && TARGET_64BIT"
> ++  "darn %0,2"
> ++  [(set_attr "type" "integer")])
> ++
> ++(define_insn "darn"
> ++  [(set (match_operand:DI 0 "register_operand" "=3Dr")
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
> ++;; Return in target register operand 0 a value of 1 if lo <=3D vv and
> ++;; vv <=3D hi.  Otherwise, set register operand 0 to 0.
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
> ++   (set (match_operand:SI 0 "gpc_reg_operand" "=3Dr")
> ++	(if_then_else:SI (lt (match_dup 3)
> ++			     (const_int 0))
> ++			 (const_int -1)
> ++			 (if_then_else (gt (match_dup 3)
> ++					   (const_int 0))
> ++				       (const_int 1)
> ++				       (const_int 0))))]
> ++  "TARGET_P9_MISC"
> ++{
> ++  operands[3] =3D gen_reg_rtx (CCmode);
> ++})
> ++
> ++;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
> ++;; represents a byte whose value is ignored in this context and
> ++;; vv, the least significant byte, holds the byte value that is to
> ++;; be tested for membership within the range specified by operand 2.
> ++;; The bytes of operand 2 are organized as xx:xx:hi:lo.
> ++;;
> ++;; Set bit 1 (the GT bit, 0x4) of CR register operand 0 to 1 if
> ++;; lo <=3D vv and vv <=3D hi.  Otherwise, set the GT bit to 0.  The oth=
er
> ++;; 3 bits of the target CR register are all set to 0.
> ++(define_insn "*cmprb_internal"
> ++  [(set (match_operand:CC 0 "cc_reg_operand" "=3Dy")
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
> ++   [(set (match_operand:SI 0 "gpc_reg_operand" "=3Dr")
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
> ++   [(set (match_operand:SI 0 "gpc_reg_operand" "=3Dr")
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
> ++;; Return in target register operand 0 a value of 1 if (lo_1 <=3D vv an=
d
> ++;; vv <=3D hi_1) or if (lo_2 <=3D vv and vv <=3D hi_2).  Otherwise, set=
 register
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
> ++   (set (match_operand:SI 0 "gpc_reg_operand" "=3Dr")
> ++	(if_then_else:SI (lt (match_dup 3)
> ++			     (const_int 0))
> ++			 (const_int -1)
> ++			 (if_then_else (gt (match_dup 3)
> ++					   (const_int 0))
> ++				       (const_int 1)
> ++				       (const_int 0))))]
> ++  "TARGET_P9_MISC"
> ++{
> ++  operands[3] =3D gen_reg_rtx (CCmode);
> ++})
> ++
> ++;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
> ++;; represents a byte whose value is ignored in this context and
> ++;; vv, the least significant byte, holds the byte value that is to
> ++;; be tested for membership within the ranges specified by operand 2.
> ++;; The bytes of operand 2 are organized as hi_1:lo_1:hi_2:lo_2.
> ++;;
> ++;; Set bit 1 (the GT bit, 0x4) of CR register operand 0 to 1 if
> ++;; (lo_1 <=3D vv and vv <=3D hi_1) or if (lo_2 <=3D vv and vv <=3D hi_2=
).
> ++;; Otherwise, set the GT bit to 0.  The other 3 bits of the target
> ++;; CR register are all set to 0.
> ++(define_insn "*cmprb2_internal"
> ++  [(set (match_operand:CC 0 "cc_reg_operand" "=3Dy")
> ++	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
> ++		    (match_operand:SI 2 "gpc_reg_operand" "r")]
> ++	 UNSPEC_CMPRB2))]
> ++  "TARGET_P9_MISC"
> ++  "cmprb %0,1,%1,%2"
> ++  [(set_attr "type" "logical")])
> ++
> +=20
> + (include "sync.md")
> + (include "vector.md")
> +--=20
> +2.23.0
> +
> diff --git a/meta/recipes-devtools/gcc/gcc/0043-CVE-2019-15847_2.patch b/=
meta/recipes-devtools/gcc/gcc/0043-CVE-2019-15847_2.patch
> new file mode 100644
> index 0000000000..8d1bc7a6fd
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0043-CVE-2019-15847_2.patch
> @@ -0,0 +1,640 @@
> +From 3efdb8c4afcbc5e07d33b05ab8c2bf88f42f4890 Mon Sep 17 00:00:00 2001
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
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@274835 138bc75d-0d04-041=
0-961f-82ee72b054a4
> +Signed-off-by: Muminul Islam <muislam@microsoft.com>
> +
> +CVE: CVE-2019-15847
> +Upstream-Status: Backport
> +---
> + gcc/ChangeLog               | 336 +++++++++++++++++++++++++++++++++++-
> + gcc/config/rs6000/rs6000.md | 169 +++++++++++++++++-
> + 2 files changed, 503 insertions(+), 2 deletions(-)
> +
> +diff --git a/gcc/ChangeLog b/gcc/ChangeLog
> +index b93dae5dfb0..dc22d7e43b7 100644
> +--- a/gcc/ChangeLog
> ++++ b/gcc/ChangeLog
> +@@ -1,4 +1,338 @@
> +-2018-07-26  Release Manager
> ++2019-08-22  Segher Boessenkool  <segher@kernel.crashing.org>
> ++
> ++	PR target/91481
> ++	* config/rs6000/rs6000.md (unspec): Delete UNSPEC_DARN, UNSPEC_DARN_32=
,
> ++	and UNSPEC_DARN_RAW.
> ++	(unspecv): New enumerator values UNSPECV_DARN, UNSPECV_DARN_32, and
> ++	UNSPECV_DARN_RAW.
> ++	(darn_32): Use an unspec_volatile, and UNSPECV_DARN_32.
> ++	(darn_raw): Use an unspec_volatile, and UNSPECV_DARN_RAW.
> ++	(darn): Use an unspec_volatile, and UNSPECV_DARN.
> ++
> ++2019-08-22  Segher Boessenkool  <segher@kernel.crashing.org>
> ++
> ++	* config/rs6000/altivec.md (unspec): Delete UNSPEC_DARN, UNSPEC_DARN_3=
2,
> ++	UNSPEC_DARN_RAW, UNSPEC_CMPRB, UNSPEC_CMPRB2, UNSPEC_CMPEQB; move to..=
.
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
> ++	* config/arm/arm_acle.h: Use arch=3Darmv8-a+crc+simd pragma for CRC32
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
> ++	* config/arm/arm.md (iorsi3_compare0): Add alternative for 16-bit thum=
b
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
> ++	* function.c (assign_parm_find_stack_rtl): Use known_eq instead of =3D=
=3D.
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
> ++	* dse.c (scan_insn): Call add_wild_read for non-const/memset tail call=
s
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
> +=20
> + 	* GCC 8.2.0 released.
> +=20
> +diff --git a/gcc/config/rs6000/rs6000.md b/gcc/config/rs6000/rs6000.md
> +index 60058814b8a..d706c6ecd1a 100644
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
> +@@ -14603,7 +14609,168 @@
> +   [(set_attr "type" "veccmp")
> +    (set_attr "size" "128")])
> +=20
> +-=0C
> ++;; Miscellaneous ISA 3.0 (power9) instructions
> ++(define_insn "darn_32"
> ++  [(set (match_operand:SI 0 "register_operand" "=3Dr")
> ++        (unspec_volatile:SI [(const_int 0)] UNSPECV_DARN_32))]
> ++  "TARGET_P9_MISC"
> ++  "darn %0,0"
> ++  [(set_attr "type" "integer")])
> ++
> ++(define_insn "darn_raw"
> ++  [(set (match_operand:DI 0 "register_operand" "=3Dr")
> ++        (unspec_volatile:DI [(const_int 0)] UNSPECV_DARN_RAW))]
> ++  "TARGET_P9_MISC && TARGET_64BIT"
> ++  "darn %0,2"
> ++  [(set_attr "type" "integer")])
> ++
> ++(define_insn "darn"
> ++  [(set (match_operand:DI 0 "register_operand" "=3Dr")
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
> ++;; Return in target register operand 0 a value of 1 if lo <=3D vv and
> ++;; vv <=3D hi.  Otherwise, set register operand 0 to 0.
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
> ++   (set (match_operand:SI 0 "gpc_reg_operand" "=3Dr")
> ++	(if_then_else:SI (lt (match_dup 3)
> ++			     (const_int 0))
> ++			 (const_int -1)
> ++			 (if_then_else (gt (match_dup 3)
> ++					   (const_int 0))
> ++				       (const_int 1)
> ++				       (const_int 0))))]
> ++  "TARGET_P9_MISC"
> ++{
> ++  operands[3] =3D gen_reg_rtx (CCmode);
> ++})
> ++
> ++;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
> ++;; represents a byte whose value is ignored in this context and
> ++;; vv, the least significant byte, holds the byte value that is to
> ++;; be tested for membership within the range specified by operand 2.
> ++;; The bytes of operand 2 are organized as xx:xx:hi:lo.
> ++;;
> ++;; Set bit 1 (the GT bit, 0x4) of CR register operand 0 to 1 if
> ++;; lo <=3D vv and vv <=3D hi.  Otherwise, set the GT bit to 0.  The oth=
er
> ++;; 3 bits of the target CR register are all set to 0.
> ++(define_insn "*cmprb_internal"
> ++  [(set (match_operand:CC 0 "cc_reg_operand" "=3Dy")
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
> ++   [(set (match_operand:SI 0 "gpc_reg_operand" "=3Dr")
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
> ++   [(set (match_operand:SI 0 "gpc_reg_operand" "=3Dr")
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
> ++;; Return in target register operand 0 a value of 1 if (lo_1 <=3D vv an=
d
> ++;; vv <=3D hi_1) or if (lo_2 <=3D vv and vv <=3D hi_2).  Otherwise, set=
 register
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
> ++   (set (match_operand:SI 0 "gpc_reg_operand" "=3Dr")
> ++	(if_then_else:SI (lt (match_dup 3)
> ++			     (const_int 0))
> ++			 (const_int -1)
> ++			 (if_then_else (gt (match_dup 3)
> ++					   (const_int 0))
> ++				       (const_int 1)
> ++				       (const_int 0))))]
> ++  "TARGET_P9_MISC"
> ++{
> ++  operands[3] =3D gen_reg_rtx (CCmode);
> ++})
> ++
> ++;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
> ++;; represents a byte whose value is ignored in this context and
> ++;; vv, the least significant byte, holds the byte value that is to
> ++;; be tested for membership within the ranges specified by operand 2.
> ++;; The bytes of operand 2 are organized as hi_1:lo_1:hi_2:lo_2.
> ++;;
> ++;; Set bit 1 (the GT bit, 0x4) of CR register operand 0 to 1 if
> ++;; (lo_1 <=3D vv and vv <=3D hi_1) or if (lo_2 <=3D vv and vv <=3D hi_2=
).
> ++;; Otherwise, set the GT bit to 0.  The other 3 bits of the target
> ++;; CR register are all set to 0.
> ++(define_insn "*cmprb2_internal"
> ++  [(set (match_operand:CC 0 "cc_reg_operand" "=3Dy")
> ++	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
> ++		    (match_operand:SI 2 "gpc_reg_operand" "r")]
> ++	 UNSPEC_CMPRB2))]
> ++  "TARGET_P9_MISC"
> ++  "cmprb %0,1,%1,%2"
> ++  [(set_attr "type" "logical")])
> ++
> +=20
> + (include "sync.md")
> + (include "vector.md")
> +--=20
> +2.23.0
> +
> +
> +From 650317c9974024bd33d533740450189c3d6540b0 Mon Sep 17 00:00:00 2001
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
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@274889 138bc75d-0d04-041=
0-961f-82ee72b054a4
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
> +=20
> + 	* GCC 8.2.0 released.
> +=20
> +diff --git a/gcc/testsuite/gcc.target/powerpc/darn-3.c b/gcc/testsuite/g=
cc.target/powerpc/darn-3.c
> +new file mode 100644
> +index 00000000000..477901fde70
> +--- /dev/null
> ++++ b/gcc/testsuite/gcc.target/powerpc/darn-3.c
> +@@ -0,0 +1,16 @@
> ++/* { dg-do compile { target { powerpc*-*-* } } } */
> ++/* { dg-skip-if "" { powerpc*-*-aix* } } */
> ++/* { dg-options "-O2 -mdejagnu-cpu=3Dpower9" } */
> ++
> ++static int darn32(void) { return __builtin_darn_32(); }
> ++
> ++int four(void)
> ++{
> ++	int sum =3D 0;
> ++	int i;
> ++	for (i =3D 0; i < 4; i++)
> ++		sum +=3D darn32();
> ++	return sum;
> ++}
> ++
> ++/* { dg-final { scan-assembler-times {(?n)\mdarn .*,0\M} 4 } } */
> +--=20
> +2.23.0
> +
> --=20
> 2.23.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core=

