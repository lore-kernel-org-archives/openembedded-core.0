Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E659C54F5C
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 07:24:35 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6066.1785309869135188041
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 00:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XrWikSOd;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gRvvdcMa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019facc2b137-724839c0-ea99-457b-873a-a5fc9ddf011e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785309868;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1A1LleJcE9b6naLBDFwu967TeyBezA//gbvMpLCIHU8=;
	b=XrWikSOd2QrWoTVCB29oaBD4RtmvPXjZ44zZ0+L+N+Vexb8WNq3ga3MACnfFqUnm
	KdZT4WBFgnZnLUU65sNJlKLw51pymY1I2tyWkIGEv+syU/bbbuW5dkcVjrBhskVRuih
	cd9WWGmlxC5v2F+gaJyoeYDnWSaPC6iyDXUu2fW8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785309868;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1A1LleJcE9b6naLBDFwu967TeyBezA//gbvMpLCIHU8=;
	b=gRvvdcMagBiUhFsBVfRISpFUQbMNJmUu5SkNIHN7aL3dG2VO2UVtMPIqM+uSWxMY
	nEsse6OOuxaySgAFt2kIhQCFeHhMHlBGhF2cHipgaq3Ek825gVdPQJUBlYmhAkGaNJj
	zi7ZRKE80UXtg2hOnKNG5DdOPZmLns4cK1ZyNbxI=
Content-Type: multipart/mixed; boundary="===============3684126963103804033=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.4.357.0 SUCCEEDED
Message-ID: <0101019facc2b137-724839c0-ea99-457b-873a-a5fc9ddf011e-000000@us-west-2.amazonses.com>
Date: Wed, 29 Jul 2026 07:24:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.29-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 07:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242242

--===============3684126963103804033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glslang* to *1.4.357.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.4.350.1-1.4.357.0.patch
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
From 4a9231cb33f3d14661cb97c9a7b45f33eef2589a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 29 Jul 2026 06:14:19 +0000
Subject: [PATCH] glslang: upgrade 1.4.350.1 -> 1.4.357.0

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
---
 .../glslang/glslang/0001-generate-glslang-pkg-config.patch      | 2 +-
 .../glslang/{glslang_1.4.350.1.bb => glslang_1.4.357.0.bb}      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.4.350.1.bb => glslang_1.4.357.0.bb} (96%)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index f06f12b303..b6a4c5a29b 100644
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
index 4d31a19e76..0f43d83f4e 100644
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
-- 
2.47.1


--===============3684126963103804033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libSPIRV.so.16.3.0 /usr/lib/libglslang-default-resource-limits.so.16.3.0 /usr/lib/libglslang.so.16.3.0", added "/usr/lib/libSPIRV.so.16.4.0 /usr/lib/libglslang.so.16.4.0 /usr/lib/libglslang-default-resource-limits.so.16.4.0"
Changes to packages/x86-64-v3-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so.16 changed symlink target from libglslang-default-resource-limits.so.16.3.0 to libglslang-default-resource-limits.so.16.4.0
  /usr/lib/libglslang.so.16 changed symlink target from libglslang.so.16.3.0 to libglslang.so.16.4.0
  /usr/lib/libSPIRV.so.16 changed symlink target from libSPIRV.so.16.3.0 to libSPIRV.so.16.4.0
  /usr/lib/libglslang-default-resource-limits.so.16.3.0 moved to /usr/lib/libglslang-default-resource-limits.so.16.4.0
  /usr/lib/libglslang.so.16.3.0 moved to /usr/lib/libglslang.so.16.4.0
  /usr/lib/libSPIRV.so.16.3.0 moved to /usr/lib/libSPIRV.so.16.4.0

