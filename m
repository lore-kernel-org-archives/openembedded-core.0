Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FADC55166
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 21:14:51 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21865.1785359681678435334
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 14:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Rh0xh3O0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so14159535e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 14:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785359680; x=1785964480; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TygG66unzRzQ3OBowvosOzfAPo+33TIV1tBRWfoaknQ=;
        b=Rh0xh3O0CHCVIz/C+vvy1eg+h1clDyRMv6Oxoba2xzKyO68pq5k27hfC1gcXlkxlu3
         yQhInVKsznVqIZjYVDWDdhYa8698+Uk/Jz+LK7qGrBuouHe7U3T/Aha0ZgSm8dRtOxNJ
         c4XRp2RFLiP2BdgYz0Iqs2cYRb4pskzs8GTr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785359680; x=1785964480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TygG66unzRzQ3OBowvosOzfAPo+33TIV1tBRWfoaknQ=;
        b=nDixSlV95MG6gG4C734KUiiE7loP9jzmjpMACzLZuLwkF3NNniytuUlAgX0nzJvAvG
         qNpWu3EOPg0sDRPbyUfMde0/z9634ruAhVcBupmdVNSQzGauGfm3JJmXW2LekwIoX4TK
         VGDx8pIxoAL28YqBb7qUa1uiGLkzFWNStNICd4JJVetPNygoc4vMHDXjXqR3jqk6zvOI
         8G7syx5Cpcis5jD330akEOWn0K4AqjhDj+T9BIx9TWepa+9ltMl88NmO3fE0bYEKajRl
         WlS4op0Wkn7TK8hpSAbCcw9dJJpmaXc3t2yHqi1MFQ4P1mpFDSXj2awjpUejwtoA0uIE
         EVww==
X-Gm-Message-State: AOJu0YyyOXKfNrCitTW9GqvMdcEmH5cRUCA2MVCnK7IQcBCITh5npx1O
	Mg1NyEYiDaL+nkJkyV6EQx/d/I5aztZpnq1bJnHyuzvNtY0NxlPrFq6GkW1zNE2KgTDPP08bdG+
	fOcb4dO4=
X-Gm-Gg: AR+sD10z4TIb+Bqi31GfI7HucrVrhiZK2blHjeN0Y+8Rui9RjD19qPYIzwxUI1glCIa
	n9L1Cqd0F3tZBMzBJtxhkYG9+vhuxt7x4cmfKP8Lqnvi9TvXaSXfe1VREXrgqyEBzBVH5sjP4hm
	Dwbvu14cXwGFMMTNvXZG1F2QuuZUM2QIo+MZ3BJQ9OOFGM+6EfRWQQK+qAe33aZ1b/p0kpQebVC
	fvLa7L/aWVQh2gjrkj3Hbo66H7M6aWi1RwGxJ2Ag7xyJJpmYPOo0tcFsPkur6nk5R4hXOJEgrRx
	WZO3gpmtHgPH7Ti+1KQiuvg7zuQX+YTEptODV94OfXveHhTaC+IHsPLB6TiKHEXG/2ZlM7GtbCS
	RrbTLozUf4YZmYGs8BhGK8I70tuB6mHvF+WZ9VzLAnxAhtJCgwZvOa9Y7wxNTlil2f7oI7WICpX
	2mbx1O3+vxo9zGbfCBuCn47HuirAZNtWPBmA5dWirEk/CRqC69GpPkF1ekEP2VG1aJi8SAlRut2
	MUPtpWIdLraZZTnRw==
X-Received: by 2002:a05:600c:a3a2:b0:495:6396:8b67 with SMTP id 5b1f17b1804b1-49800e89181mr381695e9.4.1785359679750;
        Wed, 29 Jul 2026 14:14:39 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3647:86f2:68ea:efc7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a94sm11277116f8f.8.2026.07.29.14.14.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 14:14:38 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] glslang: upgrade 1.4.350.1 -> 1.4.357.0
Date: Wed, 29 Jul 2026 22:14:30 +0100
Message-ID: <20260729211437.3394641-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729211437.3394641-1-richard.purdie@linuxfoundation.org>
References: <20260729211437.3394641-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 21:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242286

Source: CHANGES.md

* Add support for GL_EXT_opacity_micromap_ray_query_mode

## 16.4.0 2026-07-14

### Descriptor Heap

