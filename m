Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DEA9C982D2
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 07:10:08 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33827.1789629007794365371
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 00:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ETEXMXOJ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OJAMEfA4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a0ae3383dc-ce04a6a4-f9f4-4e1a-9c8e-07f97f4a9b9d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789629007;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=+YYQ4QWZuSyYynOWtpuPPNW3xkyPldst2GroIpW6rQY=;
	b=ETEXMXOJ1+TnREuHxzEfwrk99Cpfw43bMsuy5u+/B5QI+CbjbLQPYa/LVEYGEKuh
	vHEDcRddtIUEIsQsvvCmZuTavsoxj0efMNdlev7YfauRUMnhUtx5mbXD/j+z5uVBS1j
	SeyLxBjsefG7guLjM2FqyBlCZ+8545kZXloh/2QE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789629007;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=+YYQ4QWZuSyYynOWtpuPPNW3xkyPldst2GroIpW6rQY=;
	b=OJAMEfA4dEghXs+FhGCncsFpHVM9I121BKGnccsXot0X30gFoZqtKUgHEGxfAHLq
	nqjPvZK4O7oc6K+dPe+q592IEGpfJaIO7swM63vgxNl3NdHaQv/qAEViiXtAAApW3RC
	KrPE0cCktsJ5OWKNUXzoihflbyiqNqEonbv38h+4=
Content-Type: multipart/mixed; boundary="===============0039174722543131915=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa,mesa-tools-native: upgrading to 26.2.3,26.2.3 SUCCEEDED
Message-ID: <010101a0ae3383dc-ce04a6a4-f9f4-4e1a-9c8e-07f97f4a9b9d-000000@us-west-2.amazonses.com>
Date: Thu, 17 Sep 2026 07:10:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.17-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 07:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246029

--===============0039174722543131915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mesa,mesa-tools-native* to *26.2.3,26.2.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-mesa-tools-native-upgrade-26.2.2-26.2.3-26.2.2-.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 28d0010669d162db1f3fb4b4f5c0c9c217103041 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 17 Sep 2026 05:22:28 +0000
Subject: [PATCH] mesa,mesa-tools-native: upgrade 26.2.2 -> 26.2.3,26.2.2 ->
 26.2.3

Source: docs/relnotes/26.2.2.rst, docs/relnotes/26.2.3.rst

Mesa 26.2.2 Release Notes / 2026-09-02
======================================

Mesa 26.2.2 is a bug fix release which fixes bugs found since the 26.2.1 release.

Mesa 26.2.2 implements the OpenGL 4.6 API, but the version reported by
glGetString(GL_VERSION) or glGetIntegerv(GL_MAJOR_VERSION) /
glGetIntegerv(GL_MINOR_VERSION) depends on the particular driver being used.
Some drivers don't support all the features required in OpenGL 4.6. OpenGL
4.6 is **only** available if requested at context creation.
Compatibility contexts may report a lower version depending on each driver.

Mesa 26.2.2 implements the OpenCL 3.1 API, but the version reported by
the CL_DEVICE_VERSION, CL_DEVICE_NUMERIC_VERSION and CL_DEVICE_OPENCL_C_ALL_VERSIONS
clGetDeviceInfo queries depends on the particular driver being used.

Mesa 26.2.2 implements the Vulkan 1.4 API, but the version reported by
the apiVersion property of the VkPhysicalDeviceProperties struct
depends on the particular driver being used.

SHA checksums
-------------

::

    SHA256: eeb29ca7e56cfaa8e8a79538dcf834e3b18e501c31bef5145e959ea437cc4216  mesa-26.2.2.tar.xz
    SHA512: 55b1234c8653dad9b85ba3de7b777a0d957909baf4628f0c00e21d4ba89c004cb687a1dcf8da46ed0a092231dd4f859027509f83ad8c558750845ba470902615  mesa-26.2.2.tar.xz

New features
------------

- None

Bug fixes
---------

- 26.2.x build fails with armhf
- Confidential issue #15052
- GL stencil reference query does not update immediately
- Mesa 26.2.1: radeonsi no longer loads for GCN1 / Pitcairn when using radeon driver.
- Textures got swapped/glitched on Wuthering Waves game.
- [Navi10][RadeonSI/RADV] NGG culling causes nondeterministic GPU hangs; nonggc fixes both OpenGL and Vulkan
- [radv][bisected][regression] Broken rendering in Persona 3 Reload menu on RDNA2 in gamescope
- radv ignores count of 0 in vkCmdDrawIndirect

Changes
-------

Allen Ballway (1):

- anv: Fix ASTC emulation sync in CopyMemoryToImage

Ashley Smith (1):

- pan/bifrost: Fix shader clock selection

Benjamin Cheng (1):

- mesa/main: Add extra_new_buffers for STENCIL_REF

Christian Gmeiner (2):

- etnaviv: Program the i2i destination type in src1
- etnaviv: nir: Call nir_opt_combine_stores(..)

Dave Airlie (1):

- nir: move load_ssbo_address to taking variable size src0

David Rosca (6):

- va: Compare file descriptions to deduplicate objects when exporting surface
- va: Parse all HEVC slice NAL unit types
- va: Parse HEVC encode slice_temporal_mvp_enabled_flag
- va: Fix parsing HEVC decode slice_temporal_mvp_enabled_flag
- va: Fix parsing HEVC VPS timing info
- radeonsi/mm: Fix VCN encode allowed_max_bitstream_size

Dmitry Baryshkov (3):

- turnip: scale the transform feedback counter offset on a6xx
- freedreno/a6xx: subtract the transform feedback buffer offset in CP_DRAW_AUTO
- nv30: fix abs source modifier on fragment program sources 1 and 2

Dominique Belhachemi (1):

- pco: fix compile failure for arrayLength() on

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]

Source: docs/relnotes/26.2.2.rst, docs/relnotes/26.2.3.rst

Mesa 26.2.2 Release Notes / 2026-09-02
======================================

Mesa 26.2.2 is a bug fix release which fixes bugs found since the 26.2.1 release.

Mesa 26.2.2 implements the OpenGL 4.6 API, but the version reported by
glGetString(GL_VERSION) or glGetIntegerv(GL_MAJOR_VERSION) /
glGetIntegerv(GL_MINOR_VERSION) depends on the particular driver being used.
Some drivers don't support all the features required in OpenGL 4.6. OpenGL
4.6 is **only** available if requested at context creation.
Compatibility contexts may report a lower version depending on each driver.

Mesa 26.2.2 implements the OpenCL 3.1 API, but the version reported by
the CL_DEVICE_VERSION, CL_DEVICE_NUMERIC_VERSION and CL_DEVICE_OPENCL_C_ALL_VERSIONS
clGetDeviceInfo queries depends on the particular driver being used.

Mesa 26.2.2 implements the Vulkan 1.4 API, but the version reported by
the apiVersion property of the VkPhysicalDeviceProperties struct
depends on the particular driver being used.

SHA checksums
-------------

::

    SHA256: eeb29ca7e56cfaa8e8a79538dcf834e3b18e501c31bef5145e959ea437cc4216  mesa-26.2.2.tar.xz
    SHA512: 55b1234c8653dad9b85ba3de7b777a0d957909baf4628f0c00e21d4ba89c004cb687a1dcf8da46ed0a092231dd4f859027509f83ad8c558750845ba470902615  mesa-26.2.2.tar.xz

New features
------------

- None

Bug fixes
---------

- 26.2.x build fails with armhf
- Confidential issue #15052
- GL stencil reference query does not update immediately
- Mesa 26.2.1: radeonsi no longer loads for GCN1 / Pitcairn when using radeon driver.
- Textures got swapped/glitched on Wuthering Waves game.
- [Navi10][RadeonSI/RADV] NGG culling causes nondeterministic GPU hangs; nonggc fixes both OpenGL and Vulkan
- [radv][bisected][regression] Broken rendering in Persona 3 Reload menu on RDNA2 in gamescope
- radv ignores count of 0 in vkCmdDrawIndirect

Changes
-------

Allen Ballway (1):

- anv: Fix ASTC emulation sync in CopyMemoryToImage

Ashley Smith (1):

- pan/bifrost: Fix shader clock selection

Benjamin Cheng (1):

- mesa/main: Add extra_new_buffers for STENCIL_REF

Christian Gmeiner (2):

- etnaviv: Program the i2i destination type in src1
- etnaviv: nir: Call nir_opt_combine_stores(..)

Dave Airlie (1):

- nir: move load_ssbo_address to taking variable size src0

David Rosca (6):

- va: Compare file descriptions to deduplicate objects when exporting surface
- va: Parse all HEVC slice NAL unit types
- va: Parse HEVC encode slice_temporal_mvp_enabled_flag
- va: Fix parsing HEVC decode slice_temporal_mvp_enabled_flag
- va: Fix parsing HEVC VPS timing info
- radeonsi/mm: Fix VCN encode allowed_max_bitstream_size

Dmitry Baryshkov (3):

- turnip: scale the transform feedback counter offset on a6xx
- freedreno/a6xx: subtract the transform feedback buffer offset in CP_DRAW_AUTO
- nv30: fix abs source modifier on fragment program sources 1 and 2

Dominique Belhachemi (1):

- pco: fix compile failure for arrayLength() on

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 ...-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch | 2 +-
 ...0001-freedreno-don-t-encode-build-path-into-binaries.patch | 2 +-
 .../0001-meson-misdetects-64bit-atomics-on-mips-clang.patch   | 2 +-
 ...src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch | 2 +-
 ...src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch | 2 +-
 meta/recipes-graphics/mesa/mesa.inc                           | 4 ++--
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch b/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
index ac88417081..12002a2c03 100644
--- a/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
+++ b/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
@@ -1,4 +1,4 @@
-From 229a8815750765d7125f0c7efe9c8d6216678bef Mon Sep 17 00:00:00 2001
+From 52293e90484f07b5186f2f1fa7de63da0f120122 Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Thu, 13 Aug 2026 00:00:00 +0000
 Subject: [PATCH] addrlib: avoid __builtin_cpu_supports for avx2 detection
diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
index 087930245f..7a00acbed3 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -1,4 +1,4 @@
-From 44f9c60f2ca4ce212c8cc3ba19e5adc357ebdad4 Mon Sep 17 00:00:00 2001
+From fd5571e22fd18b855199f23731f035927067a2a2 Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Date: Wed, 10 Dec 2025 02:27:16 +0200
 Subject: [PATCH] freedreno: don't encode build path into binaries
diff --git a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
index 39ebd01e23..dc0957d8e2 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From d0c3c71a0eebe72b822277e46ee2698bcc428d44 Mon Sep 17 00:00:00 2001
+From c1a89a08629f9e576e136dc044c0ed8a2b67d92f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
diff --git a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
index 1cee7ad4e0..36456cc3b1 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
@@ -1,4 +1,4 @@
-From 35ba9a2f6f5ffccca93aa430ef94cb174dd68ea5 Mon Sep 17 00:00:00 2001
+From f0c1b4e5480bb4118326a339a3a7084df1a6b0b7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 14 Jun 2026 17:42:19 +0200
 Subject: [PATCH] src/intel/compiler/jay/jay_ir.h: do not used typed enum
diff --git a/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch b/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
index a697b4c774..aac42083c4 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
@@ -1,4 +1,4 @@
-From 80a8cc93b8a4dca53ed11f9fd9b8065a55845bc3 Mon Sep 17 00:00:00 2001
+From 56dbc838e42d920506f0f119a65a1faf0cf7b3cc Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 1 Jul 2026 22:48:15 +0200
 Subject: [PATCH] src/util/u_math.c: do not use arm fpu instructions if fpu is
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 9927d80b22..1154d511d9 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,8 +22,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch \
            "
 
-SRC_URI[sha256sum] = "eeb29ca7e56cfaa8e8a79538dcf834e3b18e501c31bef5145e959ea437cc4216"
-PV = "26.2.2"
+SRC_URI[sha256sum] = "1628058a8d2c0615975de5a15ab7bbb9638c50000b5bed9456ff423ea034a81f"
+PV = "26.2.3"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============0039174722543131915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-26.2.2.so", added "/usr/lib/libgallium-26.2.3.so"
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-26.2.2.so moved to /usr/lib/libgallium-26.2.3.so

--===============0039174722543131915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="mesa-changelog.txt"

