Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F63C0018A
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:13 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.8639.1698848702607659161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dTZCRmj/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Vubf4hEU;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.31, mailfrom: 0101018b8b460c11-420a614c-f0fd-4fab-9869-abc0b1c5b6df-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=o0ApfxFlgFNIqKTM2T6+VvqVQ+ZcogusRcdSmohiu4E=;
	b=dTZCRmj/tEdtJperNzv/OHbSjlxnzbccn0Nb2IttVMno/JEM4XRMvJat1l8aKbkH
	OkrmaqIPxveQjfcYurl60bFyBOx/youlHiCBWs64Hcc/QcefjD28AKrrGPby7jNDcLE
	5G+PjWZJpnQznIpGQEnGVkyH3IZVy120PgAmQoNE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=o0ApfxFlgFNIqKTM2T6+VvqVQ+ZcogusRcdSmohiu4E=;
	b=Vubf4hEUbLmQGM8TB00PKGx37o1o6Rx6OLbrXrm+Tv7WyaUyShezmlIy5Xqe5/J4
	EkYdqqzvaWEDMQCPv68XpDuyvIqMeCbsFjpgHwKr17MhpZ9Oqpp7dieVEpRK7w5TuBb
	9Cj/bRnYfyMcsasl5+Na6l2OGZesuXe3y7NQGEzw=
Content-Type: multipart/mixed; boundary="===============0608108057971028345=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-headers: upgrading to 1.3.268.0 SUCCEEDED
Message-ID: <0101018b8b460c11-420a614c-f0fd-4fab-9869-abc0b1c5b6df-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189989

--===============0608108057971028345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *spirv-headers* to *1.3.268.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-headers-upgrade-1.3.261.1-1.3.268.0.patch
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
From 5c4ff96c5906626cc00ba897ca99a4ef50feed7f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 13:01:08 +0000
Subject: [PATCH] spirv-headers: upgrade 1.3.261.1 -> 1.3.268.0

---
 .../{spirv-headers_1.3.261.1.bb => spirv-headers_1.3.268.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.261.1.bb => spirv-headers_1.3.268.0.bb} (92%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.261.1.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.268.0.bb
similarity index 92%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.261.1.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.268.0.bb
index 945f0879f5..c70845788e 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.261.1.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.268.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
-SRCREV = "124a9665e464ef98b8b718d572d5f329311061eb"
+SRCREV = "e867c06631767a2d96424cbec530f9ee5e78180f"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
-- 
2.39.2


--===============0608108057971028345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/spirv-headers: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/spirv-headers: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dbg: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dbg: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dev: PKGSIZE changed from 2851522 to 2902543 (+2%)
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dev: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dev: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-doc: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-doc: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-locale: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-locale: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-src: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-src: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-staticdev: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-staticdev: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers: PV changed from "1.3.261.1" to "1.3.268.0"

--===============0608108057971028345==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-headers-upgrade-1.3.261.1-1.3.268.0.patch"

RnJvbSA1YzRmZjk2YzU5MDY2MjZjYzAwYmE4OTdjYTk5YTRlZjUwZmVlZDdmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMzowMTowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNw
aXJ2LWhlYWRlcnM6IHVwZ3JhZGUgMS4zLjI2MS4xIC0+IDEuMy4yNjguMAoKLS0tCiAuLi4ve3Nw
aXJ2LWhlYWRlcnNfMS4zLjI2MS4xLmJiID0+IHNwaXJ2LWhlYWRlcnNfMS4zLjI2OC4wLmJifSAg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci97c3BpcnYtaGVhZGVyc18xLjMuMjYxLjEu
YmIgPT4gc3BpcnYtaGVhZGVyc18xLjMuMjY4LjAuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18xLjMuMjYxLjEuYmIgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1oZWFkZXJzXzEuMy4yNjguMC5iYgpzaW1pbGFy
aXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGly
di1oZWFkZXJzXzEuMy4yNjEuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Nw
aXIvc3BpcnYtaGVhZGVyc18xLjMuMjY4LjAuYmIKaW5kZXggOTQ1ZjA4NzlmNS4uYzcwODQ1Nzg4
ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18x
LjMuMjYxLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVy
c18xLjMuMjY4LjAuYmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vd3d3Lmto
cm9ub3Mub3JnL3JlZ2lzdHJ5L3NwaXItdiIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YzkzOGI4NWJjZWI4ZmIyNmMxYTgwN2YyOGE1MmFl
MmQiCiAKLVNSQ1JFViA9ICIxMjRhOTY2NWU0NjRlZjk4YjhiNzE4ZDU3MmQ1ZjMyOTMxMTA2MWVi
IgorU1JDUkVWID0gImU4NjdjMDY2MzE3NjdhMmQ5NjQyNGNiZWM1MzBmOWVlNWU3ODE4MGYiCiBT
UkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1NQSVJWLUhlYWRlcnM7cHJv
dG9jb2w9aHR0cHM7YnJhbmNoPW1haW4iCiBQRSA9ICIxIgogIyBUaGVzZSByZWNpcGVzIG5lZWQg
dG8gYmUgdXBkYXRlZCBpbiBsb2Nrc3RlcCB3aXRoIGVhY2ggb3RoZXI6Ci0tIAoyLjM5LjIKCg==

--===============0608108057971028345==--

