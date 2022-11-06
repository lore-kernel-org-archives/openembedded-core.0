Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7414C41535
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:18:01 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.16492.1667744273544611822
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:17:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=PsOdvSiu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id k7so8921666pll.6
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QU+PCLhze4ExYZfPzeTCDM9HvAL3M8mJHEgkRLZSWoM=;
        b=PsOdvSiuXKtf0X400g4qkfWUOjajQigRL6IFqfAiLP7b4e4L4aLbnWpO3NYphVuwAb
         RG46e1dfxuDFPyJ39zoOX7kkj5THX42Xc8uCnsEwHs2YIfpdEbuyj0P9h5us7jG+R8OK
         o6G3w9sriK8x8MWEPQTDiKScWI/u0xwd1RMgCfKSPWyjh483naem7iUHPUyoUIdF/tzN
         DlDHhnWtvOJXMVSPnoEkx5rauta3cSamLOsa1df5TzXfAw9Hy1QeVGdr/O1d664kk5tV
         oa/Ut6LqcCDnM/7DOUTATjUx0J6/4mD9F3JaTPB/yjXTaYOse6jF+B4T112pWP3K2bSA
         s+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QU+PCLhze4ExYZfPzeTCDM9HvAL3M8mJHEgkRLZSWoM=;
        b=dv3+WZOLxWZzljsSMi50By8wbOp2x+4JUzgZ7A7Z95i/MEBfTj72qCxlswwts1tWnM
         EgLZb3kcLjr6tW7TGMEDbMyV59S7eTirZ3UEgkMBlzsNt2J5F72KBqFsXrUAitDLvWt9
         sOM5ZRQe4GdTJJNUucQBeLz/MltFb0BwV8TaTvWazC7rPE/znMql1sTYpG32EqW4yeYH
         nCMEiH9Lunjge+72P7ChvdHFAt0da54xCNe5FJca30CoDK/ndyTkwLFJYevoYKwbwYoK
         K+Eb1YyAUcJvuLl3ro8foatA7+TcibjctSad/5Em70xutcs8ohB//i6HdqjsXsKafwUv
         rnnQ==
X-Gm-Message-State: ACrzQf2IsrEPKelVyOLiH/p2XsoYdB5cIBC4UhGYC2+QSwuCwmXZYmTI
	HuClv3ja77oNppMwQXZAfy0/sT/VY/7GYhj9
X-Google-Smtp-Source: AMsMyM4faQe9LIRwrt46D1Y2iT8SHFz9XS71qNRDHmLg8zSz0OccFIESCeEjGCFFDe5YbDm5YpbXxA==
X-Received: by 2002:a17:90b:4a02:b0:213:9ba4:206a with SMTP id kk2-20020a17090b4a0200b002139ba4206amr48464277pjb.102.1667744272593;
        Sun, 06 Nov 2022 06:17:52 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.17.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:17:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 11/34] mesa: update 22.2.0 -> 22.2.2
Date: Sun,  6 Nov 2022 04:16:54 -1000
Message-Id: <a68121557f72ebccc92adaec0df2b43abe11869d.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172779

From: Markus Volk <f_l_k@t-online.de>

Mesa 22.2.2 is a bug fix release which fixes bugs found since the 22.2.1 release.

New features

None

Bug fixes

radv: Crash in dEQP-VK.ray_query.misc.dynamic_indexing
glthread: radeonsi: offset textures in game starsector with glthread enabled
Crashing on Windows VM
Exanima renders with the wrong colors.
nouveau: tegra124: GL_OUT_OF_MEMORY error

Changes