Q2hhbmdlbG9nIGZvciBtZXNhOiAyNi4yLjIgLT4gMjYuMi4zClNvdXJjZTogZG9jcy9yZWxub3Rl
cy8yNi4yLjIucnN0LCBkb2NzL3JlbG5vdGVzLzI2LjIuMy5yc3QKCk1lc2EgMjYuMi4yIFJlbGVh
c2UgTm90ZXMgLyAyMDI2LTA5LTAyCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09CgpNZXNhIDI2LjIuMiBpcyBhIGJ1ZyBmaXggcmVsZWFzZSB3aGljaCBmaXhlcyBidWdzIGZv
dW5kIHNpbmNlIHRoZSAyNi4yLjEgcmVsZWFzZS4KCk1lc2EgMjYuMi4yIGltcGxlbWVudHMgdGhl
IE9wZW5HTCA0LjYgQVBJLCBidXQgdGhlIHZlcnNpb24gcmVwb3J0ZWQgYnkKZ2xHZXRTdHJpbmco
R0xfVkVSU0lPTikgb3IgZ2xHZXRJbnRlZ2VydihHTF9NQUpPUl9WRVJTSU9OKSAvCmdsR2V0SW50
ZWdlcnYoR0xfTUlOT1JfVkVSU0lPTikgZGVwZW5kcyBvbiB0aGUgcGFydGljdWxhciBkcml2ZXIg
YmVpbmcgdXNlZC4KU29tZSBkcml2ZXJzIGRvbid0IHN1cHBvcnQgYWxsIHRoZSBmZWF0dXJlcyBy
ZXF1aXJlZCBpbiBPcGVuR0wgNC42LiBPcGVuR0wKNC42IGlzICoqb25seSoqIGF2YWlsYWJsZSBp
ZiByZXF1ZXN0ZWQgYXQgY29udGV4dCBjcmVhdGlvbi4KQ29tcGF0aWJpbGl0eSBjb250ZXh0cyBt
YXkgcmVwb3J0IGEgbG93ZXIgdmVyc2lvbiBkZXBlbmRpbmcgb24gZWFjaCBkcml2ZXIuCgpNZXNh
IDI2LjIuMiBpbXBsZW1lbnRzIHRoZSBPcGVuQ0wgMy4xIEFQSSwgYnV0IHRoZSB2ZXJzaW9uIHJl
cG9ydGVkIGJ5CnRoZSBDTF9ERVZJQ0VfVkVSU0lPTiwgQ0xfREVWSUNFX05VTUVSSUNfVkVSU0lP
TiBhbmQgQ0xfREVWSUNFX09QRU5DTF9DX0FMTF9WRVJTSU9OUwpjbEdldERldmljZUluZm8gcXVl
cmllcyBkZXBlbmRzIG9uIHRoZSBwYXJ0aWN1bGFyIGRyaXZlciBiZWluZyB1c2VkLgoKTWVzYSAy
Ni4yLjIgaW1wbGVtZW50cyB0aGUgVnVsa2FuIDEuNCBBUEksIGJ1dCB0aGUgdmVyc2lvbiByZXBv
cnRlZCBieQp0aGUgYXBpVmVyc2lvbiBwcm9wZXJ0eSBvZiB0aGUgVmtQaHlzaWNhbERldmljZVBy
b3BlcnRpZXMgc3RydWN0CmRlcGVuZHMgb24gdGhlIHBhcnRpY3VsYXIgZHJpdmVyIGJlaW5nIHVz
ZWQuCgpTSEEgY2hlY2tzdW1zCi0tLS0tLS0tLS0tLS0KCjo6CgogICAgU0hBMjU2OiBlZWIyOWNh
N2U1NmNmYWE4ZThhNzk1MzhkY2Y4MzRlM2IxOGU1MDFjMzFiZWY1MTQ1ZTk1OWVhNDM3Y2M0MjE2
ICBtZXNhLTI2LjIuMi50YXIueHoKICAgIFNIQTUxMjogNTViMTIzNGM4NjUzZGFkOWI4NWJhM2Rl
N2I3NzdhMGQ5NTc5MDliYWY0NjI4ZjBjMDBlMjFkNGJhODljMDA0Y2I2ODdhMWRjZjhkYTQ2ZWQw
YTA5MjIzMWRkNGY4NTkwMjc1MDlmODNhZDhjNTU4NzUwODQ1YmE0NzA5MDI2MTUgIG1lc2EtMjYu
Mi4yLnRhci54egoKTmV3IGZlYXR1cmVzCi0tLS0tLS0tLS0tLQoKLSBOb25lCgpCdWcgZml4ZXMK
LS0tLS0tLS0tCgotIDI2LjIueCBidWlsZCBmYWlscyB3aXRoIGFybWhmCi0gQ29uZmlkZW50aWFs
IGlzc3VlICMxNTA1MgotIEdMIHN0ZW5jaWwgcmVmZXJlbmNlIHF1ZXJ5IGRvZXMgbm90IHVwZGF0
ZSBpbW1lZGlhdGVseQotIE1lc2EgMjYuMi4xOiByYWRlb25zaSBubyBsb25nZXIgbG9hZHMgZm9y
IEdDTjEgLyBQaXRjYWlybiB3aGVuIHVzaW5nIHJhZGVvbiBkcml2ZXIuCi0gVGV4dHVyZXMgZ290
IHN3YXBwZWQvZ2xpdGNoZWQgb24gV3V0aGVyaW5nIFdhdmVzIGdhbWUuCi0gW05hdmkxMF1bUmFk
ZW9uU0kvUkFEVl0gTkdHIGN1bGxpbmcgY2F1c2VzIG5vbmRldGVybWluaXN0aWMgR1BVIGhhbmdz
OyBub25nZ2MgZml4ZXMgYm90aCBPcGVuR0wgYW5kIFZ1bGthbgotIFtyYWR2XVtiaXNlY3RlZF1b
cmVncmVzc2lvbl0gQnJva2VuIHJlbmRlcmluZyBpbiBQZXJzb25hIDMgUmVsb2FkIG1lbnUgb24g
UkROQTIgaW4gZ2FtZXNjb3BlCi0gcmFkdiBpZ25vcmVzIGNvdW50IG9mIDAgaW4gdmtDbWREcmF3
SW5kaXJlY3QKCkNoYW5nZXMKLS0tLS0tLQoKQWxsZW4gQmFsbHdheSAoMSk6CgotIGFudjogRml4
IEFTVEMgZW11bGF0aW9uIHN5bmMgaW4gQ29weU1lbW9yeVRvSW1hZ2UKCkFzaGxleSBTbWl0aCAo
MSk6CgotIHBhbi9iaWZyb3N0OiBGaXggc2hhZGVyIGNsb2NrIHNlbGVjdGlvbgoKQmVuamFtaW4g
Q2hlbmcgKDEpOgoKLSBtZXNhL21haW46IEFkZCBleHRyYV9uZXdfYnVmZmVycyBmb3IgU1RFTkNJ
TF9SRUYKCkNocmlzdGlhbiBHbWVpbmVyICgyKToKCi0gZXRuYXZpdjogUHJvZ3JhbSB0aGUgaTJp
IGRlc3RpbmF0aW9uIHR5cGUgaW4gc3JjMQotIGV0bmF2aXY6IG5pcjogQ2FsbCBuaXJfb3B0X2Nv
bWJpbmVfc3RvcmVzKC4uKQoKRGF2ZSBBaXJsaWUgKDEpOgoKLSBuaXI6IG1vdmUgbG9hZF9zc2Jv
X2FkZHJlc3MgdG8gdGFraW5nIHZhcmlhYmxlIHNpemUgc3JjMAoKRGF2aWQgUm9zY2EgKDYpOgoK
LSB2YTogQ29tcGFyZSBmaWxlIGRlc2NyaXB0aW9ucyB0byBkZWR1cGxpY2F0ZSBvYmplY3RzIHdo
ZW4gZXhwb3J0aW5nIHN1cmZhY2UKLSB2YTogUGFyc2UgYWxsIEhFVkMgc2xpY2UgTkFMIHVuaXQg
dHlwZXMKLSB2YTogUGFyc2UgSEVWQyBlbmNvZGUgc2xpY2VfdGVtcG9yYWxfbXZwX2VuYWJsZWRf
ZmxhZwotIHZhOiBGaXggcGFyc2luZyBIRVZDIGRlY29kZSBzbGljZV90ZW1wb3JhbF9tdnBfZW5h
YmxlZF9mbGFnCi0gdmE6IEZpeCBwYXJzaW5nIEhFVkMgVlBTIHRpbWluZyBpbmZvCi0gcmFkZW9u
c2kvbW06IEZpeCBWQ04gZW5jb2RlIGFsbG93ZWRfbWF4X2JpdHN0cmVhbV9zaXplCgpEbWl0cnkg
QmFyeXNoa292ICgzKToKCi0gdHVybmlwOiBzY2FsZSB0aGUgdHJhbnNmb3JtIGZlZWRiYWNrIGNv
dW50ZXIgb2Zmc2V0IG9uIGE2eHgKLSBmcmVlZHJlbm8vYTZ4eDogc3VidHJhY3QgdGhlIHRyYW5z
Zm9ybSBmZWVkYmFjayBidWZmZXIgb2Zmc2V0IGluIENQX0RSQVdfQVVUTwotIG52MzA6IGZpeCBh
YnMgc291cmNlIG1vZGlmaWVyIG9uIGZyYWdtZW50IHByb2dyYW0gc291cmNlcyAxIGFuZCAyCgpE
b21pbmlxdWUgQmVsaGFjaGVtaSAoMSk6CgotIHBjbzogZml4IGNvbXBpbGUgZmFpbHVyZSBmb3Ig
YXJyYXlMZW5ndGgoKSBvbiBub24tcG93ZXItb2YtdHdvIHN0cmlkZXMKCkVtbWEgQW5ob2x0ICg2
KToKCi0gZnJlZWRyZW5vL2lyMzogQWN0dWFsbHkgcGFzcyBjc19sb2NrX3VubG9ja19xdWlyayBp
bnRvIHRoZSBjb21waWxlci4KLSB0dTogRml4IFZLX1BJUEVMSU5FX0NSRUFUSU9OX0ZFRURCQUNL
X0FQUExJQ0FUSU9OX1BJUEVMSU5FX0NBQ0hFX0hJVF9CSVQuCi0gdHU6IEZpeCBzdGl0Y2hpbmcg
dG9nZXRoZXIgc2V0IGxheW91dHMgZnJvbSBncmFwaGljcyBwaXBlbGluZSBsaWJyYXJpZXMuCi0g
dHU6IEFkZCBtaXNzaW5nIHJlc2VydmF0aW9uIG9mIHRoZSBleHRyYSBzYWZlLWNvbnN0IFZQQyBz
dGF0ZSBmb3IgR1Nlcy4KLSB0dTogRml4IHRoZSBibG9jayB0ZXhlbCB2aWV3IGNoZWNrIGZvciBm
b3JjZV9kaXNhYmxlX2xpbmVhcl9mYWxsYmFjay4KLSB0dTogUHVibGlzaCBwcm9wZXIgYXNwZWN0
IG1hc2tzIGZvciBEMzJTOCBWa1NwYXJzZUltYWdlTWVtb3J5UmVxdWlyZW1lbnRzMi4KCkVyaWMg
RW5nZXN0cm9tICg0KToKCi0gZG9jczogYWRkIHNoYSBzdW0gZm9yIDI2LjIuMQotIC5waWNrX3N0
YXR1cy5qc29uOiBVcGRhdGUgdG8gN2Q2YmIwOWQ1YjU5ZWM1YWYxYTU4OTcxZjM0MzkwYTYyOTQz
YmZlMAotIFsyNi4yIG9ubHldIHBjbzogcGx1bWIgXGBwY29fZGF0YWAgdGhyb3VnaCB0byBcYHBj
b19uaXJfb3B0KClgCi0gY2ktdHJvbjogYnlwYXNzIGNhY2hpbmcgcHJveHkgZm9yIGRvY2tlciBp
bWFnZXMKCkVyaWsgRmF5ZS1MdW5kICgxKToKCi0gZG9jczogZml4IGphdmFzY3JpcHQtd2Fybmlu
ZyBvbiBzZWFyY2gtcGFnZQoKRnJhbmsgQmlubnMgKDEpOgoKLSBwdnI6IGNoZWNrIGNvbW1hbmQg
YnVmZmVyIGlzIGluIHJlY29yZGluZyBzdGF0ZSBpbiB2a0NtZHtCZWdpbixFbmR9UmVuZGVyaW5n
CgpHZW9yZyBMZWhtYW5uICgxKToKCi0gcmFkdjogZml4IGxvd2VyX2FycmF5X2xheWVyX3JvdW5k
X2V2ZW4gY29uZGl0aW9uCgpJY2Vub3d5IFpoZW5nICgyKToKCi0gcGNvOiBmaXggcmEgZW1pdF9j
b3BpZXMgc2lkZWNhc2VzCi0gcHZyOiBzZXQgeWNiY3Igc2FtcGxlciBzdGF0ZSB3b3JkcyB3aGVu
IGFueSBzYW1wbGVyIHdvcmQgaXMgcHJlc2VudAoKSmVzc2UgTmF0YWxpZSAoMyk6CgotIGQzZDEy
OiBTdG9wIHVzaW5nIEQzRDEyX0lHTk9SRV9TREtfTEFZRVJTCi0gZHpuOiBSZWFycmFuZ2UgaW5j
bHVkZXMgYW5kIHN0b3AgdXNpbmcgRDNEMTJfSUdOT1JFX1NES19MQVlFUlMKLSB2ay93c2kvd2lu
MzI6IFN0b3AgdXNpbmcgRDNEMTJfSUdOT1JFX1NES19MQVlFUlMKCkppbWluZyBMaXUgKDEpOgoK
LSBhYy92aXJ0aW86IEZpeCBWSVJUSU9fU0hBUkVEIGZsYWcgbWFza2luZwoKSm9iIE5vb3JtYW4g
KDEpOgoKLSBmcmVlZHJlbm8vY29tcHV0ZXJhdG9yOiBhdHRhY2ggcGVyZmNudHIgQk8gdG8gQ1MK
CkpvcmRhbiBKdXN0ZW4gKDIpOgoKLSBpbnRlbC9kZXY6IERyb3AgMHhkNzQ0IFBDSSBJRAotIGlu
dGVsL2RldjogRW5hYmxlIE5WTC1TL1UgUENJIElEcyAod2l0aG91dCBGT1JDRV9QUk9CRSkKCkpv
c2UgTWFyaWEgQ2FzYW5vdmEgQ3Jlc3BvICg0KToKCi0gdjNkOiBmbHVzaCBqb2JzIHRoYXQgcXVl
dWUgdG9vIG1hbnkgZHJhdyBjYWxscwotIGJyb2FkY29tL3FwdTogZGVjb2RlIGZ1bGx5IHRoZSBp
bnB1dCB1bnBhY2sgZnJvbSBtdWwgRk1PVgotIGJyb2FkY29tL3FwdTogZGVjb2RlIHRoZSBmcm91
bmQtZ3JvdXAgaW5wdXQgdW5wYWNrIGZyb20gcmFkZHJfYiBvbiBWM0QgNy4xCi0gYnJvYWRjb20v
Y29tcGlsZXI6IGZpbGwgdGhlIG9sZCB2YWx1ZSB3aGVuIHNwaWxsaW5nIGEgcGFydGlhbCB3cml0
ZQoKTGlvbmVsIExhbmR3ZXJsaW4gKDIpOgoKLSBhbnY6IGRvbid0IGZvcmdldCB0byBoYXNoIHJl
bmRlciBwYXNzIGNvbG9yIGF0dGFjaG1lbnRzCi0gaW50ZWw6IGZpeHVwIG1jcyBzYW1wbGVyIGhh
bmRsZSBsb3dlcmluZwoKTG9yZW56byBSb3NzaSAoMyk6CgotIHBhbmZyb3N0OiBBbHdheXMgZW1p
dCB2ZXJ0ZXggYXR0cmlidXRlIGRlc2NyaXB0b3JzIGZvciBhcmNoIDwgdjkKLSBwYW52ay9qbTog
QWx3YXlzIGVtaXQgdmVydGV4IGF0dHJpYnV0ZSBkZXNjcmlwdG9ycwotIHBhbnZrL2ptOiBGaXgg
dW5ib3VuZCBhdHRyaWJ1dGUgcmVhZHMKCk1hcmMgQWxjYWxhIFByaWV0byAoMSk6CgotIHBhbmZy
b3N0L21vZGVsOiBGaXggRzcyMCBhbmQgRzcyNSBzZnUgcmF0ZXMKCk1hcmVrIE9sxaHDoWsgKDMp
OgoKLSBtZXNhOiBjbGFtcCBsZXZlbCBjb3VudCB0byB0aGUgYWxsb2NhdGVkIGxldmVsIGNvdW50
IGluIG1pcG1hcCBnZW5lcmF0aW9uCi0gcmFkdjogc2tpcCBpbmRpcmVjdCBkcmF3cyB3aXRoICht
YXgpZHJhd0NvdW50ID09IDAKLSByYWR2OiBmaXggUkFEVl9GT1JDRV9WUlMgKFBlcnNvbmEgMyBS
ZWxvYWQpCgpNaWtlIEJsdW1lbmtyYW50eiAoMik6CgotIGxhdmFwaXBlOiByZXNldCBjb21wdXRl
IHNoYWRlciBpbmZvIGluIGVtaXRfY29tcHV0ZV9zdGF0ZSgpCi0gbGF2YXBpcGU6IHplcm8gY29t
cHV0ZSBzdGF0ZSBmb3IgZXZlcnkgbWVzaCBkcmF3CgpOYW5sZXkgQ2hlcnkgKDEpOgoKLSBpbnRl
bC9pc2w6IFN1cHBvcnQgTVNBQSBpbiBzdWJpbWFnZSByYW5nZSBoZWxwZXIKCk9saXZpYSBMZWUg
KDEpOgoKLSBwYW52ay9jc2Y6IGZpeCBsYXllcmVkIEZCIGJhcnJpZXIgaW4gc2Vjb25kYXJ5IGNt
ZGJ1ZnMKClBpZXJyZS1FcmljIFBlbGxvdXgtUHJheWVyICgxKToKCi0gbG9hZGVyOiBjb25zaWRl
ciByYWRlb24gaW4gYW1kX3ByZWRpY2F0ZQoKUmh5cyBQZXJyeSAoMyk6CgotIG5pcjogYWRkIGRl
cmVmX2J1ZmZlcl9hZGRyZXNzCi0gYWMvbmlyOiBpbXBsZW1lbnQgbG9hZF9zc2JvX2FkZHJlc3MK
LSByYWR2OiB1c2UgbG9hZF9kZXJlZl9idWZmZXJfYWRkcmVzcwoKUm9iIENsYXJrICgxKToKCi0g
dHU6IEZpeCBnZW44IFRFWF9MSU5FX09GRlNFVAoKUm9iIEhlcnJpbmcgKEFybSkgKDEpOgoKLSBl
dGhvc3U6IEZpeCBmbGF0dGVuZWQgZnVsbHkgY29ubmVjdGVkIGlucHV0cwoKUm9oYW4gR2FyZyAo
MSk6CgotIHB2cjogdXNlIGEgbG9hZCBvcCBmb3IgdGhlIHJlc29sdmUgc3RlbmNpbCBsb2FkIG9w
CgpTYW11ZWwgUGl0b2lzZXQgKDIpOgoKLSByYWR2OiBmaXggY29weWluZyBWUlMgcmF0ZXMgd2l0
aCBhIG5vbi16ZXJvIGJhc2UgbGF5ZXIgY29ycmVjdGx5Ci0gYW1kOiBvbmx5IGVuYWJsZSB0aGUg
YWRkcmxpYiBTSU1EIHBhdGggd2hlbiBzdXBwb3J0ZWQKClNpbW9uIFBlcnJldHRhICg5KToKCi0g
bmlyOiBnZW5lcmFsaXplIHRoZSBzcmMgdHlwZSBvZiBpbnRlcmxlYXZlIHRvIHR1aW50Ci0gcGNv
OiBkcm9wIGkyaTE2IGNvbnZlcnNpb24gZm9yIG5pcl9pbnRlcmxlYXZlIHNyY3MKLSBwY286IGZs
dXNoIHRoZSBjYWNoZSBmb3IgaW1hZ2VzIGFjY2Vzc2VkIHZpYSBhdG9taWNzIGFuZCBub24tYXRv
bWljcwotIHBjbzogc2tpcCBwcm9wYWdhdGluZyBhY2Nlc3MgZm9yIGRlcmVmcyB3aXRob3V0IHZh
cnMKLSBwY286IHBhc3Mgc2hhZGVyIGRhdGEgdG8gcHJlcHJvY2Vzc2luZyBmdW5jdGlvbgotIHBj
bzogY29uc2lkZXIgcm9idXN0bmVzcyBpbiBsb2FkL3N0b3JlIHZlY3Rvcml6YXRpb24KLSBwY286
IGFtZW5kIGF0b21pYyBhZGRyZXNzIGNhbGN1bGF0aW9uIGZvciAyZCBpbWFnZXMKLSBwY286IGVu
c3VyZSBuaXJfZ2xvYmFsX2F0b21pY19wY28gb3BzIGFyZSB0cmFja2VkCi0gcGNvOiB1c2UgdGhl
IHNvdXJjZSBmcm9tIHNyYyBpbnN0ZWFkIG9mIGlvIHdoZW4gYnVpbGRpbmcgbWFwcGluZ3MKClRp
bXVyIEtyaXN0w7NmICg2KToKCi0gcmFkdjogSW52YWxpZGF0ZSBMMiBjYWNoZSBvbiBBQ0UgYWZ0
ZXIgd2FpdGluZyBmb3IgU0RNQQotIHJhZHY6IENyZWF0ZSBzZXBhcmF0ZSBCTyBmb3IgZ2FuZyBz
ZW1hcGhvcmUgdG8gYXZvaWQgY29oZXJlbmN5IGFuZCBwZXJmIGlzc3VlcwotIGFjby9vcHRpbWl6
ZXI6IEtlZXAgTVVCVUYgU09GRlNFVCBvbiBHRlg2LTcKLSBhY28vaXNlbDogVXNlIFNPRkZTRVQg
d2hlbiBzZWxlY3RpbmcgYnVmZmVyIGxvYWRzIHdpdGggaW5kZXggVkdQUgotIHJhZHYvbmlyOiBE
b24ndCBmb2xkIGNvbnN0YW50IG9mZnNldCBpbnRvIGluZGV4IFZHUFIgZm9yIFZTIGlucHV0cyBh
bnltb3JlCi0gYWMvbmlyL25nZzogVXNlIGRzX29yX2IzMiBmb3Igc3RvcmluZyBjdWxsaW5nIGZs
YWdzIG9uIE5hdmkgMTAKClZhbGVudGluZSBCdXJsZXkgKDcpOgoKLSBsdnAvY2k6IFVwZGF0ZSBl
eHBlY3RhdGlvbnMgYWZ0ZXIgZ2l0bGFiLXJ1bm5lciB1cGRhdGUKLSB0dTogRml4IHJlcXVpcmVk
U3ViZ3JvdXBTaXplU3RhZ2VzIGVuYWJsZW1lbnQKLSBmcmVlZHJlbm8sIHR1OiBMaW1pdCBYRkIg
c3RyZWFtcyBvbiBHUFVzIGxhY2tpbmcgbXVsdGktc3RyZWFtIHF1ZXJ5IHN1cHBvcnQKLSB0dTog
Q3JlYXRlIHBhdGNocG9pbnRzX2N0eCBiZWZvcmUgZW1pdHRpbmcgc3VicGFzcyBiZWdpbiBpbiBy
ZW5kZXJwYXNzCi0gdHU6IElnbm9yZSBGRE0gb2Zmc2V0cyBmb3Igc3Vic2FtcGxlZCBpbWFnZXMg
d2hlbiBzaGFyZWQgdmlld3BvcnQgaXMgYWN0aXZlCi0gdHU6IERvIG5vdCBiYWtlIHN0YXRpYyB2
aWV3cG9ydC9zY2lzc29yIHdoZW4gRkRNIGlzIGVuYWJsZWQKLSB0dTogRml4IEdNRU0gY2xlYXJz
IHdpdGggYW4gRkRNIG9mZnNldCBvbiB0aGUgYmxpdC1ldmVudCBjbGVhciBwYXRoCgpXZWkgWmhh
byAoMSk6CgotIHdzaS9kaXNwbGF5OiBhbGxvY2F0ZSB0aGUgRURJRCBkaXNwbGF5IG5hbWUgb25s
eSBvbmNlCgpZaXdlaSBaaGFuZyAoMik6CgotIHBhbnZrL2FuZHJvaWQ6IGF2b2lkIHBOZXh0IGlu
amVjdGlvbiBvZiBjYWxsZXIgQU5CIGluZm8KLSB2ZW51czogZW5zdXJlIHF1ZXVlIHN1Ym1pc3Np
b24gcE5leHQgY2hhaW4gZW5kcyBwcm9wZXJseQoKTWVzYSAyNi4yLjMgUmVsZWFzZSBOb3RlcyAv
IDIwMjYtMDktMTYKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KCk1lc2Eg
MjYuMi4zIGlzIGEgYnVnIGZpeCByZWxlYXNlIHdoaWNoIGZpeGVzIGJ1Z3MgZm91bmQgc2luY2Ug
dGhlIDI2LjIuMiByZWxlYXNlLgoKTWVzYSAyNi4yLjMgaW1wbGVtZW50cyB0aGUgT3BlbkdMIDQu
NiBBUEksIGJ1dCB0aGUgdmVyc2lvbiByZXBvcnRlZCBieQpnbEdldFN0cmluZyhHTF9WRVJTSU9O
KSBvciBnbEdldEludGVnZXJ2KEdMX01BSk9SX1ZFUlNJT04pIC8KZ2xHZXRJbnRlZ2VydihHTF9N
SU5PUl9WRVJTSU9OKSBkZXBlbmRzIG9uIHRoZSBwYXJ0aWN1bGFyIGRyaXZlciBiZWluZyB1c2Vk
LgpTb21lIGRyaXZlcnMgZG9uJ3Qgc3VwcG9ydCBhbGwgdGhlIGZlYXR1cmVzIHJlcXVpcmVkIGlu
IE9wZW5HTCA0LjYuIE9wZW5HTAo0LjYgaXMgKipvbmx5KiogYXZhaWxhYmxlIGlmIHJlcXVlc3Rl
ZCBhdCBjb250ZXh0IGNyZWF0aW9uLgpDb21wYXRpYmlsaXR5IGNvbnRleHRzIG1heSByZXBvcnQg
YSBsb3dlciB2ZXJzaW9uIGRlcGVuZGluZyBvbiBlYWNoIGRyaXZlci4KCk1lc2EgMjYuMi4zIGlt
cGxlbWVudHMgdGhlIE9wZW5DTCAzLjEgQVBJLCBidXQgdGhlIHZlcnNpb24gcmVwb3J0ZWQgYnkK
dGhlIENMX0RFVklDRV9WRVJTSU9OLCBDTF9ERVZJQ0VfTlVNRVJJQ19WRVJTSU9OIGFuZCBDTF9E
RVZJQ0VfT1BFTkNMX0NfQUxMX1ZFUlNJT05TCmNsR2V0RGV2aWNlSW5mbyBxdWVyaWVzIGRlcGVu
ZHMgb24gdGhlIHBhcnRpY3VsYXIgZHJpdmVyIGJlaW5nIHVzZWQuCgpNZXNhIDI2LjIuMyBpbXBs
ZW1lbnRzIHRoZSBWdWxrYW4gMS40IEFQSSwgYnV0IHRoZSB2ZXJzaW9uIHJlcG9ydGVkIGJ5CnRo
ZSBhcGlWZXJzaW9uIHByb3BlcnR5IG9mIHRoZSBWa1BoeXNpY2FsRGV2aWNlUHJvcGVydGllcyBz
dHJ1Y3QKZGVwZW5kcyBvbiB0aGUgcGFydGljdWxhciBkcml2ZXIgYmVpbmcgdXNlZC4KClNIQSBj
aGVja3N1bXMKLS0tLS0tLS0tLS0tLQoKOjoKCiAgICBUQkQuCgpOZXcgZmVhdHVyZXMKLS0tLS0t
LS0tLS0tCgotIE5vbmUKCkJ1ZyBmaXhlcwotLS0tLS0tLS0KCi0gTlZLIG1lbW9yeSBsZWFrIGlu
IENtZENvcHlCdWZmZXJUb0ltYWdlIGluIDI2LjIuMCwgMjYuMi4xIGFuZCAyNi4yLjIuCi0gUkFE
VjogR1BVIHBhZ2UgZmF1bHQgKG51bGwgcG9pbnRlcikgd2l0aCBSVCBlbXVsYXRpb24gb24gUG9s
YXJpcyAoUlggNTgwIDIwNDhTUCkuIElzc3VlIGJldHdlZW4gMjYuMS42IGFuZCAyNi4yLjEKLSBb
QU5WXVtBUkxdW2Jpc2VjdGVkXSBWaXN1YWwgZ3JhcGhpY3MgZ2xpdGNoZXMgaW4gQ291bnRlci1T
dHJpa2UgMiBzdGFydGluZyBpbiBNZXNhIDI2LjIueAotIFtyYWRlb25zaV0gTWluZWNyYWZ0IFZv
eHkgbW9kOiBEaXN0YW50IHdhdGVyIHJlbmRlcmluZyBpc3N1ZSBvbiBWZWdhIGlHUFUgYW5kIFJE
TkEyCi0gXGBoZXZjX3ZhYXBpYCBvbiBBTUQgKHJhZGVvbnNpL2dmeDExNTApIHN0YWxscyB0byB+
MSBmcHMgd2hlbiBpbnB1dCBmcmFtZXMgY2FycnkgQS81MyAoQ0VBLTYwOC83MDgpIGNsb3NlZC1j
YXB0aW9uIHNpZGUgZGF0YQotIGFudjogVGVzdCBmYWlscyBpbiBzaW11bGF0aW9uIGR1ZSB0byBj
b2Fyc2UgcGl4ZWwgc2hhZGluZyBzdGF0ZQotIGFzYWhpOiAxNi1iaXQgYmxlbmRpbmcgaW50byBS
R0JBMzJGIHByb2R1Y2VzIHplcm8gZHVlIHRvIDMyLWJpdCB0aWxlYnVmZmVyIGxvYWQKLSBhc2Fo
aTogU29tZSB0ZXh0dXJlcyBkbyBub3QgcmVuZGVyIGNvcnJlY3RseSBpbiBQb3J0YWxzIDIKLSBs
aWJ2dWxrYW5faW50ZWwuc28gY3Jhc2ggd2l0aCBYLVBsYW5lIDEyLjQuMyBvbiBJbnRlbCBBcmMg
QjU4MAotIG5pcmNhY2hlIGNhdXNlcyBnbHhnZWFycy9lZ2xnZWFycyB0byBzZWdmYXVsdCB1bmRl
ciBaaW5rCi0gdnVsa2FuLHJhZHY6IHdoZW4gdXNpbmcgZGVzY3JpcHRvciBoZWFwcywgaW5wdXQg
YXR0YWNobWVudHMgaW4gU1BJUi1WIGFyZSBpbmNvcnJlY3RseSBkZXRlY3RlZCBhcyByZWFkIG9u
bHkgaW5zdGVhZCBvZiByZWFkIHdyaXRlCgpDaGFuZ2VzCi0tLS0tLS0KCkFseXNzYSBSb3Nlbnp3
ZWlnICgxKToKCi0gbWVzYS9zdDogZml4IGluY29ycmVjdCBWUyBpbnB1dCBiYXNlcwoKQW5kcnpl
aiBEYXRjenVrICgxKToKCi0gYWMvc3F0dCwgcmFkdiwgcmFkZW9uc2k6IEZpeCBTUVRUIGJ1ZmZl
ciBzaXplIGFsaWdubWVudCBpc3N1ZXMKCkJlbmphbWluIENoZW5nICgxKToKCi0gcmFkZW9uc2k6
IHNldCBzdGVuY2lsIGNsZWFyIHRvIDAgd2hlbiBlbmFibGluZyBUQyBjb21wYXQKCkNhaW8gT2xp
dmVpcmEgKDEpOgoKLSBzcGlydjogUHJlc2VydmUgYWxsIGZwX21hdGhfY3RybCBiaXRzIGluIHZ0
bl9oYW5kbGVfYWx1IGRlZmF1bHQgY2FzZQoKQ2hyaXN0aWFuIEdtZWluZXIgKDIpOgoKLSBldG5h
dml2OiBEbyBub3QgYWJvcnQgb24gdW5zdXBwb3J0ZWQgc3RlbmNpbC1vbmx5IGJsaXRzCi0gZXRu
YXZpdjogVXNlIFJTIGRlcHRoIGZvcm1hdHMgb25seSBvbiBoYWx0aTUrCgpEYW55bG8gUGlsaWFp
ZXYgKDUpOgoKLSB0dTogV2FpdCBmb3IgWEZCIHF1ZXJ5IHdyaXRlcyB0byBsYW5kIGJlZm9yZSBt
YWtpbmcgaXQgYXZhaWxhYmxlCi0gdHU6IFN5bmNocm9uaXppbmcgd2l0aCBDbWRDb3B5UXVlcnlQ
b29sUmVzdWx0IHNob3VsZCB3YWl0IGZvciBtZW0gd3JpdGVzCi0gdHU6IFVzZSBwX2F0b21pY19y
ZWFkIHRvIHJlYWQgZnJvbSBxdWVyeSdzIHNsb3QtPmF2YWlsYWJsZQotIHR1OiBGaXggUEFDS0VE
ICsgYWxpZ25hcyg4KSBhcHBsaWNhdGlvbiB0byB0aGUgc2FtZSBzdHJ1Y3Qgb24gb2xkZXIgR0ND
Ci0gdHU6IEhhbmRsZSBsYXp5IG1lbW9yeSBpbiBHZXREZXZpY2VNZW1vcnlPcGFxdWVDYXB0dXJl
QWRkcmVzcwoKRGF2aWQgUm9zY2EgKDIpOgoKLSB2YTogRHJvcCBIRVZDIFNFSSBwYXJzaW5nCi0g
cmFkdi92aWRlbzogRml4IHNldHRpbmcgc2Vzc2lvbiBwYXJhbWV0ZXJzIG92ZXJyaWRlIGluZm8K
CkRtaXRyeSBCYXJ5c2hrb3YgKDgpOgoKLSBpcjM6IGtlZXAgYnl0ZSBTU0JPIG9mZnNldHMgYmVm
b3JlIGE2eHgKLSBmcmVlZHJlbm8vYTV4eDogb25seSAyRC1ibGl0IGJldHdlZW4gY29tcGF0aWJs
ZSBmb3JtYXRzCi0gZnJlZWRyZW5vL2E1eHg6IHByb2dyYW0gTlVNTk9OUE9TVkFSIHdpdGggcG9z
aXRpb24ncyBWUEMgbG9jYXRpb24KLSBmcmVlZHJlbm8vYTR4eCthNXh4OiBjbGFtcCB0aGUgdGV4
dHVyZSBidWZmZXIgc2l6ZQotIGZyZWVkcmVubzoga2VlcCB0aGUgc2VwYXJhdGUgc3RlbmNpbCBv
dXQgb2YgdGhlIHNoYWRvdyBibGl0Ci0gZnJlZWRyZW5vL2E1eHg6IGJsaXQgdGhlIHNlcGFyYXRl
IHN0ZW5jaWwgcGxhbmUgdG9vCi0gaXIzOiBza2lwIHRoZSBwaGlzIG9mIG5vbi1HUFIgcmVnaXN0
ZXJzIGluIHRoZSBtaW5pbXVtIHByZXNzdXJlIGJvdW5kCi0gZnJlZWRyZW5vL2E1eHg6IGJvdW5k
IGJsaXRzIGJ5IHRoZSBsYXllciBjb3VudCwgbm90IHRoZSBkZXB0aAoKRW1tYSBBbmhvbHQgKDMp
OgoKLSB0dTogRHJvcCBUUkFOU0ZFUl9TUkMvRFNUIGZyb20gYnVmZmVyRmVhdHVyZXMuCi0gdHU6
IEZpeCB0aGUgc1R5cGUgb2YgdGhlIHJldHVybmVkIFZrRnJhZ21lbnRTaGFkaW5nUmF0ZUtIUnMu
Ci0gdHU6IEZpeCBkZXN0cm95IG9yZGVyIG9mIGF1dG90dW5lIHZzIHBlcmZjb3VudGVycyBpbiBm
YWlsdXJlIHBhdGguCgpFcmljIEVuZ2VzdHJvbSAoNCk6CgotIGRvY3M6IGFkZCBzaGEgc3VtIGZv
ciAyNi4yLjIKLSAucGlja19zdGF0dXMuanNvbjogVXBkYXRlIHRvIDlmNDJlYTEyMzkwMjVkM2Y5
M2Q5YmJmNzQwNTM0MGFkY2VjOTQ0MTkKLSAucGlja19zdGF0dXMuanNvbjogTWFyayBmNDU4MjVh
MGM3MjRkMDZmMjMxYTEyMTA0ODRmZTlhZjcxYTNmZmFiIGFzIGRlbm9taW5hdGVkCi0gLnBpY2tf
c3RhdHVzLmpzb246IE1hcmsgODU5ZmNjM2I3NGY4MzFiYmI5MTUxZjA2ZDA1NWRkZmQ0NWNjNmU1
MCBhcyBkZW5vbWluYXRlZAoKRnJhbmsgQmlubnMgKDMpOgoKLSBwdnI6IGFkZCBtaXNzaW5nIEdQ
VSBhcmNoaXRlY3R1cmUgdG8gZGV2aWNlIGluZm8gZm9yIHNvbWUgQlZOQ3MKLSBwdnI6IGZpeHVw
IG9yZGVyaW5nIG9mIChoYXNcXyl1c2NfaXRyX3BhcmFsbGVsX2luc3RhbmNlcyBpbiBkZXYgaW5m
bwotIHppbms6IHJlcGxhY2UgYmxlbmQgYW5kIHZlcnRleCBlbGVtZW50cyBzdGF0ZSBoYXNoZXMg
d2l0aCBJRHMKCkdhbmVzaCBCZWxndXIgUmFtYWNoYW5kcmEgKDEpOgoKLSBhbWQ6IGFkZCBnZngx
MTcxCgpHZW9yZyBMZWhtYW5uICgyKToKCi0gbmlyL29wdF91dWI6IGZpeCBpbWF4IG9wdGltaXph
dGlvbgotIGFjbzogYXZvaWQgbXVidWYgYm91bmRzIGNoZWNraW5nIGZvciBnbG9iYWwKCkl2w6Fu
IEJyaWFubyAoMSk6CgotIGFudjogZml4IHB1c2ggY29uc3RhbnQgcmFuZ2UgZ2F0aGVyaW5nIGZv
ciBkeW5hbWljIG9mZnNldHMKCkppeXUgWWFuZyAoMSk6CgotIGNsYzogZml4IGZkIGxlYWsgaW4g
b3Blbl9jbGNfZGF0YSgpIG9uIG1hcCBmYWlsdXJlCgpKdXN0b24gTGkgKDEpOgoKLSBhbnYvYW5k
cm9pZDogRG9uJ3QgZGlzYWJsZSBBVVhfQklUIGltcG9ydGluZyBYZTIrIENDUyBtb2QgaW1hZ2Vz
CgpLYXJtaml0IE1haGlsICgxKToKCi0gdHU6IEZpeCBzcGFyc2UgYmluZCBjb2x1bW4gbWVyZ2lu
ZwoKS2Fyb2wgSGVyYnN0ICgyKToKCi0gbmlyL3NlcmlhbGl6ZTogc2V0IGluZm8uc3BlYyB0byBO
VUxMCi0gcnVzdGljbC9ldmVudDogcHJvcGVybHkgaW1wbGVtZW50IENMX1BST0ZJTElOR19JTkZP
X05PVF9BVkFJTEFCTEUgZXJyb3IgY29uZGl0aW9uCgpLb3N0YWRpbiBTaGlzaG1hbm92ICgxKToK
Ci0gYWNvOiBhZGQgbWlzc2luZyA8YWxnb3JpdGhtPiBpbmNsdWRlCgpMZW9uIFBlcmlhbnUgKDEp
OgoKLSBwdnI6IEZpeCBwcmltaXRpdmUgcmVzdGFydCBmb3Igbm9uLWluZGV4ZWQgZHJhd3MKCkxp
b25lbCBMYW5kd2VybGluICg2KToKCi0gYW52OiBmaXggNjRiaXQgdmFsdWVzIHByb21vdGVkIHRv
IGlubGluZSByZWdpc3RlcgotIGJydzogdXNlIHNhbXBsZXIgZnJvbSBpbmNvbWluZyBpbnN0cnVj
dGlvbnMgZm9yIGNvbWJpbmVyCi0gYW52OiBmaXh1cCBkeW5hbWljIGJ1ZmZlcnMgd2l0aCBBTlZf
REVCVUc9YmluZGxlc3MKLSBhbnY6IGVtaXQgQ1BCIHNldHVwIGF0IGRldmljZSBpbml0aWFsaXph
dGlvbgotIGFudjogZml4IHN5bmNocm9uaXphdGlvbiBvZiBhY2NlbGVyYXRpb24gc3RydWN0dXJl
IHF1ZXJ5IHdyaXRlcwotIGFudjogYWRkIG1pc3NpbmcgaGFuZGxpbmcgZm9yIFBJUEVMSU5FX1NU
QUdFXzJfQ09QWV9JTkRJUkVDVAoKTGl2aXUgUHJvZGVhICgxKToKCi0gY2xjOiBGaXggc3RhdGlj
IGxpbmsgd2l0aCBsbHZtIGFuZCBjbGFuZyAyMwoKTWFyZWsgT2zFocOhayAoMSk6CgotIHJhZHY6
IGZpeCBzUkdCIGNvbG9yIGNsZWFycyB2aWEgY29tcHV0ZQoKTWFyeSBHdWlsbGVtYXJkICgxKToK
Ci0gYXNhaGk6IEFkZCB0aGUgc2FtZSB3b3JrYXJvdW5kIGFzIEZpcmVmb3ggZm9yIFplbiBicm93
c2VyCgpNYXR0IFR1cm5lciAoMik6CgotIG1lc2Evc3Q6IHVzZSBjb25jcmV0ZSBmb3JtYXRzIGZv
ciBsb3dlcmVkIFlVViBwbGFuZSB2aWV3cwotIGRyaTogdXNlIGNvbmNyZXRlIGZvcm1hdHMgZm9y
IHRoZSBHUjg4LCA4ODg4IGFuZCBzUkdCIERSTSBmb3JtYXRzCgpNZWwgSGVubmluZyAoMik6Cgot
IG52azogRml4IG1lbW9yeSBsZWFrIGluIGNvbXB1dGUgc2F2ZS9yZXN0b3JlCi0gbnZrOiBGaXgg
bGVhayBvZiBkZXYtPmhlYXAgYW5kIGRldi0+cmVwbGF5X2hlYXAKCk1pY2hhZWwgQ2hlbmcgKDEp
OgoKLSB1dGlsL2RyaXJjOiBjaGFuZ2UgbWluX3ZhbHVlIHRvIG1heF92YWx1ZSB0eXBvCgpNaWtl
IEJsdW1lbmtyYW50eiAoMik6CgotIGxsdm1waXBlOiBmb3JjZSBhbGlnbm1lbnQgZm9yIFdpbmRv
d3MgdGV4dHVyZSBhbGxvY2F0aW9ucwotIG50djogaW1wcm92ZSBkZXJlZiB0eXBlIG1hdGNoaW5n
IHdoZW4gY29udmVydGluZyB2cmkgZGVyZWZzCgpQYXZlbCBPbmRyYcSNa2EgKDEpOgoKLSByMzAw
OiBkb24ndCBwcm9wYWdhdGUgbmVnYXRpb24gdGhyb3VnaCBhYnNvbHV0ZSB2YWx1ZXMKClJoeXMg
UGVycnkgKDQpOgoKLSByYWR2OiBkb24ndCBzZXQgbXVsYWRkX3N1cHBvcnRfcHJlZmVyc19zcGxp
dCB3aGVuIGZmbWEgaXMgdW5zdXBwb3J0ZWQKLSByYWR2OiBpbml0aWFsaXplIHNoYWRlcl9ibGFr
ZTMgZm9yIHNoYWRlciBvYmplY3RzCi0gcmFkdjogaGFzaCBkZXNjcmlwdG9yIHNldCBsYXlvdXRz
IGluIHJhZHZfaGFzaF9ncmFwaGljc19zcGlydl90b19uaXIKLSByYWRlb25zaTogdXNlIGFjX3No
YWRlcl9jb25maWc6Omxkc19zaXplIGZyb20gQUNPCgpSb2hhbiBHYXJnICgxKToKCi0gbmlyOiBk
ZXJpdmUgY29sb3JfaXNfZHVhbF9zb3VyY2UgZnJvbSBkZWNsYXJlZCB2YXJzCgpSeWFuIE1ja2Vl
dmVyICgxKToKCi0gcGFudmsvdjYtNzogaW5jbHVkZSByZXF1aXJlZCBsYXlvdXRzIGluIGhvc3Qg
aW1hZ2UgY29weSBsYXlvdXRzCgpSeWFuIFpoYW5nICgzKToKCi0gd3NpL3dheWxhbmQ6IHNraXAg
ZmVlZGJhY2sgZGlzcGF0Y2ggd2hlbiBub3RoaW5nIGlzIG91dHN0YW5kaW5nCi0gcGFudms6IGlu
aXRpYWxpemUgQ1BVIHRyYWNpbmcgY2F0ZWdvcmllcwotIHBhbnZrL3V0cmFjZTogcmVwbGFjZSBi
b2d1cyBhc3NlcnQgd2l0aCBzdGF0aWNfYXNzZXJ0IGluIHBlcmZldHRvIGJlZ2luIGV2ZW50IGNh
bGxiYWNrCgpTYW11ZWwgUGl0b2lzZXQgKDMpOgoKLSByYWR2OiBmaXggTDBfQ0FDSEVfSElUX1JB
VElPIHBlcmYgY291bnRlciBvbiBHRlgxMQotIHJhZHY6IHJldHVybiBWS19FUlJPUl9ERVZJQ0Vf
TE9TVCBpZiBhbnkgc2hhZGVyIGV4ZWN1dGVkIE9wQWJvcnRLSFIKLSByYWR2OiBjb25zaWRlciBz
aGFkZXIgYWJvcnQgZmF1bHRzIHdpdGggVktfS0hSX2RldmljZV9mYXVsdAoKU2lsdmlvIFZpbGVy
aW5vICgyKToKCi0gZDNkMTI6IEZpeCBkM2QxMiB2aWRlbyBlbmNvZGVyIGJhdGNoIGxlYWtzCi0g
ZDNkMTI6IEZpeCBkM2QxMiB2aWRlbyBkZWNvZGVyIGJhdGNoIGxlYWtzCgpUYWt1cm8gQXNoaWUg
KDEpOgoKLSBwYW5mcm9zdDogUmVhbGxvY2F0ZSBCTyB3aGVuIGxpbmVhciBsYXlvdXQgZ3Jvd3MK
ClRhcGFuaSBQw6RsbGkgKDMpOgoKLSBhbnY6IGNoYW5nZSBiaW5kbGVzcyBkZWJ1ZyBlbnYgdmFy
aWFibGUgdG8gYmUgZHJpcmMgb3B0aW9uCi0gYW52OiB0b2dnbGUgYW52X2Fsd2F5c19iaW5kbGVz
cyBmb3IgWFBsYW5lLTEyCi0gYW52OiBmaXggY21kX2J1ZmZlcl9zZXRfaW5kaXJlY3Rfc3RyaWRl
IG9uIEFSTAoKVmFuZG9tYXMgKDEpOgoKLSB6aW5rOiBwdXQgdGhlIGJ1ZmZlciB2aWV3IGNhY2hl
IGtleSBmaXJzdAoKVmluc29uIExlZSAoMik6CgotIGdsc2w6IGluaXRpYWxpemUgcGl4ZWxfbG9j
YWxfc3RvcmFnZSBhbmQgeXV2IGluIGlyX3ZhcmlhYmxlIGNvbnN0cnVjdG9yCi0gZ2xzbDogaW5p
dGlhbGl6ZSBpc19nbG9iYWwgaW4gaXJfdmFyaWFibGVfcmVmY291bnRfZW50cnkgY29uc3RydWN0
b3IKClbDrWN0b3IgTWFudWVsIErDoXF1ZXogTGVhbCAoMSk6CgotIHJhZHYvdmlkZW86IHJlcG9y
dCBoYXNPdmVycmlkZXMgb24gQVYxIGVuY29kaW5nCgpZaXdlaSBaaGFuZyAoMSk6CgotIHBhbnZr
OiBwbGFjZSBjb2hlcmVudCBtZW1vcnkgdHlwZSBiZWZvcmUgY2FjaGVkIHR5cGUKCnJhamFyeWFu
MTQ5MjAwNyAoMSk6CgotIHNwaXJ2OiBEb24ndCBpbXBsaWNpdGx5IHNldCBBQ0NFU1NfTk9OX1dS
SVRFQUJMRSBmb3IgaW5wdXQgYXR0YWNobWVudHMK

