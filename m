Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CE3C35FF6
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:38 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.7172.1740828326819850408
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=RInxBuFe;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Y7cUJWjh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019551745b50-2586d6e4-512a-4ee0-a911-69838d53d2a7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bMgbB685jJuF1Tf2G/pirVN8a2pbrDoaQAq5SJw6AxA=;
	b=RInxBuFexi68+a9urrQnkpCpYL4DmHshzB1Eu36d3BWAL/jqdXiZt2ZPF4RXANu6
	QPSO/D4pkjgusXZ0X0YYzxAv1wqvKUtsLheAFa12iP/I8MjPwr1Au0lsOZqTMzGVBaz
	a1+8Gg0XfkY5UgtpqAX17HruTN6ppE99uM7vFa90=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bMgbB685jJuF1Tf2G/pirVN8a2pbrDoaQAq5SJw6AxA=;
	b=Y7cUJWjhYsg1VxKqC4ir+DBvXKZdUCiQs9lGuuasTcMo019Di8+aOsVXuZuk9bcn
	9cUb5ungnVa2T0GLfAw82SR5QrtXp/hayBhQn6IBvGMsNqqE4WKA9ZUNH7LIWDuoINc
	Q93Zn0igu+pz/ATNiF1NknmDJsJgv2gdDdG8tyr8=
Content-Type: multipart/mixed; boundary="===============7176099915575765236=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-headers: upgrading to 1.4.304.1 SUCCEEDED
Message-ID: <0101019551745b50-2586d6e4-512a-4ee0-a911-69838d53d2a7-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212157

--===============7176099915575765236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-headers* to *1.4.304.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-headers-upgrade-1.3.296.0-1.4.304.1.patch
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
From 1194503518195df828d30bc8c875a4283892ce65 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 10:07:42 +0000
Subject: [PATCH] spirv-headers: upgrade 1.3.296.0 -> 1.4.304.1

---
 .../{spirv-headers_1.3.296.0.bb => spirv-headers_1.4.304.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.296.0.bb => spirv-headers_1.4.304.1.bb} (93%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.296.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.304.1.bb
similarity index 93%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.296.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.4.304.1.bb
index bf7190379d..a4d947ff54 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.296.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.4.304.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d14ee3b13f42e9c9674acc5925c3d741"
 
-SRCREV = "2a9b6f951c7d6b04b6c21fe1bf3f475b68b84801"
+SRCREV = "3f17b2af6784bfa2c5aa5dbb8e0e74a607dd8b3b"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
-- 
2.44.1


--===============7176099915575765236==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-headers-upgrade-1.3.296.0-1.4.304.1.patch"

RnJvbSAxMTk0NTAzNTE4MTk1ZGY4MjhkMzBiYzhjODc1YTQyODM4OTJjZTY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAxMDowNzo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNw
aXJ2LWhlYWRlcnM6IHVwZ3JhZGUgMS4zLjI5Ni4wIC0+IDEuNC4zMDQuMQoKLS0tCiAuLi4ve3Nw
aXJ2LWhlYWRlcnNfMS4zLjI5Ni4wLmJiID0+IHNwaXJ2LWhlYWRlcnNfMS40LjMwNC4xLmJifSAg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci97c3BpcnYtaGVhZGVyc18xLjMuMjk2LjAu
YmIgPT4gc3BpcnYtaGVhZGVyc18xLjQuMzA0LjEuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18xLjMuMjk2LjAuYmIgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1oZWFkZXJzXzEuNC4zMDQuMS5iYgpzaW1pbGFy
aXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGly
di1oZWFkZXJzXzEuMy4yOTYuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Nw
aXIvc3BpcnYtaGVhZGVyc18xLjQuMzA0LjEuYmIKaW5kZXggYmY3MTkwMzc5ZC4uYTRkOTQ3ZmY1
NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18x
LjMuMjk2LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVy
c18xLjQuMzA0LjEuYmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vd3d3Lmto
cm9ub3Mub3JnL3JlZ2lzdHJ5L3NwaXItdiIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZDE0ZWUzYjEzZjQyZTljOTY3NGFjYzU5MjVjM2Q3
NDEiCiAKLVNSQ1JFViA9ICIyYTliNmY5NTFjN2Q2YjA0YjZjMjFmZTFiZjNmNDc1YjY4Yjg0ODAx
IgorU1JDUkVWID0gIjNmMTdiMmFmNjc4NGJmYTJjNWFhNWRiYjhlMGU3NGE2MDdkZDhiM2IiCiBT
UkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1NQSVJWLUhlYWRlcnM7cHJv
dG9jb2w9aHR0cHM7YnJhbmNoPW1haW4iCiBQRSA9ICIxIgogIyBUaGVzZSByZWNpcGVzIG5lZWQg
dG8gYmUgdXBkYXRlZCBpbiBsb2Nrc3RlcCB3aXRoIGVhY2ggb3RoZXI6Ci0tIAoyLjQ0LjEKCg==

--===============7176099915575765236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/spirv-headers: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/spirv-headers: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dbg: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dbg: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dev: PKGSIZE changed from 3308184 to 3349995 (+1%)
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dev: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dev: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-doc: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-doc: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-locale: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-locale: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-src: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-src: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-staticdev: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-staticdev: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/spirv-headers/spirv-headers: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]

--===============7176099915575765236==--