--===============3684126963103804033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/glslang/glslang-dbg: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-dbg: FILELIST: removed "/usr/lib/.debug/libSPIRV.so.16.3.0 /usr/lib/.debug/libglslang-default-resource-limits.so.16.3.0 /usr/lib/.debug/libglslang.so.16.3.0", added "/usr/lib/.debug/libSPIRV.so.16.4.0 /usr/lib/.debug/libglslang-default-resource-limits.so.16.4.0 /usr/lib/.debug/libglslang.so.16.4.0"
packages/x86-64-v3-poky-linux/glslang/glslang-dbg: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/glslang/glslang-dbg: PKGSIZE changed from 54103760 to 55128232 (+2%)
packages/x86-64-v3-poky-linux/glslang/glslang-dev: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-dev: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/glslang/glslang-dev: PKGSIZE changed from 425929 to 444211 (+4%)
packages/x86-64-v3-poky-linux/glslang/glslang-doc: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-doc: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/glslang/glslang-locale: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-locale: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/glslang/glslang-src: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-src: FILELIST: directory renamed /usr/src/debug/glslang/1.4.350.1/include/glslang -> /usr/src/debug/glslang/1.4.357.0/include/glslang, directory renamed /usr/src/debug/glslang/1.4.350.1/glslang/MachineIndependent -> /usr/src/debug/glslang/1.4.357.0/glslang/MachineIndependent, directory renamed /usr/src/debug/glslang/1.4.350.1/StandAlone -> /usr/src/debug/glslang/1.4.357.0/StandAlone, directory renamed /usr/src/debug/glslang/1.4.350.1/glslang/CInterface -> /usr/src/debug/glslang/1.4.357.0/glslang/CInterface, directory renamed /usr/src/debug/glslang/1.4.350.1/glslang/MachineIndependent/preprocessor -> /usr/src/debug/glslang/1.4.357.0/glslang/MachineIndependent/preprocessor, directory renamed /usr/src/debug/glslang/1.4.350.1/glslang/HLSL -> /usr/src/debug/glslang/1.4.357.0/glslang/HLSL, directory renamed /usr/src/debug/glslang/1.4.350.1/glslang/OSDependent -> /usr/src/debug/glslang/1.4.357.0/glslang/OSDependent, directory renamed /usr/src/de
 bug/glslang/1.4.350.1/glslang -> /usr/src/debug/glslang/1.4.357.0/glslang, directory renamed /usr/src/debug/glslang/1.4.350.1/glslang/Public -> /usr/src/debug/glslang/1.4.357.0/glslang/Public, directory renamed /usr/src/debug/glslang/1.4.350.1/glslang/OSDependent/Unix -> /usr/src/debug/glslang/1.4.357.0/glslang/OSDependent/Unix, directory renamed /usr/src/debug/glslang/1.4.350.1/glslang/Include -> /usr/src/debug/glslang/1.4.357.0/glslang/Include, directory renamed /usr/src/debug/glslang/1.4.350.1/SPIRV -> /usr/src/debug/glslang/1.4.357.0/SPIRV, directory renamed /usr/src/debug/glslang/1.4.350.1/SPIRV/CInterface -> /usr/src/debug/glslang/1.4.357.0/SPIRV/CInterface, directory renamed /usr/src/debug/glslang/1.4.350.1/glslang/ResourceLimits -> /usr/src/debug/glslang/1.4.357.0/glslang/ResourceLimits, directory renamed /usr/src/debug/glslang/1.4.350.1/glslang/GenericCodeGen -> /usr/src/debug/glslang/1.4.357.0/glslang/GenericCodeGen