--===============0039174722543131915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mesa: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa: SRC_URI changed from "https://archive.mesa3d.org/mesa-26.2.2.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch file://0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch file://0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch file://0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch" to "https://archive.mesa3d.org/mesa-26.2.3.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch file://0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch file://0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch file://0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch"
packages/x86-64-v3-poky-linux/mesa: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/libgallium: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-26.2.2.so", added "/usr/lib/libgallium-26.2.3.so"
packages/x86-64-v3-poky-linux/mesa/libgallium: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/libgbm: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgbm: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/libglapi: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/libteflon: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/libteflon: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 773198720 to 773212000 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: FILELIST: removed "/usr/lib/.debug/libgallium-26.2.2.so", added "/usr/lib/.debug/libgallium-26.2.3.so"
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGSIZE changed from 201327 to 201480 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGSIZE changed from 250559095 to 250559352 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-src: FILELIST: directory renamed /usr/src/debug/mesa/26.2.2/src/intel/vulkan -> /usr/src/debug/mesa/26.2.3/src/intel/vulkan, directory renamed /usr/src/debug/mesa/26.2.2/src/intel/compiler/jay -> /usr/src/debug/mesa/26.2.3/src/intel/compiler/jay, directory renamed /usr/src/debug/mesa/26.2.2/src/intel/compiler/brw -> /usr/src/debug/mesa/26.2.3/src/intel/compiler/brw, directory renamed /usr/src/debug/mesa/26.2.2/src/gallium/frontends/lavapipe -> /usr/src/debug/mesa/26.2.3/src/gallium/frontends/lavapipe, directory renamed /usr/src/debug/mesa/26.2.2/src/intel/blorp -> /usr/src/debug/mesa/26.2.3/src/intel/blorp, directory renamed /usr/src/debug/mesa/26.2.2/src/intel/compiler/gen -> /usr/src/debug/mesa/26.2.3/src/intel/compiler/gen, directory renamed /usr/src/debug/mesa/26.2.2/src/compiler -> /usr/src/debug/mesa/26.2.3/src/compiler, directory renamed /usr/src/debug/mesa/26.2.2/src/intel/compiler/elk -> /usr/src/debug/mesa/26.2.3/src/intel/compiler/el
 k, directory renamed /usr/src/debug/mesa/26.2.2/src/intel/vulkan_hasvk -> /usr/src/debug/mesa/26.2.3/src/intel/vulkan_hasvk, directory renamed /usr/src/debug/mesa/26.2.2/src/gallium/drivers/r600 -> /usr/src/debug/mesa/26.2.3/src/gallium/drivers/r600, directory renamed /usr/src/debug/mesa/26.2.2/src/compiler/spirv -> /usr/src/debug/mesa/26.2.3/src/compiler/spirv, directory renamed /usr/src/debug/mesa/26.2.2/src/nouveau/headers -> /usr/src/debug/mesa/26.2.3/src/nouveau/headers, directory renamed /usr/src/debug/mesa/26.2.2/src/amd/common -> /usr/src/debug/mesa/26.2.3/src/amd/common, directory renamed /usr/src/debug/mesa/26.2.2/src/amd/vulkan -> /usr/src/debug/mesa/26.2.3/src/amd/vulkan, directory renamed /usr/src/debug/mesa/26.2.2/src/mesa -> /usr/src/debug/mesa/26.2.3/src/mesa, directory renamed /usr/src/debug/mesa/26.2.2/src/gfxstream/guest/vulkan_enc -> /usr/src/debug/mesa/26.2.3/src/gfxstream/guest/vulkan_enc, directory renamed /usr/src/debug/mesa/26.2.2/src/vulkan/runtime -> /usr/
 src/debug/mesa/26.2.3/src/vulkan/runtime, directory renamed /usr/src/debug/mesa/26.2.2/src/gallium/drivers/radeonsi -> /usr/src/debug/mesa/26.2.3/src/gallium/drivers/radeonsi, directory renamed /usr/src/debug/mesa/26.2.2/src/intel/compiler -> /usr/src/debug/mesa/26.2.3/src/intel/compiler, directory renamed /usr/src/debug/mesa/26.2.2/src/compiler/glsl/glcpp -> /usr/src/debug/mesa/26.2.3/src/compiler/glsl/glcpp, directory renamed /usr/src/debug/mesa/26.2.2/src/util -> /usr/src/debug/mesa/26.2.3/src/util, directory renamed /usr/src/debug/mesa/26.2.2/src/mesa/glapi/shared-glapi -> /usr/src/debug/mesa/26.2.3/src/mesa/glapi/shared-glapi, directory renamed /usr/src/debug/mesa/26.2.2/src/vulkan/util -> /usr/src/debug/mesa/26.2.3/src/vulkan/util, directory renamed /usr/src/debug/mesa/26.2.2/src/gallium/auxiliary -> /usr/src/debug/mesa/26.2.3/src/gallium/auxiliary, directory renamed /usr/src/debug/mesa/26.2.2/src/intel/dev -> /usr/src/debug/mesa/26.2.3/src/intel/dev, directory renamed /usr/sr
 c/debug/mesa/26.2.2/src/loader -> /usr/src/debug/mesa/26.2.3/src/loader, directory renamed /usr/src/debug/mesa/26.2.2/src/amd/vulkan/layers -> /usr/src/debug/mesa/26.2.3/src/amd/vulkan/layers, directory renamed /usr/src/debug/mesa/26.2.2/src/gallium/drivers/r300 -> /usr/src/debug/mesa/26.2.3/src/gallium/drivers/r300, directory renamed /usr/src/debug/mesa/26.2.2/src/intel/genxml -> /usr/src/debug/mesa/26.2.3/src/intel/genxml, directory renamed /usr/src/debug/mesa/26.2.2/src/intel/perf -> /usr/src/debug/mesa/26.2.3/src/intel/perf, directory renamed /usr/src/debug/mesa/26.2.2/src/mesa/glapi/glapi/gen -> /usr/src/debug/mesa/26.2.3/src/mesa/glapi/glapi/gen, directory renamed /usr/src/debug/mesa/26.2.2/src/gallium/drivers/zink -> /usr/src/debug/mesa/26.2.3/src/gallium/drivers/zink, directory renamed /usr/src/debug/mesa/26.2.2/src/virtio/vulkan -> /usr/src/debug/mesa/26.2.3/src/virtio/vulkan, directory renamed /usr/src/debug/mesa/26.2.2/src/vulkan/wsi -> /usr/src/debug/mesa/26.2.3/src/vulk
 an/wsi, directory renamed /usr/src/debug/mesa/26.2.2/src/mesa/program -> /usr/src/debug/mesa/26.2.3/src/mesa/program, directory renamed /usr/src/debug/mesa/26.2.2/src/intel/ds -> /usr/src/debug/mesa/26.2.3/src/intel/ds, directory renamed /usr/src/debug/mesa/26.2.2/src/amd/compiler -> /usr/src/debug/mesa/26.2.3/src/amd/compiler, directory renamed /usr/src/debug/mesa/26.2.2/src/compiler/nir -> /usr/src/debug/mesa/26.2.3/src/compiler/nir, directory renamed /usr/src/debug/mesa/26.2.2/src/intel/shaders -> /usr/src/debug/mesa/26.2.3/src/intel/shaders, directory renamed /usr/src/debug/mesa/26.2.2/src/intel/isl -> /usr/src/debug/mesa/26.2.3/src/intel/isl, directory renamed /usr/src/debug/mesa/26.2.2/src/util/format -> /usr/src/debug/mesa/26.2.3/src/util/format, directory renamed /usr/src/debug/mesa/26.2.2/src/compiler/glsl -> /usr/src/debug/mesa/26.2.3/src/compiler/glsl
