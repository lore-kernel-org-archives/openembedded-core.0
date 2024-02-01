Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA40C54E63
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:19 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.2123.1706810407961070556
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fQLCI0ca;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=j2TqsIvP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018d65d3f7a1-ac0426d2-8383-4cb7-976c-2ab160b7c0aa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZE36tbECe4HvgwctgoqjSJpgyCH1dGAHFJfUTYlJTxY=;
	b=fQLCI0caHaVn9zNRh4grXU+PCKcSbcQJc36RyqP9WngkMTDhoGCDSAFAfRqXC2X5
	THPIeGmGxq48+endIYY+gzWjWCfKzDkMlUlqVQ5isF8EhchQMNW5mkHnVTUgWedIjs/
	MPAxmMgzjlfga6sefGKK7wBxJVmgiKTnMC1RFFbE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZE36tbECe4HvgwctgoqjSJpgyCH1dGAHFJfUTYlJTxY=;
	b=j2TqsIvPf4hLMZ+0Qk76+bDJR0C+qame8L0/vJyMj7tbErMQOi18MHShTiRm+bRg
	Tn3dGOl39e892iElkd13KO0GjIS2KemvgXC5C43i/qDK8owudS/xWGBz7L832umtnY9
	ccDWiNm5pG79+HnrCkmKS+Gr34KrVn2R1MRqqxPA=
Content-Type: multipart/mixed; boundary="===============2672020417549447177=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-headers: upgrading to 1.3.275.0 SUCCEEDED
Message-ID: <0101018d65d3f7a1-ac0426d2-8383-4cb7-976c-2ab160b7c0aa-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194695

--===============2672020417549447177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *spirv-headers* to *1.3.275.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-headers-upgrade-1.3.268.0-1.3.275.0.patch
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
From 6e711aa6dedc17cf1850bcf1682de81db98ac9bb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 13:20:19 +0000
Subject: [PATCH] spirv-headers: upgrade 1.3.268.0 -> 1.3.275.0

---
 .../{spirv-headers_1.3.268.0.bb => spirv-headers_1.3.275.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.268.0.bb => spirv-headers_1.3.275.0.bb} (93%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.268.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.275.0.bb
similarity index 93%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.268.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.275.0.bb
index 7045f70473..598a8fc209 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.268.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.275.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
-SRCREV = "e867c06631767a2d96424cbec530f9ee5e78180f"
+SRCREV = "1c6bb2743599e6eb6f37b2969acc0aef812e32e3"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
-- 
2.42.0


--===============2672020417549447177==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-headers-upgrade-1.3.268.0-1.3.275.0.patch"

RnJvbSA2ZTcxMWFhNmRlZGMxN2NmMTg1MGJjZjE2ODJkZTgxZGI5OGFjOWJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxMzoyMDoxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNw
aXJ2LWhlYWRlcnM6IHVwZ3JhZGUgMS4zLjI2OC4wIC0+IDEuMy4yNzUuMAoKLS0tCiAuLi4ve3Nw
aXJ2LWhlYWRlcnNfMS4zLjI2OC4wLmJiID0+IHNwaXJ2LWhlYWRlcnNfMS4zLjI3NS4wLmJifSAg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci97c3BpcnYtaGVhZGVyc18xLjMuMjY4LjAu
YmIgPT4gc3BpcnYtaGVhZGVyc18xLjMuMjc1LjAuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18xLjMuMjY4LjAuYmIgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1oZWFkZXJzXzEuMy4yNzUuMC5iYgpzaW1pbGFy
aXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGly
di1oZWFkZXJzXzEuMy4yNjguMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Nw
aXIvc3BpcnYtaGVhZGVyc18xLjMuMjc1LjAuYmIKaW5kZXggNzA0NWY3MDQ3My4uNTk4YThmYzIw
OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18x
LjMuMjY4LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVy
c18xLjMuMjc1LjAuYmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vd3d3Lmto
cm9ub3Mub3JnL3JlZ2lzdHJ5L3NwaXItdiIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YzkzOGI4NWJjZWI4ZmIyNmMxYTgwN2YyOGE1MmFl
MmQiCiAKLVNSQ1JFViA9ICJlODY3YzA2NjMxNzY3YTJkOTY0MjRjYmVjNTMwZjllZTVlNzgxODBm
IgorU1JDUkVWID0gIjFjNmJiMjc0MzU5OWU2ZWI2ZjM3YjI5NjlhY2MwYWVmODEyZTMyZTMiCiBT
UkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1NQSVJWLUhlYWRlcnM7cHJv
dG9jb2w9aHR0cHM7YnJhbmNoPW1haW4iCiBQRSA9ICIxIgogIyBUaGVzZSByZWNpcGVzIG5lZWQg
dG8gYmUgdXBkYXRlZCBpbiBsb2Nrc3RlcCB3aXRoIGVhY2ggb3RoZXI6Ci0tIAoyLjQyLjAKCg==

--===============2672020417549447177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/spirv-headers: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/spirv-headers: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dbg: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dbg: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dev: PKGSIZE changed from 2902543 to 2907497 (+0%)
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dev: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dev: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-doc: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-doc: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-locale: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-locale: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-src: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-src: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-staticdev: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-staticdev: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers: PV changed from "1.3.268.0" to "1.3.275.0"

--===============2672020417549447177==--

