Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456A9CA5FA1
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 06:18:51 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1829.1790662721163593823
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 23:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=qawnxPqW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Q5ks61vT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a0ebd0bb1b-9abb1b89-7c12-473a-9fa0-9ff2a9e9d361-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790662720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IHfv2MUdOJS2clM18YJBU8JU0XwnZosNC46EeL95P3o=;
	b=qawnxPqWxh2JExgLk0kHD3Qg+mDWWBpxwiemHzvvVLSkNm4WXfj1lNmUnDaSeLz3
	Jm3bdfKUFnrqEuLU3GX4si/kfW6AvCxDsDcK5e2q64ZIIpx2WciQO1gy2Ku+4Cse/S2
	DXe6nwF9v746h96ITYDqafX6EqBTdAEVGXcenS38=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790662720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IHfv2MUdOJS2clM18YJBU8JU0XwnZosNC46EeL95P3o=;
	b=Q5ks61vTEFCprBLIqlX7ZKwZ0wZRlAD2ejx9WEe4Q4qRzAfpV6ECtW1Jjbej7SHF
	hMCxS1bE4MB4P/e4+knfEfjtIIvEWA3a4vCpud9YVlhdIXdHFk0CnFUDbriy8XSGlAR
	HfIYs7Rl+fqI7Drhgq/oVD8zTSbh+DNX37vusdt8=
Content-Type: multipart/mixed; boundary="===============3754508017299279145=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-tools: upgrading to 1.4.363.0 FAILED
Message-ID: <010101a0ebd0bb1b-9abb1b89-7c12-473a-9fa0-9ff2a9e9d361-000000@us-west-2.amazonses.com>
Date: Tue, 29 Sep 2026 06:18:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.29-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 06:18:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246825

--===============3754508017299279145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-tools* to *1.4.363.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-spirv-tools-upgrade-1.4.357.0-1.4.363.0.patch
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
From 3e2287b0941268da9b80752acc181ed4977f3bd4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 29 Sep 2026 05:41:56 +0000
Subject: [PATCH] spirv-tools: upgrade 1.4.357.0 -> 1.4.363.0

