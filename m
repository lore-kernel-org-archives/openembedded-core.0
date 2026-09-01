Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D10DC624D1
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 05:53:22 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1377.1788241992001097722
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 22:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ToRqiTDn;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SRuy6hPm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a05b87550f-b0161daf-b08a-4027-a602-b9e5cc254b26-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788241991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oAIv3ovdiGO0Rzepz3rg5MrdT4gRLoNuccVijW1wM0k=;
	b=ToRqiTDn6nUuz/btKdZClY8bOefHjuIgkERunBn2l+geevTWoHSieSSEqeGlOkE5
	JUIcUuniLedoBCXpHjiq1EsUHPeD1DKvUwd9sw9iq7GThqCN/g2SdsIF4ExF+dYC3Al
	0dikDF8fjsQ7sIpneGgww1Cap0mljlYbUuWue1bo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788241991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oAIv3ovdiGO0Rzepz3rg5MrdT4gRLoNuccVijW1wM0k=;
	b=SRuy6hPmOVyFRKpO5wremCj/p2MmGUJ8sGCejEwgnwbZIvq5v3VctjO7+QjYY13V
	7WOXwlN3PlOThgsx7hD3R8pnITjGK3JypdwuYTgYn4eXDD4lUavoerFXHaKAPsuvDcb
	TmWgLHBokDr+2wVKY6mVOKVdmMx10KxQBxSmV2Wo=
Content-Type: multipart/mixed; boundary="===============8093478806093308849=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-llvm-translator: upgrading to 23.1.1 FAILED
Message-ID: <010101a05b87550f-b0161daf-b08a-4027-a602-b9e5cc254b26-000000@us-west-2.amazonses.com>
Date: Tue, 1 Sep 2026 05:53:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 05:53:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244789

--===============8093478806093308849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-llvm-translator* to *23.1.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe spirv-llvm-translator failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1986 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-74617d2ec6db3b9721d48203f4e58752d68e78fb"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:74617d2ec6db3b9721d48203f4e58752d68e78fb"
meta-yocto-bsp       
meta-poky            = "master:6ce984c0a3a68c2fdc3c32bc185b6729d09e7829"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto c808623558686b7b285cabfa71542a93a5390f55
WARNING: Command 'git rebase c808623558686b7b285cabfa71542a93a5390f55' failed:
Auto-merging .github/workflows/check-code-style.yml
CONFLICT (content): Merge conflict in .github/workflows/check-code-style.yml
Auto-merging .github/workflows/check-in-tree-build.yml
CONFLICT (content): Merge conflict in .github/workflows/check-in-tree-build.yml
Auto-merging .github/workflows/check-out-of-tree-build.yml
CONFLICT (content): Merge conflict in .github/workflows/check-out-of-tree-build.yml
Auto-merging CMakeLists.txt
CONFLICT (content): Merge conflict in CMakeLists.txt
Auto-merging README.md
CONFLICT (content): Merge conflict in README.md

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/spirv-llvm-translator
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/spirv-llvm-translator/spirv-llvm-translator_23.1.1.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/spirv-llvm-translator.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8093478806093308849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="spirv-llvm-translator-changelog.txt"

Changelog for spirv-llvm-translator: 22.1.5 -> 23.1.1

