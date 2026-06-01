Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562BBCD98CB
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:51 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1569.1780328135766942518
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=m9bIGauR;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HuXLCTnt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019e83d3b184-0485cbf3-2b5e-4d85-8d19-9add18ac5ff8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328149;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nYBgblDA44qutjsT7E4m42FWzwC921cFlfkTkjNQiTM=;
	b=m9bIGauRwUg6NFe9tWiKoeMLvJzKh5AZnJD76JMiFAesXzp27uM2Qga0ED6sB1vT
	HYCeFvHNnPF/y1a0w7kMi86/y+QkHKqHNqFCg2hKSzJ2TTA5ffIsXPo7fMrdBVStH/w
	hiM1cRD8hjZ452nt/B8iJv/59WrijqSXzH1FJMZw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328149;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nYBgblDA44qutjsT7E4m42FWzwC921cFlfkTkjNQiTM=;
	b=HuXLCTntddbnabDXbwLM9fVcfg4rpWlDdT8TWTjz88wuu3kDeCQaGmF1LmTUHRS2
	JpAyr1A2kBXiTVyIDqeluPjUXfdQPL5C7AEOle0yO3/DfJ1jsalusrs4rdCPHZfmZcK
	YTeOnhwjYVqKx3rlhIs7Y61wK+KtLUkX3HX6rA3A=
Content-Type: multipart/mixed; boundary="===============7822040665109789740=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-headers: upgrading to 1.4.350.0 SUCCEEDED
Message-ID: <0101019e83d3b184-0485cbf3-2b5e-4d85-8d19-9add18ac5ff8-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237923

--===============7822040665109789740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-headers* to *1.4.350.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-headers-upgrade-1.4.341.0-1.4.350.0.patch
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
From 6c025ddffcb0f4d17e150e701b2a55d4a711e158 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 11:33:25 +0000
Subject: [PATCH] spirv-headers: upgrade 1.4.341.0 -> 1.4.350.0

---
 .../{spirv-headers_1.4.341.0.bb => spirv-headers_1.4.350.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.4.341.0.bb => spirv-headers_1.4.350.0.bb} (93%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.341.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.350.0.bb
similarity index 93%
rename from meta/recipes-graphics/spir/spirv-headers_1.4.341.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.4.350.0.bb
index 258ba11504..c4a7be4045 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.4.341.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.4.350.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT & CC-BY-4.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a0dcaa512cc2dee95fe0fd791ee83a18"
 
-SRCREV = "04f10f650d514df88b76d25e83db360142c7b174"
+SRCREV = "ad9184e76a66b1001c29db9b0a3e87f646c64de0"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main;tag=vulkan-sdk-${PV}"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
-- 
2.47.1


--===============7822040665109789740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dev: FILELIST: added "/usr/include/spirv/unified1/extinst.nonsemantic.shader.debuginfo.grammar.json /usr/include/spirv/unified1/NonSemanticShaderDebugInfo.h"
Changes to packages/x86-64-v3-poky-linux/spirv-headers (sysroot):
  /usr/include/spirv/unified1/extinst.nonsemantic.shader.debuginfo.grammar.json was added
  /usr/include/spirv/unified1/NonSemanticShaderDebugInfo.h was added

--===============7822040665109789740==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-headers-upgrade-1.4.341.0-1.4.350.0.patch"

RnJvbSA2YzAyNWRkZmZjYjBmNGQxN2UxNTBlNzAxYjJhNTVkNGE3MTFlMTU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxMTozMzoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNw
aXJ2LWhlYWRlcnM6IHVwZ3JhZGUgMS40LjM0MS4wIC0+IDEuNC4zNTAuMAoKLS0tCiAuLi4ve3Nw
aXJ2LWhlYWRlcnNfMS40LjM0MS4wLmJiID0+IHNwaXJ2LWhlYWRlcnNfMS40LjM1MC4wLmJifSAg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci97c3BpcnYtaGVhZGVyc18xLjQuMzQxLjAu
YmIgPT4gc3BpcnYtaGVhZGVyc18xLjQuMzUwLjAuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18xLjQuMzQxLjAuYmIgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1oZWFkZXJzXzEuNC4zNTAuMC5iYgpzaW1pbGFy
aXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGly
di1oZWFkZXJzXzEuNC4zNDEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Nw
aXIvc3BpcnYtaGVhZGVyc18xLjQuMzUwLjAuYmIKaW5kZXggMjU4YmExMTUwNC4uYzRhN2JlNDA0
NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18x
LjQuMzQxLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVy
c18xLjQuMzUwLjAuYmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vd3d3Lmto
cm9ub3Mub3JnL3JlZ2lzdHJ5L3NwaXItdiIKIExJQ0VOU0UgPSAiTUlUICYgQ0MtQlktNC4wIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YTBkY2FhNTEyY2MyZGVlOTVm
ZTBmZDc5MWVlODNhMTgiCiAKLVNSQ1JFViA9ICIwNGYxMGY2NTBkNTE0ZGY4OGI3NmQyNWU4M2Ri
MzYwMTQyYzdiMTc0IgorU1JDUkVWID0gImFkOTE4NGU3NmE2NmIxMDAxYzI5ZGI5YjBhM2U4N2Y2
NDZjNjRkZTAiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1NQSVJW
LUhlYWRlcnM7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW47dGFnPXZ1bGthbi1zZGstJHtQVn0i
CiBQRSA9ICIxIgogIyBUaGVzZSByZWNpcGVzIG5lZWQgdG8gYmUgdXBkYXRlZCBpbiBsb2Nrc3Rl
cCB3aXRoIGVhY2ggb3RoZXI6Ci0tIAoyLjQ3LjEKCg==

--===============7822040665109789740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/spirv-headers: SRC_URI changed from "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main;tag=vulkan-sdk-1.4.341.0" to "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main;tag=vulkan-sdk-1.4.350.0"
packages/x86-64-v3-poky-linux/spirv-headers: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/spirv-headers: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dbg: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dbg: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dev: FILELIST: added "/usr/include/spirv/unified1/NonSemanticShaderDebugInfo.h /usr/include/spirv/unified1/extinst.nonsemantic.shader.debuginfo.grammar.json"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dev: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dev: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dev: PKGSIZE changed from 3591544 to 3634800 (+1%)
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-doc: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-doc: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-locale: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-locale: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-src: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-src: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-staticdev: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-staticdev: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
Changes to packages/x86-64-v3-poky-linux/spirv-headers (sysroot):
  /usr/include/spirv/unified1/extinst.nonsemantic.shader.debuginfo.grammar.json was added
  /usr/include/spirv/unified1/NonSemanticShaderDebugInfo.h was added

--===============7822040665109789740==--