freedreno: Fix graphic glitches on a4xx and a5xx
nir/lower_system_values: Fix cs_local_index_to_id with variable workgroups
pan/mdg: Lower PIPE_COMPUTE_CAP_MAX_THREADS_PER_BLOCK on Midgard
pan/mdg: Fix 16-bit alignment with spiller
nir: Fix nir_fmax_abs_vec_comp
gallium/vl: Add opaque rgb pixel formats
aco/spill: Fix spilling of Phi operands
tu: Reset whether there is DS resolve for dynamic subpass
gallivm: handle llvm coroutines for llvm > 15
nouveau: treat DRM_FORMAT_INVALID as implicit modifier
docs: Add sha256 sum for 22.2.1
.pick_status.json: Update to 243aa6b2ec0c2626b1333ba666a6d6d60ede8505
.pick_status.json: Update to c4482a3c1a973975eb27ac284a18bebca24f7876
.pick_status.json: Update to 3eed5931edf6e5f45378b013ca21f98f17af2b34
.pick_status.json: Update to b02e9ef35a0446019cda9473e4c355c7cc4bb24d
.pick_status.json: Mark 4c7a44413a07d3fb314f786e047bb7212c082a6c as denominated
.pick_status.json: Mark dbd022f2ab43ff0a9ecc05c61123467e25f109de as backported
turnip: Don’t use the dynamic color write enable during non-dynamic.
gallium/u_threaded_context: remove stale comment
r300: don’t use smooth line if not requested
r600/sfn: Always start a new CF after a KILL instruction
r600/sfn: don’t propagate registers into conditional test
virgl: Report CONSTANT_BUFFER_SIZE according to GL_MAX_UNIFORM_BLOCK_SIZE
vulkan/runtime: don’t lookup the pipeline disk cache if disabled
anv: initialization pipeline layout to 0s
anv: add missing tracepoint
clc/clover: Link clang statically when shared-llvm is disabled
zink: clamp line_stipple_factor to 1 if stipple is disabled
zink: unset rp_changed after initializing renderpass attachments
zink: disable fbfetch when flushing clears
vulkan/wsi: Add dep_libudev to idep dependencies
gallium/va: vaDeriveImage to check PIPE_VIDEO_SUPPORTS_CONTIGUOUS_PLANES_MAP
d3d12: Implement cap PIPE_VIDEO_SUPPORTS_CONTIGUOUS_PLANES_MAP
zink: fix invalid Offset set for variables which do not need an offset
zink: stop enabling minmax filtering when not supported
zink: fix isNan mismatch between NIR and SPIR-V
util/conf: enable init to zero workaround for Exanima
util/radeonsi: enable zerovram workaround for Exanima
radv: add radv_zero_vram workarounds for OpenGL games
glthread: fix matrix stack depth tracking
glthread: leave dlist dispatch in place for Begin/End
util: Turn -DWINDOWS_NO_FUTEX to be pre_args

- add a PACKAGECONFIG for perfetto support

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cbcaff0b4cc349706b9847f4262746b43adba209)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mesa/{mesa-gl_22.2.0.bb => mesa-gl_22.2.2.bb}             | 0
 meta/recipes-graphics/mesa/mesa.inc                           | 4 +++-
 meta/recipes-graphics/mesa/{mesa_22.2.0.bb => mesa_22.2.2.bb} | 0
 3 files changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_22.2.0.bb => mesa-gl_22.2.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_22.2.0.bb => mesa_22.2.2.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.2.0.bb b/meta/recipes-graphics/mesa/mesa-gl_22.2.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_22.2.0.bb
rename to meta/recipes-graphics/mesa/mesa-gl_22.2.2.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c94e439363..78ac0964f6 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -24,7 +24,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
 # required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BUILD enabled
 SRC_URI:append:class-native = " file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch"
 
-SRC_URI[sha256sum] = "b1f9c8fd08f2cae3adf83355bef4d2398e8025f44947332880f2d0066bdafa8c"
+SRC_URI[sha256sum] = "2de11fb74fc5cc671b818e49fe203cea0cd1d8b69756e97cdb06a2f4e78948f9"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
@@ -181,6 +181,8 @@ PACKAGECONFIG[vulkan-beta] = "-Dvulkan-beta=true,-Dvulkan-beta=false"
 
 PACKAGECONFIG[osmesa] = "-Dosmesa=true,-Dosmesa=false"
 
+PACKAGECONFIG[perfetto] = "-Dperfetto=true,-Dperfetto=false,libperfetto"
+
 PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
 
 PACKAGECONFIG[lmsensors] = "-Dlmsensors=enabled,-Dlmsensors=disabled,lmsensors"
diff --git a/meta/recipes-graphics/mesa/mesa_22.2.0.bb b/meta/recipes-graphics/mesa/mesa_22.2.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_22.2.0.bb
rename to meta/recipes-graphics/mesa/mesa_22.2.2.bb
-- 
2.25.1


