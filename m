Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DECACA5FF5
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 20:31:17 +0000 (UTC)
Received: from imap6.mcr3.codethink.co.uk (imap6.mcr3.codethink.co.uk [46.37.160.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27630.1791226771103143197
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 11:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@codethink.co.uk header.s=imap6-20260915 header.b=ZSAsHgOU;
 spf=pass (domain: codethink.co.uk, ip: 46.37.160.117, mailfrom: marcel.ziswiler@codethink.co.uk)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap6-20260915; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To; bh=mk0+XhPUHuiiK2ly46PXVNMJrXdszGgxOtC/0PbZNXo=; b=ZSAsHgOUIgxAwbOi
	GI3ZcizDhVBSWdf16DEw3ctiadYFtwb/2nMGF52Zfhq/YSgIZpVCmwvlS26a5QXNgnd2L5FghL7vu
	hsPPAVT+JmZIXa1751Y6N2jJDjb+ejogetPsyVIRIyrgp5h6lHYBdGMUXx0RvU2X1Pev1wTE0rUxA
	QUt9BnR5989td2c/kKpsXaH1Zk6RonkdQs8tIX8ljWhpJcTnt16N82JRAOJOvd4Wb9cyecRWQ3KKM
	v8oMwmE79os3ZthWbq6BejoBZ/LPIEYtRQFW2cx4llEts/xd6ySdITS+FVmRLpDxZ+qtOBzgLLpND
	rVWwOu8xJXAZ0clDYA==;
Received: from [10.17.2.146] (helo=toolbx.v.cablecom.net)
	by imap6.mcr3.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1xDnYI-00Fdbr-Pf; Mon, 05 Oct 2026 19:36:43 +0100
From: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
To: openembedded-core@lists.openembedded.org
Cc: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
Subject: [PATCH 1/2] mesa,mesa-tools-native: upgrade 26.2.3 -> 26.2.4
Date: Mon,  5 Oct 2026 20:36:26 +0200
Message-ID: <6aa07d3d439f56b58f6267c68103b737639cdb5e.1791224526.git.marcel.ziswiler@codethink.co.uk>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1791224526.git.marcel.ziswiler@codethink.co.uk>
References: <cover.1791224526.git.marcel.ziswiler@codethink.co.uk>
MIME-Version: 1.0
Sender: marcel.ziswiler@codethink.co.uk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 20:31:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247260

Mesa 26.2.3 Release Notes / 2026-09-16
======================================

Mesa 26.2.3 is a bug fix release which fixes bugs found since the 26.2.2
release.

Mesa 26.2.3 implements the OpenGL 4.6 API, but the version reported by
glGetString(GL_VERSION) or glGetIntegerv(GL_MAJOR_VERSION) /
glGetIntegerv(GL_MINOR_VERSION) depends on the particular driver being used.
Some drivers don't support all the features required in OpenGL 4.6. OpenGL
4.6 is **only** available if requested at context creation.
Compatibility contexts may report a lower version depending on each driver.

Mesa 26.2.3 implements the OpenCL 3.1 API, but the version reported by
the CL_DEVICE_VERSION, CL_DEVICE_NUMERIC_VERSION and
CL_DEVICE_OPENCL_C_ALL_VERSIONS
clGetDeviceInfo queries depends on the particular driver being used.

Mesa 26.2.3 implements the Vulkan 1.4 API, but the version reported by
the apiVersion property of the VkPhysicalDeviceProperties struct
depends on the particular driver being used.

SHA checksums
-------------

::

    SHA256: 1628058a8d2c0615975de5a15ab7bbb9638c50000b5bed9456ff423ea034a81f
    mesa-26.2.3.tar.xz
    SHA512: ec621735ae4679762ea27b979a5314c7aecfdd4165afea19c8c55f933d79b40f01fa
    041a95874fc4347e732ac565786d9b616a9aa8856a422204d9ecc9a12ec4
    mesa-26.2.3.tar.xz

New features
------------

- None

Bug fixes
---------

- NVK memory leak in CmdCopyBufferToImage in 26.2.0, 26.2.1 and 26.2.2.
- RADV: GPU page fault (null pointer) with RT emulation on Polaris (RX 580
  2048SP). Issue between 26.1.6 and 26.2.1
- [ANV][ARL][bisected] Visual graphics glitches in Counter-Strike 2 starting in
  Mesa 26.2.x
- [radeonsi] Minecraft Voxy mod: Distant water rendering issue on Vega iGPU and
  RDNA2
- \`hevc_vaapi` on AMD (radeonsi/gfx1150) stalls to ~1 fps when input frames
  carry A/53 (CEA-608/708) closed-caption side data
- anv: Test fails in simulation due to coarse pixel shading state
- asahi: 16-bit blending into RGBA32F produces zero due to 32-bit tilebuffer
  load
- asahi: Some textures do not render correctly in Portals 2
- libvulkan_intel.so crash with X-Plane 12.4.3 on Intel Arc B580
- nircache causes glxgears/eglgears to segfault under Zink
- vulkan,radv: when using descriptor heaps, input attachments in SPIR-V are
  incorrectly detected as read only instead of read write

Changes
-------

Alyssa Rosenzweig (1):
- mesa/st: fix incorrect VS input bases
Andrzej Datczuk (1):
- ac/sqtt, radv, radeonsi: Fix SQTT buffer size alignment issues
Benjamin Cheng (1):
- radeonsi: set stencil clear to 0 when enabling TC compat
Caio Oliveira (1):
- spirv: Preserve all fp_math_ctrl bits in vtn_handle_alu default case
Christian Gmeiner (2):

- etnaviv: Do not abort on unsupported stencil-only blits
- etnaviv: Use RS depth formats only on halti5+

Danylo Piliaiev (5):

- tu: Wait for XFB query writes to land before making it available
- tu: Synchronizing with CmdCopyQueryPoolResult should wait for mem writes
- tu: Use p_atomic_read to read from query's slot->available
- tu: Fix PACKED + alignas(8) application to the same struct on older GCC
- tu: Handle lazy memory in GetDeviceMemoryOpaqueCaptureAddress

David Rosca (2):

- va: Drop HEVC SEI parsing
- radv/video: Fix setting session parameters override info

Dmitry Baryshkov (8):

- ir3: keep byte SSBO offsets before a6xx
- freedreno/a5xx: only 2D-blit between compatible formats
- freedreno/a5xx: program NUMNONPOSVAR with position's VPC location
- freedreno/a4xx+a5xx: clamp the texture buffer size
- freedreno: keep the separate stencil out of the shadow blit
- freedreno/a5xx: blit the separate stencil plane too
- ir3: skip the phis of non-GPR registers in the minimum pressure bound
- freedreno/a5xx: bound blits by the layer count, not the depth

Emma Anholt (3):

- tu: Drop TRANSFER_SRC/DST from bufferFeatures.
- tu: Fix the sType of the returned VkFragmentShadingRateKHRs.
- tu: Fix destroy order of autotune vs perfcounters in failure path.

Eric Engestrom (4):

- docs: add sha sum for 26.2.2
- .pick_status.json: Update to 9f42ea1239025d3f93d9bbf7405340adcec94419
- .pick_status.json: Mark f45825a0c724d06f231a1210484fe9af71a3ffab as
  denominated
- .pick_status.json: Mark 859fcc3b74f831bbb9151f06d055ddfd45cc6e50 as
  denominated

Frank Binns (3):

- pvr: add missing GPU architecture to device info for some BVNCs
- pvr: fixup ordering of (has\_)usc_itr_parallel_instances in dev info
- zink: replace blend and vertex elements state hashes with IDs

Ganesh Belgur Ramachandra (1):
- amd: add gfx1171
Georg Lehmann (2):

- nir/opt_uub: fix imax optimization
- aco: avoid mubuf bounds checking for global

Iván Briano (1):
- anv: fix push constant range gathering for dynamic offsets
Jiyu Yang (1):
- clc: fix fd leak in open_clc_data() on map failure
Juston Li (1):
- anv/android: Don't disable AUX_BIT importing Xe2+ CCS mod images
Karmjit Mahil (1):
- tu: Fix sparse bind column merging
Karol Herbst (2):

- nir/serialize: set info.spec to NULL
- rusticl/event: properly implement CL

[Changelog truncated as it exceeds 5000 characters;
the full changelog can be found in an attachment to the AUH email]

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
---
 ...-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch | 2 +-
 ...0001-freedreno-don-t-encode-build-path-into-binaries.patch | 2 +-
 .../0001-meson-misdetects-64bit-atomics-on-mips-clang.patch   | 2 +-
 ...src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch | 2 +-
 ...src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch | 2 +-
 meta/recipes-graphics/mesa/mesa.inc                           | 4 ++--
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch b/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
index 12002a2c037c..2b30c1b5c78f 100644
--- a/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
+++ b/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
@@ -1,4 +1,4 @@
-From 52293e90484f07b5186f2f1fa7de63da0f120122 Mon Sep 17 00:00:00 2001
+From b00409956cd1a58f1c676de9cbfd2c688ca3fc9f Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Thu, 13 Aug 2026 00:00:00 +0000
 Subject: [PATCH] addrlib: avoid __builtin_cpu_supports for avx2 detection
diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
index 7a00acbed383..d58027712486 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -1,4 +1,4 @@
-From fd5571e22fd18b855199f23731f035927067a2a2 Mon Sep 17 00:00:00 2001
+From a61daaf354bd84dfa849f8da6028ddc71f1af7dc Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Date: Wed, 10 Dec 2025 02:27:16 +0200
 Subject: [PATCH] freedreno: don't encode build path into binaries
diff --git a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
index dc0957d8e2d5..77a0ba3d8ba7 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From c1a89a08629f9e576e136dc044c0ed8a2b67d92f Mon Sep 17 00:00:00 2001
+From c3a359d39e387e785883cb740934a0dc4e6376db Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
diff --git a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
index 36456cc3b153..b923c4c1fb8b 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
@@ -1,4 +1,4 @@
-From f0c1b4e5480bb4118326a339a3a7084df1a6b0b7 Mon Sep 17 00:00:00 2001
+From ccfa5a6555f6eb035ace12cba1ce3e785a47895f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 14 Jun 2026 17:42:19 +0200
 Subject: [PATCH] src/intel/compiler/jay/jay_ir.h: do not used typed enum
diff --git a/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch b/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
index aac42083c46e..0d0fdace2ccf 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
@@ -1,4 +1,4 @@
-From 56dbc838e42d920506f0f119a65a1faf0cf7b3cc Mon Sep 17 00:00:00 2001
+From 89c46de92e974202c1cabce25bb4d9441830b8b6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 1 Jul 2026 22:48:15 +0200
 Subject: [PATCH] src/util/u_math.c: do not use arm fpu instructions if fpu is
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 1154d511d975..b0ae5016de1a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,8 +22,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch \
            "
 
-SRC_URI[sha256sum] = "1628058a8d2c0615975de5a15ab7bbb9638c50000b5bed9456ff423ea034a81f"
-PV = "26.2.3"
+SRC_URI[sha256sum] = "bce5f7fbebb934373b86c999a064d52fb5065878dc57f287f95346648ec832e9"
+PV = "26.2.4"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.53.0