packages/x86-64-v3-poky-linux/mesa/mesa-src: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGSIZE changed from 84440808 to 84436712 (-0%)
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "26.2.2" to "26.2.3"
packages/x86-64-v3-poky-linux/mesa/mesa: PKGV changed from 26.2.2 [default] to 26.2.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa: PV changed from "26.2.2" to "26.2.3"
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-26.2.2.so moved to /usr/lib/libgallium-26.2.3.so

--===============0039174722543131915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="mesa-tools-native-changelog.txt"

Q2hhbmdlbG9nIGZvciBtZXNhLXRvb2xzLW5hdGl2ZTogMjYuMi4yIC0+IDI2LjIuMwpTb3VyY2U6
IGRvY3MvcmVsbm90ZXMvMjYuMi4yLnJzdCwgZG9jcy9yZWxub3Rlcy8yNi4yLjMucnN0CgpNZXNh
IDI2LjIuMiBSZWxlYXNlIE5vdGVzIC8gMjAyNi0wOS0wMgo9PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQoKTWVzYSAyNi4yLjIgaXMgYSBidWcgZml4IHJlbGVhc2Ugd2hpY2gg
Zml4ZXMgYnVncyBmb3VuZCBzaW5jZSB0aGUgMjYuMi4xIHJlbGVhc2UuCgpNZXNhIDI2LjIuMiBp
bXBsZW1lbnRzIHRoZSBPcGVuR0wgNC42IEFQSSwgYnV0IHRoZSB2ZXJzaW9uIHJlcG9ydGVkIGJ5
CmdsR2V0U3RyaW5nKEdMX1ZFUlNJT04pIG9yIGdsR2V0SW50ZWdlcnYoR0xfTUFKT1JfVkVSU0lP
TikgLwpnbEdldEludGVnZXJ2KEdMX01JTk9SX1ZFUlNJT04pIGRlcGVuZHMgb24gdGhlIHBhcnRp
Y3VsYXIgZHJpdmVyIGJlaW5nIHVzZWQuClNvbWUgZHJpdmVycyBkb24ndCBzdXBwb3J0IGFsbCB0
aGUgZmVhdHVyZXMgcmVxdWlyZWQgaW4gT3BlbkdMIDQuNi4gT3BlbkdMCjQuNiBpcyAqKm9ubHkq
KiBhdmFpbGFibGUgaWYgcmVxdWVzdGVkIGF0IGNvbnRleHQgY3JlYXRpb24uCkNvbXBhdGliaWxp
dHkgY29udGV4dHMgbWF5IHJlcG9ydCBhIGxvd2VyIHZlcnNpb24gZGVwZW5kaW5nIG9uIGVhY2gg
ZHJpdmVyLgoKTWVzYSAyNi4yLjIgaW1wbGVtZW50cyB0aGUgT3BlbkNMIDMuMSBBUEksIGJ1dCB0
aGUgdmVyc2lvbiByZXBvcnRlZCBieQp0aGUgQ0xfREVWSUNFX1ZFUlNJT04sIENMX0RFVklDRV9O
VU1FUklDX1ZFUlNJT04gYW5kIENMX0RFVklDRV9PUEVOQ0xfQ19BTExfVkVSU0lPTlMKY2xHZXRE
ZXZpY2VJbmZvIHF1ZXJpZXMgZGVwZW5kcyBvbiB0aGUgcGFydGljdWxhciBkcml2ZXIgYmVpbmcg
dXNlZC4KCk1lc2EgMjYuMi4yIGltcGxlbWVudHMgdGhlIFZ1bGthbiAxLjQgQVBJLCBidXQgdGhl
IHZlcnNpb24gcmVwb3J0ZWQgYnkKdGhlIGFwaVZlcnNpb24gcHJvcGVydHkgb2YgdGhlIFZrUGh5
c2ljYWxEZXZpY2VQcm9wZXJ0aWVzIHN0cnVjdApkZXBlbmRzIG9uIHRoZSBwYXJ0aWN1bGFyIGRy
aXZlciBiZWluZyB1c2VkLgoKU0hBIGNoZWNrc3VtcwotLS0tLS0tLS0tLS0tCgo6OgoKICAgIFNI
QTI1NjogZWViMjljYTdlNTZjZmFhOGU4YTc5NTM4ZGNmODM0ZTNiMThlNTAxYzMxYmVmNTE0NWU5
NTllYTQzN2NjNDIxNiAgbWVzYS0yNi4yLjIudGFyLnh6CiAgICBTSEE1MTI6IDU1YjEyMzRjODY1
M2RhZDliODViYTNkZTdiNzc3YTBkOTU3OTA5YmFmNDYyOGYwYzAwZTIxZDRiYTg5YzAwNGNiNjg3
YTFkY2Y4ZGE0NmVkMGEwOTIyMzFkZDRmODU5MDI3NTA5ZjgzYWQ4YzU1ODc1MDg0NWJhNDcwOTAy
NjE1ICBtZXNhLTI2LjIuMi50YXIueHoKCk5ldyBmZWF0dXJlcwotLS0tLS0tLS0tLS0KCi0gTm9u
ZQoKQnVnIGZpeGVzCi0tLS0tLS0tLQoKLSAyNi4yLnggYnVpbGQgZmFpbHMgd2l0aCBhcm1oZgot
IENvbmZpZGVudGlhbCBpc3N1ZSAjMTUwNTIKLSBHTCBzdGVuY2lsIHJlZmVyZW5jZSBxdWVyeSBk
b2VzIG5vdCB1cGRhdGUgaW1tZWRpYXRlbHkKLSBNZXNhIDI2LjIuMTogcmFkZW9uc2kgbm8gbG9u
Z2VyIGxvYWRzIGZvciBHQ04xIC8gUGl0Y2Fpcm4gd2hlbiB1c2luZyByYWRlb24gZHJpdmVyLgot
IFRleHR1cmVzIGdvdCBzd2FwcGVkL2dsaXRjaGVkIG9uIFd1dGhlcmluZyBXYXZlcyBnYW1lLgot
IFtOYXZpMTBdW1JhZGVvblNJL1JBRFZdIE5HRyBjdWxsaW5nIGNhdXNlcyBub25kZXRlcm1pbmlz
dGljIEdQVSBoYW5nczsgbm9uZ2djIGZpeGVzIGJvdGggT3BlbkdMIGFuZCBWdWxrYW4KLSBbcmFk
dl1bYmlzZWN0ZWRdW3JlZ3Jlc3Npb25dIEJyb2tlbiByZW5kZXJpbmcgaW4gUGVyc29uYSAzIFJl
bG9hZCBtZW51IG9uIFJETkEyIGluIGdhbWVzY29wZQotIHJhZHYgaWdub3JlcyBjb3VudCBvZiAw
IGluIHZrQ21kRHJhd0luZGlyZWN0CgpDaGFuZ2VzCi0tLS0tLS0KCkFsbGVuIEJhbGx3YXkgKDEp
OgoKLSBhbnY6IEZpeCBBU1RDIGVtdWxhdGlvbiBzeW5jIGluIENvcHlNZW1vcnlUb0ltYWdlCgpB
c2hsZXkgU21pdGggKDEpOgoKLSBwYW4vYmlmcm9zdDogRml4IHNoYWRlciBjbG9jayBzZWxlY3Rp
b24KCkJlbmphbWluIENoZW5nICgxKToKCi0gbWVzYS9tYWluOiBBZGQgZXh0cmFfbmV3X2J1ZmZl
cnMgZm9yIFNURU5DSUxfUkVGCgpDaHJpc3RpYW4gR21laW5lciAoMik6CgotIGV0bmF2aXY6IFBy
b2dyYW0gdGhlIGkyaSBkZXN0aW5hdGlvbiB0eXBlIGluIHNyYzEKLSBldG5hdml2OiBuaXI6IENh
bGwgbmlyX29wdF9jb21iaW5lX3N0b3JlcyguLikKCkRhdmUgQWlybGllICgxKToKCi0gbmlyOiBt
b3ZlIGxvYWRfc3Nib19hZGRyZXNzIHRvIHRha2luZyB2YXJpYWJsZSBzaXplIHNyYzAKCkRhdmlk
IFJvc2NhICg2KToKCi0gdmE6IENvbXBhcmUgZmlsZSBkZXNjcmlwdGlvbnMgdG8gZGVkdXBsaWNh
dGUgb2JqZWN0cyB3aGVuIGV4cG9ydGluZyBzdXJmYWNlCi0gdmE6IFBhcnNlIGFsbCBIRVZDIHNs
aWNlIE5BTCB1bml0IHR5cGVzCi0gdmE6IFBhcnNlIEhFVkMgZW5jb2RlIHNsaWNlX3RlbXBvcmFs
X212cF9lbmFibGVkX2ZsYWcKLSB2YTogRml4IHBhcnNpbmcgSEVWQyBkZWNvZGUgc2xpY2VfdGVt
cG9yYWxfbXZwX2VuYWJsZWRfZmxhZwotIHZhOiBGaXggcGFyc2luZyBIRVZDIFZQUyB0aW1pbmcg
aW5mbwotIHJhZGVvbnNpL21tOiBGaXggVkNOIGVuY29kZSBhbGxvd2VkX21heF9iaXRzdHJlYW1f
c2l6ZQoKRG1pdHJ5IEJhcnlzaGtvdiAoMyk6CgotIHR1cm5pcDogc2NhbGUgdGhlIHRyYW5zZm9y
bSBmZWVkYmFjayBjb3VudGVyIG9mZnNldCBvbiBhNnh4Ci0gZnJlZWRyZW5vL2E2eHg6IHN1YnRy
YWN0IHRoZSB0cmFuc2Zvcm0gZmVlZGJhY2sgYnVmZmVyIG9mZnNldCBpbiBDUF9EUkFXX0FVVE8K
LSBudjMwOiBmaXggYWJzIHNvdXJjZSBtb2RpZmllciBvbiBmcmFnbWVudCBwcm9ncmFtIHNvdXJj
ZXMgMSBhbmQgMgoKRG9taW5pcXVlIEJlbGhhY2hlbWkgKDEpOgoKLSBwY286IGZpeCBjb21waWxl
IGZhaWx1cmUgZm9yIGFycmF5TGVuZ3RoKCkgb24gbm9uLXBvd2VyLW9mLXR3byBzdHJpZGVzCgpF
bW1hIEFuaG9sdCAoNik6CgotIGZyZWVkcmVuby9pcjM6IEFjdHVhbGx5IHBhc3MgY3NfbG9ja191
bmxvY2tfcXVpcmsgaW50byB0aGUgY29tcGlsZXIuCi0gdHU6IEZpeCBWS19QSVBFTElORV9DUkVB
VElPTl9GRUVEQkFDS19BUFBMSUNBVElPTl9QSVBFTElORV9DQUNIRV9ISVRfQklULgotIHR1OiBG
aXggc3RpdGNoaW5nIHRvZ2V0aGVyIHNldCBsYXlvdXRzIGZyb20gZ3JhcGhpY3MgcGlwZWxpbmUg
bGlicmFyaWVzLgotIHR1OiBBZGQgbWlzc2luZyByZXNlcnZhdGlvbiBvZiB0aGUgZXh0cmEgc2Fm
ZS1jb25zdCBWUEMgc3RhdGUgZm9yIEdTZXMuCi0gdHU6IEZpeCB0aGUgYmxvY2sgdGV4ZWwgdmll
dyBjaGVjayBmb3IgZm9yY2VfZGlzYWJsZV9saW5lYXJfZmFsbGJhY2suCi0gdHU6IFB1Ymxpc2gg
cHJvcGVyIGFzcGVjdCBtYXNrcyBmb3IgRDMyUzggVmtTcGFyc2VJbWFnZU1lbW9yeVJlcXVpcmVt
ZW50czIuCgpFcmljIEVuZ2VzdHJvbSAoNCk6CgotIGRvY3M6IGFkZCBzaGEgc3VtIGZvciAyNi4y
LjEKLSAucGlja19zdGF0dXMuanNvbjogVXBkYXRlIHRvIDdkNmJiMDlkNWI1OWVjNWFmMWE1ODk3
MWYzNDM5MGE2Mjk0M2JmZTAKLSBbMjYuMiBvbmx5XSBwY286IHBsdW1iIFxgcGNvX2RhdGFgIHRo
cm91Z2ggdG8gXGBwY29fbmlyX29wdCgpYAotIGNpLXRyb246IGJ5cGFzcyBjYWNoaW5nIHByb3h5
IGZvciBkb2NrZXIgaW1hZ2VzCgpFcmlrIEZheWUtTHVuZCAoMSk6CgotIGRvY3M6IGZpeCBqYXZh
c2NyaXB0LXdhcm5pbmcgb24gc2VhcmNoLXBhZ2UKCkZyYW5rIEJpbm5zICgxKToKCi0gcHZyOiBj
aGVjayBjb21tYW5kIGJ1ZmZlciBpcyBpbiByZWNvcmRpbmcgc3RhdGUgaW4gdmtDbWR7QmVnaW4s
RW5kfVJlbmRlcmluZwoKR2VvcmcgTGVobWFubiAoMSk6CgotIHJhZHY6IGZpeCBsb3dlcl9hcnJh
eV9sYXllcl9yb3VuZF9ldmVuIGNvbmRpdGlvbgoKSWNlbm93eSBaaGVuZyAoMik6CgotIHBjbzog
Zml4IHJhIGVtaXRfY29waWVzIHNpZGVjYXNlcwotIHB2cjogc2V0IHljYmNyIHNhbXBsZXIgc3Rh
dGUgd29yZHMgd2hlbiBhbnkgc2FtcGxlciB3b3JkIGlzIHByZXNlbnQKCkplc3NlIE5hdGFsaWUg
KDMpOgoKLSBkM2QxMjogU3RvcCB1c2luZyBEM0QxMl9JR05PUkVfU0RLX0xBWUVSUwotIGR6bjog
UmVhcnJhbmdlIGluY2x1ZGVzIGFuZCBzdG9wIHVzaW5nIEQzRDEyX0lHTk9SRV9TREtfTEFZRVJT
Ci0gdmsvd3NpL3dpbjMyOiBTdG9wIHVzaW5nIEQzRDEyX0lHTk9SRV9TREtfTEFZRVJTCgpKaW1p
bmcgTGl1ICgxKToKCi0gYWMvdmlydGlvOiBGaXggVklSVElPX1NIQVJFRCBmbGFnIG1hc2tpbmcK
CkpvYiBOb29ybWFuICgxKToKCi0gZnJlZWRyZW5vL2NvbXB1dGVyYXRvcjogYXR0YWNoIHBlcmZj
bnRyIEJPIHRvIENTCgpKb3JkYW4gSnVzdGVuICgyKToKCi0gaW50ZWwvZGV2OiBEcm9wIDB4ZDc0
NCBQQ0kgSUQKLSBpbnRlbC9kZXY6IEVuYWJsZSBOVkwtUy9VIFBDSSBJRHMgKHdpdGhvdXQgRk9S
Q0VfUFJPQkUpCgpKb3NlIE1hcmlhIENhc2Fub3ZhIENyZXNwbyAoNCk6CgotIHYzZDogZmx1c2gg
am9icyB0aGF0IHF1ZXVlIHRvbyBtYW55IGRyYXcgY2FsbHMKLSBicm9hZGNvbS9xcHU6IGRlY29k
ZSBmdWxseSB0aGUgaW5wdXQgdW5wYWNrIGZyb20gbXVsIEZNT1YKLSBicm9hZGNvbS9xcHU6IGRl
Y29kZSB0aGUgZnJvdW5kLWdyb3VwIGlucHV0IHVucGFjayBmcm9tIHJhZGRyX2Igb24gVjNEIDcu
MQotIGJyb2FkY29tL2NvbXBpbGVyOiBmaWxsIHRoZSBvbGQgdmFsdWUgd2hlbiBzcGlsbGluZyBh
IHBhcnRpYWwgd3JpdGUKCkxpb25lbCBMYW5kd2VybGluICgyKToKCi0gYW52OiBkb24ndCBmb3Jn
ZXQgdG8gaGFzaCByZW5kZXIgcGFzcyBjb2xvciBhdHRhY2htZW50cwotIGludGVsOiBmaXh1cCBt
Y3Mgc2FtcGxlciBoYW5kbGUgbG93ZXJpbmcKCkxvcmVuem8gUm9zc2kgKDMpOgoKLSBwYW5mcm9z
dDogQWx3YXlzIGVtaXQgdmVydGV4IGF0dHJpYnV0ZSBkZXNjcmlwdG9ycyBmb3IgYXJjaCA8IHY5
Ci0gcGFudmsvam06IEFsd2F5cyBlbWl0IHZlcnRleCBhdHRyaWJ1dGUgZGVzY3JpcHRvcnMKLSBw
YW52ay9qbTogRml4IHVuYm91bmQgYXR0cmlidXRlIHJlYWRzCgpNYXJjIEFsY2FsYSBQcmlldG8g
KDEpOgoKLSBwYW5mcm9zdC9tb2RlbDogRml4IEc3MjAgYW5kIEc3MjUgc2Z1IHJhdGVzCgpNYXJl
ayBPbMWhw6FrICgzKToKCi0gbWVzYTogY2xhbXAgbGV2ZWwgY291bnQgdG8gdGhlIGFsbG9jYXRl
ZCBsZXZlbCBjb3VudCBpbiBtaXBtYXAgZ2VuZXJhdGlvbgotIHJhZHY6IHNraXAgaW5kaXJlY3Qg
ZHJhd3Mgd2l0aCAobWF4KWRyYXdDb3VudCA9PSAwCi0gcmFkdjogZml4IFJBRFZfRk9SQ0VfVlJT
IChQZXJzb25hIDMgUmVsb2FkKQoKTWlrZSBCbHVtZW5rcmFudHogKDIpOgoKLSBsYXZhcGlwZTog
cmVzZXQgY29tcHV0ZSBzaGFkZXIgaW5mbyBpbiBlbWl0X2NvbXB1dGVfc3RhdGUoKQotIGxhdmFw
aXBlOiB6ZXJvIGNvbXB1dGUgc3RhdGUgZm9yIGV2ZXJ5IG1lc2ggZHJhdwoKTmFubGV5IENoZXJ5
ICgxKToKCi0gaW50ZWwvaXNsOiBTdXBwb3J0IE1TQUEgaW4gc3ViaW1hZ2UgcmFuZ2UgaGVscGVy
CgpPbGl2aWEgTGVlICgxKToKCi0gcGFudmsvY3NmOiBmaXggbGF5ZXJlZCBGQiBiYXJyaWVyIGlu
IHNlY29uZGFyeSBjbWRidWZzCgpQaWVycmUtRXJpYyBQZWxsb3V4LVByYXllciAoMSk6CgotIGxv
YWRlcjogY29uc2lkZXIgcmFkZW9uIGluIGFtZF9wcmVkaWNhdGUKClJoeXMgUGVycnkgKDMpOgoK
LSBuaXI6IGFkZCBkZXJlZl9idWZmZXJfYWRkcmVzcwotIGFjL25pcjogaW1wbGVtZW50IGxvYWRf
c3Nib19hZGRyZXNzCi0gcmFkdjogdXNlIGxvYWRfZGVyZWZfYnVmZmVyX2FkZHJlc3MKClJvYiBD
bGFyayAoMSk6CgotIHR1OiBGaXggZ2VuOCBURVhfTElORV9PRkZTRVQKClJvYiBIZXJyaW5nIChB
cm0pICgxKToKCi0gZXRob3N1OiBGaXggZmxhdHRlbmVkIGZ1bGx5IGNvbm5lY3RlZCBpbnB1dHMK
ClJvaGFuIEdhcmcgKDEpOgoKLSBwdnI6IHVzZSBhIGxvYWQgb3AgZm9yIHRoZSByZXNvbHZlIHN0
ZW5jaWwgbG9hZCBvcAoKU2FtdWVsIFBpdG9pc2V0ICgyKToKCi0gcmFkdjogZml4IGNvcHlpbmcg
VlJTIHJhdGVzIHdpdGggYSBub24temVybyBiYXNlIGxheWVyIGNvcnJlY3RseQotIGFtZDogb25s
eSBlbmFibGUgdGhlIGFkZHJsaWIgU0lNRCBwYXRoIHdoZW4gc3VwcG9ydGVkCgpTaW1vbiBQZXJy
ZXR0YSAoOSk6CgotIG5pcjogZ2VuZXJhbGl6ZSB0aGUgc3JjIHR5cGUgb2YgaW50ZXJsZWF2ZSB0
byB0dWludAotIHBjbzogZHJvcCBpMmkxNiBjb252ZXJzaW9uIGZvciBuaXJfaW50ZXJsZWF2ZSBz
cmNzCi0gcGNvOiBmbHVzaCB0aGUgY2FjaGUgZm9yIGltYWdlcyBhY2Nlc3NlZCB2aWEgYXRvbWlj
cyBhbmQgbm9uLWF0b21pY3MKLSBwY286IHNraXAgcHJvcGFnYXRpbmcgYWNjZXNzIGZvciBkZXJl
ZnMgd2l0aG91dCB2YXJzCi0gcGNvOiBwYXNzIHNoYWRlciBkYXRhIHRvIHByZXByb2Nlc3Npbmcg
ZnVuY3Rpb24KLSBwY286IGNvbnNpZGVyIHJvYnVzdG5lc3MgaW4gbG9hZC9zdG9yZSB2ZWN0b3Jp
emF0aW9uCi0gcGNvOiBhbWVuZCBhdG9taWMgYWRkcmVzcyBjYWxjdWxhdGlvbiBmb3IgMmQgaW1h
Z2VzCi0gcGNvOiBlbnN1cmUgbmlyX2dsb2JhbF9hdG9taWNfcGNvIG9wcyBhcmUgdHJhY2tlZAot
IHBjbzogdXNlIHRoZSBzb3VyY2UgZnJvbSBzcmMgaW5zdGVhZCBvZiBpbyB3aGVuIGJ1aWxkaW5n
IG1hcHBpbmdzCgpUaW11ciBLcmlzdMOzZiAoNik6CgotIHJhZHY6IEludmFsaWRhdGUgTDIgY2Fj
aGUgb24gQUNFIGFmdGVyIHdhaXRpbmcgZm9yIFNETUEKLSByYWR2OiBDcmVhdGUgc2VwYXJhdGUg
Qk8gZm9yIGdhbmcgc2VtYXBob3JlIHRvIGF2b2lkIGNvaGVyZW5jeSBhbmQgcGVyZiBpc3N1ZXMK
LSBhY28vb3B0aW1pemVyOiBLZWVwIE1VQlVGIFNPRkZTRVQgb24gR0ZYNi03Ci0gYWNvL2lzZWw6
IFVzZSBTT0ZGU0VUIHdoZW4gc2VsZWN0aW5nIGJ1ZmZlciBsb2FkcyB3aXRoIGluZGV4IFZHUFIK
LSByYWR2L25pcjogRG9uJ3QgZm9sZCBjb25zdGFudCBvZmZzZXQgaW50byBpbmRleCBWR1BSIGZv
ciBWUyBpbnB1dHMgYW55bW9yZQotIGFjL25pci9uZ2c6IFVzZSBkc19vcl9iMzIgZm9yIHN0b3Jp
bmcgY3VsbGluZyBmbGFncyBvbiBOYXZpIDEwCgpWYWxlbnRpbmUgQnVybGV5ICg3KToKCi0gbHZw
L2NpOiBVcGRhdGUgZXhwZWN0YXRpb25zIGFmdGVyIGdpdGxhYi1ydW5uZXIgdXBkYXRlCi0gdHU6
IEZpeCByZXF1aXJlZFN1Ymdyb3VwU2l6ZVN0YWdlcyBlbmFibGVtZW50Ci0gZnJlZWRyZW5vLCB0
dTogTGltaXQgWEZCIHN0cmVhbXMgb24gR1BVcyBsYWNraW5nIG11bHRpLXN0cmVhbSBxdWVyeSBz
dXBwb3J0Ci0gdHU6IENyZWF0ZSBwYXRjaHBvaW50c19jdHggYmVmb3JlIGVtaXR0aW5nIHN1YnBh
c3MgYmVnaW4gaW4gcmVuZGVycGFzcwotIHR1OiBJZ25vcmUgRkRNIG9mZnNldHMgZm9yIHN1YnNh
bXBsZWQgaW1hZ2VzIHdoZW4gc2hhcmVkIHZpZXdwb3J0IGlzIGFjdGl2ZQotIHR1OiBEbyBub3Qg
YmFrZSBzdGF0aWMgdmlld3BvcnQvc2Npc3NvciB3aGVuIEZETSBpcyBlbmFibGVkCi0gdHU6IEZp
eCBHTUVNIGNsZWFycyB3aXRoIGFuIEZETSBvZmZzZXQgb24gdGhlIGJsaXQtZXZlbnQgY2xlYXIg
cGF0aAoKV2VpIFpoYW8gKDEpOgoKLSB3c2kvZGlzcGxheTogYWxsb2NhdGUgdGhlIEVESUQgZGlz
cGxheSBuYW1lIG9ubHkgb25jZQoKWWl3ZWkgWmhhbmcgKDIpOgoKLSBwYW52ay9hbmRyb2lkOiBh
dm9pZCBwTmV4dCBpbmplY3Rpb24gb2YgY2FsbGVyIEFOQiBpbmZvCi0gdmVudXM6IGVuc3VyZSBx
dWV1ZSBzdWJtaXNzaW9uIHBOZXh0IGNoYWluIGVuZHMgcHJvcGVybHkKCk1lc2EgMjYuMi4zIFJl
bGVhc2UgTm90ZXMgLyAyMDI2LTA5LTE2Cj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09CgpNZXNhIDI2LjIuMyBpcyBhIGJ1ZyBmaXggcmVsZWFzZSB3aGljaCBmaXhlcyBidWdz
IGZvdW5kIHNpbmNlIHRoZSAyNi4yLjIgcmVsZWFzZS4KCk1lc2EgMjYuMi4zIGltcGxlbWVudHMg
dGhlIE9wZW5HTCA0LjYgQVBJLCBidXQgdGhlIHZlcnNpb24gcmVwb3J0ZWQgYnkKZ2xHZXRTdHJp
bmcoR0xfVkVSU0lPTikgb3IgZ2xHZXRJbnRlZ2VydihHTF9NQUpPUl9WRVJTSU9OKSAvCmdsR2V0
SW50ZWdlcnYoR0xfTUlOT1JfVkVSU0lPTikgZGVwZW5kcyBvbiB0aGUgcGFydGljdWxhciBkcml2
ZXIgYmVpbmcgdXNlZC4KU29tZSBkcml2ZXJzIGRvbid0IHN1cHBvcnQgYWxsIHRoZSBmZWF0dXJl
cyByZXF1aXJlZCBpbiBPcGVuR0wgNC42LiBPcGVuR0wKNC42IGlzICoqb25seSoqIGF2YWlsYWJs
ZSBpZiByZXF1ZXN0ZWQgYXQgY29udGV4dCBjcmVhdGlvbi4KQ29tcGF0aWJpbGl0eSBjb250ZXh0
cyBtYXkgcmVwb3J0IGEgbG93ZXIgdmVyc2lvbiBkZXBlbmRpbmcgb24gZWFjaCBkcml2ZXIuCgpN
ZXNhIDI2LjIuMyBpbXBsZW1lbnRzIHRoZSBPcGVuQ0wgMy4xIEFQSSwgYnV0IHRoZSB2ZXJzaW9u
IHJlcG9ydGVkIGJ5CnRoZSBDTF9ERVZJQ0VfVkVSU0lPTiwgQ0xfREVWSUNFX05VTUVSSUNfVkVS
U0lPTiBhbmQgQ0xfREVWSUNFX09QRU5DTF9DX0FMTF9WRVJTSU9OUwpjbEdldERldmljZUluZm8g
cXVlcmllcyBkZXBlbmRzIG9uIHRoZSBwYXJ0aWN1bGFyIGRyaXZlciBiZWluZyB1c2VkLgoKTWVz
YSAyNi4yLjMgaW1wbGVtZW50cyB0aGUgVnVsa2FuIDEuNCBBUEksIGJ1dCB0aGUgdmVyc2lvbiBy
ZXBvcnRlZCBieQp0aGUgYXBpVmVyc2lvbiBwcm9wZXJ0eSBvZiB0aGUgVmtQaHlzaWNhbERldmlj
ZVByb3BlcnRpZXMgc3RydWN0CmRlcGVuZHMgb24gdGhlIHBhcnRpY3VsYXIgZHJpdmVyIGJlaW5n
IHVzZWQuCgpTSEEgY2hlY2tzdW1zCi0tLS0tLS0tLS0tLS0KCjo6CgogICAgVEJELgoKTmV3IGZl
YXR1cmVzCi0tLS0tLS0tLS0tLQoKLSBOb25lCgpCdWcgZml4ZXMKLS0tLS0tLS0tCgotIE5WSyBt
ZW1vcnkgbGVhayBpbiBDbWRDb3B5QnVmZmVyVG9JbWFnZSBpbiAyNi4yLjAsIDI2LjIuMSBhbmQg
MjYuMi4yLgotIFJBRFY6IEdQVSBwYWdlIGZhdWx0IChudWxsIHBvaW50ZXIpIHdpdGggUlQgZW11
bGF0aW9uIG9uIFBvbGFyaXMgKFJYIDU4MCAyMDQ4U1ApLiBJc3N1ZSBiZXR3ZWVuIDI2LjEuNiBh
bmQgMjYuMi4xCi0gW0FOVl1bQVJMXVtiaXNlY3RlZF0gVmlzdWFsIGdyYXBoaWNzIGdsaXRjaGVz
IGluIENvdW50ZXItU3RyaWtlIDIgc3RhcnRpbmcgaW4gTWVzYSAyNi4yLngKLSBbcmFkZW9uc2ld
IE1pbmVjcmFmdCBWb3h5IG1vZDogRGlzdGFudCB3YXRlciByZW5kZXJpbmcgaXNzdWUgb24gVmVn
YSBpR1BVIGFuZCBSRE5BMgotIFxgaGV2Y192YWFwaWAgb24gQU1EIChyYWRlb25zaS9nZngxMTUw
KSBzdGFsbHMgdG8gfjEgZnBzIHdoZW4gaW5wdXQgZnJhbWVzIGNhcnJ5IEEvNTMgKENFQS02MDgv
NzA4KSBjbG9zZWQtY2FwdGlvbiBzaWRlIGRhdGEKLSBhbnY6IFRlc3QgZmFpbHMgaW4gc2ltdWxh
dGlvbiBkdWUgdG8gY29hcnNlIHBpeGVsIHNoYWRpbmcgc3RhdGUKLSBhc2FoaTogMTYtYml0IGJs
ZW5kaW5nIGludG8gUkdCQTMyRiBwcm9kdWNlcyB6ZXJvIGR1ZSB0byAzMi1iaXQgdGlsZWJ1ZmZl
ciBsb2FkCi0gYXNhaGk6IFNvbWUgdGV4dHVyZXMgZG8gbm90IHJlbmRlciBjb3JyZWN0bHkgaW4g
UG9ydGFscyAyCi0gbGlidnVsa2FuX2ludGVsLnNvIGNyYXNoIHdpdGggWC1QbGFuZSAxMi40LjMg
b24gSW50ZWwgQXJjIEI1ODAKLSBuaXJjYWNoZSBjYXVzZXMgZ2x4Z2VhcnMvZWdsZ2VhcnMgdG8g
c2VnZmF1bHQgdW5kZXIgWmluawotIHZ1bGthbixyYWR2OiB3aGVuIHVzaW5nIGRlc2NyaXB0b3Ig
aGVhcHMsIGlucHV0IGF0dGFjaG1lbnRzIGluIFNQSVItViBhcmUgaW5jb3JyZWN0bHkgZGV0ZWN0
ZWQgYXMgcmVhZCBvbmx5IGluc3RlYWQgb2YgcmVhZCB3cml0ZQoKQ2hhbmdlcwotLS0tLS0tCgpB
bHlzc2EgUm9zZW56d2VpZyAoMSk6CgotIG1lc2Evc3Q6IGZpeCBpbmNvcnJlY3QgVlMgaW5wdXQg
YmFzZXMKCkFuZHJ6ZWogRGF0Y3p1ayAoMSk6CgotIGFjL3NxdHQsIHJhZHYsIHJhZGVvbnNpOiBG
aXggU1FUVCBidWZmZXIgc2l6ZSBhbGlnbm1lbnQgaXNzdWVzCgpCZW5qYW1pbiBDaGVuZyAoMSk6
CgotIHJhZGVvbnNpOiBzZXQgc3RlbmNpbCBjbGVhciB0byAwIHdoZW4gZW5hYmxpbmcgVEMgY29t
cGF0CgpDYWlvIE9saXZlaXJhICgxKToKCi0gc3BpcnY6IFByZXNlcnZlIGFsbCBmcF9tYXRoX2N0
cmwgYml0cyBpbiB2dG5faGFuZGxlX2FsdSBkZWZhdWx0IGNhc2UKCkNocmlzdGlhbiBHbWVpbmVy
ICgyKToKCi0gZXRuYXZpdjogRG8gbm90IGFib3J0IG9uIHVuc3VwcG9ydGVkIHN0ZW5jaWwtb25s
eSBibGl0cwotIGV0bmF2aXY6IFVzZSBSUyBkZXB0aCBmb3JtYXRzIG9ubHkgb24gaGFsdGk1KwoK
RGFueWxvIFBpbGlhaWV2ICg1KToKCi0gdHU6IFdhaXQgZm9yIFhGQiBxdWVyeSB3cml0ZXMgdG8g
bGFuZCBiZWZvcmUgbWFraW5nIGl0IGF2YWlsYWJsZQotIHR1OiBTeW5jaHJvbml6aW5nIHdpdGgg
Q21kQ29weVF1ZXJ5UG9vbFJlc3VsdCBzaG91bGQgd2FpdCBmb3IgbWVtIHdyaXRlcwotIHR1OiBV
c2UgcF9hdG9taWNfcmVhZCB0byByZWFkIGZyb20gcXVlcnkncyBzbG90LT5hdmFpbGFibGUKLSB0
dTogRml4IFBBQ0tFRCArIGFsaWduYXMoOCkgYXBwbGljYXRpb24gdG8gdGhlIHNhbWUgc3RydWN0
IG9uIG9sZGVyIEdDQwotIHR1OiBIYW5kbGUgbGF6eSBtZW1vcnkgaW4gR2V0RGV2aWNlTWVtb3J5
T3BhcXVlQ2FwdHVyZUFkZHJlc3MKCkRhdmlkIFJvc2NhICgyKToKCi0gdmE6IERyb3AgSEVWQyBT
RUkgcGFyc2luZwotIHJhZHYvdmlkZW86IEZpeCBzZXR0aW5nIHNlc3Npb24gcGFyYW1ldGVycyBv
dmVycmlkZSBpbmZvCgpEbWl0cnkgQmFyeXNoa292ICg4KToKCi0gaXIzOiBrZWVwIGJ5dGUgU1NC
TyBvZmZzZXRzIGJlZm9yZSBhNnh4Ci0gZnJlZWRyZW5vL2E1eHg6IG9ubHkgMkQtYmxpdCBiZXR3
ZWVuIGNvbXBhdGlibGUgZm9ybWF0cwotIGZyZWVkcmVuby9hNXh4OiBwcm9ncmFtIE5VTU5PTlBP
U1ZBUiB3aXRoIHBvc2l0aW9uJ3MgVlBDIGxvY2F0aW9uCi0gZnJlZWRyZW5vL2E0eHgrYTV4eDog
Y2xhbXAgdGhlIHRleHR1cmUgYnVmZmVyIHNpemUKLSBmcmVlZHJlbm86IGtlZXAgdGhlIHNlcGFy
YXRlIHN0ZW5jaWwgb3V0IG9mIHRoZSBzaGFkb3cgYmxpdAotIGZyZWVkcmVuby9hNXh4OiBibGl0
IHRoZSBzZXBhcmF0ZSBzdGVuY2lsIHBsYW5lIHRvbwotIGlyMzogc2tpcCB0aGUgcGhpcyBvZiBu
b24tR1BSIHJlZ2lzdGVycyBpbiB0aGUgbWluaW11bSBwcmVzc3VyZSBib3VuZAotIGZyZWVkcmVu
by9hNXh4OiBib3VuZCBibGl0cyBieSB0aGUgbGF5ZXIgY291bnQsIG5vdCB0aGUgZGVwdGgKCkVt
bWEgQW5ob2x0ICgzKToKCi0gdHU6IERyb3AgVFJBTlNGRVJfU1JDL0RTVCBmcm9tIGJ1ZmZlckZl
YXR1cmVzLgotIHR1OiBGaXggdGhlIHNUeXBlIG9mIHRoZSByZXR1cm5lZCBWa0ZyYWdtZW50U2hh
ZGluZ1JhdGVLSFJzLgotIHR1OiBGaXggZGVzdHJveSBvcmRlciBvZiBhdXRvdHVuZSB2cyBwZXJm
Y291bnRlcnMgaW4gZmFpbHVyZSBwYXRoLgoKRXJpYyBFbmdlc3Ryb20gKDQpOgoKLSBkb2NzOiBh
ZGQgc2hhIHN1bSBmb3IgMjYuMi4yCi0gLnBpY2tfc3RhdHVzLmpzb246IFVwZGF0ZSB0byA5ZjQy
ZWExMjM5MDI1ZDNmOTNkOWJiZjc0MDUzNDBhZGNlYzk0NDE5Ci0gLnBpY2tfc3RhdHVzLmpzb246
IE1hcmsgZjQ1ODI1YTBjNzI0ZDA2ZjIzMWExMjEwNDg0ZmU5YWY3MWEzZmZhYiBhcyBkZW5vbWlu
YXRlZAotIC5waWNrX3N0YXR1cy5qc29uOiBNYXJrIDg1OWZjYzNiNzRmODMxYmJiOTE1MWYwNmQw
NTVkZGZkNDVjYzZlNTAgYXMgZGVub21pbmF0ZWQKCkZyYW5rIEJpbm5zICgzKToKCi0gcHZyOiBh
ZGQgbWlzc2luZyBHUFUgYXJjaGl0ZWN0dXJlIHRvIGRldmljZSBpbmZvIGZvciBzb21lIEJWTkNz
Ci0gcHZyOiBmaXh1cCBvcmRlcmluZyBvZiAoaGFzXF8pdXNjX2l0cl9wYXJhbGxlbF9pbnN0YW5j
ZXMgaW4gZGV2IGluZm8KLSB6aW5rOiByZXBsYWNlIGJsZW5kIGFuZCB2ZXJ0ZXggZWxlbWVudHMg
c3RhdGUgaGFzaGVzIHdpdGggSURzCgpHYW5lc2ggQmVsZ3VyIFJhbWFjaGFuZHJhICgxKToKCi0g
YW1kOiBhZGQgZ2Z4MTE3MQoKR2VvcmcgTGVobWFubiAoMik6CgotIG5pci9vcHRfdXViOiBmaXgg
aW1heCBvcHRpbWl6YXRpb24KLSBhY286IGF2b2lkIG11YnVmIGJvdW5kcyBjaGVja2luZyBmb3Ig
Z2xvYmFsCgpJdsOhbiBCcmlhbm8gKDEpOgoKLSBhbnY6IGZpeCBwdXNoIGNvbnN0YW50IHJhbmdl
IGdhdGhlcmluZyBmb3IgZHluYW1pYyBvZmZzZXRzCgpKaXl1IFlhbmcgKDEpOgoKLSBjbGM6IGZp
eCBmZCBsZWFrIGluIG9wZW5fY2xjX2RhdGEoKSBvbiBtYXAgZmFpbHVyZQoKSnVzdG9uIExpICgx
KToKCi0gYW52L2FuZHJvaWQ6IERvbid0IGRpc2FibGUgQVVYX0JJVCBpbXBvcnRpbmcgWGUyKyBD
Q1MgbW9kIGltYWdlcwoKS2FybWppdCBNYWhpbCAoMSk6CgotIHR1OiBGaXggc3BhcnNlIGJpbmQg
Y29sdW1uIG1lcmdpbmcKCkthcm9sIEhlcmJzdCAoMik6CgotIG5pci9zZXJpYWxpemU6IHNldCBp
bmZvLnNwZWMgdG8gTlVMTAotIHJ1c3RpY2wvZXZlbnQ6IHByb3Blcmx5IGltcGxlbWVudCBDTF9Q
Uk9GSUxJTkdfSU5GT19OT1RfQVZBSUxBQkxFIGVycm9yIGNvbmRpdGlvbgoKS29zdGFkaW4gU2hp
c2htYW5vdiAoMSk6CgotIGFjbzogYWRkIG1pc3NpbmcgPGFsZ29yaXRobT4gaW5jbHVkZQoKTGVv
biBQZXJpYW51ICgxKToKCi0gcHZyOiBGaXggcHJpbWl0aXZlIHJlc3RhcnQgZm9yIG5vbi1pbmRl
eGVkIGRyYXdzCgpMaW9uZWwgTGFuZHdlcmxpbiAoNik6CgotIGFudjogZml4IDY0Yml0IHZhbHVl
cyBwcm9tb3RlZCB0byBpbmxpbmUgcmVnaXN0ZXIKLSBicnc6IHVzZSBzYW1wbGVyIGZyb20gaW5j
b21pbmcgaW5zdHJ1Y3Rpb25zIGZvciBjb21iaW5lcgotIGFudjogZml4dXAgZHluYW1pYyBidWZm
ZXJzIHdpdGggQU5WX0RFQlVHPWJpbmRsZXNzCi0gYW52OiBlbWl0IENQQiBzZXR1cCBhdCBkZXZp
Y2UgaW5pdGlhbGl6YXRpb24KLSBhbnY6IGZpeCBzeW5jaHJvbml6YXRpb24gb2YgYWNjZWxlcmF0
aW9uIHN0cnVjdHVyZSBxdWVyeSB3cml0ZXMKLSBhbnY6IGFkZCBtaXNzaW5nIGhhbmRsaW5nIGZv
ciBQSVBFTElORV9TVEFHRV8yX0NPUFlfSU5ESVJFQ1QKCkxpdml1IFByb2RlYSAoMSk6CgotIGNs
YzogRml4IHN0YXRpYyBsaW5rIHdpdGggbGx2bSBhbmQgY2xhbmcgMjMKCk1hcmVrIE9sxaHDoWsg
KDEpOgoKLSByYWR2OiBmaXggc1JHQiBjb2xvciBjbGVhcnMgdmlhIGNvbXB1dGUKCk1hcnkgR3Vp
bGxlbWFyZCAoMSk6CgotIGFzYWhpOiBBZGQgdGhlIHNhbWUgd29ya2Fyb3VuZCBhcyBGaXJlZm94
IGZvciBaZW4gYnJvd3NlcgoKTWF0dCBUdXJuZXIgKDIpOgoKLSBtZXNhL3N0OiB1c2UgY29uY3Jl
dGUgZm9ybWF0cyBmb3IgbG93ZXJlZCBZVVYgcGxhbmUgdmlld3MKLSBkcmk6IHVzZSBjb25jcmV0
ZSBmb3JtYXRzIGZvciB0aGUgR1I4OCwgODg4OCBhbmQgc1JHQiBEUk0gZm9ybWF0cwoKTWVsIEhl
bm5pbmcgKDIpOgoKLSBudms6IEZpeCBtZW1vcnkgbGVhayBpbiBjb21wdXRlIHNhdmUvcmVzdG9y
ZQotIG52azogRml4IGxlYWsgb2YgZGV2LT5oZWFwIGFuZCBkZXYtPnJlcGxheV9oZWFwCgpNaWNo
YWVsIENoZW5nICgxKToKCi0gdXRpbC9kcmlyYzogY2hhbmdlIG1pbl92YWx1ZSB0byBtYXhfdmFs
dWUgdHlwbwoKTWlrZSBCbHVtZW5rcmFudHogKDIpOgoKLSBsbHZtcGlwZTogZm9yY2UgYWxpZ25t
ZW50IGZvciBXaW5kb3dzIHRleHR1cmUgYWxsb2NhdGlvbnMKLSBudHY6IGltcHJvdmUgZGVyZWYg
dHlwZSBtYXRjaGluZyB3aGVuIGNvbnZlcnRpbmcgdnJpIGRlcmVmcwoKUGF2ZWwgT25kcmHEjWth
ICgxKToKCi0gcjMwMDogZG9uJ3QgcHJvcGFnYXRlIG5lZ2F0aW9uIHRocm91Z2ggYWJzb2x1dGUg
dmFsdWVzCgpSaHlzIFBlcnJ5ICg0KToKCi0gcmFkdjogZG9uJ3Qgc2V0IG11bGFkZF9zdXBwb3J0
X3ByZWZlcnNfc3BsaXQgd2hlbiBmZm1hIGlzIHVuc3VwcG9ydGVkCi0gcmFkdjogaW5pdGlhbGl6
ZSBzaGFkZXJfYmxha2UzIGZvciBzaGFkZXIgb2JqZWN0cwotIHJhZHY6IGhhc2ggZGVzY3JpcHRv
ciBzZXQgbGF5b3V0cyBpbiByYWR2X2hhc2hfZ3JhcGhpY3Nfc3BpcnZfdG9fbmlyCi0gcmFkZW9u
c2k6IHVzZSBhY19zaGFkZXJfY29uZmlnOjpsZHNfc2l6ZSBmcm9tIEFDTwoKUm9oYW4gR2FyZyAo
MSk6CgotIG5pcjogZGVyaXZlIGNvbG9yX2lzX2R1YWxfc291cmNlIGZyb20gZGVjbGFyZWQgdmFy
cwoKUnlhbiBNY2tlZXZlciAoMSk6CgotIHBhbnZrL3Y2LTc6IGluY2x1ZGUgcmVxdWlyZWQgbGF5
b3V0cyBpbiBob3N0IGltYWdlIGNvcHkgbGF5b3V0cwoKUnlhbiBaaGFuZyAoMyk6CgotIHdzaS93
YXlsYW5kOiBza2lwIGZlZWRiYWNrIGRpc3BhdGNoIHdoZW4gbm90aGluZyBpcyBvdXRzdGFuZGlu
ZwotIHBhbnZrOiBpbml0aWFsaXplIENQVSB0cmFjaW5nIGNhdGVnb3JpZXMKLSBwYW52ay91dHJh
Y2U6IHJlcGxhY2UgYm9ndXMgYXNzZXJ0IHdpdGggc3RhdGljX2Fzc2VydCBpbiBwZXJmZXR0byBi
ZWdpbiBldmVudCBjYWxsYmFjawoKU2FtdWVsIFBpdG9pc2V0ICgzKToKCi0gcmFkdjogZml4IEww
X0NBQ0hFX0hJVF9SQVRJTyBwZXJmIGNvdW50ZXIgb24gR0ZYMTEKLSByYWR2OiByZXR1cm4gVktf
RVJST1JfREVWSUNFX0xPU1QgaWYgYW55IHNoYWRlciBleGVjdXRlZCBPcEFib3J0S0hSCi0gcmFk
djogY29uc2lkZXIgc2hhZGVyIGFib3J0IGZhdWx0cyB3aXRoIFZLX0tIUl9kZXZpY2VfZmF1bHQK
ClNpbHZpbyBWaWxlcmlubyAoMik6CgotIGQzZDEyOiBGaXggZDNkMTIgdmlkZW8gZW5jb2RlciBi
YXRjaCBsZWFrcwotIGQzZDEyOiBGaXggZDNkMTIgdmlkZW8gZGVjb2RlciBiYXRjaCBsZWFrcwoK
VGFrdXJvIEFzaGllICgxKToKCi0gcGFuZnJvc3Q6IFJlYWxsb2NhdGUgQk8gd2hlbiBsaW5lYXIg
bGF5b3V0IGdyb3dzCgpUYXBhbmkgUMOkbGxpICgzKToKCi0gYW52OiBjaGFuZ2UgYmluZGxlc3Mg
ZGVidWcgZW52IHZhcmlhYmxlIHRvIGJlIGRyaXJjIG9wdGlvbgotIGFudjogdG9nZ2xlIGFudl9h
bHdheXNfYmluZGxlc3MgZm9yIFhQbGFuZS0xMgotIGFudjogZml4IGNtZF9idWZmZXJfc2V0X2lu
ZGlyZWN0X3N0cmlkZSBvbiBBUkwKClZhbmRvbWFzICgxKToKCi0gemluazogcHV0IHRoZSBidWZm
ZXIgdmlldyBjYWNoZSBrZXkgZmlyc3QKClZpbnNvbiBMZWUgKDIpOgoKLSBnbHNsOiBpbml0aWFs
aXplIHBpeGVsX2xvY2FsX3N0b3JhZ2UgYW5kIHl1diBpbiBpcl92YXJpYWJsZSBjb25zdHJ1Y3Rv
cgotIGdsc2w6IGluaXRpYWxpemUgaXNfZ2xvYmFsIGluIGlyX3ZhcmlhYmxlX3JlZmNvdW50X2Vu
dHJ5IGNvbnN0cnVjdG9yCgpWw61jdG9yIE1hbnVlbCBKw6FxdWV6IExlYWwgKDEpOgoKLSByYWR2
L3ZpZGVvOiByZXBvcnQgaGFzT3ZlcnJpZGVzIG9uIEFWMSBlbmNvZGluZwoKWWl3ZWkgWmhhbmcg
KDEpOgoKLSBwYW52azogcGxhY2UgY29oZXJlbnQgbWVtb3J5IHR5cGUgYmVmb3JlIGNhY2hlZCB0
eXBlCgpyYWphcnlhbjE0OTIwMDcgKDEpOgoKLSBzcGlydjogRG9uJ3QgaW1wbGljaXRseSBzZXQg
QUNDRVNTX05PTl9XUklURUFCTEUgZm9yIGlucHV0IGF0dGFjaG1lbnRzCg==

