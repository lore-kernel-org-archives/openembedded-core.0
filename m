Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D273ECAAA1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 16:15:05 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.13716.1661876094211873631
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 09:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=B71dYLj3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EEEE6FF811;
	Tue, 30 Aug 2022 16:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661876092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9krqT5J54vMAHt59lE61XL+mJ/JfhtiTnzv8A3+r41g=;
	b=B71dYLj3aB5ACBY/OG8BBuA2kebV2UsqThw9i/VSDQyymILQ3zUOiXSg7mKFbMd3XnsvXr
	7US7XF1zgeQxtiPIPINkvGAyUs5t9JbnglCs2hoSblPDJFRy/ui4dsHhs72wr0Mr3OYn2/
	Bw5YOH3sGjC2TlASZIkn8TdK/57TgrahzEZQ5pLWZ66rw77Dq/j/iMqvJIBYGQNIV29A2p
	Ik10um6Ka33tW/5QHYKbpjXa8N7LMF1TMRVseozHx0e3VXY0uK1e/XJx+hIgBZRnKchibe
	mspofOdWXZNUwV48M+UYDyABasv8jZqIIlCFpOXsGH3VIAIWG6ryUVCqNlJzIg==
Date: Tue, 30 Aug 2022 18:14:51 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] vulkan: upgrade 1.3.216.0 -> 1.3.224.1
Message-ID: <Yw43e4yLyrvwB4fE@mail.local>
References: <1661849990-14381-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1661849990-14381-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 16:15:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170077

This fails on the autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5828/steps/11/logs/stdio

