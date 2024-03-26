Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B6FC6FD1F
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 08:44:28 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.3888.1711442665297641870
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Mar 2024 01:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kTueUmqq;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d094bc2244so69238411fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 01:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711442663; x=1712047463; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bw/f2Q2IzcomZ+fKGak9kNcgP7u07x0l1XDN+AYhgMg=;
        b=kTueUmqqBSktVLTdiP4vGEHAXuWM1EC8N98WOjOGNxdyMjX2R6CkcK/5vdIbhtCbkU
         MncgB4frwb4vzQSEn9LFWNH1kEsL76itVYVLYYH7n2ApsxYnE8apjCJxx7YhY0UCzK9P
         HhLAud150epj9CJJV/fpBq5Z0WZ6gcp4r3i3FIq/TZ+O8HJ0DFl+P3h5SFuCrRutYbS5
         OOlSL3guMI6JJI4K2iD8vYRIpGBwWli4X6FEx/SArmp8dbStVY8FGwrhED+9FoqgqfFa
         fmjEGWif3DOKn5kNgA87877B1uGXUzPYFEU/uP4q9NzbKfkN5Aa5GOP9q1fV+sBZyPnN
         Vt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711442663; x=1712047463;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bw/f2Q2IzcomZ+fKGak9kNcgP7u07x0l1XDN+AYhgMg=;
        b=kiAoawlhuHy2zuBdUdDU+9RoXOjBbrVJZ7IlJ/xu4cBOrzbvCZQOozcrq3fcImFrIh
         whqR811EovhOPy/iwQJ9uMWlRdZS3luggQ4vZbDMOCq7XvrORSkGtoT1iFRHiNGJzr+I
         YIRnv74HwKQmvlW/Q5D3+vyUXt8RbauW4Yyt5wOtJyFpogA1HreJV8LzJKWaCVFif98+
         7o9CYcvUUQUyygs6roM5JYA6sSix/wHNWg2NBrX6N0DfcftfER6N1cj6UuGuMmzEkyyh
         YI3raHKnBtZloVNF1+zs0y2R3U4wE8bHlLXvINn1Llmclay+hlEUXHB0MImGEI/4yLEY
         nwVA==
X-Gm-Message-State: AOJu0YyxKC5O1TpS9j7f16BdS8NMRx13PHo1Y27oMwrBTyaQ9hV/s5l5
	f+U9PS7GBoZeKVrf8/4r2ujfForcAS8WwwQ9aU5zf7IQjPnpoIfW7E9EAJ59fcTYjDYr3rITvDR
	CgCI6+Fc0R5q3P4fVz3NsiXQNvhY=
X-Google-Smtp-Source: AGHT+IF/Qx3acw1U454daK0LXS6RPZz5qrolCPVaW8nJ1IyxJRoYF1lCwHUDv7s3jE7vt3ywZUePy62Ptic0x+6yiQU=
X-Received: by 2002:a2e:a60c:0:b0:2d4:ad34:85a7 with SMTP id
 v12-20020a2ea60c000000b002d4ad3485a7mr5695720ljp.29.1711442663097; Tue, 26
 Mar 2024 01:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com> <1711413292-3025-7-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1711413292-3025-7-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Mar 2024 09:44:11 +0100
Message-ID: <CANNYZj9oABHE=oWB0J_koiJ4zy8V8DhumE_TH_Qw8qs-dP60qw@mail.gmail.com>
Subject: Re: [OE-Core] [PATCH 07/34] glslang: upgrade 1.3.275.0 -> 1.3.280.0
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 08:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197529

This and the spirv recipes should be updated in lockstep with vulkan
recipes to keep them all at the same version. Please note that this is
written in the comments in all those recipes.

Alex


