Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F295DC55160
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 07:24:34 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6128.1785309871842678576
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 00:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=pow7TyMH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JIe8xdP4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019facc2bb35-4648793d-3c31-463d-b722-c2ad11c7dbcd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785309871;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=r/0VnD20rRP6HQg8UFUjDxQnOBEKqAg4HMAFqWZq500=;
	b=pow7TyMHRbjOy1bgV09XqIq376GZRZ0n9lUfUi4S9phH6pmiKJwuXkbgeo3ZQk6p
	Kew9+w+dmkF8+3OKxOOSHDiPXSCZ5PJwE+CszsEXPBOXdTp6HFTiHOEsmpUdboO0fcX
	y5cgplSDPKpHCcemYcPqdz/ePh0WK9ytTFiyVogE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785309871;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=r/0VnD20rRP6HQg8UFUjDxQnOBEKqAg4HMAFqWZq500=;
	b=JIe8xdP4iqOoari7ZagoClizc0HfyyEODSeDrREQ1LbN9DUHHQ8WErHzFgPFejxI
	H3KMF9m4of0yLSZZkxAiKb7HRYRncQkPCsz82v9HV+hRMAKCOZy+mzUPzXQyMWyd2xO
	0RawraidNpFKry4wP9JmRJCE7QiTr+LmQn4th8mk=
Content-Type: multipart/mixed; boundary="===============8833824254225544396=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-headers: upgrading to 1.4.357.0 SUCCEEDED
Message-ID: <0101019facc2bb35-4648793d-3c31-463d-b722-c2ad11c7dbcd-000000@us-west-2.amazonses.com>
Date: Wed, 29 Jul 2026 07:24:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.29-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 07:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242246

--===============8833824254225544396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-headers* to *1.4.357.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-headers-upgrade-1.4.350.1-1.4.357.0.patch
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
From 0b86a42b8fc325408f524e57e20cd5d361b732e9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 29 Jul 2026 06:16:55 +0000
Subject: [PATCH] spirv-headers: upgrade 1.4.350.1 -> 1.4.357.0