On 30/08/2022 16:59:50+0800, wangmy wrote:
> spirv-tools:
>  0001-Remove-default-copy-constructor-in-header.-4879.patch
>  removed since it's included in 1.3.224.1
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...lang_1.3.216.0.bb => glslang_1.3.224.1.bb} |  2 +-
>  ....3.216.0.bb => spirv-headers_1.3.224.1.bb} |  0
>  ...ult-copy-constructor-in-header.-4879.patch | 34 -------------------
>  ..._1.3.216.0.bb => spirv-tools_1.3.224.1.bb} |  6 ++--
>  ...3.216.0.bb => vulkan-headers_1.3.224.1.bb} |  2 +-
>  ....3.216.0.bb => vulkan-loader_1.3.224.1.bb} |  4 +--
>  ...1.3.216.0.bb => vulkan-tools_1.3.224.1.bb} |  2 +-
>  7 files changed, 7 insertions(+), 43 deletions(-)
>  rename meta/recipes-graphics/glslang/{glslang_1.3.216.0.bb => glslang_1.3.224.1.bb} (95%)
>  rename meta/recipes-graphics/spir/{spirv-headers_1.3.216.0.bb => spirv-headers_1.3.224.1.bb} (100%)
>  delete mode 100644 meta/recipes-graphics/spir/spirv-tools/0001-Remove-default-copy-constructor-in-header.-4879.patch
>  rename meta/recipes-graphics/spir/{spirv-tools_1.3.216.0.bb => spirv-tools_1.3.224.1.bb} (88%)
>  rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.216.0.bb => vulkan-headers_1.3.224.1.bb} (93%)
>  rename meta/recipes-graphics/vulkan/{vulkan-loader_1.3.216.0.bb => vulkan-loader_1.3.224.1.bb} (94%)
>  rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.216.0.bb => vulkan-tools_1.3.224.1.bb} (96%)
> 
> diff --git a/meta/recipes-graphics/glslang/glslang_1.3.216.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.224.1.bb
> similarity index 95%
> rename from meta/recipes-graphics/glslang/glslang_1.3.216.0.bb
> rename to meta/recipes-graphics/glslang/glslang_1.3.224.1.bb
> index 69d9a0a84e..dd8df15fc7 100644
> --- a/meta/recipes-graphics/glslang/glslang_1.3.216.0.bb
> +++ b/meta/recipes-graphics/glslang/glslang_1.3.224.1.bb
> @@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
>  LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
>  
> -SRCREV = "adbf0d3106b26daa237b10b9bf72b1af7c31092d"
> +SRCREV = "10423ec659d301a0ff2daac8bbf38980abf27590"
>  SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=master \
>             file://0001-generate-glslang-pkg-config.patch"
>  PE = "1"
> diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.224.1.bb
> similarity index 100%
> rename from meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb
> rename to meta/recipes-graphics/spir/spirv-headers_1.3.224.1.bb
> diff --git a/meta/recipes-graphics/spir/spirv-tools/0001-Remove-default-copy-constructor-in-header.-4879.patch b/meta/recipes-graphics/spir/spirv-tools/0001-Remove-default-copy-constructor-in-header.-4879.patch
> deleted file mode 100644
> index 044c366a75..0000000000
> --- a/meta/recipes-graphics/spir/spirv-tools/0001-Remove-default-copy-constructor-in-header.-4879.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From a90ccc240501bf3362b23f67771f65b7dec2ccf9 Mon Sep 17 00:00:00 2001
> -From: Jamie Madill <jmadill@chromium.org>
> -Date: Fri, 29 Jul 2022 14:26:37 -0400
> -Subject: [PATCH] Remove default copy constructor in header. (#4879)
> -
> -A recent libc++ roll in Chrome warned of a deprecated copy. We're
> -still looking if this is a bug in libc++ or a valid warning, but
> -removing the redundant line is a safe workaround or fix in either
> -case.
> -
> -See discussion in https://crrev.com/c/3791771
> -
> -Upstream-Status: Backport [https://github.com/KhronosGroup/SPIRV-Tools/pull/4879]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - source/opt/merge_return_pass.h | 2 --
> - 1 file changed, 2 deletions(-)
> -
> -diff --git a/source/opt/merge_return_pass.h b/source/opt/merge_return_pass.h
> -index a35cf269..d15db2f6 100644
> ---- a/source/opt/merge_return_pass.h
> -+++ b/source/opt/merge_return_pass.h
> -@@ -118,8 +118,6 @@ class MergeReturnPass : public MemPass {
> -     StructuredControlState(Instruction* break_merge, Instruction* merge)
> -         : break_merge_(break_merge), current_merge_(merge) {}
> - 
> --    StructuredControlState(const StructuredControlState&) = default;
> --
> -     bool InBreakable() const { return break_merge_; }
> -     bool InStructuredFlow() const { return CurrentMergeId() != 0; }
> - 
> --- 
> -2.37.2
> -
> diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb
> similarity index 88%
> rename from meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb
> rename to meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb
> index fc1074d8b8..cfea28a6ef 100644
> --- a/meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb
> +++ b/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb
> @@ -7,10 +7,8 @@ SECTION = "graphics"
>  LICENSE  = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>  
> -SRCREV = "c94501352d545e84c821ce031399e76d1af32d18"
> -SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https \
> -           file://0001-Remove-default-copy-constructor-in-header.-4879.patch \
> -          "
> +SRCREV = "5e61ea2098220059e89523f1f47b0bcd8c33b89a"
> +SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https"
>  PE = "1"
>  UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
>  S = "${WORKDIR}/git"
> diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb
> similarity index 93%
> rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb
> rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb
> index 5f7917ae82..8d34738ad7 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb
> @@ -11,7 +11,7 @@ LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
>  SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
>  
> -SRCREV = "3ef4c97fd6ea001d75a8e9da408ee473c180e456"
> +SRCREV = "c896e2f920273bfee852da9cca2a356bc1c2031e"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb
> similarity index 94%
> rename from meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb
> rename to meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb
> index 15a079879b..f24db87962 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb
> @@ -9,8 +9,8 @@ SECTION = "libs"
>  
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
> -SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.3.216;protocol=https"
> -SRCREV = "322f7e3212b4fd9d70d7f48972963c83d24d06e4"
> +SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.3.224;protocol=https"
> +SRCREV = "09afdf64210b11ec653a1001e013b5af4fce8559"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.224.1.bb
> similarity index 96%
> rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb
> rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.224.1.bb
> index e26f4504f1..bed10afef1 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.224.1.bb
> @@ -7,7 +7,7 @@ SECTION = "libs"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
>  SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=master;protocol=https"
> -SRCREV = "ef9db7a8ec52f6c56158d83f5d57ef388c1abec1"
> +SRCREV = "497f232680b046db34ba9e9da065e6303a125851"
>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170068): https://lists.openembedded.org/g/openembedded-core/message/170068
> Mute This Topic: https://lists.openembedded.org/mt/93345010/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

