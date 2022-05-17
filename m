Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 08/31] mesa: upgrade 22.0.0 -> 22.0.2
Date: Tue, 17 May 2022 08:23:54 -1000
Message-Id: <34f6d4763fc3bad1382551fd863f96e556b5f6cc.1652811454.git.steve@sakoman.com>
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Alexander Kanavin <alex.kanavin@gmail.com>

Mesa 22.0.1 is a bug fix release which fixes bugs found since the 22.0.0 release:

freedreno: crash in PUBG
MSVC: Build failure in libmesa_util when targeting x86 32-bit
A crash in radeonsi driver
freedreno: deqp cts fails

Mesa 22.0.2 is a bug fix release which fixes bugs found since the 22.0.1 release:

Vulkan::Calling vkWaitForFences Timeout
Intel (CHT) - Uplink text rendering bugged out in Mesa 22.0
gen9atom gpu hang on dEQP-VK.spirv_assembly.instruction.graphics.float16.arithmetic_1
bad memory managment on panfrost RK3399 - cannot alocate more ram - fury unleashed
Broken rendering in Ryujinx on Tigerlake
intel: integer_mad_hi / integer_mad_sat / integer_mul_hi produce invalid results
Textures colors distortion in “Black Geyser: Couriers of Darkness” with radeonsi
ShaderStorageBlocksWriteAccess not set for spir-v shaders?
radeonsi dEQP-GLES3.functional.buffer.map.write.explicit_flush.* flake crashes
radv: nir validation error with invalid array access
Intel Iris Xe Geometry Flickering/Assets Disappearing
Rendering artifacts when playing Outer Wilds [Reproducible with latest ANV driver built from main]
Vulkan wsi leaks vk_sync object on every wsi_AcquireNextImageKHR call
panfrost(RK3399/T860): Emulationstation: broken, black or missing menus with v22.0.0
Plasma/KDE settings menus disappear on daily build
Square Artifacts Dragons Dogma
r300: Anmesia the dark descent corruption
Error compiling with LLVM-git/15

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f3e9444968fd47b3c8e0b2ee7b1b17f43a6bd56b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mesa/{mesa-gl_22.0.0.bb => mesa-gl_22.0.2.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_22.0.0.bb => mesa_22.0.2.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_22.0.0.bb => mesa-gl_22.0.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_22.0.0.bb => mesa_22.0.2.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.0.0.bb b/meta/recipes-graphics/mesa/mesa-gl_22.0.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_22.0.0.bb
rename to meta/recipes-graphics/mesa/mesa-gl_22.0.2.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index e8c07a4563..f5a5c14e72 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-util-format-Check-for-NEON-before-using-it.patch \
            "
 
-SRC_URI[sha256sum] = "e6c41928b5b9917485bd67cec22d15e62cad7a358bf4c711a647979987601250"
+SRC_URI[sha256sum] = "df4fa560dcce6680133067cd15b0505fc424ca703244ce9ab247c74d2fab6885"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_22.0.0.bb b/meta/recipes-graphics/mesa/mesa_22.0.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_22.0.0.bb
rename to meta/recipes-graphics/mesa/mesa_22.0.2.bb
-- 
2.25.1

