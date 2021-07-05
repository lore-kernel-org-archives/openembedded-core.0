Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.14446.1625510589277772029
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 11:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vTnaX6ax;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id t3so24693398edc.7
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 11:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ISvhGxOUUjeBKO/Utps67gPisCjGnpHFakUToxA+b5g=;
        b=vTnaX6axUpwSFuNZswxfT7EHE7K6+/ky0a25B9mjC5fBoUPJ2nHd42gKqNg9eyQqgc
         MlMfsXUOBx811gW2ryVlnffTGsUXp3r6SIm80v9ltv5sJZdjUwT4/ogxn24yF4y9mk3p
         n60bfjuzlA4vmzJPHwEkzKePq9awUlXdLhSVJ93h9Dt67Jgziida7tAkXUPEpgC3DsLG
         y45JImWIqabwqVF65UMXaEsbBgoz8RiRX2gy9WZwRNcDmCaHLia3KTU34RwDRjFosWn4
         Av1htnk6oAo9JHuiKf89o54esvDMJAI2EJMhAidtSNmxSaGzt9FMPpvu1+DOGRv52YjP
         rePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ISvhGxOUUjeBKO/Utps67gPisCjGnpHFakUToxA+b5g=;
        b=WVEhN6SM+UCQYXv4UfAG+4AOVnDMFyIzre6KZcQXEKV8qFO3cVpUv6bMYhm1C+UVNN
         6d1SQN8Zod+kzgomrOU54YbNrWFBfUQSg+mWSepRaxLJ8E94Ii4AnhuL4OJX7SL3+fDf
         gsaEcZ0PsZhAz1lwS6BcVCglRZXa9luc2g01pG4XyW+Ln/XrtI1vlqQiKSDyXQD0M5+L
         HI8Womi+UMlGJTaiLPvOCI4TU4EDNQNkOdaa8s8QHMVD1mbMxXAex5XOUOWdeuNQgucp
         erVq1JPBBEDv8VvToXjiT2yXcHMxtA6nYh/UwZJf1a1ZietOFYKfm2AqvqcAMUurGlbX
         3c2Q==
X-Gm-Message-State: AOAM533W5mD0E3+SiOo/nZGhz9FZOvv7nlwvQ7j/xcZuZBS2iy1Lv0HF
	qS9YlIBhvaU1ooASzKhu0BoTxcgXoRE=
X-Google-Smtp-Source: ABdhPJwN+9fdGkUbziDJsbJLx4Hpr8Rgq7pgJi9h+2FalxIjKvSF+eVwKH1KBXiJER1zBHLiHm+zEQ==
X-Received: by 2002:aa7:c34a:: with SMTP id j10mr9544144edr.86.1625510587845;
        Mon, 05 Jul 2021 11:43:07 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f3d403323b289d7a4d4d153.dip0.t-ipconnect.de. [2003:f0:7f3d:4033:23b2:89d7:a4d4:d153])
        by smtp.gmail.com with ESMTPSA id ec40sm5872578edb.57.2021.07.05.11.43.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 11:43:07 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] mesa: upgrade 21.1.3 -> 21.1.4
Date: Mon,  5 Jul 2021 20:42:58 +0200
Message-Id: <20210705184259.2125023-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210705184259.2125023-1-schnitzeltony@gmail.com>
References: <20210705184259.2125023-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Bug fixes
    * [anv] GravityMark (benchmark) crashes on ANV
    * [opengl] We happy few not being rendered correctly
    * Factorio: GPU hang when opening machine inventory
    * RuneScape on Mesa 21.1.1 (VEGA10) has bad performance and leaks memory
    * Supraland: flickering black bars on ground
    * radv: GPU hang in Cyberpunk 2077 on Big Navi
    * [amdgpu][renoir][rx5500m]: [drm:0xffffffff8198ad5e] *ERROR* ring gfx timeout, signaled seq=10952, emitted seq=10954
    * [spirv-fuzz] SPIR-V parsing FAILED: Invalid back or cross-edge in the CFG
    * panfrost Mount and Blade: Warband (glitches)
    * anv: dEQP-VK.robustness.robustness2*no_fmt_qual.null_descriptor.samples* fail

