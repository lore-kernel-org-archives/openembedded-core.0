Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11912.1793714862216097750
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 06:07:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=v4BYFUNH;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1AA65C8F45C
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Nov 2026 14:08:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5FF0B6046C;
	Tue,  3 Nov 2026 14:07:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8AFF610328C5E;
	Tue,  3 Nov 2026 15:07:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793714858; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5UgSijsIxnDkwOGPQVPgsVeaAeMQXDHKW/lWWr3bLKY=;
	b=v4BYFUNHGbJ7w2hEH+Q+peImAFuRCqTIUHxkWauef70RgBC6vb1Q74QABUV/u9We6kvBTv
	XclKUgmggyR3QtRYFXt5qqGOYpL61SBf2h8jn6924pfK/yjJD7E7ePtFi1FxakIsmpux1R
	Ph/z99eV1f+Ofsn0+71zJihvOi7yzZ4vzZ/m9nxxn7CT3EQQFlEMkNByRdX3zXHR7RLrAM
	2THbTsUyAcLT5G42+qvHIhD2R74PWMvTi40G5FCQLrgBc1aVFixo64UM7Kcmlhg1RK6t6D
	2PoUOyqBHPBuBPR3j8pH4jJjuD+hWCfAYhIOEr+XkdXTg7fe3kYNNFPA3iaLXw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Nov 2026 15:07:36 +0100
Message-Id: <DMLMUL9PAI7S.3HKJOV8DDKDAA@bootlin.com>
Subject: Re: [OE-core] [PATCH] clang/llvm: Upgrade to 23.1.4 release
Cc: <Sundeep.Kokkonda@windriver.com>, <Sunilkumar.Dora@windriver.com>,
 <Deepesh.Varatharajan@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <deepesh.varatharajan@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261102111046.3459346-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20261102111046.3459346-1-Deepesh.Varatharajan@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 14:07:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249282

On Mon Nov 2, 2026 at 12:10 PM CET, Deepesh via openembedded-core Varathara=
jan wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> https://discourse.llvm.org/t/llvm-23-1-4-released/92564
>
> Brings following fixes:
> 7a941dfb2877 github-upload-release: Update script to work with draft rele=
ases (#229909)
> 4635269e3782 [X86] Fix constant vector i64 signed div/rem on 32-bit targe=
ts (#229244)
> 524ac171cd43 [GlobalISel] Drop nuw/nsw/disjoint when widening a result wi=
th G_ANYEXT (#218558)
> fdf44b31a63e [InstCombine] Drop poison-generating annotations forming min=
/max for clamp (#231537)
> d5f50fc559a2 [Mips] Fix symbol names for private functions in relocation =
hints (#230572)
> 52e90e1917a4 [Mips] Lower calls to private functions the same way as inte=
rnal functions (#229975)
> d5ff1316673e [clang][bytecode] disable tail calls on mips (#229679)
> 41042adf8339 [ARM] Fix miscompile in MAC for 64b values (#231702)
> 6c859967be70 [SPARC] Lower dynamic v2i32 vector extracts on 32-bit SPARC =
(#222348)
> 71c76755a8ff [ELF] Move layout-changing transforms before address assignm=
ent (#232189)
> d946f7b2b214 [PowerPC] Don't let optimizeCompareInstr define CR0 while it=
 is still live (#220999)
> a5eac6566485 [Clang][counted_by] Load the count through unions by byte of=
fset (#228309)
> beb6b7dfae46 [X86] Don't treat vectors with elements wider than 64 bits a=
s immediate-shiftable (#228840)
> 0cd28174a1f6 [SimplifyLibCalls] Fix ConstantInt construction based on cha=
r (#231159)
> d66309da4d8d [SCEV] Add missing scPtrToAddr to getCastExpr. (#211899)
> 94ae4f86b8f3 [Passes] Run MergeICmps/ExpandMemCmps in LTO post-link pipel=
ine (#230562)
> 7909311aa6f3 [Mips] Remove experimental warning bits in a few places (#22=
3230)
> 1be9d5eb62e0 [llvm-objcopy][COFF] Keep COMDAT section definition symbols =
when stripping (#228783)
> 8451016186f2 release/23.x: [llvm-ar][GOFF] Implement symbol attributes fo=
r GOFF archives (#214528)
> 1b843902f5b4 Change release notes wording
> ca0b6a823a5b workflows/release-binaries: Improve Windows installer (#2204=
14)
> 5177329b802a [Windows] Export Registry<T> members and accessors for plugi=
ns again (#221296)
> bb46d66418b9 [X86] Don't double count the interrupt stack alignment push =
in StackSize (#224029)
> 15d373104a6e [GlobalsAA] Handle self-referencing stores in `AnalyzeUsesOf=
Pointer` (#213631)
> 705f593fb506 [AArch64] Restore always-inline behaviour for incompatible S=
ME attributes.
> bbbf266c78bf pre-commit test
> 195209c5c105 [SanitizerCoverage] Don't create comdat for unnamed function=
s (#228959)
> 3dadaf417121 [PGO] Fix PGO instrumentation for selects with poison condit=
ion (#229002)
> 370eb8ddac24 [Mips][FastISel] Also add low part when materializing privat=
e functions (#229717)
> d7cdb9b24351 [SelectionDAG] Do not flag undef bitcast lanes as known zero
> 13d7a167327c [CAS] Close the stderr temp file of the out-of-process valid=
ator (#226844)
> affff9cc58ab [llvm][Support] Use ::closesocket for native sockets on Wind=
ows (#226613)
> 8e044a8f3ada [NVPTX] Set default value of nvptx-allow-ftz-atomics to true=
 (#206154)
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---

Hi Deepesh,

Thanks for the upgrade. Yet I believe we can see issues during the
toolchain tests:

2026-11-03 11:35:26,571 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemux86-tc/build/layers/openembedded-co=
re/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemux86-tc/build/layers/openembedded-co=
re/meta/lib/oeqa/selftest/cases/clang.py", line 202, in test_llvm
    raise AssertionError(f"llvm-lit failed for LLVM: {output}")
AssertionError: llvm-lit failed for LLVM: -- Testing: 25525 of 64777 tests,=
 4 workers --
...
FAIL: LLVM :: tools/extract_symbols/registry-itanium.test (23446 of 25525)
FAIL: LLVM :: tools/extract_symbols/registry-microsoft.test (23447 of 25525=
)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/4919
https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/4916

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

