Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 446D7C07CA9
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 16:02:07 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.10771.1688227323990159839
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jul 2023 09:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FnxUcG6C;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018912309ddb-68821865-2c04-4695-a842-33d531768dbf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1688227323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aGLwsrRRY0xDhi8wI6Udc75Gu9VUOamW1J52wPGwC+E=;
	b=FnxUcG6CuNPk592jdj+YmCaSeWHPmHgRQEH2d9X2yVhMxxQwnuBPyxO7M8sherVq
	nHRyTfeud8C+JCMnq6Bf9/OOaNgmJmz6l5AjhBmj8B+9LmQPxLdo9j4svu7UB6zBS2O
	gxxDKyjvFDJmksqx1VpzKryaXzs8egB+V6Y1H/+k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1688227323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aGLwsrRRY0xDhi8wI6Udc75Gu9VUOamW1J52wPGwC+E=;
	b=YyUaVY/V9J7OVCAdzrvhS0MLLyMNjB7e3apDSkfYyPN9heHGSUWTjbEsQAmBw/ob
	2pIc9xwE468Qc2pkAcbPAXMOROe+gdzNcv9EvUNIl6DontWHAFiSTbXPgycabZ6EZSa
	PSsNAovyTuJVKkEnzsdSMzczJ1BGwzClGmYGKR0A=
Content-Type: multipart/mixed; boundary="===============4437464974840371332=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-headers: upgrading to 1.3.250.1 SUCCEEDED
Message-ID: <0101018912309ddb-68821865-2c04-4695-a842-33d531768dbf-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jul 2023 16:02:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jul 2023 16:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183747

--===============4437464974840371332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *spirv-headers* to *1.3.250.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-headers-upgrade-1.3.250.0-1.3.250.1.patch
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
From ad8c6b501b8bd4ce6f7dcff8675da9eec1058bf9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jul 2023 12:56:20 +0000
Subject: [PATCH] spirv-headers: upgrade 1.3.250.0 -> 1.3.250.1

---
 .../{spirv-headers_1.3.250.0.bb => spirv-headers_1.3.250.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.250.0.bb => spirv-headers_1.3.250.1.bb} (92%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.250.1.bb
similarity index 92%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.250.1.bb
index d0a2e2e991..3215cfd4f2 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.250.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
-SRCREV = "268a061764ee69f09a477a695bf6a11ffe311b8d"
+SRCREV = "3469b164e25cee24435029a569933cb42578db5d"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
-- 
2.39.2


--===============4437464974840371332==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-headers-upgrade-1.3.250.0-1.3.250.1.patch"

RnJvbSBhZDhjNmI1MDFiOGJkNGNlNmY3ZGNmZjg2NzVkYTllZWMxMDU4YmY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdWwgMjAyMyAxMjo1NjoyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNw
aXJ2LWhlYWRlcnM6IHVwZ3JhZGUgMS4zLjI1MC4wIC0+IDEuMy4yNTAuMQoKLS0tCiAuLi4ve3Nw
aXJ2LWhlYWRlcnNfMS4zLjI1MC4wLmJiID0+IHNwaXJ2LWhlYWRlcnNfMS4zLjI1MC4xLmJifSAg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci97c3BpcnYtaGVhZGVyc18xLjMuMjUwLjAu
YmIgPT4gc3BpcnYtaGVhZGVyc18xLjMuMjUwLjEuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18xLjMuMjUwLjAuYmIgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1oZWFkZXJzXzEuMy4yNTAuMS5iYgpzaW1pbGFy
aXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGly
di1oZWFkZXJzXzEuMy4yNTAuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Nw
aXIvc3BpcnYtaGVhZGVyc18xLjMuMjUwLjEuYmIKaW5kZXggZDBhMmUyZTk5MS4uMzIxNWNmZDRm
MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18x
LjMuMjUwLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVy
c18xLjMuMjUwLjEuYmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vd3d3Lmto
cm9ub3Mub3JnL3JlZ2lzdHJ5L3NwaXItdiIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YzkzOGI4NWJjZWI4ZmIyNmMxYTgwN2YyOGE1MmFl
MmQiCiAKLVNSQ1JFViA9ICIyNjhhMDYxNzY0ZWU2OWYwOWE0NzdhNjk1YmY2YTExZmZlMzExYjhk
IgorU1JDUkVWID0gIjM0NjliMTY0ZTI1Y2VlMjQ0MzUwMjlhNTY5OTMzY2I0MjU3OGRiNWQiCiBT
UkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1NQSVJWLUhlYWRlcnM7cHJv
dG9jb2w9aHR0cHM7YnJhbmNoPW1haW4iCiBQRSA9ICIxIgogIyBUaGVzZSByZWNpcGVzIG5lZWQg
dG8gYmUgdXBkYXRlZCBpbiBsb2Nrc3RlcCB3aXRoIGVhY2ggb3RoZXI6Ci0tIAoyLjM5LjIKCg==

--===============4437464974840371332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/spirv-headers: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-headers: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dbg: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dbg: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PKGSIZE changed from 2828577 to 2849304 (+1%)
packages/core2-32-poky-linux/spirv-headers/spirv-headers-doc: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-doc: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-locale: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-locale: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-src: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-src: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-staticdev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-staticdev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]

--===============4437464974840371332==--