c8086235 [Backport to llvm_release_230] Fix memory leak in isInternalSPIRVBuiltin (#3985)
19a29d43 Revert "[CI] Temporarily work around missing llvm 23 packages" (#3950)
e51894c2 [CI] Temporarily work around missing llvm 23 packages
30777e6d Prepare release branch for LLVM 23.x
b888251d Read old SPV_INTEL_float4 type for StochasticRound*ToE2M1INTEL (#3901)
2a28bf4a Use OpImageQuerySize for multisampled image size queries (#3776)
09adb2b3 Propagate intrinsic param attributes to generated helper functions (#3821)
a3789718 Fix OpGroupNonUniformRotateKHR mangling (#3863)
fa264644 Replace decode-path asserts with runtime error checks (#3798)
4ace1857 Add missing coverage for SPV_EXT_long_vector (#3869)
ee776682 Avoid per-instruction stream seeks in validateWordCount (#3850)
6734efd9 Add 2 opcodes back from old SPV_INTEL_fp_conversions spec (#3868)
880cbb08 Early-out transIntelFPGADecorations for undecorated values (#3851)
959eb891 Represent FP4 E2M1 with SPV_EXT_ocp_microscaling_types (#3828)
db650121 Adapt to latest llvm changes (#3859)
94156dfb Drop constant zero-sized memcpy/memmove/memset before selection (#3827)
696e6751 Allow FPFastMathMode decoration on OpFmaKHR (#3820)
3238c290 Keep VectorAnyINTEL for VectorCompute modules with SPV_EXT_long_vector (#3829)
0a6abf0d Add storage class memory semantics bit to LLVM IR atomic translation (#3826)
a1441b28 Add additional guardrails against unsigned underflows caused by wrong WordCount (#3787)
7d759325 Optimize checkError (#3840)
7d4b128d Use SPV_EXT_long_vector extension for non-standard vector size (#3777)
0382b779 chore: Add AI-Assisted Contributions in CONTRIBUTING.md (#3824)
f361da03 Implement SPV_INTEL_subgroup_scaled_matrix_multiply_accumulate (#3815)
dd66f0bd Re-enable spirv-val for tests of published extensions (#3818)
e32b76f6 Avoid duplicate spirv-fp-contract registration with LLVM SPIR-V backend (#3819)
8edb4243 Update SPV_INTEL_fp_conversions to the latest spec revision (#3782)
a2a27749 Fix SPIR-V module assert when translating freeze without SPV_KHR_poison_freeze (#3778)
a3937121 Support SPV_INTEL_rounded_div_sqrt extension (#3770)
766ab20c [DebugInfo] Distinguish absent and empty DIFile source on round-trip (#3781)
a34ca53e Re-enable spirv-val for some tests (#3783)
5b7e49f0 Fix build after IRBuilder::CreateIntrinsic change (#3784)
148a0b95 Preventing generating FPRoundingMode for arithmetic constrained intrinsics (#3771)
b1ea8cba Translate undef array global initializers to OpConstantComposite (#3775)
3532d745 Add reqd_sub_group_size metadata for SubgroupSize (#3764)
6fcf2004 Fix tests broken by LLVM Constant and Verifier updates (#3780)
ce486d2c [CI] Switch lit to internal shell (#3779)
31301b17 Support `SaturatedToLargestFloat8NormalConversionEXT` decoration (#3767)
33aa12bc Add Int64ImageEXT capability for OpTypeImage with 64-bit integer sampled type (#3773)
26682004 Avoid duplicate spirv-preserve-auxdata registration with LLVM SPIR-V backend (#3774)
8e958fcc Add SPV_NV_shader_atomic_fp16_vector extension (#3772)
bd15d75e Translate llvm.exp10.* intrinsics (#3766)
06bd1600 Configurable address space numbering (#3716)
19833602 [NFC] Remove unussed `.travis.yml` (#3765)
a81d73ed Make `this` captures explicit for C++20; NFC (#3763)
9f48169a ESIMD W/A Feature Check Guard (#3759)
cfecbadc Implement SPV_KHR_poison_freeze extension (#3751)
fac93141 [NFC] Sort some misplaced list entries (#3757)
78ee81dd [SPIRV->LLVM] Fix missing spir_func CC on builtin FP4/i4 conversion calls (#3746)
ce41b712 [DebugInfo] Fix DebugFunction Parent when DISubprogram is scoped in DIModule (#3753)
2569028f Fix is_fpclass translation for inverted case (#3750)
77625e8c [CI] Build SPIRV-Tools from main instead of lunarg packages (#3748)
ba34cbb6 Add SPV_AMD_weak_linkage (#3693)
f48615b9 Drop undef/poison initializers for global variables in SPIR-V translation (#3661)
38a315ed [DebugInfo] Fix NonSemantic DebugLine Source operand (#3747)
1406f979 Skip unknown nonsemantic instructions and sets (#3744)
c2ba98f7 Add NonSemanticAuxData::Linkage translation (#3743)
28cfd130 [DebugInfo] Fix NonSemantic DebugTypeBasic Flags operand (#3740)
63cae912 [NFC] Fix typo in the error message (#3739)
e6a66994 Update floating point literal CHECKs after AsmWriter change (#3741)
bb853893 [DOC] Add NonSemantic AuxData set specification (#3734)
8f759502 Add round-trip tests through SPIR-V backend for previously failing tests (#3717)
d62c9277 Ensure DISubprogram always has a type (#3738)
c1c1f797 Disable spirv-val for SPV_KHR_abort tests (#3735)
8324c559 SPIRVReader: Add spirv.nontemporal for Nontemporal image op (#3720)
c5dbe566 Implement SPV_KHR_abort extension (#3691)
5a8baf6c Remove internal values for SPV_INTEL_predicated_io (#3721)
a94d7338 Fix DebugTypeFunction void return type (#3718)
bd774ef4 [NFC] Use tool substitution for spirv-val in lit config (#3704)
39e94f89 Fix OpVariable ordering violation in NonSemantic debug info (#3692)
d4d65d5e Handle ConstantFP vector splats in transConstant (#3705)
c8862dd4 Add SPV_INTEL_subgroup_buffer_prefetch extension support (#3690)
daa7d18d Add workaround to translate casts from target ext types to int (#3689)
31ba7d13 Extend INT4/FP4 packed conversions for i16, i64, and vector packed inputs (#3675)
508c2aeb Add round-trip tests through SPIR-V backend for previously failing tests (#3669)
f417c2db Update prefalign in DebugInfo test (#3681)
7de094bd Disable spirv-val in global_block test that fails newer spirv-val (#3680)
b2410000 Add `sadd_with_overflow_i8` support (#3673)
5adf335e Guard setWordCount() resizes against unsigned underflow (CWE-191) (#3671)
bf469923 Make DebugLinePriority test valid SPIR-V (#3672)
8f16307f SPIRVReader: Move UserSemantic strings to constant addrspace (#3670)
01ee67cc Restore SPIRVUseTextFormat on error in readSpirv (#3622)
34fdf7fc Adjust tests where DCE is removing IR and enable round-trip tests (#3665)
40ce6c71 Add SPV_KHR_non_semantic_info to some llc tests (#3668)
9691713f Avoid losing DebugInfo in some tests
6b5f17f1 Migrate away from BranchInst
3f525768 Add round-trip tests through SPIR-V backend for previously failing tests (#3660)
13f1c79e Avoid creating ConstantComposites with spec constants (#3662)
12645e34 Make DebugInfo tests robust for newer SPIRV-Tools (#3659)
f66eceee Enable llc RUN line in create-placeholders-for-phi-operands.ll test (#3656)
787f1e76 Check for spirv-dis tool in DebugMacro tests (#3648)
3ce38f4e Update OCL nan builtin translation to work with bfloat type (#3558)
9981b92e Update DebugInfo tests for LLVM changes (#3625)
735dc42f Remove leftovers of deprecated SPV_INTEL_fast_composite (#3607)
9223610c Add translation of ptrtoaddr (#3619)
3c31709b [CI] Fix llvm-lit path for LLVM 23 apt packages (#3620)
0337510a Translate llvm.ldexp.* intrinsics. (#3608)
564a5623 Add FP4/FP8 operand support for SubgroupMatrixMultiplyAccumulateINTEL (#3609)
cb7e40b4 [NFC] Add testing for cross-compilation with SPIR-V backend (#3564)
b30f6281 Add SPV_ALTERA_arbitrary_precision_integers (#3606)
a76f8208 [CI] Remove job to cleanup backport branches (#3601)
ee801714 [CMake] Force LLVM discovery via LLVMConfig.cmake (CONFIG mode) (#3598)
8c36d7fa [NFC] Check for ptrtoadd instead of ptrtoint (#3605)
9b0d02a7 Add support for debug macro information (DW_MACINFO_define/undef) (#3562)
8dfdbae1 Implement extension SPV_KHR_float_controls2 (#3475)
a37f629c Fix BFloat16 argument type demangling (#3563)
81895515 Disable spirv-val in some tests (#3584)
30258ee3 fix a spir-val error in the cooperative_matrix_constant_null test (#3568)
58b467a7 Fix in-tree build: replace isZeroValue with isNullValue (#3582)
28b0cb08 Limit the instructions that enable `BFloat16ArithmeticINTEL` capability (#3561)
3515e17b Update memset test after LLVM IR changes
b5e67e3e [CI] Upgrade CI jobs to Ubuntu 24.04
aef1b521 Update LLVM version from 22 to 23
6f7fe8be [NFC] Allow `llvm::Value` derived types on `SPIRVMDWalker::get` (#3557)
14d53695 [NFC] Change ExtensionNamesMap type to DenseMap<StringRef, ExtensionID> (#3516)
60fa4bf3 Fix backward translation of `OpFmaKHR` (#3529)
1d8f38fd Update for DITypeRefArray removal (#3519)
fdbf9279 Enhance handling of umul_with_overflow in reverse translation (#3518)

--===============8093478806093308849==--

