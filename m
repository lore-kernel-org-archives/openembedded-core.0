Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E091CD32D84
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 10:10:56 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.82990.1731406255685056992
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 02:10:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R0NfcH5v;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb59652cb9so44454551fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 02:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731406254; x=1732011054; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sz0FmU3WQZyRXul1VB8UTLmio0XzXHrhTN5KZTIZStY=;
        b=R0NfcH5v5EGbbFfQK3lC2BIqFp8Y+e9SXjnBEPJcjD13CmqHVpSGBmd3bzTiYpcMya
         2NbrJEL1dMJ7VvwMRXiC2FYOHuCEOFHZrevqwCEefTZAgaZC36RDvwlheP9xbHPOQGst
         y2ZrOB79rqYq4rlkMJiJ2NAm0ydhHV1JrNsKehmg4RsmEwg3YrniYKdRIaSihYj75Opx
         iue6jZc2kniPYSyMntOjGbrokd1yxJ8r3vxhVfXtH6OsnbWcBXo3agZqURNXTHi/xG5r
         27D3hr8QbmM3dfDGM4WlivNpKvbL+LlYxFOGLRVS1Ck8p8TRqpPG+lQ7ww4A4ch43adB
         /lDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731406254; x=1732011054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sz0FmU3WQZyRXul1VB8UTLmio0XzXHrhTN5KZTIZStY=;
        b=ao/G45ZpDggeHhZDpDZBrcxTBxatlV2scsOHXKehgD+PE9Qy+SmZ+Pcvenl/WEBi0K
         dYAJDPZbmvFYASgud0j1h9SPeIV5nTaqGcwb4KkC2BD00LG63/zgAvy2gRpkEGdNKBJG
         4Hm/8QhINYj+WrIiMCAk3MIdOATY0CNTHk2Wz5eUcoMq3PRKGbaH9v1KT97WBhSpUEgz
         LMsad79wtxgFMn2X5ollL7qyysQYoo+duCjzZMD1g5gzRBuGxlSxSLJ7UZM/TBt67xXK
         cXr6dQvdqDJQ4VAM+6Ea1/3g6/Ga7G6YLT4j2XhXfWL47KItZ/6xvyyO8hB36wif/DIw
         3YhA==
X-Gm-Message-State: AOJu0Yw/MyBSDhKOzKJWdfvC+y7JJRufcAbuUmJnTfsy76bS+wmPE0r3
	PbLPLMp4s1n97K059651Nq9fyLA16mSZ/uHW7spd/mNRKMH/7pyL5oXrJSlUM+CttIKjPsqVlga
	rS6vK5X43fP5+BWT+9p2ndy1Mgkw=
X-Google-Smtp-Source: AGHT+IGuFbAApvSbOg5yXJiirf6Bia9fhWXDN00XtoKuRKAO50ULAeM5sE/cP734kZ6h9OMNgd2qTKFwEmlqDYsGjtM=
X-Received: by 2002:a05:651c:1550:b0:2fb:955e:5c17 with SMTP id
 38308e7fff4ca-2ff2031a72cmr71956711fa.40.1731406253502; Tue, 12 Nov 2024
 02:10:53 -0800 (PST)
MIME-Version: 1.0
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com> <1731403483-21399-8-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1731403483-21399-8-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Nov 2024 11:10:42 +0100
Message-ID: <CANNYZj94X7MiF89e=PA=0cVjjh-L2nVdzWgOqu0hxiPCxXKyrg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 08/47] glslang: upgrade 1.3.290.0 -> 1.3.296.0
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 10:10:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207039

This needs to be updated in lockstep with all other vulkan recipes,
and the recipe has a comment about it.

Alex

