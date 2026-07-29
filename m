Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C5BC54FD1
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 07:24:33 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6130.1785309872257771610
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 00:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=iJ9eNoMO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CxPDDqHO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019facc2bbc5-4acb2aa9-47dc-4560-ab69-7bb7425007e9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785309871;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=C/Qrhljc7MNfGfD+vJJJ2OHwMSIQLZnWnFG4NCCyNUU=;
	b=iJ9eNoMOxEh+2EAuPisRBbSOnbAuFGOXlVjuNM1vy2CTZ+8bkkrwrLondcgeGdqM
	Y8/pnWztEA0LrvzIB0kFAIGaBTCkdDimqMa7gOq3Rofd5UQaulf3TQRiBtemjjveOBc
	FvnrxQlVIqNtDUBa0iITgPf4S6wyuJQH//gKe3mc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785309871;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=C/Qrhljc7MNfGfD+vJJJ2OHwMSIQLZnWnFG4NCCyNUU=;
	b=CxPDDqHOqVl9pPID5BCHU4Yu5kITZOUkwlQaDdYxRadJNE1AGn13afOUW5DL+6f5
	zcgtTJ1eZtxAXP715L22uw5CjECVePsSwKWJ7wBVkW51BoRs4BYzYGjAhTjAWycvNky
	l8h4T8FMsE6AmhCU0qZ7e1Jx3aW9SDZBcRmBWuAM=
Content-Type: multipart/mixed; boundary="===============0004995457081632703=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-tools: upgrading to 1.4.357.0 FAILED
Message-ID: <0101019facc2bbc5-4acb2aa9-47dc-4560-ab69-7bb7425007e9-000000@us-west-2.amazonses.com>
Date: Wed, 29 Jul 2026 07:24:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.29-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 07:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242251

--===============0004995457081632703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-tools* to *1.4.357.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-spirv-tools-upgrade-1.4.350.1-1.4.357.0.patch
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
From f0f49f71d0da721de92e7657556334b125b244f3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 29 Jul 2026 06:19:06 +0000
Subject: [PATCH] spirv-tools: upgrade 1.4.350.1 -> 1.4.357.0

Source: CHANGES