packages/x86-64-v3-poky-linux/glslang/glslang-src: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/glslang/glslang-src: PKGSIZE changed from 5515424 to 5637751 (+2%)
packages/x86-64-v3-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-staticdev: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/glslang/glslang: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libSPIRV.so.16.3.0 /usr/lib/libglslang-default-resource-limits.so.16.3.0 /usr/lib/libglslang.so.16.3.0", added "/usr/lib/libSPIRV.so.16.4.0 /usr/lib/libglslang.so.16.4.0 /usr/lib/libglslang-default-resource-limits.so.16.4.0"
packages/x86-64-v3-poky-linux/glslang/glslang: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/glslang/glslang: PKGSIZE changed from 4030617 to 4141209 (+3%)
packages/x86-64-v3-poky-linux/glslang: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/glslang: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/glslang: SRC_URI changed from "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main;tag=vulkan-sdk-1.4.350.1 file://0001-generate-glslang-pkg-config.patch" to "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main;tag=vulkan-sdk-1.4.357.0 file://0001-generate-glslang-pkg-config.patch"
Changes to packages/x86-64-v3-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so.16 changed symlink target from libglslang-default-resource-limits.so.16.3.0 to libglslang-default-resource-limits.so.16.4.0
  /usr/lib/libglslang.so.16 changed symlink target from libglslang.so.16.3.0 to libglslang.so.16.4.0
  /usr/lib/libSPIRV.so.16 changed symlink target from libSPIRV.so.16.3.0 to libSPIRV.so.16.4.0
  /usr/lib/libglslang-default-resource-limits.so.16.3.0 moved to /usr/lib/libglslang-default-resource-limits.so.16.4.0
  /usr/lib/libglslang.so.16.3.0 moved to /usr/lib/libglslang.so.16.4.0
  /usr/lib/libSPIRV.so.16.3.0 moved to /usr/lib/libSPIRV.so.16.4.0

--===============3684126963103804033==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.4.350.1-1.4.357.0.patch"