Changes
    * util/fossilize_db: Pull seek into lock.
    * util/fossilize_db: Split out reading the index.
    * util/fossilize_db: Do not lock the fossilize db permanently.
    * spirv: Fix handling of OpBranchConditional with same THEN and ELSE
    * nir/opt_if: Don’t split ALU for single block infinite loops
    * llvmpipe: Add handle export for resource_get_param
    * i965: fix regression in pipe control on g45
    * pick_status.json: Update to 977355c6e5efd781dde85d834172dd23cd4852f1
    * pick_status.json: Update to 40b67a292297606f0a7576e3ef4087028d5edd17
    * zink: do not unmap dt-buffers twice
    * zink: drop repeated usage-bit
    * zink: do not check buffer-format for usage-bits
    * zink: remove unused moltenvk functions
    * libgl-gdi: add missing include
    * aux/trace: fix bool argument
    * ci/windows: work around meson encoding issues
    * intel/fs: Teach IR about EOT instruction writing the accumulator implicitly on TGL+.
    * intel/fs: Fix synchronization of accumulator-clearing W/A move on TGL+.
    * pan/mdg: Add a bundle ID to instructions
    * pan/mdg: Reorder some code in mir_spill_register
    * pan/mdg: Fill from TLS before spilling non-SSA nodes
    * pan/mdg: Fix reading a spilt register in the bundle it’s written
    * pan/mdg: Add 16 bytes of padding to the end of shaders
    * intel/nir: Fix txs for null surfaces
    * spirv: Create acceleration structure and shader record variables
    * nv50/ir: fix surface lowering when values get shared accross operations
    * anv: Fix dynamic primitive topology for tess on Gfx7.x too
    * anv: allocate bigger batches as we grow command buffers
    * mesa: unreference zombie buffers when creating buffers to lower memory usage
    * compiler/glsl: Use mutex lock while freeing up mem_ctx
    * anv: fix dynamic primitive topology for tess
    * zink: handle custom border color without matching wrap mode case
    * radeonsi: skip instance_count==0 draws on <= GFX9
    * radeonsi: disable ngg culling on llvm < 12
    * radv: reject binding buffer/image when the device memory is too small
    * radv: always decompress both aspects of a depth/stencil image
    * amd/addrlib: remove Meson debug message()
    * radeon/vcn/enc: Add missing line to HEVC SPS header code
    * util: add work around for the game We Happy Few
    * ac/nir: Update TCS output barriers with nir_var_mem_shared.
    * radv/llvm: Emit s_barrier at the beginning of NGG non-GS shaders.
    * aco/gfx10: NGG zero output workaround for conservative rasterization.
    * aco/gfx10: Emit barrier at the start of NGG VS and TES.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../mesa/{mesa-gl_21.1.3.bb => mesa-gl_21.1.4.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_21.1.3.bb => mesa_21.1.4.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_21.1.3.bb => mesa-gl_21.1.4.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_21.1.3.bb => mesa_21.1.4.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.1.3.bb b/meta/recipes-graphics/mesa/mesa-gl_21.1.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_21.1.3.bb
rename to meta/recipes-graphics/mesa/mesa-gl_21.1.4.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index b7e42a9d7f..6a102585a1 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            "
 
-SRC_URI[sha256sum] = "cbe221282670875ffd762247b6a2c95dcee91d0a34c29802c75ef761fc891e69"
+SRC_URI[sha256sum] = "1f177f44098164b65731c5ded4c928fd58b14f6c9d2087aa0e37bc79bf79e90b"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.1.3.bb b/meta/recipes-graphics/mesa/mesa_21.1.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_21.1.3.bb
rename to meta/recipes-graphics/mesa/mesa_21.1.4.bb
-- 
2.31.1