29981f6 Fix Int64ImageEXT capability prerequisite to Int64 (#611)
0312729 Implement Samsung Intrinsic decoration (#597)
02c0394 Bump actions/checkout from 6 to 7 in the github-actions group (#612)
8d56066 SPV_QCOM_image_processing3 (#596)
b3cabdd SPV_QCOM_multiple_wait_queues (#595)
575b651 Add SPV_EXT_ocp_microscaling_types (#613)
daa093d chore: Add CONTRIBUTING file (#608)
ed73438 license: Add or update REUSE compliance (#609)
c63848e added source language entry ApilaJai (#607)
1e770e7 Add Pred as a new SPIR-V source language (#606)
8c5559c Add ArmExperimentalMLOperations instruction set (#602)
aaffbc5 SPV_NV_cooperative_matrix_decode_vector (#601)
fe44b20 SPV_EXT_split_barrier (#600)
82dfca3 Revert "Add SPV_MESA_fragment_coverage_mask enumerants (#580)" (#598)
3541d11 Add NonSemanticGraphDebugInfo instruction set (#591)
62d3e83 Add SPV_KHR_opacity_micromap (#599)
5c50cbd Add SPV_AMD_weak_linkage extension (#583)
98c842b Fix OpReadPipeBlockingINTEL/OpWritePipeBlockingINTEL operands (#588)
58006c9 Reserve ImageOperand 17 for Google (#589)
1f2dd16 Update spirv.core.grammar.json revision (#593)
1260380 Fix OpCompositeConstructContinuedINTEL operands (#587)
53b334f Reserve some tokens for Samsung (#586)
1a22b16 Update headers for spirv issue 373 (#584)
157de8e Add SPV_MESA_fragment_coverage_mask enumerants (#580)
948a3b0 header updates for SPV_INTEL_rounded_divide_sqrt (#582)
b8a3296 grammar and header changes for SPV_INTEL_predicated_io (#585)
---
 .../{spirv-headers_1.4.350.1.bb => spirv-headers_1.4.357.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.4.350.1.bb => spirv-headers_1.4.357.0.bb} (93%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.350.1.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.357.0.bb
similarity index 93%
rename from meta/recipes-graphics/spir/spirv-headers_1.4.350.1.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.4.357.0.bb
index c4af29652d..244c6854fa 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.4.350.1.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.4.357.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "CC-BY-4.0 AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a0dcaa512cc2dee95fe0fd791ee83a18"
 
-SRCREV = "ad9184e76a66b1001c29db9b0a3e87f646c64de0"
+SRCREV = "29981f65241605e08b0ede4cfeb999fe3b723c6a"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main;tag=vulkan-sdk-${PV}"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
-- 
2.47.1


--===============8833824254225544396==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-headers-upgrade-1.4.350.1-1.4.357.0.patch"

RnJvbSAwYjg2YTQyYjhmYzMyNTQwOGY1MjRlNTdlMjBjZDVkMzYxYjczMmU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjkgSnVsIDIwMjYgMDY6MTY6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cGlydi1oZWFkZXJzOiB1cGdyYWRlIDEuNC4zNTAuMSAtPiAxLjQuMzU3LjAKCjI5OTgxZjYgRml4
IEludDY0SW1hZ2VFWFQgY2FwYWJpbGl0eSBwcmVyZXF1aXNpdGUgdG8gSW50NjQgKCM2MTEpCjAz
MTI3MjkgSW1wbGVtZW50IFNhbXN1bmcgSW50cmluc2ljIGRlY29yYXRpb24gKCM1OTcpCjAyYzAz
OTQgQnVtcCBhY3Rpb25zL2NoZWNrb3V0IGZyb20gNiB0byA3IGluIHRoZSBnaXRodWItYWN0aW9u
cyBncm91cCAoIzYxMikKOGQ1NjA2NiBTUFZfUUNPTV9pbWFnZV9wcm9jZXNzaW5nMyAoIzU5NikK
YjNjYWJkZCBTUFZfUUNPTV9tdWx0aXBsZV93YWl0X3F1ZXVlcyAoIzU5NSkKNTc1YjY1MSBBZGQg
U1BWX0VYVF9vY3BfbWljcm9zY2FsaW5nX3R5cGVzICgjNjEzKQpkYWEwOTNkIGNob3JlOiBBZGQg
Q09OVFJJQlVUSU5HIGZpbGUgKCM2MDgpCmVkNzM0MzggbGljZW5zZTogQWRkIG9yIHVwZGF0ZSBS
RVVTRSBjb21wbGlhbmNlICgjNjA5KQpjNjM4NDhlIGFkZGVkIHNvdXJjZSBsYW5ndWFnZSBlbnRy
eSBBcGlsYUphaSAoIzYwNykKMWU3NzBlNyBBZGQgUHJlZCBhcyBhIG5ldyBTUElSLVYgc291cmNl
IGxhbmd1YWdlICgjNjA2KQo4YzU1NTljIEFkZCBBcm1FeHBlcmltZW50YWxNTE9wZXJhdGlvbnMg
aW5zdHJ1Y3Rpb24gc2V0ICgjNjAyKQphYWZmYmM1IFNQVl9OVl9jb29wZXJhdGl2ZV9tYXRyaXhf
ZGVjb2RlX3ZlY3RvciAoIzYwMSkKZmU0NGIyMCBTUFZfRVhUX3NwbGl0X2JhcnJpZXIgKCM2MDAp
CjgyZGZjYTMgUmV2ZXJ0ICJBZGQgU1BWX01FU0FfZnJhZ21lbnRfY292ZXJhZ2VfbWFzayBlbnVt
ZXJhbnRzICgjNTgwKSIgKCM1OTgpCjM1NDFkMTEgQWRkIE5vblNlbWFudGljR3JhcGhEZWJ1Z0lu
Zm8gaW5zdHJ1Y3Rpb24gc2V0ICgjNTkxKQo2MmQzZTgzIEFkZCBTUFZfS0hSX29wYWNpdHlfbWlj
cm9tYXAgKCM1OTkpCjVjNTBjYmQgQWRkIFNQVl9BTURfd2Vha19saW5rYWdlIGV4dGVuc2lvbiAo
IzU4MykKOThjODQyYiBGaXggT3BSZWFkUGlwZUJsb2NraW5nSU5URUwvT3BXcml0ZVBpcGVCbG9j
a2luZ0lOVEVMIG9wZXJhbmRzICgjNTg4KQo1ODAwNmM5IFJlc2VydmUgSW1hZ2VPcGVyYW5kIDE3
IGZvciBHb29nbGUgKCM1ODkpCjFmMmRkMTYgVXBkYXRlIHNwaXJ2LmNvcmUuZ3JhbW1hci5qc29u
IHJldmlzaW9uICgjNTkzKQoxMjYwMzgwIEZpeCBPcENvbXBvc2l0ZUNvbnN0cnVjdENvbnRpbnVl
ZElOVEVMIG9wZXJhbmRzICgjNTg3KQo1M2IzMzRmIFJlc2VydmUgc29tZSB0b2tlbnMgZm9yIFNh
bXN1bmcgKCM1ODYpCjFhMjJiMTYgVXBkYXRlIGhlYWRlcnMgZm9yIHNwaXJ2IGlzc3VlIDM3MyAo
IzU4NCkKMTU3ZGU4ZSBBZGQgU1BWX01FU0FfZnJhZ21lbnRfY292ZXJhZ2VfbWFzayBlbnVtZXJh
bnRzICgjNTgwKQo5NDhhM2IwIGhlYWRlciB1cGRhdGVzIGZvciBTUFZfSU5URUxfcm91bmRlZF9k
aXZpZGVfc3FydCAoIzU4MikKYjhhMzI5NiBncmFtbWFyIGFuZCBoZWFkZXIgY2hhbmdlcyBmb3Ig
U1BWX0lOVEVMX3ByZWRpY2F0ZWRfaW8gKCM1ODUpCi0tLQogLi4uL3tzcGlydi1oZWFkZXJzXzEu
NC4zNTAuMS5iYiA9PiBzcGlydi1oZWFkZXJzXzEuNC4zNTcuMC5iYn0gIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3NwaXIve3NwaXJ2LWhlYWRlcnNfMS40LjM1MC4xLmJiID0+IHNwaXJ2LWhl
YWRlcnNfMS40LjM1Ny4wLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9zcGlyL3NwaXJ2LWhlYWRlcnNfMS40LjM1MC4xLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3NwaXIvc3BpcnYtaGVhZGVyc18xLjQuMzU3LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18xLjQu
MzUwLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWhlYWRl
cnNfMS40LjM1Ny4wLmJiCmluZGV4IGM0YWYyOTY1MmQuLjI0NGM2ODU0ZmEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWhlYWRlcnNfMS40LjM1MC4xLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWhlYWRlcnNfMS40LjM1Ny4wLmJi
CkBAIC00LDcgKzQsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL3d3dy5raHJvbm9zLm9yZy9yZWdp
c3RyeS9zcGlyLXYiCiBMSUNFTlNFID0gIkNDLUJZLTQuMCBBTkQgTUlUIgogTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YTBkY2FhNTEyY2MyZGVlOTVmZTBmZDc5MWVlODNh
MTgiCiAKLVNSQ1JFViA9ICJhZDkxODRlNzZhNjZiMTAwMWMyOWRiOWIwYTNlODdmNjQ2YzY0ZGUw
IgorU1JDUkVWID0gIjI5OTgxZjY1MjQxNjA1ZTA4YjBlZGU0Y2ZlYjk5OWZlM2I3MjNjNmEiCiBT
UkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1NQSVJWLUhlYWRlcnM7cHJv
dG9jb2w9aHR0cHM7YnJhbmNoPW1haW47dGFnPXZ1bGthbi1zZGstJHtQVn0iCiBQRSA9ICIxIgog
IyBUaGVzZSByZWNpcGVzIG5lZWQgdG8gYmUgdXBkYXRlZCBpbiBsb2Nrc3RlcCB3aXRoIGVhY2gg
b3RoZXI6Ci0tIAoyLjQ3LjEKCg==

--===============8833824254225544396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dev: FILELIST: added "/usr/include/spirv/unified1/extinst.arm.experimental-ml-operations.grammar.json /usr/include/spirv/unified1/extinst.nonsemantic.graph.debuginfo.grammar.json /usr/include/spirv/unified1/ArmExperimentalMLOperations.h /usr/include/spirv/unified1/NonSemanticGraphDebugInfo.h"
Changes to packages/x86-64-v3-poky-linux/spirv-headers (sysroot):
  /usr/include/spirv/unified1/ArmExperimentalMLOperations.h was added
  /usr/include/spirv/unified1/extinst.arm.experimental-ml-operations.grammar.json was added
  /usr/include/spirv/unified1/extinst.nonsemantic.graph.debuginfo.grammar.json was added
  /usr/include/spirv/unified1/NonSemanticGraphDebugInfo.h was added

--===============8833824254225544396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/spirv-headers: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/spirv-headers: SRC_URI changed from "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main;tag=vulkan-sdk-1.4.350.1" to "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main;tag=vulkan-sdk-1.4.357.0"
packages/x86-64-v3-poky-linux/spirv-headers: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dbg: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dbg: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dev: PKGSIZE changed from 3634800 to 3668443 (+1%)
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dev: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dev: FILELIST: added "/usr/include/spirv/unified1/extinst.arm.experimental-ml-operations.grammar.json /usr/include/spirv/unified1/ArmExperimentalMLOperations.h /usr/include/spirv/unified1/NonSemanticGraphDebugInfo.h /usr/include/spirv/unified1/extinst.nonsemantic.graph.debuginfo.grammar.json"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dev: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-doc: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-doc: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-locale: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-locale: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-src: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-src: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-staticdev: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-staticdev: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
Changes to packages/x86-64-v3-poky-linux/spirv-headers (sysroot):
  /usr/include/spirv/unified1/ArmExperimentalMLOperations.h was added
  /usr/include/spirv/unified1/extinst.arm.experimental-ml-operations.grammar.json was added
  /usr/include/spirv/unified1/extinst.nonsemantic.graph.debuginfo.grammar.json was added
  /usr/include/spirv/unified1/NonSemanticGraphDebugInfo.h was added

--===============8833824254225544396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="spirv-headers-changelog.txt"

Changelog for spirv-headers: 1.4.350.1 -> 1.4.357.0

29981f6 Fix Int64ImageEXT capability prerequisite to Int64 (#611)
0312729 Implement Samsung Intrinsic decoration (#597)
02c0394 Bump actions/checkout from 6 to 7 in the github-actions group (#612)
8d56066 SPV_QCOM_image_processing3 (#596)
b3cabdd SPV_QCOM_multiple_wait_queues (#595)
575b651 Add SPV_EXT_ocp_microscaling_types (#613)
daa093d chore: Add CONTRIBUTING file (#608)
ed73438 license: Add or update REUSE compliance (#609)
c63848e added source language entry ApilaJai (#607)
1e770e7 Add Pred as a new SPIR-V source language (#606)
8c5559c Add ArmExperimentalMLOperations instruction set (#602)
aaffbc5 SPV_NV_cooperative_matrix_decode_vector (#601)
fe44b20 SPV_EXT_split_barrier (#600)
82dfca3 Revert "Add SPV_MESA_fragment_coverage_mask enumerants (#580)" (#598)
3541d11 Add NonSemanticGraphDebugInfo instruction set (#591)
62d3e83 Add SPV_KHR_opacity_micromap (#599)
5c50cbd Add SPV_AMD_weak_linkage extension (#583)
98c842b Fix OpReadPipeBlockingINTEL/OpWritePipeBlockingINTEL operands (#588)
58006c9 Reserve ImageOperand 17 for Google (#589)
1f2dd16 Update spirv.core.grammar.json revision (#593)
1260380 Fix OpCompositeConstructContinuedINTEL operands (#587)
53b334f Reserve some tokens for Samsung (#586)
1a22b16 Update headers for spirv issue 373 (#584)
157de8e Add SPV_MESA_fragment_coverage_mask enumerants (#580)
948a3b0 header updates for SPV_INTEL_rounded_divide_sqrt (#582)
b8a3296 grammar and header changes for SPV_INTEL_predicated_io (#585)

--===============8833824254225544396==--

