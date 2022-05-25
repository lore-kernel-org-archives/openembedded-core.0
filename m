Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 16/19] mesa: upgrade 22.0.2 -> 22.0.3
Date: Wed, 25 May 2022 04:29:44 -1000
Message-Id: <4bd58b513132cbc855df644faf8be3728c242ae9.1653488418.git.steve@sakoman.com>
In-Reply-To: <cover.1653488418.git.steve@sakoman.com>
References: <cover.1653488418.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Alexander Kanavin <alex.kanavin@gmail.com>

Mesa 22.0.3 is a bug fix release

New features:

None

Bug fixes:

freedreno: fragile location packing can break cull/clip distance
turnip: dEQP-VK.spirv_assembly.instruction.compute.float_controls.fp16.generated_args.* failures
piglit ext_image_dma_buf_import.ext_image_dma_buf_import* regression
piglit ext_image_dma_buf_import.ext_image_dma_buf_import* regression
Grid Autosport via proton/vulkan: glitches on the grass on amdgpu, fine on amdgpu-pro
[Bisected] r600: Big performance regression on some games
Huge amount of anon_inode:sync_file file descriptor created
anv regressions from commit 57445adc891 “anv: Re-enable CCS_E on TGL+”
NIR validation failed after nir_opt_if
intel: integer_mad_hi / integer_mad_sat / integer_mul_hi produce invalid results
Aperture Desk Job rendering artifacts Intel TGL
intel: integer_sub_sat produces stack corruption / OpISubBorrow compilation issue
r300/rv530: “Black rendering” of Baldur’s Gate Dark Alliance in Xbox emulator CXBX-R under wine with Gallium Nine and RADEON_DEBUG=use_tgsi
radv/aco: xfb bug
Occasional flicker corruption in Rage 2, e.g. after loading, with ACO on RX 5700 XT
RADV: Quake 2 RTX v1.6.0 Corrupted Graphics
‘../src/amd/common/ac_surface.c:1575: void ac_copy_dcc_equation(const struct radeon_info *, ADDR2_COMPUTE_DCCINFO_OUTPUT *, struct gfx9_meta_equation *): assertion “dcc->equation.gfx9.num_bits <= ARRAY_SIZE(equation->u.gfx9.bit)” failed’

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2f5831ec66c6a7e7b0f21a63cc46307aa68c5b96)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mesa/{mesa-gl_22.0.2.bb => mesa-gl_22.0.3.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_22.0.2.bb => mesa_22.0.3.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_22.0.2.bb => mesa-gl_22.0.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_22.0.2.bb => mesa_22.0.3.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.0.2.bb b/meta/recipes-graphics/mesa/mesa-gl_22.0.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_22.0.2.bb
rename to meta/recipes-graphics/mesa/mesa-gl_22.0.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index f5a5c14e72..d7bce3a008 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-util-format-Check-for-NEON-before-using-it.patch \
            "
 
-SRC_URI[sha256sum] = "df4fa560dcce6680133067cd15b0505fc424ca703244ce9ab247c74d2fab6885"
+SRC_URI[sha256sum] = "9f2b30f5276a9abaf71aafc6979685e2636189de1a87aea2c9e69744a6d0ebb9"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_22.0.2.bb b/meta/recipes-graphics/mesa/mesa_22.0.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_22.0.2.bb
rename to meta/recipes-graphics/mesa/mesa_22.0.3.bb
-- 
2.25.1