* Implement `GLSL_EXT_structured_descriptor_heap` with SPIR-V layout generation, heap offset access, buffer references, matrix layout decorations, and correct `readonly`/`writeonly` qualifier propagation for buffer and image descriptors
* Fix descriptor heap-bound buffer access to use typed pointers
* Omit `NonUniform` decoration when using descriptor heaps, as the SPIR-V spec does not require it
* Add `--relax-set-binding-limits` option to allow large `layout(set)` and `layout(binding)` values for descriptor heap-style workflows with sparse set spaces
* Reject combined image samplers with `descriptor_heap`

### Compute Shader Derivatives

* Fix `GL_KHR_compute_shader_derivatives` regressions on shaders using the `GL_NV` variant
* Update compute shader derivative rules to allow texture operations with implicit derivatives without extensions, falling back to LoD 0

### New Extensions

* Implement `GL_EXT_ocp_microscaling_types`
* Implement `GL_NV_cooperative_matrix_decode_vector`
* Add basic support for `GL_NV_desktop_lowp_mediump`
* Implement `GL_EXT_opacity_micromap_ray_query_mode`

### Bug Fixes

* Fix generated decoration string from `UTF8EncodingKHR` to `UTFEncodingKHR`
* Fix missing SPIR-V extension emission for `float16` derivative functions with `SPV_AMD_gpu_shader_half_float`
* Apply `NoContraction` decoration to `dot()` when `noContraction` is set
* Fix `OpStore` of buffer device address pointer to use 8-byte alignment, consistent with loads
* Fix `RayTracingOpacityMicromapKHR` capability emission to only occur when `gl_RayFlagsForceOpacityMicromap2StateEXT` is actually used, fixing SPIR-V validation failures in ray query shaders outside ray-tracing pipeline stages
* Fix `setInvertY()` to apply Y-inversion to GLSL vertex, geometry, and tessellation-evaluation shaders (previously only affected HLSL)
* Fix `.length()` on arrays of long/cooperative vectors to use `OpArrayLength` instead of a constant component count
* Fix unnecessary cooperative matrix conversions when creating arrays of KHR cooperative matrices
* Add error for cooperative matrix `*=` with bf16/fp8 scalar operands
* Fix out-of-bounds access in `elseSeen` at maximum `#if`/`#ifdef` nesting depth
* Fix out-of-bounds read on empty struct texture template types
* Fix crash in `layoutObjectCheck` when accessing members of an empty block
* Emit an error when HLSL [numthreads] is given more than three arguments instead of crashing the compiler.
* Emit error when attempting to convert a literal string to an incompatible type
* Fix `abortKHR` to preserve the original user-defined string without modification
* Fix out-of-bounds indexing in `TDefaultIoResolverBase::addStage` when a negative `EShLanguage` value is passed

### Other

* Add `--discard-is-terminate` option to emit `OpTerminateInvocation` instead of `OpDemoteToHelperInvocation` for GLSL `discard` when tar

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../glslang/glslang/0001-generate-glslang-pkg-config.patch      | 2 +-
 .../glslang/{glslang_1.4.350.1.bb => glslang_1.4.357.0.bb}      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.4.350.1.bb => glslang_1.4.357.0.bb} (96%)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index f06f12b303e..b6a4c5a29b8 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -1,4 +1,4 @@
-From 2c7e21605b0324b4afd51270592bc6cb0a0cca5f Mon Sep 17 00:00:00 2001
+From f7aad1905705097782ebfea3c74c75856158a2ba Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 7 Feb 2021 01:30:39 +0000
 Subject: [PATCH] generate glslang pkg-config
diff --git a/meta/recipes-graphics/glslang/glslang_1.4.350.1.bb b/meta/recipes-graphics/glslang/glslang_1.4.357.0.bb
similarity index 96%
rename from meta/recipes-graphics/glslang/glslang_1.4.350.1.bb
rename to meta/recipes-graphics/glslang/glslang_1.4.357.0.bb
index 4d31a19e763..0f43d83f4ea 100644
--- a/meta/recipes-graphics/glslang/glslang_1.4.350.1.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.4.357.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND MIT AND GPL-3.0-or-later WITH Bison-exception-2.2"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=50ff9d0fcde2d5b953ebe431c48e34e3"
 
-SRCREV = "275822a6261ee689aadb1da5f09a0ec2f058685c"
+SRCREV = "168d452a4f460d24b588fed08477a81c44ee27a1"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main;tag=vulkan-sdk-${PV} \
            file://0001-generate-glslang-pkg-config.patch \
            "

