Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0CAC54799
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:13 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.75746.1722536825440412903
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VF2KY8GH;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=qRCOpyo8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101910f322f52-0368ef7b-023e-4d2b-9bba-69fa4012d268-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536832;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q78UW+U/SvGLjyuti8Xwp9KP90rxm16A7jdTx5oeb+c=;
	b=VF2KY8GHPkeEDf5mS/YaYIT/FY8rH/UvZwgwqGrIBZi15QM7sG2+X1qz181dQinh
	L3MChab2uX/uToui4Gh2nHdn4Y4Cak1uKqXhxtfjnP8yAhUiCZw3v6r5hf9b48SW/dm
	KYxI/OZ9+Zlh8RBvbVhhg6pcVne25gcbLaUSF/qg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536832;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q78UW+U/SvGLjyuti8Xwp9KP90rxm16A7jdTx5oeb+c=;
	b=qRCOpyo8rRb7AUJrEKmBmRpybahYOx9qLM7RVbPF3hiUp6Jw3khh3z60CNxWn+Ea
	hTrwivgLsUuQG8RrGJGmjZYXAvNFyLyhGZwgdlRrtH9PRJz7lmncmy4itLwhbq9LgvW
	7koH3gw3j/RJjLo9ksgSMNQfwSNygkxOzGPFt54Q=
Content-Type: multipart/mixed; boundary="===============1750685656518729070=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-headers: upgrading to 1.3.290.0 SUCCEEDED
Message-ID: <010101910f322f52-0368ef7b-023e-4d2b-9bba-69fa4012d268-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202846

--===============1750685656518729070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-headers* to *1.3.290.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-headers-upgrade-1.3.283.0-1.3.290.0.patch
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
From ae4cd74a113a25723b4ba3315e0f21fadc7e2573 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 14:07:57 +0000
Subject: [PATCH] spirv-headers: upgrade 1.3.283.0 -> 1.3.290.0

---
 .../{spirv-headers_1.3.283.0.bb => spirv-headers_1.3.290.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.283.0.bb => spirv-headers_1.3.290.0.bb} (93%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.283.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.290.0.bb
similarity index 93%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.283.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.290.0.bb
index 5ec7e42b7c..30280a5b5e 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.283.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.290.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d14ee3b13f42e9c9674acc5925c3d741"
 
-SRCREV = "4f7b471f1a66b6d06462cd4ba57628cc0cd087d7"
+SRCREV = "2acb319af38d43be3ea76bfabf3998e5281d8d12"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
-- 
2.44.0


--===============1750685656518729070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/spirv-headers/spirv-headers-dev: PKGSIZE changed from 2943241 to 3283078 (+12%)

--===============1750685656518729070==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-headers-upgrade-1.3.283.0-1.3.290.0.patch"

RnJvbSBhZTRjZDc0YTExM2EyNTcyM2I0YmEzMzE1ZTBmMjFmYWRjN2UyNTczIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxNDowNzo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNw
aXJ2LWhlYWRlcnM6IHVwZ3JhZGUgMS4zLjI4My4wIC0+IDEuMy4yOTAuMAoKLS0tCiAuLi4ve3Nw
aXJ2LWhlYWRlcnNfMS4zLjI4My4wLmJiID0+IHNwaXJ2LWhlYWRlcnNfMS4zLjI5MC4wLmJifSAg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci97c3BpcnYtaGVhZGVyc18xLjMuMjgzLjAu
YmIgPT4gc3BpcnYtaGVhZGVyc18xLjMuMjkwLjAuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18xLjMuMjgzLjAuYmIgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1oZWFkZXJzXzEuMy4yOTAuMC5iYgpzaW1pbGFy
aXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGly
di1oZWFkZXJzXzEuMy4yODMuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Nw
aXIvc3BpcnYtaGVhZGVyc18xLjMuMjkwLjAuYmIKaW5kZXggNWVjN2U0MmI3Yy4uMzAyODBhNWI1
ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18x
LjMuMjgzLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVy
c18xLjMuMjkwLjAuYmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vd3d3Lmto
cm9ub3Mub3JnL3JlZ2lzdHJ5L3NwaXItdiIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZDE0ZWUzYjEzZjQyZTljOTY3NGFjYzU5MjVjM2Q3
NDEiCiAKLVNSQ1JFViA9ICI0ZjdiNDcxZjFhNjZiNmQwNjQ2MmNkNGJhNTc2MjhjYzBjZDA4N2Q3
IgorU1JDUkVWID0gIjJhY2IzMTlhZjM4ZDQzYmUzZWE3NmJmYWJmMzk5OGU1MjgxZDhkMTIiCiBT
UkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1NQSVJWLUhlYWRlcnM7cHJv
dG9jb2w9aHR0cHM7YnJhbmNoPW1haW4iCiBQRSA9ICIxIgogIyBUaGVzZSByZWNpcGVzIG5lZWQg
dG8gYmUgdXBkYXRlZCBpbiBsb2Nrc3RlcCB3aXRoIGVhY2ggb3RoZXI6Ci0tIAoyLjQ0LjAKCg==

--===============1750685656518729070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/spirv-headers: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/spirv-headers: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dbg: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dbg: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dev: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dev: PKGSIZE changed from 2943241 to 3283078 (+12%)
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dev: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-doc: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-doc: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-locale: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-locale: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-src: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-src: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-staticdev: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-staticdev: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]

--===============1750685656518729070==--