RnJvbSA0YTkyMzFjYjMzZjNkMTQ2NjFjYjk3YzlhN2I0NWYzM2VlZjI1ODlhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjkgSnVsIDIwMjYgMDY6MTQ6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bHNsYW5nOiB1cGdyYWRlIDEuNC4zNTAuMSAtPiAxLjQuMzU3LjAKClNvdXJjZTogQ0hBTkdFUy5t
ZAoKKiBBZGQgc3VwcG9ydCBmb3IgR0xfRVhUX29wYWNpdHlfbWljcm9tYXBfcmF5X3F1ZXJ5X21v
ZGUKCiMjIDE2LjQuMCAyMDI2LTA3LTE0CgojIyMgRGVzY3JpcHRvciBIZWFwCgoqIEltcGxlbWVu
dCBgR0xTTF9FWFRfc3RydWN0dXJlZF9kZXNjcmlwdG9yX2hlYXBgIHdpdGggU1BJUi1WIGxheW91
dCBnZW5lcmF0aW9uLCBoZWFwIG9mZnNldCBhY2Nlc3MsIGJ1ZmZlciByZWZlcmVuY2VzLCBtYXRy
aXggbGF5b3V0IGRlY29yYXRpb25zLCBhbmQgY29ycmVjdCBgcmVhZG9ubHlgL2B3cml0ZW9ubHlg
IHF1YWxpZmllciBwcm9wYWdhdGlvbiBmb3IgYnVmZmVyIGFuZCBpbWFnZSBkZXNjcmlwdG9ycwoq
IEZpeCBkZXNjcmlwdG9yIGhlYXAtYm91bmQgYnVmZmVyIGFjY2VzcyB0byB1c2UgdHlwZWQgcG9p
bnRlcnMKKiBPbWl0IGBOb25Vbmlmb3JtYCBkZWNvcmF0aW9uIHdoZW4gdXNpbmcgZGVzY3JpcHRv
ciBoZWFwcywgYXMgdGhlIFNQSVItViBzcGVjIGRvZXMgbm90IHJlcXVpcmUgaXQKKiBBZGQgYC0t
cmVsYXgtc2V0LWJpbmRpbmctbGltaXRzYCBvcHRpb24gdG8gYWxsb3cgbGFyZ2UgYGxheW91dChz
ZXQpYCBhbmQgYGxheW91dChiaW5kaW5nKWAgdmFsdWVzIGZvciBkZXNjcmlwdG9yIGhlYXAtc3R5
bGUgd29ya2Zsb3dzIHdpdGggc3BhcnNlIHNldCBzcGFjZXMKKiBSZWplY3QgY29tYmluZWQgaW1h
Z2Ugc2FtcGxlcnMgd2l0aCBgZGVzY3JpcHRvcl9oZWFwYAoKIyMjIENvbXB1dGUgU2hhZGVyIERl
cml2YXRpdmVzCgoqIEZpeCBgR0xfS0hSX2NvbXB1dGVfc2hhZGVyX2Rlcml2YXRpdmVzYCByZWdy
ZXNzaW9ucyBvbiBzaGFkZXJzIHVzaW5nIHRoZSBgR0xfTlZgIHZhcmlhbnQKKiBVcGRhdGUgY29t
cHV0ZSBzaGFkZXIgZGVyaXZhdGl2ZSBydWxlcyB0byBhbGxvdyB0ZXh0dXJlIG9wZXJhdGlvbnMg
d2l0aCBpbXBsaWNpdCBkZXJpdmF0aXZlcyB3aXRob3V0IGV4dGVuc2lvbnMsIGZhbGxpbmcgYmFj
ayB0byBMb0QgMAoKIyMjIE5ldyBFeHRlbnNpb25zCgoqIEltcGxlbWVudCBgR0xfRVhUX29jcF9t
aWNyb3NjYWxpbmdfdHlwZXNgCiogSW1wbGVtZW50IGBHTF9OVl9jb29wZXJhdGl2ZV9tYXRyaXhf
ZGVjb2RlX3ZlY3RvcmAKKiBBZGQgYmFzaWMgc3VwcG9ydCBmb3IgYEdMX05WX2Rlc2t0b3BfbG93
cF9tZWRpdW1wYAoqIEltcGxlbWVudCBgR0xfRVhUX29wYWNpdHlfbWljcm9tYXBfcmF5X3F1ZXJ5
X21vZGVgCgojIyMgQnVnIEZpeGVzCgoqIEZpeCBnZW5lcmF0ZWQgZGVjb3JhdGlvbiBzdHJpbmcg
ZnJvbSBgVVRGOEVuY29kaW5nS0hSYCB0byBgVVRGRW5jb2RpbmdLSFJgCiogRml4IG1pc3Npbmcg
U1BJUi1WIGV4dGVuc2lvbiBlbWlzc2lvbiBmb3IgYGZsb2F0MTZgIGRlcml2YXRpdmUgZnVuY3Rp
b25zIHdpdGggYFNQVl9BTURfZ3B1X3NoYWRlcl9oYWxmX2Zsb2F0YAoqIEFwcGx5IGBOb0NvbnRy
YWN0aW9uYCBkZWNvcmF0aW9uIHRvIGBkb3QoKWAgd2hlbiBgbm9Db250cmFjdGlvbmAgaXMgc2V0
CiogRml4IGBPcFN0b3JlYCBvZiBidWZmZXIgZGV2aWNlIGFkZHJlc3MgcG9pbnRlciB0byB1c2Ug
OC1ieXRlIGFsaWdubWVudCwgY29uc2lzdGVudCB3aXRoIGxvYWRzCiogRml4IGBSYXlUcmFjaW5n
T3BhY2l0eU1pY3JvbWFwS0hSYCBjYXBhYmlsaXR5IGVtaXNzaW9uIHRvIG9ubHkgb2NjdXIgd2hl
biBgZ2xfUmF5RmxhZ3NGb3JjZU9wYWNpdHlNaWNyb21hcDJTdGF0ZUVYVGAgaXMgYWN0dWFsbHkg
dXNlZCwgZml4aW5nIFNQSVItViB2YWxpZGF0aW9uIGZhaWx1cmVzIGluIHJheSBxdWVyeSBzaGFk
ZXJzIG91dHNpZGUgcmF5LXRyYWNpbmcgcGlwZWxpbmUgc3RhZ2VzCiogRml4IGBzZXRJbnZlcnRZ
KClgIHRvIGFwcGx5IFktaW52ZXJzaW9uIHRvIEdMU0wgdmVydGV4LCBnZW9tZXRyeSwgYW5kIHRl
c3NlbGxhdGlvbi1ldmFsdWF0aW9uIHNoYWRlcnMgKHByZXZpb3VzbHkgb25seSBhZmZlY3RlZCBI
TFNMKQoqIEZpeCBgLmxlbmd0aCgpYCBvbiBhcnJheXMgb2YgbG9uZy9jb29wZXJhdGl2ZSB2ZWN0
b3JzIHRvIHVzZSBgT3BBcnJheUxlbmd0aGAgaW5zdGVhZCBvZiBhIGNvbnN0YW50IGNvbXBvbmVu
dCBjb3VudAoqIEZpeCB1bm5lY2Vzc2FyeSBjb29wZXJhdGl2ZSBtYXRyaXggY29udmVyc2lvbnMg
d2hlbiBjcmVhdGluZyBhcnJheXMgb2YgS0hSIGNvb3BlcmF0aXZlIG1hdHJpY2VzCiogQWRkIGVy
cm9yIGZvciBjb29wZXJhdGl2ZSBtYXRyaXggYCo9YCB3aXRoIGJmMTYvZnA4IHNjYWxhciBvcGVy
YW5kcwoqIEZpeCBvdXQtb2YtYm91bmRzIGFjY2VzcyBpbiBgZWxzZVNlZW5gIGF0IG1heGltdW0g
YCNpZmAvYCNpZmRlZmAgbmVzdGluZyBkZXB0aAoqIEZpeCBvdXQtb2YtYm91bmRzIHJlYWQgb24g
ZW1wdHkgc3RydWN0IHRleHR1cmUgdGVtcGxhdGUgdHlwZXMKKiBGaXggY3Jhc2ggaW4gYGxheW91
dE9iamVjdENoZWNrYCB3aGVuIGFjY2Vzc2luZyBtZW1iZXJzIG9mIGFuIGVtcHR5IGJsb2NrCiog
RW1pdCBhbiBlcnJvciB3aGVuIEhMU0wgW251bXRocmVhZHNdIGlzIGdpdmVuIG1vcmUgdGhhbiB0
aHJlZSBhcmd1bWVudHMgaW5zdGVhZCBvZiBjcmFzaGluZyB0aGUgY29tcGlsZXIuCiogRW1pdCBl
cnJvciB3aGVuIGF0dGVtcHRpbmcgdG8gY29udmVydCBhIGxpdGVyYWwgc3RyaW5nIHRvIGFuIGlu
Y29tcGF0aWJsZSB0eXBlCiogRml4IGBhYm9ydEtIUmAgdG8gcHJlc2VydmUgdGhlIG9yaWdpbmFs
IHVzZXItZGVmaW5lZCBzdHJpbmcgd2l0aG91dCBtb2RpZmljYXRpb24KKiBGaXggb3V0LW9mLWJv
dW5kcyBpbmRleGluZyBpbiBgVERlZmF1bHRJb1Jlc29sdmVyQmFzZTo6YWRkU3RhZ2VgIHdoZW4g
YSBuZWdhdGl2ZSBgRVNoTGFuZ3VhZ2VgIHZhbHVlIGlzIHBhc3NlZAoKIyMjIE90aGVyCgoqIEFk
ZCBgLS1kaXNjYXJkLWlzLXRlcm1pbmF0ZWAgb3B0aW9uIHRvIGVtaXQgYE9wVGVybWluYXRlSW52
b2NhdGlvbmAgaW5zdGVhZCBvZiBgT3BEZW1vdGVUb0hlbHBlckludm9jYXRpb25gIGZvciBHTFNM
IGBkaXNjYXJkYCB3aGVuIHRhcgoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhjZWVkcyAz
MDAwIGNoYXJhY3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4gYXR0
YWNobWVudCB0byB0aGUgQVVIIGVtYWlsXQotLS0KIC4uLi9nbHNsYW5nL2dsc2xhbmcvMDAwMS1n
ZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25maWcucGF0Y2ggICAgICB8IDIgKy0KIC4uLi9nbHNsYW5n
L3tnbHNsYW5nXzEuNC4zNTAuMS5iYiA9PiBnbHNsYW5nXzEuNC4zNTcuMC5iYn0gICAgICB8IDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL3tnbHNsYW5nXzEuNC4zNTAuMS5iYiA9
PiBnbHNsYW5nXzEuNC4zNTcuMC5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nLzAwMDEtZ2VuZXJhdGUtZ2xzbGFuZy1wa2ctY29uZmln
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZy8wMDAxLWdlbmVy
YXRlLWdsc2xhbmctcGtnLWNvbmZpZy5wYXRjaAppbmRleCBmMDZmMTJiMzAzLi5iNmE0YzVhMjli
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nLzAwMDEt
Z2VuZXJhdGUtZ2xzbGFuZy1wa2ctY29uZmlnLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9nbHNsYW5nL2dsc2xhbmcvMDAwMS1nZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25maWcucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDJjN2UyMTYwNWIwMzI0YjRhZmQ1MTI3MDU5MmJjNmNi
MGEwY2NhNWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGY3YWFkMTkwNTcwNTA5Nzc4
MmViZmVhM2M3NGM3NTg1NjE1OGEyYmEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBK
b3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgNyBGZWIg
MjAyMSAwMTozMDozOSArMDAwMAogU3ViamVjdDogW1BBVENIXSBnZW5lcmF0ZSBnbHNsYW5nIHBr
Zy1jb25maWcKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xh
bmdfMS40LjM1MC4xLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18x
LjQuMzU3LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjQuMzUwLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS40LjM1Ny4wLmJiCmluZGV4IDRkMzFhMTll
NzYuLjBmNDNkODNmNGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5n
L2dsc2xhbmdfMS40LjM1MC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5n
L2dsc2xhbmdfMS40LjM1Ny4wLmJiCkBAIC04LDcgKzgsNyBAQCBIT01FUEFHRSA9ICJodHRwczov
L3d3dy5raHJvbm9zLm9yZy9vcGVuZ2xlcy9zZGsvdG9vbHMvUmVmZXJlbmNlLUNvbXBpbGVyIgog
TElDRU5TRSA9ICJBcGFjaGUtMi4wIEFORCBCU0QtMi1DbGF1c2UgQU5EIEJTRC0zLUNsYXVzZSBB
TkQgTUlUIEFORCBHUEwtMy4wLW9yLWxhdGVyIFdJVEggQmlzb24tZXhjZXB0aW9uLTIuMiIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT01MGZmOWQwZmNkZTJkNWI5
NTNlYmU0MzFjNDhlMzRlMyIKIAotU1JDUkVWID0gIjI3NTgyMmE2MjYxZWU2ODlhYWRiMWRhNWYw
OWEwZWMyZjA1ODY4NWMiCitTUkNSRVYgPSAiMTY4ZDQ1MmE0ZjQ2MGQyNGI1ODhmZWQwODQ3N2E4
MWM0NGVlMjdhMSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvZ2xz
bGFuZy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW47dGFnPXZ1bGthbi1zZGstJHtQVn0g
XAogICAgICAgICAgICBmaWxlOi8vMDAwMS1nZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25maWcucGF0
Y2ggXAogICAgICAgICAgICAiCi0tIAoyLjQ3LjEKCg==

--===============3684126963103804033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="glslang-changelog.txt"

Changelog for glslang: 1.4.350.1 -> 1.4.357.0
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

* Add `--discard-is-terminate` option to emit `OpTerminateInvocation` instead of `OpDemoteToHelperInvocation` for GLSL `discard` when targeting SPIR-V 1.6+
* Add REUSE license compliance infrastructure

--===============3684126963103804033==--