v2026.4 2026-09-09
  - Optimizer
    - Add pass to convert typed pointers to untyped pointers (`--convert-to-
      untyped`)
    - Support optimizing shaders using SPV_KHR_opacity_micromap across dead-code
      elimination and local passes
    - Add folding rule to dissolve OpCopyLogical of OpCompositeConstruct in
      simplification pass
    - Harden optimizer passes against ID overflow (#6851, #6852, #6857, #6858,
      #6863)
    - Filter duplicate decorations during module serialization to binary
    - Correctness fixes for vector constant folding size and OpSelect folding
      pre-SPIR-V 1.4 (#6798, #6827)
    - Stability fixes for IRContext analysis handling, debug info stripping, and
      eliminate dead functions (#6765, #6797, #6799)
  - Validator
    - Support and validate SPV_EXT_cooperative_matrix_maintenance1
    - Support and validate SPV_QCOM_image_processing3 and OpImageGatherQCOM
    - Add validation for NonSemantic.DebugPrintf extended instruction set
    - Validate OpAbortKHR explicit layout message type and require scalar
      packing (#6854, #6859)
    - Tighten relaxed block layout alignments and add explicit alignment VUIDs
      (#6819, #6853)
    - Validate Offset decoration on Input/Output storage classes and add VUID
      12509 (#6835, #6855)
    - Allow OpExtInstWithForwardRefsKHR in generic non-semantic instruction sets
    - Restrict Workgroup execution scope to OpGroupNonUniformRotateKHR for non-
      uniform group operations
    - Validate OpControlBarrierArriveEXT execution and memory scopes
    - Allow Generic pointer casts to and from CodeSectionINTEL storage class
    - Allow BFloat16 and FP8 result types in OpExtInst
    - Validate OpSourceContinued order following OpSource
    - Correctness fixes for >64-bit integer constant evaluation and
      AliasScopeINTELMask/NoAliasINTELMask operand counting (#6816, #6791,
      #6865)
    - Validate ArrayStride on OpConstantDataKHR result types
    - Add validation for UTFEncodedKHR decoration on array types
    - Validate that OpAbortKHR Message Type is a concrete type
  - Linker
    - Detect duplicate exported definitions without imports to prevent ODR
      violations
  - Assembler/Disassembler
    - Initialize parsed operand floating-point encoding to ensure deterministic
      disassembly of literal floats
---
 .../{spirv-tools_1.4.357.0.bb => spirv-tools_1.4.363.0.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-tools_1.4.357.0.bb => spirv-tools_1.4.363.0.bb} (93%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.363.0.bb
similarity index 93%
rename from meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.4.363.0.bb
index d9f6d29267..a5b08684f0 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.4.363.0.bb
@@ -7,9 +7,8 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "9a49b0883b9b635689a85b5647dbfcb223268151"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=vulkan-sdk-1.4.357;protocol=https;tag=vulkan-sdk-${PV} \
-"
+SRCREV = "ef96ed763b43b59b33b31b362f09a02b729fa1c9"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools
-- 
2.47.1


--===============3754508017299279145==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-tools-upgrade-1.4.357.0-1.4.363.0.patch"

RnJvbSAzZTIyODdiMDk0MTI2OGRhOWI4MDc1MmFjYzE4MWVkNDk3N2YzYmQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjkgU2VwIDIwMjYgMDU6NDE6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cGlydi10b29sczogdXBncmFkZSAxLjQuMzU3LjAgLT4gMS40LjM2My4wCgp2MjAyNi40IDIwMjYt
MDktMDkKICAtIE9wdGltaXplcgogICAgLSBBZGQgcGFzcyB0byBjb252ZXJ0IHR5cGVkIHBvaW50
ZXJzIHRvIHVudHlwZWQgcG9pbnRlcnMgKGAtLWNvbnZlcnQtdG8tCiAgICAgIHVudHlwZWRgKQog
ICAgLSBTdXBwb3J0IG9wdGltaXppbmcgc2hhZGVycyB1c2luZyBTUFZfS0hSX29wYWNpdHlfbWlj
cm9tYXAgYWNyb3NzIGRlYWQtY29kZQogICAgICBlbGltaW5hdGlvbiBhbmQgbG9jYWwgcGFzc2Vz
CiAgICAtIEFkZCBmb2xkaW5nIHJ1bGUgdG8gZGlzc29sdmUgT3BDb3B5TG9naWNhbCBvZiBPcENv
bXBvc2l0ZUNvbnN0cnVjdCBpbgogICAgICBzaW1wbGlmaWNhdGlvbiBwYXNzCiAgICAtIEhhcmRl
biBvcHRpbWl6ZXIgcGFzc2VzIGFnYWluc3QgSUQgb3ZlcmZsb3cgKCM2ODUxLCAjNjg1MiwgIzY4
NTcsICM2ODU4LAogICAgICAjNjg2MykKICAgIC0gRmlsdGVyIGR1cGxpY2F0ZSBkZWNvcmF0aW9u
cyBkdXJpbmcgbW9kdWxlIHNlcmlhbGl6YXRpb24gdG8gYmluYXJ5CiAgICAtIENvcnJlY3RuZXNz
IGZpeGVzIGZvciB2ZWN0b3IgY29uc3RhbnQgZm9sZGluZyBzaXplIGFuZCBPcFNlbGVjdCBmb2xk
aW5nCiAgICAgIHByZS1TUElSLVYgMS40ICgjNjc5OCwgIzY4MjcpCiAgICAtIFN0YWJpbGl0eSBm
aXhlcyBmb3IgSVJDb250ZXh0IGFuYWx5c2lzIGhhbmRsaW5nLCBkZWJ1ZyBpbmZvIHN0cmlwcGlu
ZywgYW5kCiAgICAgIGVsaW1pbmF0ZSBkZWFkIGZ1bmN0aW9ucyAoIzY3NjUsICM2Nzk3LCAjNjc5
OSkKICAtIFZhbGlkYXRvcgogICAgLSBTdXBwb3J0IGFuZCB2YWxpZGF0ZSBTUFZfRVhUX2Nvb3Bl
cmF0aXZlX21hdHJpeF9tYWludGVuYW5jZTEKICAgIC0gU3VwcG9ydCBhbmQgdmFsaWRhdGUgU1BW
X1FDT01faW1hZ2VfcHJvY2Vzc2luZzMgYW5kIE9wSW1hZ2VHYXRoZXJRQ09NCiAgICAtIEFkZCB2
YWxpZGF0aW9uIGZvciBOb25TZW1hbnRpYy5EZWJ1Z1ByaW50ZiBleHRlbmRlZCBpbnN0cnVjdGlv
biBzZXQKICAgIC0gVmFsaWRhdGUgT3BBYm9ydEtIUiBleHBsaWNpdCBsYXlvdXQgbWVzc2FnZSB0
eXBlIGFuZCByZXF1aXJlIHNjYWxhcgogICAgICBwYWNraW5nICgjNjg1NCwgIzY4NTkpCiAgICAt
IFRpZ2h0ZW4gcmVsYXhlZCBibG9jayBsYXlvdXQgYWxpZ25tZW50cyBhbmQgYWRkIGV4cGxpY2l0
IGFsaWdubWVudCBWVUlEcwogICAgICAoIzY4MTksICM2ODUzKQogICAgLSBWYWxpZGF0ZSBPZmZz
ZXQgZGVjb3JhdGlvbiBvbiBJbnB1dC9PdXRwdXQgc3RvcmFnZSBjbGFzc2VzIGFuZCBhZGQgVlVJ
RAogICAgICAxMjUwOSAoIzY4MzUsICM2ODU1KQogICAgLSBBbGxvdyBPcEV4dEluc3RXaXRoRm9y
d2FyZFJlZnNLSFIgaW4gZ2VuZXJpYyBub24tc2VtYW50aWMgaW5zdHJ1Y3Rpb24gc2V0cwogICAg
LSBSZXN0cmljdCBXb3JrZ3JvdXAgZXhlY3V0aW9uIHNjb3BlIHRvIE9wR3JvdXBOb25Vbmlmb3Jt
Um90YXRlS0hSIGZvciBub24tCiAgICAgIHVuaWZvcm0gZ3JvdXAgb3BlcmF0aW9ucwogICAgLSBW
YWxpZGF0ZSBPcENvbnRyb2xCYXJyaWVyQXJyaXZlRVhUIGV4ZWN1dGlvbiBhbmQgbWVtb3J5IHNj
b3BlcwogICAgLSBBbGxvdyBHZW5lcmljIHBvaW50ZXIgY2FzdHMgdG8gYW5kIGZyb20gQ29kZVNl
Y3Rpb25JTlRFTCBzdG9yYWdlIGNsYXNzCiAgICAtIEFsbG93IEJGbG9hdDE2IGFuZCBGUDggcmVz
dWx0IHR5cGVzIGluIE9wRXh0SW5zdAogICAgLSBWYWxpZGF0ZSBPcFNvdXJjZUNvbnRpbnVlZCBv
cmRlciBmb2xsb3dpbmcgT3BTb3VyY2UKICAgIC0gQ29ycmVjdG5lc3MgZml4ZXMgZm9yID42NC1i
aXQgaW50ZWdlciBjb25zdGFudCBldmFsdWF0aW9uIGFuZAogICAgICBBbGlhc1Njb3BlSU5URUxN
YXNrL05vQWxpYXNJTlRFTE1hc2sgb3BlcmFuZCBjb3VudGluZyAoIzY4MTYsICM2NzkxLAogICAg
ICAjNjg2NSkKICAgIC0gVmFsaWRhdGUgQXJyYXlTdHJpZGUgb24gT3BDb25zdGFudERhdGFLSFIg
cmVzdWx0IHR5cGVzCiAgICAtIEFkZCB2YWxpZGF0aW9uIGZvciBVVEZFbmNvZGVkS0hSIGRlY29y
YXRpb24gb24gYXJyYXkgdHlwZXMKICAgIC0gVmFsaWRhdGUgdGhhdCBPcEFib3J0S0hSIE1lc3Nh
Z2UgVHlwZSBpcyBhIGNvbmNyZXRlIHR5cGUKICAtIExpbmtlcgogICAgLSBEZXRlY3QgZHVwbGlj
YXRlIGV4cG9ydGVkIGRlZmluaXRpb25zIHdpdGhvdXQgaW1wb3J0cyB0byBwcmV2ZW50IE9EUgog
ICAgICB2aW9sYXRpb25zCiAgLSBBc3NlbWJsZXIvRGlzYXNzZW1ibGVyCiAgICAtIEluaXRpYWxp
emUgcGFyc2VkIG9wZXJhbmQgZmxvYXRpbmctcG9pbnQgZW5jb2RpbmcgdG8gZW5zdXJlIGRldGVy
bWluaXN0aWMKICAgICAgZGlzYXNzZW1ibHkgb2YgbGl0ZXJhbCBmbG9hdHMKLS0tCiAuLi4ve3Nw
aXJ2LXRvb2xzXzEuNC4zNTcuMC5iYiA9PiBzcGlydi10b29sc18xLjQuMzYzLjAuYmJ9ICAgfCA1
ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3tzcGlydi10b29sc18xLjQuMzU3LjAu
YmIgPT4gc3BpcnYtdG9vbHNfMS40LjM2My4wLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LXRvb2xzXzEuNC4zNTcuMC5iYiBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LXRvb2xzXzEuNC4zNjMuMC5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi10b29s
c18xLjQuMzU3LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2
LXRvb2xzXzEuNC4zNjMuMC5iYgppbmRleCBkOWY2ZDI5MjY3Li5hNWIwODY4NGYwIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi10b29sc18xLjQuMzU3LjAuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtdG9vbHNfMS40LjM2My4wLmJi
CkBAIC03LDkgKzcsOCBAQCBTRUNUSU9OID0gImdyYXBoaWNzIgogTElDRU5TRSAgPSAiQXBhY2hl
LTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2Mzg3
ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogCi1TUkNSRVYgPSAiOWE0OWIwODgzYjliNjM1Njg5YTg1
YjU2NDdkYmZjYjIyMzI2ODE1MSIKLVNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9z
R3JvdXAvU1BJUlYtVG9vbHMuZ2l0O2JyYW5jaD12dWxrYW4tc2RrLTEuNC4zNTc7cHJvdG9jb2w9
aHR0cHM7dGFnPXZ1bGthbi1zZGstJHtQVn0gXAotIgorU1JDUkVWID0gImVmOTZlZDc2M2I0M2I1
OWIzM2IzMWIzNjJmMDlhMDJiNzI5ZmExYzkiCitTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20v
S2hyb25vc0dyb3VwL1NQSVJWLVRvb2xzLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwczt0
YWc9dnVsa2FuLXNkay0ke1BWfSIKIFBFID0gIjEiCiAjIFRoZXNlIHJlY2lwZXMgbmVlZCB0byBi
ZSB1cGRhdGVkIGluIGxvY2tzdGVwIHdpdGggZWFjaCBvdGhlcjoKICMgZ2xzbGFuZywgdnVsa2Fu
LWhlYWRlcnMsIHZ1bGthbi1sb2FkZXIsIHZ1bGthbi10b29scywgc3BpcnYtaGVhZGVycywgc3Bp
cnYtdG9vbHMKLS0gCjIuNDcuMQoK

--===============3754508017299279145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="spirv-tools-changelog.txt"

v2026.4 2026-09-09
  - Optimizer
    - Add pass to convert typed pointers to untyped pointers (`--convert-to-
      untyped`)
    - Support optimizing shaders using SPV_KHR_opacity_micromap across dead-code
      elimination and local passes
    - Add folding rule to dissolve OpCopyLogical of OpCompositeConstruct in
      simplification pass
    - Harden optimizer passes against ID overflow (#6851, #6852, #6857, #6858,
      #6863)
    - Filter duplicate decorations during module serialization to binary
    - Correctness fixes for vector constant folding size and OpSelect folding
      pre-SPIR-V 1.4 (#6798, #6827)
    - Stability fixes for IRContext analysis handling, debug info stripping, and
      eliminate dead functions (#6765, #6797, #6799)
  - Validator
    - Support and validate SPV_EXT_cooperative_matrix_maintenance1
    - Support and validate SPV_QCOM_image_processing3 and OpImageGatherQCOM
    - Add validation for NonSemantic.DebugPrintf extended instruction set
    - Validate OpAbortKHR explicit layout message type and require scalar
      packing (#6854, #6859)
    - Tighten relaxed block layout alignments and add explicit alignment VUIDs
      (#6819, #6853)
    - Validate Offset decoration on Input/Output storage classes and add VUID
      12509 (#6835, #6855)
    - Allow OpExtInstWithForwardRefsKHR in generic non-semantic instruction sets
    - Restrict Workgroup execution scope to OpGroupNonUniformRotateKHR for non-
      uniform group operations
    - Validate OpControlBarrierArriveEXT execution and memory scopes
    - Allow Generic pointer casts to and from CodeSectionINTEL storage class
    - Allow BFloat16 and FP8 result types in OpExtInst
    - Validate OpSourceContinued order following OpSource
    - Correctness fixes for >64-bit integer constant evaluation and
      AliasScopeINTELMask/NoAliasINTELMask operand counting (#6816, #6791,
      #6865)
    - Validate ArrayStride on OpConstantDataKHR result types
    - Add validation for UTFEncodedKHR decoration on array types
    - Validate that OpAbortKHR Message Type is a concrete type
  - Linker
    - Detect duplicate exported definitions without imports to prevent ODR
      violations
  - Assembler/Disassembler
    - Initialize parsed operand floating-point encoding to ensure deterministic
      disassembly of literal floats

--===============3754508017299279145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1991 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-f44579d376b06042d699a59794bc4ed58e2aacd1"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:f44579d376b06042d699a59794bc4ed58e2aacd1"
meta-yocto-bsp       
meta-poky            = "master:d36c827e02ab138b446386792fd7588b5a041507"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 158 Local 145 Mirrors 0 Missed 13 Current 224 (91% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 335 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.357.0.bb:do_create_spdx_setscene)
NOTE: Running task 914 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.363.0.bb:do_recipe_qa)
NOTE: recipe spirv-headers-1_1.4.357.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-tools-1_1.4.363.0-r0: task do_recipe_qa: Started
NOTE: recipe spirv-headers-1_1.4.357.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 381 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.357.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe spirv-headers-1_1.4.357.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe spirv-tools-1_1.4.363.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe spirv-headers-1_1.4.357.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 1012 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.363.0.bb:do_fetch)
NOTE: Setscene tasks completed
NOTE: Running task 1015 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.363.0.bb:do_create_recipe_spdx)
NOTE: recipe spirv-tools-1_1.4.363.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.4.363.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe spirv-tools-1_1.4.363.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe spirv-tools-1_1.4.363.0-r0: task do_fetch: Succeeded
NOTE: Running task 1016 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.363.0.bb:do_unpack)
NOTE: Running task 1017 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.363.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.4.363.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.4.363.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.4.363.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.4.363.0-r0: task do_unpack: Succeeded
NOTE: Running task 1018 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.363.0.bb:do_patch)
NOTE: recipe spirv-tools-1_1.4.363.0-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.4.363.0-r0: task do_patch: Succeeded
NOTE: Running task 1019 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.363.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1020 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.363.0.bb:do_generate_toolchain_file)
NOTE: Running task 1021 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.363.0.bb:do_populate_lic)
NOTE: recipe spirv-tools-1_1.4.363.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.4.363.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.4.363.0-r0: task do_populate_lic: Started
NOTE: recipe spirv-tools-1_1.4.363.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.4.363.0-r0: task do_populate_lic: Succeeded
NOTE: recipe spirv-tools-1_1.4.363.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1022 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.363.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.4.363.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.4.363.0-r0: task do_configure: Succeeded
NOTE: Running task 1023 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.363.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.4.363.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build --target all --
| Change Dir: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build'
| 
| Run Build Command(s): ninja -v -j 16 all
| [1/383] cd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/cmake -DCHANGES_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/CHANGES -DTEMPLATE_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/cmake/SPIRV-Tools-shared.pc.in -DOUT_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build/SPIRV-Tools-shared.pc -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_INSTALL_INCLUDEDIR=include -DSPIRV_SHARED_LIBRARIES=-lSPIRV-Tools-shared -P /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/cmake/write_pkg_config.cma
 ke
| [2/383] cd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/cmake -DCHANGES_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/CHANGES -DTEMPLATE_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/cmake/SPIRV-Tools.pc.in -DOUT_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build/SPIRV-Tools.pc -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_INSTALL_INCLUDEDIR=include -DSPIRV_LIBRARIES=-lSPIRV-Tools-opt\ -lSPIRV-Tools\ -lSPIRV-Tools-link -P /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/cmake/write_pkg
 _config.cmake
| [3/383] cd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build/source && /srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/utils/generate_language_headers.py --extinst-grammar=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot/usr/include/spirv/unified1/extinst.opencl.debuginfo.100.grammar.json --extinst-output-path=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build/OpenCLDebugInfo100.h
| [4/383] cd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build/source && /srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/utils/generate_language_headers.py --extinst-grammar=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot/usr/include/spirv/unified1/extinst.debuginfo.grammar.json --extinst-output-path=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build/DebugInfo.h
| [5/383] cd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build/source && /srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/utils/ggt.py --core-tables-body-output=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build/core_tables_body.inc --core-tables-header-output=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build/core_tables_header.inc --spirv-core-grammar=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot/usr/include/spirv/unified1/spirv.core.grammar.json --extinst=,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot/usr/include/spirv/unified1/extin
 st.glsl.std.450.grammar.json --extinst=,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot/usr/include/spirv/unified1/extinst.opencl.std.100.grammar.json --extinst=CLDEBUG100_,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot/usr/include/spirv/unified1/extinst.opencl.debuginfo.100.grammar.json --extinst=SHDEBUG100_,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot/usr/include/spirv/unified1/extinst.nonsemantic.shader.debuginfo.grammar.json --extinst=,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot/usr/include/spirv/unified1/extinst.spv-amd-shader-explicit-vertex-parameter.grammar.json --extinst=,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot/usr/include/spirv/unified1/extinst.spv
 -amd-shader-trinary-minmax.grammar.json --extinst=,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot/usr/include/spirv/unified1/extinst.spv-amd-gcn-shader.grammar.json --extinst=,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot/usr/include/spirv/unified1/extinst.spv-amd-shader-ballot.grammar.json --extinst=,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot/usr/include/spirv/unified1/extinst.debuginfo.grammar.json --extinst=,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot/usr/include/spirv/unified1/extinst.nonsemantic.clspvreflection.grammar.json --extinst=,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot/usr/include/spirv/unified1/extinst.nonsemantic.vkspreflection.grammar.json -
 -extinst=TOSA_,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot/usr/include/spirv/unified1/extinst.tosa.001000.1.grammar.json --extinst=,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot/usr/include/spirv/unified1/extinst.arm.motion-engine.100.grammar.json --extinst=,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot/usr/include/spirv/unified1/extinst.nonsemantic.graph.debuginfo.grammar.json --extinst=,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot/usr/include/spirv/unified1/extinst.arm.experimental-ml-operations.grammar.json --extinst=,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot/usr/include/spirv/unified1/extinst.nonsemantic.debugprintf.grammar.json
| [6/383] cd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build/source && /srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/utils/generate_registry_tables.py --xml=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot/usr/include/spirv/spir-v.xml --generator-output=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build/generators.inc
| [7/383] cd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build/source && /srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/utils/update_build_version.py /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/CHANGES /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build/build-version.inc
| [8/383] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot -DSPIRV_COLOR_TERMINAL -DSPIRV_TIMER_ENABLED -DSPIRV_Tools_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot  -O2 -g -fcanon-prefi
 x-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -O2 -g -DNDEBUG -std=c++17 -fPIC -fno-rtti -Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers -Werror -Wno-long-long -Wshadow -Wundef -Wconversion -Wno-sign-conversion -fno-exceptions -MD -MT source/CMakeFiles/SPIRV-Tools.dir/software_version.cpp.o -MF source/CMakeFiles/SPIRV-Tools.dir/software_version.cpp.o.d -o source/CMakeFiles/
 SPIRV-Tools.dir/software_version.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/software_version.cpp
| [9/383] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot -DSPIRV_COLOR_TERMINAL -DSPIRV_TIMER_ENABLED -DSPIRV_Tools_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot  -O2 -g -fcanon-prefi
 x-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -O2 -g -DNDEBUG -std=c++17 -fPIC -fno-rtti -Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers -Werror -Wno-long-long -Wshadow -Wundef -Wconversion -Wno-sign-conversion -fno-exceptions -MD -MT source/CMakeFiles/SPIRV-Tools.dir/spirv_endian.cpp.o -MF source/CMakeFiles/SPIRV-Tools.dir/spirv_endian.cpp.o.d -o source/CMakeFiles/SPIRV-To
 ols.dir/spirv_endian.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/spirv_endian.cpp
| [10/383] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot -DSPIRV_COLOR_TERMINAL -DSPIRV_TIMER_ENABLED -DSPIRV_Tools_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot  -O2 -g -fcanon-pref
 ix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -O2 -g -DNDEBUG -std=c++17 -fPIC -fno-rtti -Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers -Werror -Wno-long-long -Wshadow -Wundef -Wconversion -Wno-sign-conversion -fno-exceptions -MD -MT source/CMakeFiles/SPIRV-Tools.dir/spirv_fuzzer_options.cpp.o -MF source/CMakeFiles/SPIRV-Tools.dir/spirv_fuzzer_options.cpp.o.d -o source/CM
 akeFiles/SPIRV-Tools.dir/spirv_fuzzer_options.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/spirv_fuzzer_options.cpp
| [11/383] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot -DSPIRV_COLOR_TERMINAL -DSPIRV_TIMER_ENABLED -DSPIRV_Tools_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot  -O2 -g -fcanon-pref
 ix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -O2 -g -DNDEBUG -std=c++17 -fPIC -fno-rtti -Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers -Werror -Wno-long-long -Wshadow -Wundef -Wconversion -Wno-sign-conversion -fno-exceptions -MD -MT source/CMakeFiles/SPIRV-Tools.dir/print.cpp.o -MF source/CMakeFiles/SPIRV-Tools.dir/print.cpp.o.d -o source/CMakeFiles/SPIRV-Tools.dir/print
 .cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/print.cpp
| [12/383] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot -DSPIRV_COLOR_TERMINAL -DSPIRV_TIMER_ENABLED -DSPIRV_Tools_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot  -O2 -g -fcanon-pref
 ix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -O2 -g -DNDEBUG -std=c++17 -fPIC -fno-rtti -Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers -Werror -Wno-long-long -Wshadow -Wundef -Wconversion -Wno-sign-conversion -fno-exceptions -MD -MT source/CMakeFiles/SPIRV-Tools.dir/spirv_optimizer_options.cpp.o -MF source/CMakeFiles/SPIRV-Tools.dir/spirv_optimizer_options.cpp.o.d -o sou
 rce/CMakeFiles/SPIRV-Tools.dir/spirv_optimizer_options.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/spirv_optimizer_options.cpp
| [13/383] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot -DSPIRV_COLOR_TERMINAL -DSPIRV_TIMER_ENABLED -DSPIRV_Tools_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot  -O2 -g -fcanon-pref
 ix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -O2 -g -DNDEBUG -std=c++17 -fPIC -fno-rtti -Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers -Werror -Wno-long-long -Wshadow -Wundef -Wconversion -Wno-sign-conversion -fno-exceptions -MD -MT source/CMakeFiles/SPIRV-Tools.dir/util/bit_vector.cpp.o -MF source/CMakeFiles/SPIRV-Tools.dir/util/bit_vector.cpp.o.d -o source/CMakeFiles/S
 PIRV-Tools.dir/util/bit_vector.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/util/bit_vector.cpp
| [14/383] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot -DSPIRV_COLOR_TERMINAL -DSPIRV_TIMER_ENABLED -DSPIRV_Tools_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot  -O2 -g -fcanon-pref
 ix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -O2 -g -DNDEBUG -std=c++17 -fPIC -fno-rtti -Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers -Werror -Wno-long-long -Wshadow -Wundef -Wconversion -Wno-sign-conversion -fno-exceptions -MD -MT source/CMakeFiles/SPIRV-Tools.dir/ext_inst.cpp.o -MF source/CMakeFiles/SPIRV-Tools.dir/ext_inst.cpp.o.d -o source/CMakeFiles/SPIRV-Tools.dir
 /ext_inst.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/ext_inst.cpp
| [15/383] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot -DSPIRV_COLOR_TERMINAL -DSPIRV_TIMER_ENABLED -DSPIRV_Tools_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot  -O2 -g -fcanon-pref
 ix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -O2 -g -DNDEBUG -std=c++17 -fPIC -fno-rtti -Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers -Werror -Wno-long-long -Wshadow -Wundef -Wconversion -Wno-sign-conversion -fno-exceptions -MD -MT source/CMakeFiles/SPIRV-Tools.dir/util/string_utils.cpp.o -MF source/CMakeFiles/SPIRV-Tools.dir/util/string_utils.cpp.o.d -o source/CMakeFil
 es/SPIRV-Tools.dir/util/string_utils.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/util/string_utils.cpp
| [16/383] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot -DSPIRV_COLOR_TERMINAL -DSPIRV_TIMER_ENABLED -DSPIRV_Tools_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot  -O2 -g -fcanon-pref
 ix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -O2 -g -DNDEBUG -std=c++17 -fPIC -fno-rtti -Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers -Werror -Wno-long-long -Wshadow -Wundef -Wconversion -Wno-sign-conversion -fno-exceptions -MD -MT source/CMakeFiles/SPIRV-Tools.dir/spirv_validator_options.cpp.o -MF source/CMakeFiles/SPIRV-Tools.dir/spirv_validator_options.cpp.o.d -o sou
 rce/CMakeFiles/SPIRV-Tools.dir/spirv_validator_options.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/spirv_validator_options.cpp
| [17/383] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot -DSPIRV_COLOR_TERMINAL -DSPIRV_TIMER_ENABLED -DSPIRV_Tools_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot  -O2 -g -fcanon-pref
 ix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -O2 -g -DNDEBUG -std=c++17 -fPIC -fno-rtti -Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers -Werror -Wno-long-long -Wshadow -Wundef -Wconversion -Wno-sign-conversion -fno-exceptions -MD -MT source/CMakeFiles/SPIRV-Tools.dir/operand.cpp.o -MF source/CMakeFiles/SPIRV-Tools.dir/operand.cpp.o.d -o source/CMakeFiles/SPIRV-Tools.dir/o
 perand.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/operand.cpp
| FAILED: [code=1] source/CMakeFiles/SPIRV-Tools.dir/operand.cpp.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot -DSPIRV_COLOR_TERMINAL -DSPIRV_TIMER_ENABLED -DSPIRV_Tools_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -
 ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -O2 -g -DNDEBUG -std=c++17 -fPIC -fno-rtti -Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers -Werror -Wno-long-long -Wshadow -Wundef -Wconversion -Wno-sign-conversion -fno-exceptions -MD -MT source/CMakeFiles/SPIRV-Tools.dir/operand.cpp.o -MF source/CMakeFiles/SPIRV-Tools.dir/operand.cpp.o.d -o source/CMakeFiles/SPIRV-Tools.dir/operand.cp
 p.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/operand.cpp
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/operand.cpp: In function 'std::function<bool(unsigned int)> spvOperandCanBeForwardDeclaredFunction(spv::Op)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/operand.cpp:583:19: error: 'OpCooperativeMatrixPerElementOpEXT' is not a member of 'spv::Op'; did you mean 'OpCooperativeMatrixPerElementOpNV'?
|   583 |     case spv::Op::OpCooperativeMatrixPerElementOpEXT:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   OpCooperativeMatrixPerElementOpNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/operand.cpp:586:19: error: 'OpCooperativeMatrixReduceEXT' is not a member of 'spv::Op'; did you mean 'OpCooperativeMatrixReduceNV'?
|   586 |     case spv::Op::OpCooperativeMatrixReduceEXT:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   OpCooperativeMatrixReduceNV
| [18/383] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot -DSPIRV_COLOR_TERMINAL -DSPIRV_TIMER_ENABLED -DSPIRV_Tools_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot  -O2 -g -fcanon-pref
 ix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -O2 -g -DNDEBUG -std=c++17 -fPIC -fno-rtti -Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers -Werror -Wno-long-long -Wshadow -Wundef -Wconversion -Wno-sign-conversion -fno-exceptions -MD -MT source/CMakeFiles/SPIRV-Tools.dir/spirv_reducer_options.cpp.o -MF source/CMakeFiles/SPIRV-Tools.dir/spirv_reducer_options.cpp.o.d -o source/
 CMakeFiles/SPIRV-Tools.dir/spirv_reducer_options.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/spirv_reducer_options.cpp
| [19/383] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot -DSPIRV_COLOR_TERMINAL -DSPIRV_TIMER_ENABLED -DSPIRV_Tools_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot  -O2 -g -fcanon-pref
 ix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -O2 -g -DNDEBUG -std=c++17 -fPIC -fno-rtti -Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers -Werror -Wno-long-long -Wshadow -Wundef -Wconversion -Wno-sign-conversion -fno-exceptions -MD -MT source/CMakeFiles/SPIRV-Tools.dir/extensions.cpp.o -MF source/CMakeFiles/SPIRV-Tools.dir/extensions.cpp.o.d -o source/CMakeFiles/SPIRV-Tools
 .dir/extensions.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/extensions.cpp
| [20/383] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot -DSPIRV_COLOR_TERMINAL -DSPIRV_TIMER_ENABLED -DSPIRV_Tools_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot  -O2 -g -fcanon-pref
 ix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -O2 -g -DNDEBUG -std=c++17 -fPIC -fno-rtti -Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers -Werror -Wno-long-long -Wshadow -Wundef -Wconversion -Wno-sign-conversion -fno-exceptions -MD -MT source/CMakeFiles/SPIRV-Tools.dir/assembly_grammar.cpp.o -MF source/CMakeFiles/SPIRV-Tools.dir/assembly_grammar.cpp.o.d -o source/CMakeFiles
 /SPIRV-Tools.dir/assembly_grammar.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/assembly_grammar.cpp
| [21/383] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot -DSPIRV_COLOR_TERMINAL -DSPIRV_TIMER_ENABLED -DSPIRV_Tools_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot  -O2 -g -fcanon-pref
 ix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -O2 -g -DNDEBUG -std=c++17 -fPIC -fno-rtti -Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers -Werror -Wno-long-long -Wshadow -Wundef -Wconversion -Wno-sign-conversion -fno-exceptions -MD -MT source/CMakeFiles/SPIRV-Tools.dir/libspirv.cpp.o -MF source/CMakeFiles/SPIRV-Tools.dir/libspirv.cpp.o.d -o source/CMakeFiles/SPIRV-Tools.dir
 /libspirv.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/libspirv.cpp
| [22/383] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot -DSPIRV_COLOR_TERMINAL -DSPIRV_TIMER_ENABLED -DSPIRV_Tools_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot  -O2 -g -fcanon-pref
 ix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -O2 -g -DNDEBUG -std=c++17 -fPIC -fno-rtti -Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers -Werror -Wno-long-long -Wshadow -Wundef -Wconversion -Wno-sign-conversion -fno-exceptions -MD -MT source/CMakeFiles/SPIRV-Tools.dir/opcode.cpp.o -MF source/CMakeFiles/SPIRV-Tools.dir/opcode.cpp.o.d -o source/CMakeFiles/SPIRV-Tools.dir/opc
 ode.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/opcode.cpp
| [23/383] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot -DSPIRV_COLOR_TERMINAL -DSPIRV_TIMER_ENABLED -DSPIRV_Tools_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot  -O2 -g -fcanon-pref
 ix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -O2 -g -DNDEBUG -std=c++17 -fPIC -fno-rtti -Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers -Werror -Wno-long-long -Wshadow -Wundef -Wconversion -Wno-sign-conversion -fno-exceptions -MD -MT source/CMakeFiles/SPIRV-Tools.dir/diagnostic.cpp.o -MF source/CMakeFiles/SPIRV-Tools.dir/diagnostic.cpp.o.d -o source/CMakeFiles/SPIRV-Tools
 .dir/diagnostic.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/diagnostic.cpp
| [24/383] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot -DSPIRV_COLOR_TERMINAL -DSPIRV_TIMER_ENABLED -DSPIRV_Tools_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot  -O2 -g -fcanon-pref
 ix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -O2 -g -DNDEBUG -std=c++17 -fPIC -fno-rtti -Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers -Werror -Wno-long-long -Wshadow -Wundef -Wconversion -Wno-sign-conversion -fno-exceptions -MD -MT source/CMakeFiles/SPIRV-Tools.dir/spirv_target_env.cpp.o -MF source/CMakeFiles/SPIRV-Tools.dir/spirv_target_env.cpp.o.d -o source/CMakeFiles
 /SPIRV-Tools.dir/spirv_target_env.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/spirv_target_env.cpp
| [25/383] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot -DSPIRV_COLOR_TERMINAL -DSPIRV_TIMER_ENABLED -DSPIRV_Tools_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot  -O2 -g -fcanon-pref
 ix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -O2 -g -DNDEBUG -std=c++17 -fPIC -fno-rtti -Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers -Werror -Wno-long-long -Wshadow -Wundef -Wconversion -Wno-sign-conversion -fno-exceptions -MD -MT source/CMakeFiles/SPIRV-Tools.dir/parsed_operand.cpp.o -MF source/CMakeFiles/SPIRV-Tools.dir/parsed_operand.cpp.o.d -o source/CMakeFiles/SPI
 RV-Tools.dir/parsed_operand.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/parsed_operand.cpp
| [26/383] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot -DSPIRV_COLOR_TERMINAL -DSPIRV_TIMER_ENABLED -DSPIRV_Tools_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot  -O2 -g -fcanon-pref
 ix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -O2 -g -DNDEBUG -std=c++17 -fPIC -fno-rtti -Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers -Werror -Wno-long-long -Wshadow -Wundef -Wconversion -Wno-sign-conversion -fno-exceptions -MD -MT source/CMakeFiles/SPIRV-Tools.dir/table.cpp.o -MF source/CMakeFiles/SPIRV-Tools.dir/table.cpp.o.d -o source/CMakeFiles/SPIRV-Tools.dir/table
 .cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/table.cpp
| [27/383] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot -DSPIRV_COLOR_TERMINAL -DSPIRV_TIMER_ENABLED -DSPIRV_Tools_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot  -O2 -g -fcanon-pref
 ix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -O2 -g -DNDEBUG -std=c++17 -fPIC -fno-rtti -Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers -Werror -Wno-long-long -Wshadow -Wundef -Wconversion -Wno-sign-conversion -fno-exceptions -MD -MT source/CMakeFiles/SPIRV-Tools.dir/binary.cpp.o -MF source/CMakeFiles/SPIRV-Tools.dir/binary.cpp.o.d -o source/CMakeFiles/SPIRV-Tools.dir/bin
 ary.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/binary.cpp
| [28/383] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot -DSPIRV_COLOR_TERMINAL -DSPIRV_TIMER_ENABLED -DSPIRV_Tools_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot  -O2 -g -fcanon-pref
 ix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -O2 -g -DNDEBUG -std=c++17 -fPIC -fno-rtti -Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers -Werror -Wno-long-long -Wshadow -Wundef -Wconversion -Wno-sign-conversion -fno-exceptions -MD -MT source/CMakeFiles/SPIRV-Tools.dir/table2.cpp.o -MF source/CMakeFiles/SPIRV-Tools.dir/table2.cpp.o.d -o source/CMakeFiles/SPIRV-Tools.dir/tab
 le2.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/table2.cpp
| [29/383] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot -DSPIRV_COLOR_TERMINAL -DSPIRV_TIMER_ENABLED -DSPIRV_Tools_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot  -O2 -g -fcanon-pref
 ix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -O2 -g -DNDEBUG -std=c++17 -fPIC -fno-rtti -Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers -Werror -Wno-long-long -Wshadow -Wundef -Wconversion -Wno-sign-conversion -fno-exceptions -MD -MT source/CMakeFiles/SPIRV-Tools.dir/name_mapper.cpp.o -MF source/CMakeFiles/SPIRV-Tools.dir/name_mapper.cpp.o.d -o source/CMakeFiles/SPIRV-Too
 ls.dir/name_mapper.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/name_mapper.cpp
| [30/383] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot -DSPIRV_COLOR_TERMINAL -DSPIRV_TIMER_ENABLED -DSPIRV_Tools_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot  -O2 -g -fcanon-pref
 ix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -O2 -g -DNDEBUG -std=c++17 -fPIC -fno-rtti -Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers -Werror -Wno-long-long -Wshadow -Wundef -Wconversion -Wno-sign-conversion -fno-exceptions -MD -MT source/CMakeFiles/SPIRV-Tools.dir/disassemble.cpp.o -MF source/CMakeFiles/SPIRV-Tools.dir/disassemble.cpp.o.d -o source/CMakeFiles/SPIRV-Too
 ls.dir/disassemble.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/disassemble.cpp
| [31/383] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot -DSPIRV_COLOR_TERMINAL -DSPIRV_TIMER_ENABLED -DSPIRV_Tools_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot  -O2 -g -fcanon-pref
 ix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -O2 -g -DNDEBUG -std=c++17 -fPIC -fno-rtti -Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers -Werror -Wno-long-long -Wshadow -Wundef -Wconversion -Wno-sign-conversion -fno-exceptions -MD -MT source/CMakeFiles/SPIRV-Tools.dir/text.cpp.o -MF source/CMakeFiles/SPIRV-Tools.dir/text.cpp.o.d -o source/CMakeFiles/SPIRV-Tools.dir/text.cp
 p.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/text.cpp
| [32/383] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot -DSPIRV_COLOR_TERMINAL -DSPIRV_TIMER_ENABLED -DSPIRV_Tools_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot  -O2 -g -fcanon-pref
 ix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build=/usr/src/debug/spirv-tools/1.4.363.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -O2 -g -DNDEBUG -std=c++17 -fPIC -fno-rtti -Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers -Werror -Wno-long-long -Wshadow -Wundef -Wconversion -Wno-sign-conversion -fno-exceptions -MD -MT source/CMakeFiles/SPIRV-Tools.dir/util/parse_number.cpp.o -MF source/CMakeFiles/SPIRV-Tools.dir/util/parse_number.cpp.o.d -o source/CMakeFil
 es/SPIRV-Tools.dir/util/parse_number.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/sources/spirv-tools-1.4.363.0/source/util/parse_number.cpp
| ninja: build stopped: subcommand failed.
| 
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/temp/run.do_compile.939755:147 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/temp/run.do_compile.939755, line 147
| 	#2: cmake_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/temp/run.do_compile.939755, line 141
| 	#3: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/temp/run.do_compile.939755, line 136
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/temp/run.do_compile.939755, line 160
NOTE: recipe spirv-tools-1_1.4.363.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1023 tasks of which 1012 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260929054135.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260929054135.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.363.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/temp/log.do_compile.939755
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: spirv-tools-1_1.4.363.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/temp/run.do_compile.939755' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.363.0/temp/log.do_compile.939755
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.363.0.bb:do_compile) failed with exit code '1'

--===============3754508017299279145==--