v2026.3 2026-07-08
  - General
    - Support SPV_QCOM_multiple_wait_queues, SPV_KHR_opacity_micromap, and SPV_EXT_ocp_microscaling_types (#6671, #6670, #6772)
    - Add ArmExperimentalMLOperations and NonSemantic.Graph.DebugInfo instruction sets (#6692, #6666)
    - Fix unbounded memory usage in FriendlyNameMapper (#6763)
    - Improved hex-float compilation and float equality testing (#6778, #6783)
    - Various build system and dependency updates (Bazel, GN, Protobuf, Abseil)
  - Optimizer
    - Stability fixes for DeadBranchElimPass, CodeSinkingPass, and OrderBlocks (#6764, #6703, #6676)
    - Improved handling of tensor constants, non-semantic instructions, and loop decorations (#6684, #6721, #6719, #6690)
    - Add folding rule for extract from copy logical and prevent word limit overflows (#6725, #6722)
  - Validator
    - Support SPV_EXT_ocp_microscaling_types, SPV_EXT_split_barrier, and SPV_ARM_graph (#6779, #6732, #6694)
    - Support for SPV_NV_cooperative_matrix_decode_vector and Intel extensions (#6693, #6717, #6665)
    - Enhanced error reporting with source line printing and Shader Debug Info (#6648, #6698, #6691, #6686, #6685, #6681)
    - Correctness fixes for ray queries, descriptors, OpSpecConstantOp, and array validation (#6710, #6729, #6731, #6777, #6709)
    - Disallow duplicate targets for OpGroupDecorate and multiple graph entry points (#6720, #6754)
  - Assembler/Disassembler
    - Support for SPV_QCOM_image_processing3 (#6776)
    - Performance and correctness improvements in the disassembler and tools (#6757, #6650)
---
 .../{spirv-tools_1.4.350.1.bb => spirv-tools_1.4.357.0.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-tools_1.4.350.1.bb => spirv-tools_1.4.357.0.bb} (94%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb
similarity index 94%
rename from meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb
index b7ae50764b..aa504e52b4 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb
@@ -7,9 +7,8 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "0539c81f69a3daeb706fd3477dca61435b475156"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https;tag=vulkan-sdk-${PV} \
-"
+SRCREV = "9a49b0883b9b635689a85b5647dbfcb223268151"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=vulkan-sdk-1.4.357;protocol=https;tag=vulkan-sdk-${PV}"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools
-- 
2.47.1


--===============0004995457081632703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="spirv-tools-changelog.txt"

Changelog for spirv-tools: 1.4.350.1 -> 1.4.357.0
Source: CHANGES

v2026.3 2026-07-08
  - General
    - Support SPV_QCOM_multiple_wait_queues, SPV_KHR_opacity_micromap, and SPV_EXT_ocp_microscaling_types (#6671, #6670, #6772)
    - Add ArmExperimentalMLOperations and NonSemantic.Graph.DebugInfo instruction sets (#6692, #6666)
    - Fix unbounded memory usage in FriendlyNameMapper (#6763)
    - Improved hex-float compilation and float equality testing (#6778, #6783)
    - Various build system and dependency updates (Bazel, GN, Protobuf, Abseil)
  - Optimizer
    - Stability fixes for DeadBranchElimPass, CodeSinkingPass, and OrderBlocks (#6764, #6703, #6676)
    - Improved handling of tensor constants, non-semantic instructions, and loop decorations (#6684, #6721, #6719, #6690)
    - Add folding rule for extract from copy logical and prevent word limit overflows (#6725, #6722)
  - Validator
    - Support SPV_EXT_ocp_microscaling_types, SPV_EXT_split_barrier, and SPV_ARM_graph (#6779, #6732, #6694)
    - Support for SPV_NV_cooperative_matrix_decode_vector and Intel extensions (#6693, #6717, #6665)
    - Enhanced error reporting with source line printing and Shader Debug Info (#6648, #6698, #6691, #6686, #6685, #6681)
    - Correctness fixes for ray queries, descriptors, OpSpecConstantOp, and array validation (#6710, #6729, #6731, #6777, #6709)
    - Disallow duplicate targets for OpGroupDecorate and multiple graph entry points (#6720, #6754)
  - Assembler/Disassembler
    - Support for SPV_QCOM_image_processing3 (#6776)
    - Performance and correctness improvements in the disassembler and tools (#6757, #6650)

--===============0004995457081632703==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-tools-upgrade-1.4.350.1-1.4.357.0.patch"

RnJvbSBmMGY0OWY3MWQwZGE3MjFkZTkyZTc2NTc1NTYzMzRiMTI1YjI0NGYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjkgSnVsIDIwMjYgMDY6MTk6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cGlydi10b29sczogdXBncmFkZSAxLjQuMzUwLjEgLT4gMS40LjM1Ny4wCgpTb3VyY2U6IENIQU5H
RVMKCnYyMDI2LjMgMjAyNi0wNy0wOAogIC0gR2VuZXJhbAogICAgLSBTdXBwb3J0IFNQVl9RQ09N
X211bHRpcGxlX3dhaXRfcXVldWVzLCBTUFZfS0hSX29wYWNpdHlfbWljcm9tYXAsIGFuZCBTUFZf
RVhUX29jcF9taWNyb3NjYWxpbmdfdHlwZXMgKCM2NjcxLCAjNjY3MCwgIzY3NzIpCiAgICAtIEFk
ZCBBcm1FeHBlcmltZW50YWxNTE9wZXJhdGlvbnMgYW5kIE5vblNlbWFudGljLkdyYXBoLkRlYnVn
SW5mbyBpbnN0cnVjdGlvbiBzZXRzICgjNjY5MiwgIzY2NjYpCiAgICAtIEZpeCB1bmJvdW5kZWQg
bWVtb3J5IHVzYWdlIGluIEZyaWVuZGx5TmFtZU1hcHBlciAoIzY3NjMpCiAgICAtIEltcHJvdmVk
IGhleC1mbG9hdCBjb21waWxhdGlvbiBhbmQgZmxvYXQgZXF1YWxpdHkgdGVzdGluZyAoIzY3Nzgs
ICM2NzgzKQogICAgLSBWYXJpb3VzIGJ1aWxkIHN5c3RlbSBhbmQgZGVwZW5kZW5jeSB1cGRhdGVz
IChCYXplbCwgR04sIFByb3RvYnVmLCBBYnNlaWwpCiAgLSBPcHRpbWl6ZXIKICAgIC0gU3RhYmls
aXR5IGZpeGVzIGZvciBEZWFkQnJhbmNoRWxpbVBhc3MsIENvZGVTaW5raW5nUGFzcywgYW5kIE9y
ZGVyQmxvY2tzICgjNjc2NCwgIzY3MDMsICM2Njc2KQogICAgLSBJbXByb3ZlZCBoYW5kbGluZyBv
ZiB0ZW5zb3IgY29uc3RhbnRzLCBub24tc2VtYW50aWMgaW5zdHJ1Y3Rpb25zLCBhbmQgbG9vcCBk
ZWNvcmF0aW9ucyAoIzY2ODQsICM2NzIxLCAjNjcxOSwgIzY2OTApCiAgICAtIEFkZCBmb2xkaW5n
IHJ1bGUgZm9yIGV4dHJhY3QgZnJvbSBjb3B5IGxvZ2ljYWwgYW5kIHByZXZlbnQgd29yZCBsaW1p
dCBvdmVyZmxvd3MgKCM2NzI1LCAjNjcyMikKICAtIFZhbGlkYXRvcgogICAgLSBTdXBwb3J0IFNQ
Vl9FWFRfb2NwX21pY3Jvc2NhbGluZ190eXBlcywgU1BWX0VYVF9zcGxpdF9iYXJyaWVyLCBhbmQg
U1BWX0FSTV9ncmFwaCAoIzY3NzksICM2NzMyLCAjNjY5NCkKICAgIC0gU3VwcG9ydCBmb3IgU1BW
X05WX2Nvb3BlcmF0aXZlX21hdHJpeF9kZWNvZGVfdmVjdG9yIGFuZCBJbnRlbCBleHRlbnNpb25z
ICgjNjY5MywgIzY3MTcsICM2NjY1KQogICAgLSBFbmhhbmNlZCBlcnJvciByZXBvcnRpbmcgd2l0
aCBzb3VyY2UgbGluZSBwcmludGluZyBhbmQgU2hhZGVyIERlYnVnIEluZm8gKCM2NjQ4LCAjNjY5
OCwgIzY2OTEsICM2Njg2LCAjNjY4NSwgIzY2ODEpCiAgICAtIENvcnJlY3RuZXNzIGZpeGVzIGZv
ciByYXkgcXVlcmllcywgZGVzY3JpcHRvcnMsIE9wU3BlY0NvbnN0YW50T3AsIGFuZCBhcnJheSB2
YWxpZGF0aW9uICgjNjcxMCwgIzY3MjksICM2NzMxLCAjNjc3NywgIzY3MDkpCiAgICAtIERpc2Fs
bG93IGR1cGxpY2F0ZSB0YXJnZXRzIGZvciBPcEdyb3VwRGVjb3JhdGUgYW5kIG11bHRpcGxlIGdy
YXBoIGVudHJ5IHBvaW50cyAoIzY3MjAsICM2NzU0KQogIC0gQXNzZW1ibGVyL0Rpc2Fzc2VtYmxl
cgogICAgLSBTdXBwb3J0IGZvciBTUFZfUUNPTV9pbWFnZV9wcm9jZXNzaW5nMyAoIzY3NzYpCiAg
ICAtIFBlcmZvcm1hbmNlIGFuZCBjb3JyZWN0bmVzcyBpbXByb3ZlbWVudHMgaW4gdGhlIGRpc2Fz
c2VtYmxlciBhbmQgdG9vbHMgKCM2NzU3LCAjNjY1MCkKLS0tCiAuLi4ve3NwaXJ2LXRvb2xzXzEu
NC4zNTAuMS5iYiA9PiBzcGlydi10b29sc18xLjQuMzU3LjAuYmJ9ICAgfCA1ICsrLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy9zcGlyL3tzcGlydi10b29sc18xLjQuMzUwLjEuYmIgPT4gc3BpcnYt
dG9vbHNfMS40LjM1Ny4wLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9zcGlyL3NwaXJ2LXRvb2xzXzEuNC4zNTAuMS5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9zcGlyL3NwaXJ2LXRvb2xzXzEuNC4zNTcuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi10b29sc18xLjQuMzUwLjEu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LXRvb2xzXzEuNC4z
NTcuMC5iYgppbmRleCBiN2FlNTA3NjRiLi5hYTUwNGU1MmI0IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi10b29sc18xLjQuMzUwLjEuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtdG9vbHNfMS40LjM1Ny4wLmJiCkBAIC03LDkgKzcs
OCBAQCBTRUNUSU9OID0gImdyYXBoaWNzIgogTElDRU5TRSAgPSAiQXBhY2hlLTIuMCIKIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRk
ZGMzYzZiZDU3IgogCi1TUkNSRVYgPSAiMDUzOWM4MWY2OWEzZGFlYjcwNmZkMzQ3N2RjYTYxNDM1
YjQ3NTE1NiIKLVNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvU1BJUlYt
VG9vbHMuZ2l0O2JyYW5jaD1tYWluO3Byb3RvY29sPWh0dHBzO3RhZz12dWxrYW4tc2RrLSR7UFZ9
IFwKLSIKK1NSQ1JFViA9ICI5YTQ5YjA4ODNiOWI2MzU2ODlhODViNTY0N2RiZmNiMjIzMjY4MTUx
IgorU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9TUElSVi1Ub29scy5n
aXQ7YnJhbmNoPXZ1bGthbi1zZGstMS40LjM1Nztwcm90b2NvbD1odHRwczt0YWc9dnVsa2FuLXNk
ay0ke1BWfSIKIFBFID0gIjEiCiAjIFRoZXNlIHJlY2lwZXMgbmVlZCB0byBiZSB1cGRhdGVkIGlu
IGxvY2tzdGVwIHdpdGggZWFjaCBvdGhlcjoKICMgZ2xzbGFuZywgdnVsa2FuLWhlYWRlcnMsIHZ1
bGthbi1sb2FkZXIsIHZ1bGthbi10b29scywgc3BpcnYtaGVhZGVycywgc3BpcnYtdG9vbHMKLS0g
CjIuNDcuMQoK

--===============0004995457081632703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 954 .bb files complete (0 cached, 954 parsed). 1983 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-d9345b1ab959c3dcc24b9c96b9188c955ef2d2fd"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:d9345b1ab959c3dcc24b9c96b9188c955ef2d2fd"
meta-yocto-bsp       
meta-poky            = "master:e4690557fb0fffcb5e9a86d1c1ebc550bb0da090"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 105 Local 92 Mirrors 0 Missed 13 Current 277 (87% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 375 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.350.1.bb:do_create_spdx_setscene)
NOTE: Running task 914 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb:do_recipe_qa)
NOTE: recipe spirv-headers-1_1.4.350.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-tools-1_1.4.357.0-r0: task do_recipe_qa: Started
NOTE: recipe spirv-headers-1_1.4.350.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 381 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.350.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe spirv-headers-1_1.4.350.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe spirv-tools-1_1.4.357.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1012 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.4.350.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1015 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb:do_create_recipe_spdx)
NOTE: recipe spirv-tools-1_1.4.357.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.4.357.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe spirv-tools-1_1.4.357.0-r0: task do_fetch: Succeeded
NOTE: Running task 1016 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb:do_unpack)
NOTE: Running task 1017 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.4.357.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.4.357.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.4.357.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe spirv-tools-1_1.4.357.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.4.357.0-r0: task do_unpack: Succeeded
NOTE: Running task 1018 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb:do_patch)
NOTE: recipe spirv-tools-1_1.4.357.0-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.4.357.0-r0: task do_patch: Succeeded
NOTE: Running task 1019 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1020 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb:do_generate_toolchain_file)
NOTE: Running task 1021 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb:do_populate_lic)
NOTE: recipe spirv-tools-1_1.4.357.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.4.357.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.4.357.0-r0: task do_populate_lic: Started
NOTE: recipe spirv-tools-1_1.4.357.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.4.357.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-tools-1_1.4.357.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 1022 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.4.357.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.4.357.0-r0: task do_configure: Succeeded
NOTE: Running task 1023 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.4.357.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.357.0/build --target all --
| Change Dir: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.357.0/build'
| 
| Run Build Command(s): ninja -v -j 16 all
| ninja: error: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.357.0/recipe-sysroot/usr/include/spirv/unified1/extinst.nonsemantic.graph.debuginfo.grammar.json', needed by 'core_tables_body.inc', missing and no known rule to make it
| 
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.357.0/temp/run.do_compile.3909144:147 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.357.0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.357.0/temp/run.do_compile.3909144, line 147
| 	#2: cmake_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.357.0/temp/run.do_compile.3909144, line 141
| 	#3: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.357.0/temp/run.do_compile.3909144, line 136
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.357.0/temp/run.do_compile.3909144, line 160
NOTE: recipe spirv-tools-1_1.4.357.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1023 tasks of which 1012 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260729061852.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260729061852.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.357.0/temp/log.do_compile.3909144
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: spirv-tools-1_1.4.357.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.357.0/temp/run.do_compile.3909144' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.357.0/temp/log.do_compile.3909144
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb:do_compile) failed with exit code '1'

--===============0004995457081632703==--