On Tue, 26 Mar 2024 at 01:35, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-generate-glslang-pkg-config.patch
> refreshed for 1.3.280.0.
>
> Changelog:
> ==========
> * Add a new --abosute-path command-line option to output absolute paths in error messages
> * Support GL_EXT_control_flow_attributes2
> * Support GL_ARB_shading_language_include
> * Fix HLSL built-in passthrough via inout
> * Enable -Wimplicit-fallthrough and fix warnings
> * Fix -Wmissing_field_initializer warnings
> * Document supported dependencies in known_good.json
> * Clear spirv vector before use
> * Emit debug info for accelerationStructure and rayQuery variables
> * Support NV_shader_atomic_fp16_vector
> * Support GL_EXT_expect_assume_support
> * Allow external control of whether glslang will be tested or installed
> * Improve debug source and line info
> * Support GL_KHR_shader_subgroup_rotate
> * Add SPIRV-Tools-opt dependency if ENABLE_OPT
> * Support EXT_shader_quad_control
> * Add OpAssumeTrueKHR and OpExpectKHR
> * Support GL_EXT_maximal_reconvergence
> * Remove generation of deprecated Target.cmake files
> * Fix array size of gl_SampleMask and gl_SampleMaskIn
> * Support GL_ARB_texture_multisample_extension
> * Emit DebugTypePointer when non-semantic debug info is enabled
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../glslang/0001-generate-glslang-pkg-config.patch     | 10 +++++-----
>  .../{glslang_1.3.275.0.bb => glslang_1.3.280.0.bb}     |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
>  rename meta/recipes-graphics/glslang/{glslang_1.3.275.0.bb => glslang_1.3.280.0.bb} (96%)
>
> diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
> index 316a57fa4a..e6bb6ec8e3 100644
> --- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
> +++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
> @@ -1,4 +1,4 @@
> -From 4cede5edcff96134baf35953d58595c4aa5f1fc5 Mon Sep 17 00:00:00 2001
> +From fc33f1cf032a15c07044ef932bc991c346d62d62 Mon Sep 17 00:00:00 2001
>  From: Jose Quaresma <quaresma.jose@gmail.com>
>  Date: Sun, 7 Feb 2021 01:30:39 +0000
>  Subject: [PATCH] generate glslang pkg-config
> @@ -15,12 +15,12 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>   create mode 100644 glslang/glslang.pc.cmake.in
>
>  diff --git a/glslang/CMakeLists.txt b/glslang/CMakeLists.txt
> -index 37eecaad..6974935c 100644
> +index e4690f09..8e660bc5 100644
>  --- a/glslang/CMakeLists.txt
>  +++ b/glslang/CMakeLists.txt
> -@@ -251,6 +251,8 @@ if(PROJECT_IS_TOP_LEVEL)
> -         ")
> -         install(FILES "${CMAKE_CURRENT_BINARY_DIR}/glslangTargets.cmake" DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake)
> +@@ -233,6 +233,8 @@ if(GLSLANG_ENABLE_INSTALL)
> +         install(TARGETS MachineIndependent EXPORT glslang-targets)
> +         install(TARGETS GenericCodeGen EXPORT glslang-targets)
>       endif()
>  +    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/glslang.pc.cmake.in ${CMAKE_CURRENT_BINARY_DIR}/pkgconfig/glslang.pc @ONLY)
>  +    install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pkgconfig/glslang.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
> diff --git a/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.280.0.bb
> similarity index 96%
> rename from meta/recipes-graphics/glslang/glslang_1.3.275.0.bb
> rename to meta/recipes-graphics/glslang/glslang_1.3.280.0.bb
> index 2fd1e72a26..637082c719 100644
> --- a/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb
> +++ b/meta/recipes-graphics/glslang/glslang_1.3.280.0.bb
> @@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
>  LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
>
> -SRCREV = "a91631b260cba3f22858d6c6827511e636c2458a"
> +SRCREV = "ee2f5d09eaf8f4e8d0d598bd2172fce290d4ca60"
>  SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
>             file://0001-generate-glslang-pkg-config.patch \
>             "
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197496): https://lists.openembedded.org/g/openembedded-core/message/197496
> Mute This Topic: https://lists.openembedded.org/mt/105150498/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