--===============0039174722543131915==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mesa-mesa-tools-native-upgrade-26.2.2-26.2.3-26.2.2-.patch"

RnJvbSAyOGQwMDEwNjY5ZDE2MmRiMWYzZmI0YjRmNWMwYzljMjE3MTAzMDQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTcgU2VwIDIwMjYgMDU6MjI6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNhLG1lc2EtdG9vbHMtbmF0aXZlOiB1cGdyYWRlIDI2LjIuMiAtPiAyNi4yLjMsMjYuMi4yIC0+
CiAyNi4yLjMKClNvdXJjZTogZG9jcy9yZWxub3Rlcy8yNi4yLjIucnN0LCBkb2NzL3JlbG5vdGVz
LzI2LjIuMy5yc3QKCk1lc2EgMjYuMi4yIFJlbGVhc2UgTm90ZXMgLyAyMDI2LTA5LTAyCj09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpNZXNhIDI2LjIuMiBpcyBhIGJ1ZyBm
aXggcmVsZWFzZSB3aGljaCBmaXhlcyBidWdzIGZvdW5kIHNpbmNlIHRoZSAyNi4yLjEgcmVsZWFz
ZS4KCk1lc2EgMjYuMi4yIGltcGxlbWVudHMgdGhlIE9wZW5HTCA0LjYgQVBJLCBidXQgdGhlIHZl
cnNpb24gcmVwb3J0ZWQgYnkKZ2xHZXRTdHJpbmcoR0xfVkVSU0lPTikgb3IgZ2xHZXRJbnRlZ2Vy
dihHTF9NQUpPUl9WRVJTSU9OKSAvCmdsR2V0SW50ZWdlcnYoR0xfTUlOT1JfVkVSU0lPTikgZGVw
ZW5kcyBvbiB0aGUgcGFydGljdWxhciBkcml2ZXIgYmVpbmcgdXNlZC4KU29tZSBkcml2ZXJzIGRv
bid0IHN1cHBvcnQgYWxsIHRoZSBmZWF0dXJlcyByZXF1aXJlZCBpbiBPcGVuR0wgNC42LiBPcGVu
R0wKNC42IGlzICoqb25seSoqIGF2YWlsYWJsZSBpZiByZXF1ZXN0ZWQgYXQgY29udGV4dCBjcmVh
dGlvbi4KQ29tcGF0aWJpbGl0eSBjb250ZXh0cyBtYXkgcmVwb3J0IGEgbG93ZXIgdmVyc2lvbiBk
ZXBlbmRpbmcgb24gZWFjaCBkcml2ZXIuCgpNZXNhIDI2LjIuMiBpbXBsZW1lbnRzIHRoZSBPcGVu
Q0wgMy4xIEFQSSwgYnV0IHRoZSB2ZXJzaW9uIHJlcG9ydGVkIGJ5CnRoZSBDTF9ERVZJQ0VfVkVS
U0lPTiwgQ0xfREVWSUNFX05VTUVSSUNfVkVSU0lPTiBhbmQgQ0xfREVWSUNFX09QRU5DTF9DX0FM
TF9WRVJTSU9OUwpjbEdldERldmljZUluZm8gcXVlcmllcyBkZXBlbmRzIG9uIHRoZSBwYXJ0aWN1
bGFyIGRyaXZlciBiZWluZyB1c2VkLgoKTWVzYSAyNi4yLjIgaW1wbGVtZW50cyB0aGUgVnVsa2Fu
IDEuNCBBUEksIGJ1dCB0aGUgdmVyc2lvbiByZXBvcnRlZCBieQp0aGUgYXBpVmVyc2lvbiBwcm9w
ZXJ0eSBvZiB0aGUgVmtQaHlzaWNhbERldmljZVByb3BlcnRpZXMgc3RydWN0CmRlcGVuZHMgb24g
dGhlIHBhcnRpY3VsYXIgZHJpdmVyIGJlaW5nIHVzZWQuCgpTSEEgY2hlY2tzdW1zCi0tLS0tLS0t
LS0tLS0KCjo6CgogICAgU0hBMjU2OiBlZWIyOWNhN2U1NmNmYWE4ZThhNzk1MzhkY2Y4MzRlM2Ix
OGU1MDFjMzFiZWY1MTQ1ZTk1OWVhNDM3Y2M0MjE2ICBtZXNhLTI2LjIuMi50YXIueHoKICAgIFNI
QTUxMjogNTViMTIzNGM4NjUzZGFkOWI4NWJhM2RlN2I3NzdhMGQ5NTc5MDliYWY0NjI4ZjBjMDBl
MjFkNGJhODljMDA0Y2I2ODdhMWRjZjhkYTQ2ZWQwYTA5MjIzMWRkNGY4NTkwMjc1MDlmODNhZDhj
NTU4NzUwODQ1YmE0NzA5MDI2MTUgIG1lc2EtMjYuMi4yLnRhci54egoKTmV3IGZlYXR1cmVzCi0t
LS0tLS0tLS0tLQoKLSBOb25lCgpCdWcgZml4ZXMKLS0tLS0tLS0tCgotIDI2LjIueCBidWlsZCBm
YWlscyB3aXRoIGFybWhmCi0gQ29uZmlkZW50aWFsIGlzc3VlICMxNTA1MgotIEdMIHN0ZW5jaWwg
cmVmZXJlbmNlIHF1ZXJ5IGRvZXMgbm90IHVwZGF0ZSBpbW1lZGlhdGVseQotIE1lc2EgMjYuMi4x
OiByYWRlb25zaSBubyBsb25nZXIgbG9hZHMgZm9yIEdDTjEgLyBQaXRjYWlybiB3aGVuIHVzaW5n
IHJhZGVvbiBkcml2ZXIuCi0gVGV4dHVyZXMgZ290IHN3YXBwZWQvZ2xpdGNoZWQgb24gV3V0aGVy
aW5nIFdhdmVzIGdhbWUuCi0gW05hdmkxMF1bUmFkZW9uU0kvUkFEVl0gTkdHIGN1bGxpbmcgY2F1
c2VzIG5vbmRldGVybWluaXN0aWMgR1BVIGhhbmdzOyBub25nZ2MgZml4ZXMgYm90aCBPcGVuR0wg
YW5kIFZ1bGthbgotIFtyYWR2XVtiaXNlY3RlZF1bcmVncmVzc2lvbl0gQnJva2VuIHJlbmRlcmlu
ZyBpbiBQZXJzb25hIDMgUmVsb2FkIG1lbnUgb24gUkROQTIgaW4gZ2FtZXNjb3BlCi0gcmFkdiBp
Z25vcmVzIGNvdW50IG9mIDAgaW4gdmtDbWREcmF3SW5kaXJlY3QKCkNoYW5nZXMKLS0tLS0tLQoK
QWxsZW4gQmFsbHdheSAoMSk6CgotIGFudjogRml4IEFTVEMgZW11bGF0aW9uIHN5bmMgaW4gQ29w
eU1lbW9yeVRvSW1hZ2UKCkFzaGxleSBTbWl0aCAoMSk6CgotIHBhbi9iaWZyb3N0OiBGaXggc2hh
ZGVyIGNsb2NrIHNlbGVjdGlvbgoKQmVuamFtaW4gQ2hlbmcgKDEpOgoKLSBtZXNhL21haW46IEFk
ZCBleHRyYV9uZXdfYnVmZmVycyBmb3IgU1RFTkNJTF9SRUYKCkNocmlzdGlhbiBHbWVpbmVyICgy
KToKCi0gZXRuYXZpdjogUHJvZ3JhbSB0aGUgaTJpIGRlc3RpbmF0aW9uIHR5cGUgaW4gc3JjMQot
IGV0bmF2aXY6IG5pcjogQ2FsbCBuaXJfb3B0X2NvbWJpbmVfc3RvcmVzKC4uKQoKRGF2ZSBBaXJs
aWUgKDEpOgoKLSBuaXI6IG1vdmUgbG9hZF9zc2JvX2FkZHJlc3MgdG8gdGFraW5nIHZhcmlhYmxl
IHNpemUgc3JjMAoKRGF2aWQgUm9zY2EgKDYpOgoKLSB2YTogQ29tcGFyZSBmaWxlIGRlc2NyaXB0
aW9ucyB0byBkZWR1cGxpY2F0ZSBvYmplY3RzIHdoZW4gZXhwb3J0aW5nIHN1cmZhY2UKLSB2YTog
UGFyc2UgYWxsIEhFVkMgc2xpY2UgTkFMIHVuaXQgdHlwZXMKLSB2YTogUGFyc2UgSEVWQyBlbmNv
ZGUgc2xpY2VfdGVtcG9yYWxfbXZwX2VuYWJsZWRfZmxhZwotIHZhOiBGaXggcGFyc2luZyBIRVZD
IGRlY29kZSBzbGljZV90ZW1wb3JhbF9tdnBfZW5hYmxlZF9mbGFnCi0gdmE6IEZpeCBwYXJzaW5n
IEhFVkMgVlBTIHRpbWluZyBpbmZvCi0gcmFkZW9uc2kvbW06IEZpeCBWQ04gZW5jb2RlIGFsbG93
ZWRfbWF4X2JpdHN0cmVhbV9zaXplCgpEbWl0cnkgQmFyeXNoa292ICgzKToKCi0gdHVybmlwOiBz
Y2FsZSB0aGUgdHJhbnNmb3JtIGZlZWRiYWNrIGNvdW50ZXIgb2Zmc2V0IG9uIGE2eHgKLSBmcmVl
ZHJlbm8vYTZ4eDogc3VidHJhY3QgdGhlIHRyYW5zZm9ybSBmZWVkYmFjayBidWZmZXIgb2Zmc2V0
IGluIENQX0RSQVdfQVVUTwotIG52MzA6IGZpeCBhYnMgc291cmNlIG1vZGlmaWVyIG9uIGZyYWdt
ZW50IHByb2dyYW0gc291cmNlcyAxIGFuZCAyCgpEb21pbmlxdWUgQmVsaGFjaGVtaSAoMSk6Cgot
IHBjbzogZml4IGNvbXBpbGUgZmFpbHVyZSBmb3IgYXJyYXlMZW5ndGgoKSBvbgoKW0NoYW5nZWxv
ZyB0cnVuY2F0ZWQgYXMgaXQgZXhjZWVkcyAzMDAwIGNoYXJhY3RlcnM7CnRoZSBmdWxsIGNoYW5n
ZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4gYXR0YWNobWVudCB0byB0aGUgQVVIIGVtYWlsXQoKU291
cmNlOiBkb2NzL3JlbG5vdGVzLzI2LjIuMi5yc3QsIGRvY3MvcmVsbm90ZXMvMjYuMi4zLnJzdAoK
TWVzYSAyNi4yLjIgUmVsZWFzZSBOb3RlcyAvIDIwMjYtMDktMDIKPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0KCk1lc2EgMjYuMi4yIGlzIGEgYnVnIGZpeCByZWxlYXNlIHdo
aWNoIGZpeGVzIGJ1Z3MgZm91bmQgc2luY2UgdGhlIDI2LjIuMSByZWxlYXNlLgoKTWVzYSAyNi4y
LjIgaW1wbGVtZW50cyB0aGUgT3BlbkdMIDQuNiBBUEksIGJ1dCB0aGUgdmVyc2lvbiByZXBvcnRl
ZCBieQpnbEdldFN0cmluZyhHTF9WRVJTSU9OKSBvciBnbEdldEludGVnZXJ2KEdMX01BSk9SX1ZF
UlNJT04pIC8KZ2xHZXRJbnRlZ2VydihHTF9NSU5PUl9WRVJTSU9OKSBkZXBlbmRzIG9uIHRoZSBw
YXJ0aWN1bGFyIGRyaXZlciBiZWluZyB1c2VkLgpTb21lIGRyaXZlcnMgZG9uJ3Qgc3VwcG9ydCBh
bGwgdGhlIGZlYXR1cmVzIHJlcXVpcmVkIGluIE9wZW5HTCA0LjYuIE9wZW5HTAo0LjYgaXMgKipv
bmx5KiogYXZhaWxhYmxlIGlmIHJlcXVlc3RlZCBhdCBjb250ZXh0IGNyZWF0aW9uLgpDb21wYXRp
YmlsaXR5IGNvbnRleHRzIG1heSByZXBvcnQgYSBsb3dlciB2ZXJzaW9uIGRlcGVuZGluZyBvbiBl
YWNoIGRyaXZlci4KCk1lc2EgMjYuMi4yIGltcGxlbWVudHMgdGhlIE9wZW5DTCAzLjEgQVBJLCBi
dXQgdGhlIHZlcnNpb24gcmVwb3J0ZWQgYnkKdGhlIENMX0RFVklDRV9WRVJTSU9OLCBDTF9ERVZJ
Q0VfTlVNRVJJQ19WRVJTSU9OIGFuZCBDTF9ERVZJQ0VfT1BFTkNMX0NfQUxMX1ZFUlNJT05TCmNs
R2V0RGV2aWNlSW5mbyBxdWVyaWVzIGRlcGVuZHMgb24gdGhlIHBhcnRpY3VsYXIgZHJpdmVyIGJl
aW5nIHVzZWQuCgpNZXNhIDI2LjIuMiBpbXBsZW1lbnRzIHRoZSBWdWxrYW4gMS40IEFQSSwgYnV0
IHRoZSB2ZXJzaW9uIHJlcG9ydGVkIGJ5CnRoZSBhcGlWZXJzaW9uIHByb3BlcnR5IG9mIHRoZSBW
a1BoeXNpY2FsRGV2aWNlUHJvcGVydGllcyBzdHJ1Y3QKZGVwZW5kcyBvbiB0aGUgcGFydGljdWxh
ciBkcml2ZXIgYmVpbmcgdXNlZC4KClNIQSBjaGVja3N1bXMKLS0tLS0tLS0tLS0tLQoKOjoKCiAg
ICBTSEEyNTY6IGVlYjI5Y2E3ZTU2Y2ZhYThlOGE3OTUzOGRjZjgzNGUzYjE4ZTUwMWMzMWJlZjUx
NDVlOTU5ZWE0MzdjYzQyMTYgIG1lc2EtMjYuMi4yLnRhci54egogICAgU0hBNTEyOiA1NWIxMjM0
Yzg2NTNkYWQ5Yjg1YmEzZGU3Yjc3N2EwZDk1NzkwOWJhZjQ2MjhmMGMwMGUyMWQ0YmE4OWMwMDRj
YjY4N2ExZGNmOGRhNDZlZDBhMDkyMjMxZGQ0Zjg1OTAyNzUwOWY4M2FkOGM1NTg3NTA4NDViYTQ3
MDkwMjYxNSAgbWVzYS0yNi4yLjIudGFyLnh6CgpOZXcgZmVhdHVyZXMKLS0tLS0tLS0tLS0tCgot
IE5vbmUKCkJ1ZyBmaXhlcwotLS0tLS0tLS0KCi0gMjYuMi54IGJ1aWxkIGZhaWxzIHdpdGggYXJt
aGYKLSBDb25maWRlbnRpYWwgaXNzdWUgIzE1MDUyCi0gR0wgc3RlbmNpbCByZWZlcmVuY2UgcXVl
cnkgZG9lcyBub3QgdXBkYXRlIGltbWVkaWF0ZWx5Ci0gTWVzYSAyNi4yLjE6IHJhZGVvbnNpIG5v
IGxvbmdlciBsb2FkcyBmb3IgR0NOMSAvIFBpdGNhaXJuIHdoZW4gdXNpbmcgcmFkZW9uIGRyaXZl
ci4KLSBUZXh0dXJlcyBnb3Qgc3dhcHBlZC9nbGl0Y2hlZCBvbiBXdXRoZXJpbmcgV2F2ZXMgZ2Ft
ZS4KLSBbTmF2aTEwXVtSYWRlb25TSS9SQURWXSBOR0cgY3VsbGluZyBjYXVzZXMgbm9uZGV0ZXJt
aW5pc3RpYyBHUFUgaGFuZ3M7IG5vbmdnYyBmaXhlcyBib3RoIE9wZW5HTCBhbmQgVnVsa2FuCi0g
W3JhZHZdW2Jpc2VjdGVkXVtyZWdyZXNzaW9uXSBCcm9rZW4gcmVuZGVyaW5nIGluIFBlcnNvbmEg
MyBSZWxvYWQgbWVudSBvbiBSRE5BMiBpbiBnYW1lc2NvcGUKLSByYWR2IGlnbm9yZXMgY291bnQg
b2YgMCBpbiB2a0NtZERyYXdJbmRpcmVjdAoKQ2hhbmdlcwotLS0tLS0tCgpBbGxlbiBCYWxsd2F5
ICgxKToKCi0gYW52OiBGaXggQVNUQyBlbXVsYXRpb24gc3luYyBpbiBDb3B5TWVtb3J5VG9JbWFn
ZQoKQXNobGV5IFNtaXRoICgxKToKCi0gcGFuL2JpZnJvc3Q6IEZpeCBzaGFkZXIgY2xvY2sgc2Vs
ZWN0aW9uCgpCZW5qYW1pbiBDaGVuZyAoMSk6CgotIG1lc2EvbWFpbjogQWRkIGV4dHJhX25ld19i
dWZmZXJzIGZvciBTVEVOQ0lMX1JFRgoKQ2hyaXN0aWFuIEdtZWluZXIgKDIpOgoKLSBldG5hdml2
OiBQcm9ncmFtIHRoZSBpMmkgZGVzdGluYXRpb24gdHlwZSBpbiBzcmMxCi0gZXRuYXZpdjogbmly
OiBDYWxsIG5pcl9vcHRfY29tYmluZV9zdG9yZXMoLi4pCgpEYXZlIEFpcmxpZSAoMSk6CgotIG5p
cjogbW92ZSBsb2FkX3NzYm9fYWRkcmVzcyB0byB0YWtpbmcgdmFyaWFibGUgc2l6ZSBzcmMwCgpE
YXZpZCBSb3NjYSAoNik6CgotIHZhOiBDb21wYXJlIGZpbGUgZGVzY3JpcHRpb25zIHRvIGRlZHVw
bGljYXRlIG9iamVjdHMgd2hlbiBleHBvcnRpbmcgc3VyZmFjZQotIHZhOiBQYXJzZSBhbGwgSEVW
QyBzbGljZSBOQUwgdW5pdCB0eXBlcwotIHZhOiBQYXJzZSBIRVZDIGVuY29kZSBzbGljZV90ZW1w
b3JhbF9tdnBfZW5hYmxlZF9mbGFnCi0gdmE6IEZpeCBwYXJzaW5nIEhFVkMgZGVjb2RlIHNsaWNl
X3RlbXBvcmFsX212cF9lbmFibGVkX2ZsYWcKLSB2YTogRml4IHBhcnNpbmcgSEVWQyBWUFMgdGlt
aW5nIGluZm8KLSByYWRlb25zaS9tbTogRml4IFZDTiBlbmNvZGUgYWxsb3dlZF9tYXhfYml0c3Ry
ZWFtX3NpemUKCkRtaXRyeSBCYXJ5c2hrb3YgKDMpOgoKLSB0dXJuaXA6IHNjYWxlIHRoZSB0cmFu
c2Zvcm0gZmVlZGJhY2sgY291bnRlciBvZmZzZXQgb24gYTZ4eAotIGZyZWVkcmVuby9hNnh4OiBz
dWJ0cmFjdCB0aGUgdHJhbnNmb3JtIGZlZWRiYWNrIGJ1ZmZlciBvZmZzZXQgaW4gQ1BfRFJBV19B
VVRPCi0gbnYzMDogZml4IGFicyBzb3VyY2UgbW9kaWZpZXIgb24gZnJhZ21lbnQgcHJvZ3JhbSBz
b3VyY2VzIDEgYW5kIDIKCkRvbWluaXF1ZSBCZWxoYWNoZW1pICgxKToKCi0gcGNvOiBmaXggY29t
cGlsZSBmYWlsdXJlIGZvciBhcnJheUxlbmd0aCgpIG9uCgpbQ2hhbmdlbG9nIHRydW5jYXRlZCBh
cyBpdCBleGNlZWRzIDMwMDAgY2hhcmFjdGVyczsKdGhlIGZ1bGwgY2hhbmdlbG9nIGNhbiBiZSBm
b3VuZCBpbiBhbiBhdHRhY2htZW50IHRvIHRoZSBBVUggZW1haWxdCi0tLQogLi4uLWFkZHJsaWIt
YXZvaWQtYnVpbHRpbl9jcHVfc3VwcG9ydHMtZm9yLWF2eDItZGV0ZWN0aS5wYXRjaCB8IDIgKy0K
IC4uLjAwMDEtZnJlZWRyZW5vLWRvbi10LWVuY29kZS1idWlsZC1wYXRoLWludG8tYmluYXJpZXMu
cGF0Y2ggfCAyICstCiAuLi4vMDAwMS1tZXNvbi1taXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24t
bWlwcy1jbGFuZy5wYXRjaCAgIHwgMiArLQogLi4uc3JjLWludGVsLWNvbXBpbGVyLWpheS1qYXlf
aXIuaC1kby1ub3QtdXNlZC10eXBlZC1lbi5wYXRjaCB8IDIgKy0KIC4uLnNyYy11dGlsLXVfbWF0
aC5jLWRvLW5vdC11c2UtYXJtLWZwdS1pbnN0cnVjdGlvbnMtaWYucGF0Y2ggfCAyICstCiBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLmluYyAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgNCArKy0tCiA2IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWFk
ZHJsaWItYXZvaWQtYnVpbHRpbl9jcHVfc3VwcG9ydHMtZm9yLWF2eDItZGV0ZWN0aS5wYXRjaCBi
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtYWRkcmxpYi1hdm9pZC1idWls
dGluX2NwdV9zdXBwb3J0cy1mb3ItYXZ4Mi1kZXRlY3RpLnBhdGNoCmluZGV4IGFjODg0MTcwODEu
LjEyMDAyYTJjMDMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVz
LzAwMDEtYWRkcmxpYi1hdm9pZC1idWlsdGluX2NwdV9zdXBwb3J0cy1mb3ItYXZ4Mi1kZXRlY3Rp
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtYWRkcmxp
Yi1hdm9pZC1idWlsdGluX2NwdV9zdXBwb3J0cy1mb3ItYXZ4Mi1kZXRlY3RpLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSAyMjlhODgxNTc1MDc2NWQ3MTI1ZjBjN2VmZTljOGQ2MjE2Njc4YmVm
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1MjI5M2U5MDQ4NGYwN2I1MTg2ZjJmMWZh
N2RlNjNkYTBmMTIwMTIyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWog
PGtoZW0ucmFqQG9zcy5xdWFsY29tbS5jb20+CiBEYXRlOiBUaHUsIDEzIEF1ZyAyMDI2IDAwOjAw
OjAwICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGFkZHJsaWI6IGF2b2lkIF9fYnVpbHRpbl9jcHVf
c3VwcG9ydHMgZm9yIGF2eDIgZGV0ZWN0aW9uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvbWVzYS9maWxlcy8wMDAxLWZyZWVkcmVuby1kb24tdC1lbmNvZGUtYnVpbGQtcGF0aC1p
bnRvLWJpbmFyaWVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAw
MS1mcmVlZHJlbm8tZG9uLXQtZW5jb2RlLWJ1aWxkLXBhdGgtaW50by1iaW5hcmllcy5wYXRjaApp
bmRleCAwODc5MzAyNDVmLi43YTAwYWNiZWQzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvbWVzYS9maWxlcy8wMDAxLWZyZWVkcmVuby1kb24tdC1lbmNvZGUtYnVpbGQtcGF0aC1p
bnRvLWJpbmFyaWVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVz
LzAwMDEtZnJlZWRyZW5vLWRvbi10LWVuY29kZS1idWlsZC1wYXRoLWludG8tYmluYXJpZXMucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDQ0ZjljNjBmMmNhNGNlMjEyYzhjYzNiYTE5ZTVhZGMz
NTdlYmRhZDQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGZkNTU3MWUyMmZkMThiODU1
MTk5ZjIzNzMxZjAzNTkyNzA2N2EyYTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBE
bWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QG9zcy5xdWFsY29tbS5jb20+CiBEYXRl
OiBXZWQsIDEwIERlYyAyMDI1IDAyOjI3OjE2ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGZyZWVk
cmVubzogZG9uJ3QgZW5jb2RlIGJ1aWxkIHBhdGggaW50byBiaW5hcmllcwpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1tZXNvbi1taXNkZXRlY3RzLTY0
Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9t
ZXNhL2ZpbGVzLzAwMDEtbWVzb24tbWlzZGV0ZWN0cy02NGJpdC1hdG9taWNzLW9uLW1pcHMtY2xh
bmcucGF0Y2gKaW5kZXggMzllYmQwMWUyMy4uZGMwOTU3ZDhlMiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1tZXNvbi1taXNkZXRlY3RzLTY0Yml0LWF0
b21pY3Mtb24tbWlwcy1jbGFuZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVz
YS9maWxlcy8wMDAxLW1lc29uLW1pc2RldGVjdHMtNjRiaXQtYXRvbWljcy1vbi1taXBzLWNsYW5n
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkMGMzYzcxYTBlZWJlNzJiODIyMjc3ZTQ2ZWUy
Njk4YmNjNDI4ZDQ0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjMWE4OWEwODYyOWY5
ZTU3NmUxMzZkYzA0NGMwZWQ4YTJiNjdkOTJmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgMTMgSmFuIDIwMjAg
MTU6MjM6NDcgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gbWVzb24gbWlzZGV0ZWN0cyA2NGJpdCBh
dG9taWNzIG9uIG1pcHMvY2xhbmcKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9t
ZXNhL2ZpbGVzLzAwMDEtc3JjLWludGVsLWNvbXBpbGVyLWpheS1qYXlfaXIuaC1kby1ub3QtdXNl
ZC10eXBlZC1lbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEt
c3JjLWludGVsLWNvbXBpbGVyLWpheS1qYXlfaXIuaC1kby1ub3QtdXNlZC10eXBlZC1lbi5wYXRj
aAppbmRleCAxY2VlN2FkNGUwLi4zNjQ1NmNjM2IxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLXNyYy1pbnRlbC1jb21waWxlci1qYXktamF5X2lyLmgt
ZG8tbm90LXVzZWQtdHlwZWQtZW4ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21l
c2EvZmlsZXMvMDAwMS1zcmMtaW50ZWwtY29tcGlsZXItamF5LWpheV9pci5oLWRvLW5vdC11c2Vk
LXR5cGVkLWVuLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzNWJhOWEyZjZmNWZmY2NjYTkz
YWE0MzBlZjk0Y2IxNzRkZDY4ZWE1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmMGMx
YjRlNTQ4MGJiNDExODMyNmEzMzlhM2E3MDg0ZGYxYTZiMGI3IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6
IFN1biwgMTQgSnVuIDIwMjYgMTc6NDI6MTkgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gc3JjL2lu
dGVsL2NvbXBpbGVyL2pheS9qYXlfaXIuaDogZG8gbm90IHVzZWQgdHlwZWQgZW51bQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1zcmMtdXRpbC11X21h
dGguYy1kby1ub3QtdXNlLWFybS1mcHUtaW5zdHJ1Y3Rpb25zLWlmLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1zcmMtdXRpbC11X21hdGguYy1kby1ub3QtdXNl
LWFybS1mcHUtaW5zdHJ1Y3Rpb25zLWlmLnBhdGNoCmluZGV4IGE2OTdiNGM3NzQuLmFhYzQyMDgz
YzQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtc3Jj
LXV0aWwtdV9tYXRoLmMtZG8tbm90LXVzZS1hcm0tZnB1LWluc3RydWN0aW9ucy1pZi5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLXNyYy11dGlsLXVfbWF0
aC5jLWRvLW5vdC11c2UtYXJtLWZwdS1pbnN0cnVjdGlvbnMtaWYucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDgwYThjYzkzYjhhNGRjYTUzZWQxMWY5ZmQ5YjgwNjVhNTU4NDViYzMgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDU2ZGJjODM4ZTQyZDkyMDUwNmYwZjExOWE2NWExZmFm
MGNmN2IzY2MgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZp
biA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogV2VkLCAxIEp1bCAyMDI2IDIyOjQ4OjE1ICsw
MjAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNyYy91dGlsL3VfbWF0aC5jOiBkbyBub3QgdXNlIGFybSBm
cHUgaW5zdHJ1Y3Rpb25zIGlmIGZwdSBpcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL21lc2EvbWVzYS5pbmMgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLmluYwpp
bmRleCA5OTI3ZDgwYjIyLi4xMTU0ZDUxMWQ5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvbWVzYS9tZXNhLmluYworKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNh
LmluYwpAQCAtMjIsOCArMjIsOCBAQCBTUkNfVVJJID0gImh0dHBzOi8vYXJjaGl2ZS5tZXNhM2Qu
b3JnL21lc2EtJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtYWRkcmxpYi1h
dm9pZC1idWlsdGluX2NwdV9zdXBwb3J0cy1mb3ItYXZ4Mi1kZXRlY3RpLnBhdGNoIFwKICAgICAg
ICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWViMjljYTdlNTZjZmFhOGU4YTc5NTM4
ZGNmODM0ZTNiMThlNTAxYzMxYmVmNTE0NWU5NTllYTQzN2NjNDIxNiIKLVBWID0gIjI2LjIuMiIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxNjI4MDU4YThkMmMwNjE1OTc1ZGU1YTE1YWI3YmJiOTYz
OGM1MDAwMGI1YmVkOTQ1NmZmNDIzZWEwMzRhODFmIgorUFYgPSAiMjYuMi4zIgogCiBVUFNUUkVB
TV9DSEVDS19HSVRUQUdSRUdFWCA9ICJtZXNhLSg/UDxwdmVyPlxkKyhcLlxkKykrKSIKIAotLSAK
Mi40Ny4xCgo=

--===============0039174722543131915==--

