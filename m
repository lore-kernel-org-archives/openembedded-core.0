Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B0BACA5FB1
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 11:37:08 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11299.1790768221698597165
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 04:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=llRr4+R/;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 65E574E410C7
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 11:36:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3B28760749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 11:36:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3DB8103293C1;
	Wed, 30 Sep 2026 13:36:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790768218; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5JMt2KfewWKPUjZk75dNKa3a2pRoryjO6WlXVxVvjSQ=;
	b=llRr4+R/20SkOPq4OGjvB9zPGLDc3/ohNpmk4oM8HBbFQh7O5qV+ePwkkEnzfwm+GwdnCA
	o7868ifAXsJhybpIVNK1Tyz3fhM+ZkFdUpMSwEXyN01+ZSEM3Fc97AC19PTVpOO402Unny
	m1cmGAdo953qDA+wsXOtXKhxRLEimxnCdLQl2rGekx9ocFFLxocOtzqLGISRKuGvfqdOrU
	XE/oX2ClVRlXCo9ljy9rCmPWOgkQeCifS3DhUQMAV8m+1cJ64rLqrcYV+GwhtC3tqwXTw8
	7SFSSau+9997H5Q4FUHFDFStuUZpxHJxsuaFEJ3wMBoDTY9wg5uKORpWJ+KqFA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 13:36:57 +0200
Message-Id: <DLSMCPUY4T7U.3TKYLLKF07HKG@bootlin.com>
Subject: Re: [OE-core] [PATCH 14/24] spirv-tools: upgrade 1.4.357.0 ->
 1.4.363.0
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Mathieu
 Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com> <18DA0B4B51CDCF67.1580077@lists.openembedded.org>
In-Reply-To: <18DA0B4B51CDCF67.1580077@lists.openembedded.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 11:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246960

On Wed Sep 30, 2026 at 10:16 AM CEST, Mathieu Dubois-Briand via lists.opene=
mbedded.org wrote:
> v2026.4 2026-09-09
>   - Optimizer
>     - Add pass to convert typed pointers to untyped pointers (`--convert-=
to-
>       untyped`)
>     - Support optimizing shaders using SPV_KHR_opacity_micromap across de=
ad-code
>       elimination and local passes
>     - Add folding rule to dissolve OpCopyLogical of OpCompositeConstruct =
in
>       simplification pass
>     - Harden optimizer passes against ID overflow (#6851, #6852, #6857, #=
6858,
>       #6863)
>     - Filter duplicate decorations during module serialization to binary
>     - Correctness fixes for vector constant folding size and OpSelect fol=
ding
>       pre-SPIR-V 1.4 (#6798, #6827)
>     - Stability fixes for IRContext analysis handling, debug info strippi=
ng, and
>       eliminate dead functions (#6765, #6797, #6799)
>   - Validator
>     - Support and validate SPV_EXT_cooperative_matrix_maintenance1
>     - Support and validate SPV_QCOM_image_processing3 and OpImageGatherQC=
OM
>     - Add validation for NonSemantic.DebugPrintf extended instruction set
>     - Validate OpAbortKHR explicit layout message type and require scalar
>       packing (#6854, #6859)
>     - Tighten relaxed block layout alignments and add explicit alignment =
VUIDs
>       (#6819, #6853)
>     - Validate Offset decoration on Input/Output storage classes and add =
VUID
>       12509 (#6835, #6855)
>     - Allow OpExtInstWithForwardRefsKHR in generic non-semantic instructi=
on sets
>     - Restrict Workgroup execution scope to OpGroupNonUniformRotateKHR fo=
r non-
>       uniform group operations
>     - Validate OpControlBarrierArriveEXT execution and memory scopes
>     - Allow Generic pointer casts to and from CodeSectionINTEL storage cl=
ass
>     - Allow BFloat16 and FP8 result types in OpExtInst
>     - Validate OpSourceContinued order following OpSource
>     - Correctness fixes for >64-bit integer constant evaluation and
>       AliasScopeINTELMask/NoAliasINTELMask operand counting (#6816, #6791=
,
>       #6865)
>     - Validate ArrayStride on OpConstantDataKHR result types
>     - Add validation for UTFEncodedKHR decoration on array types
>     - Validate that OpAbortKHR Message Type is a concrete type
>   - Linker
>     - Detect duplicate exported definitions without imports to prevent OD=
R
>       violations
>   - Assembler/Disassembler
>     - Initialize parsed operand floating-point encoding to ensure determi=
nistic
>       disassembly of literal floats
>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> ---
>  .../spir/{spirv-tools_1.4.357.0.bb =3D> spirv-tools_1.4.363.0.bb}      |=
 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb b/meta/r=
ecipes-graphics/spir/spirv-tools_1.4.363.0.bb
> similarity index 93%
> rename from meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb
> rename to meta/recipes-graphics/spir/spirv-tools_1.4.363.0.bb
> index d9f6d2926788..a5b08684f0d4 100644
> --- a/meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb
> +++ b/meta/recipes-graphics/spir/spirv-tools_1.4.363.0.bb
> @@ -7,9 +7,8 @@ SECTION =3D "graphics"
>  LICENSE  =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
> =20
> -SRCREV =3D "9a49b0883b9b635689a85b5647dbfcb223268151"
> -SRC_URI =3D "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=3Dvulk=
an-sdk-1.4.357;protocol=3Dhttps;tag=3Dvulkan-sdk-${PV} \
> -"
> +SRCREV =3D "ef96ed763b43b59b33b31b362f09a02b729fa1c9"
> +SRC_URI =3D "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=3Dmain=
;protocol=3Dhttps;tag=3Dvulkan-sdk-${PV}"
>  PE =3D "1"
>  # These recipes need to be updated in lockstep with each other:
>  # glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, s=
pirv-tools


This is broken on Debian 12. I will come with a fix.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


