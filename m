Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27424C55175
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 07:59:38 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38370.1785743974368516771
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 00:59:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=n95mi0wQ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EF3F34E410B3
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Aug 2026 07:59:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AC28E6029E;
	Mon,  3 Aug 2026 07:59:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 68FEF11C17C16;
	Mon,  3 Aug 2026 09:59:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785743971; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VUsciFSKUUqnUS2ON51CBumUiHtFfpZ4fqBUFImyd7I=;
	b=n95mi0wQgbmlgUSn7xv06ntkpUcbFzKibFWbWtxwCly8UBWodB7og+4pSvIpAMQ+89o2Fi
	1KozvKNQ6YHQmbW7vkGlAPpbxEcYTQm+1mET4nYtXGHZuo2WuNcITm3bAN3bFAskF19cFv
	npmmjfm9PQRrSCW/Iqsl1wERe+jvwkF31E9SrFIlxwkA+erhwHSapW2J8+Ar2JxAeF20+h
	PHDKorCm2bg/EOCHnBcT6oDe5CuoFUSS9ahwmMRTlxXYbf23tPaX8m6BWdK48aHnRTuu6t
	N8+U+P3saEztoZ8MZ70NK/BAhhxG67UR4npJXEc07UU0Zg87SsZuMFLcmBkdAA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 09:59:29 +0200
Message-Id: <DKF5EMI6PAQP.1BKV118DSTRZF@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 5/6] spirv-llvm-translator: upgrade 22.1.2 ->
 22.1.5
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260801121454.2770123-1-richard.purdie@linuxfoundation.org>
 <20260801121454.2770123-5-richard.purdie@linuxfoundation.org>
In-Reply-To: <20260801121454.2770123-5-richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 07:59:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242613

On Sat Aug 1, 2026 at 2:14 PM CEST, Richard Purdie via lists.openembedded.o=
rg wrote:
> 27afcfe3 [Backport to 22] Read old SPV_INTEL_float4 type for StochasticRo=
und*ToE2M1INTEL (#3926)
> 699789f4 [Backport to 22] Fix OpGroupNonUniformRotateKHR mangling (#3863)=
 (#3905)
> f167fe94 [Backport to 22] Add missing coverage for SPV_EXT_long_vector (#=
3889)
> f172a708 [Backport to 22] Add 2 opcodes back from old SPV_INTEL_fp_conver=
sions spec (#3880)
> 08310a8e [Backport to 22] Represent FP4 E2M1 with SPV_EXT_ocp_microscalin=
g_types (#3867)
> 64fa6b0a [Backport to 22] Keep VectorAnyINTEL for VectorCompute modules w=
ith SPV_EXT_long_vector (#3829)
> 36e45764 [Backport to 22] Use SPV_EXT_long_vector extension for non-stand=
ard vector size (#3777)
> e123849a [Backport to 22] Implement SPV_INTEL_subgroup_scaled_matrix_mult=
iply_accumulate (#3831)
> c88a2e4a [Backport to 22] Support SPV_INTEL_rounded_div_sqrt extension (#=
3770)
> 6c3fc37e [Backport to 22] Preventing generating FPRoundingMode for arithm=
etic constrained intrinsics (#3771)
> 9c688012 [Backport to 22] Update SPV_INTEL_fp_conversions to the latest s=
pec revision (#3782)
> 521e409d [Backport to 22] Support `SaturatedToLargestFloat8NormalConversi=
onEXT` decoration (#3767)
> 1d5546f5 [Backport to 22] [SPIRV->LLVM] Fix missing spir_func CC on built=
in FP4/i4 conversion calls (#3746)
> e10ca9b4 [LLVM 22] Add workaround to translate casts from target ext type=
s to int (Originally: #3476) (#3684)
> beefc64b [Backport to llvm_release_220] Remove internal values for SPV_IN=
TEL_predicated_io (#3723)
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---

Hi Richard,

Is it building on your side? On my branch I have some errors:

ERROR: spirv-llvm-translator-native-22.1.5-r0 do_compile: Execution of '/sr=
v/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-linux/sp=
irv-llvm-translator-native/22.1.5/temp/run.do_compile.2412725' failed with =
exit code 1
...
| /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-lin=
ux/spirv-llvm-translator-native/22.1.5/sources/spirv-llvm-translator-22.1.5=
/lib/SPIRV/libSPIRV/SPIRVOpCode.h:52:31: error: =E2=80=98OpPredicatedLoadIN=
TEL=E2=80=99 was not declared in this scope
|    52 | #define _SPIRV_OP(x, ...) add(Op##x, #x);
|       |                               ^~

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4301

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