On Tue, 12 Nov 2024 at 10:25, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-generate-glslang-pkg-config.patch
> refreshed for 1.3.296.0
>
> Changelog:
> ===========
> * Explicitly export all symbols that are part of the public API and hide other symbols by default
> * Allow building glslang without the SPIR-V backend using the new ENABLE_SPIRV build option
> * Add setResourceSetBinding method to the API
> * Add interface to get the GLSL IO mapper and resolver
> * Allow compute derivative modes when the workgroup dimensions are spec constants
> * Improve debug location of branch/return instructions
> * Silence preprocessor '#' error reporting in inactive #if/#ifdef/#elif/#else blocks
> * Apply GLSL memory decorations to top-level OpVariable
> * Move definition of GLSLANG_EXPORT to visibility.h
> * Merge ancillary libraries into main glslang library and stub originals
> * Add public setSourceFile and addSourceText methods to TShader class
> * Add type checks for hitObjectNV
> * Add optimizerAllowExpandedIDBound to SpvOptions
> * Add SpvTools.h back to public headers
> * Add cross-stage check for missing outputs
> * Fix HLSL offsets for non-buffers
> * Add types and functions for IO mapping to API
> * Add function to set preprocessed code to API
> * Add set/get version functions to API
> * Expose setGlobalUniform functions to API
> * Don't emit debug instructions before an OpPhi
> * Add command-line and API option to enable reporting column location for compiler errors
> * Improve location aliasing checks
> * Support constant expression calculated by matrixCompMult
> * Fix crash caused by atomicCounter() use without arguments
> * Fix multi-line function call line numbers
> * Add line info to OpDebugDeclare for function parameters
> * Fix HLSL OpDebugFunction file name
> * Fix duplicate decorations
> * Enable compilation of glslang without thread support for WASI
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../glslang/glslang/0001-generate-glslang-pkg-config.patch  | 6 +++---
>  .../glslang/{glslang_1.3.290.0.bb => glslang_1.3.296.0.bb}  | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-graphics/glslang/{glslang_1.3.290.0.bb => glslang_1.3.296.0.bb} (96%)
>
> diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
> index f8c0fc64c8..04dab67773 100644
> --- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
> +++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
> @@ -1,4 +1,4 @@
> -From 0311dfd63ea41abb45aaf0f4ccc674f574ce639e Mon Sep 17 00:00:00 2001
> +From df6111570ada81d3968043decb5eee16dc5f9fa1 Mon Sep 17 00:00:00 2001
>  From: Jose Quaresma <quaresma.jose@gmail.com>
>  Date: Sun, 7 Feb 2021 01:30:39 +0000
>  Subject: [PATCH] generate glslang pkg-config
> @@ -15,10 +15,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>   create mode 100644 glslang/glslang.pc.cmake.in
>
>  diff --git a/glslang/CMakeLists.txt b/glslang/CMakeLists.txt
> -index 8d4b1e9c..717c6d47 100644
> +index 47925d8d..d90191c3 100644
>  --- a/glslang/CMakeLists.txt
>  +++ b/glslang/CMakeLists.txt
> -@@ -235,6 +235,8 @@ if(GLSLANG_ENABLE_INSTALL)
> +@@ -255,6 +255,8 @@ if(GLSLANG_ENABLE_INSTALL)
>           install(TARGETS MachineIndependent EXPORT glslang-targets)
>           install(TARGETS GenericCodeGen EXPORT glslang-targets)
>       endif()
> diff --git a/meta/recipes-graphics/glslang/glslang_1.3.290.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.296.0.bb
> similarity index 96%
> rename from meta/recipes-graphics/glslang/glslang_1.3.290.0.bb
> rename to meta/recipes-graphics/glslang/glslang_1.3.296.0.bb
> index d6ee46de1e..3b66e3544c 100644
> --- a/meta/recipes-graphics/glslang/glslang_1.3.290.0.bb
> +++ b/meta/recipes-graphics/glslang/glslang_1.3.296.0.bb
> @@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
>  LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
>
> -SRCREV = "fa9c3deb49e035a8abcabe366f26aac010f6cbfb"
> +SRCREV = "46ef757e048e760b46601e6e77ae0cb72c97bd2f"
>  SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
>             file://0001-generate-glslang-pkg-config.patch \
>             "
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206994): https://lists.openembedded.org/g/openembedded-core/message/206994
> Mute This Topic: https://lists.openembedded.org/mt/109531965/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

