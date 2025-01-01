Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64772C02193
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:36 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.11490.1735723940591369071
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=L57tcERa;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=fCOxGM1c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101942135b1f1-9180a438-97f8-423b-a2cf-f9c5f2091b6a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723954;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=T9jE8k8rtadigaYEiSgqARacyEkJXkLSookmsvdPU70=;
	b=L57tcERaDniPEyVd4p0L5N6JpZ4SiYhBiD0iBfcPqW0kW/+2rSfTcoo6uj2u0YcV
	MudEJiRn7avdsbNLMy6fhu1LIlctait5vw4xMUD5e76V90Gu47YPMfBTNuWxddjXJWT
	fORLifBk+vcJ4moE6kLhxBchcn9OSPbhzfTDSEQw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723954;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=T9jE8k8rtadigaYEiSgqARacyEkJXkLSookmsvdPU70=;
	b=fCOxGM1csOWXS6YAfDtZ+sVgqf/LG2CCxnMFR//3K+XjuXfe/ajlYw7UWNKQ2x7o
	48MukBDyasIpsFJ523U245lxjmkvR/Oudffr2UoeDy/XfAKM9BONtBk7aoOzR+2/rAB
	3NPleYwJQ/nkLXTbBaRKMA6gjQZ6DO0E9pFYZR9I=
Content-Type: multipart/mixed; boundary="===============3555610790634138800=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] debianutils: upgrading to 5.21 SUCCEEDED
Message-ID: <010101942135b1f1-9180a438-97f8-423b-a2cf-f9c5f2091b6a-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209240

--===============3555610790634138800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *debianutils* to *5.21* has Succeeded.

Next steps:
    - apply the patch: git am 0001-debianutils-upgrade-5.20-5.21.patch
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
From 332c87f25ce5a9b67970af4c89faec0222bc46bf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jan 2025 09:02:05 +0000
Subject: [PATCH] debianutils: upgrade 5.20 -> 5.21

---
 .../debianutils/{debianutils_5.20.bb => debianutils_5.21.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.20.bb => debianutils_5.21.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.20.bb b/meta/recipes-support/debianutils/debianutils_5.21.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.20.bb
rename to meta/recipes-support/debianutils/debianutils_5.21.bb
index 61438121da..e0485b24a3 100644
--- a/meta/recipes-support/debianutils/debianutils_5.20.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.21.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
            "
 
-SRCREV = "9f3d6fa6b8d91849a78d681294fa8ea7bfa9086f"
+SRCREV = "ae002b498f2e310c934a0b3f0992e83391f108c7"
 
 inherit autotools update-alternatives
 
-- 
2.44.1


--===============3555610790634138800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/debianutils/debianutils-dbg: PKGSIZE changed from 74416 to 78064 (+5%)
packages/core2-64-poky-linux/debianutils/debianutils-dbg: PV changed from "5.20" to "5.21"
packages/core2-64-poky-linux/debianutils/debianutils-dbg: PKGV changed from 5.20 [default] to 5.21 [default]
packages/core2-64-poky-linux/debianutils/debianutils-dev: PV changed from "5.20" to "5.21"
packages/core2-64-poky-linux/debianutils/debianutils-dev: PKGV changed from 5.20 [default] to 5.21 [default]
packages/core2-64-poky-linux/debianutils/debianutils-doc: PKGSIZE changed from 13622 to 14141 (+4%)
packages/core2-64-poky-linux/debianutils/debianutils-doc: PV changed from "5.20" to "5.21"
packages/core2-64-poky-linux/debianutils/debianutils-doc: PKGV changed from 5.20 [default] to 5.21 [default]
packages/core2-64-poky-linux/debianutils/debianutils-locale: PV changed from "5.20" to "5.21"
packages/core2-64-poky-linux/debianutils/debianutils-locale: PKGV changed from 5.20 [default] to 5.21 [default]
packages/core2-64-poky-linux/debianutils/debianutils-run-parts: PV changed from "5.20" to "5.21"
packages/core2-64-poky-linux/debianutils/debianutils-run-parts: PKGV changed from 5.20 [default] to 5.21 [default]
packages/core2-64-poky-linux/debianutils/debianutils-src: PKGSIZE changed from 30127 to 33339 (+11%)
packages/core2-64-poky-linux/debianutils/debianutils-src: PV changed from "5.20" to "5.21"
packages/core2-64-poky-linux/debianutils/debianutils-src: PKGV changed from 5.20 [default] to 5.21 [default]
packages/core2-64-poky-linux/debianutils/debianutils-staticdev: PV changed from "5.20" to "5.21"
packages/core2-64-poky-linux/debianutils/debianutils-staticdev: PKGV changed from 5.20 [default] to 5.21 [default]
packages/core2-64-poky-linux/debianutils/debianutils: PV changed from "5.20" to "5.21"
packages/core2-64-poky-linux/debianutils/debianutils: PKGV changed from 5.20 [default] to 5.21 [default]
packages/core2-64-poky-linux/debianutils: PV changed from "5.20" to "5.21"
packages/core2-64-poky-linux/debianutils: PKGV changed from 5.20 [default] to 5.21 [default]

--===============3555610790634138800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/debianutils/debianutils-src: PKGSIZE changed from 30127 to 33339 (+11%)

--===============3555610790634138800==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-debianutils-upgrade-5.20-5.21.patch"

RnJvbSAzMzJjODdmMjVjZTVhOWI2Nzk3MGFmNGM4OWZhZWMwMjIyYmM0NmJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKYW4gMjAyNSAwOTowMjowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRl
YmlhbnV0aWxzOiB1cGdyYWRlIDUuMjAgLT4gNS4yMQoKLS0tCiAuLi4vZGViaWFudXRpbHMve2Rl
YmlhbnV0aWxzXzUuMjAuYmIgPT4gZGViaWFudXRpbHNfNS4yMS5iYn0gICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy97ZGViaWFudXRpbHNfNS4yMC5iYiA9PiBkZWJpYW51
dGlsc181LjIxLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Rl
YmlhbnV0aWxzL2RlYmlhbnV0aWxzXzUuMjAuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kZWJp
YW51dGlscy9kZWJpYW51dGlsc181LjIxLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2RlYmlhbnV0aWxzL2RlYmlhbnV0aWxzXzUuMjAuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2RlYmlhbnV0aWxzL2RlYmlhbnV0aWxzXzUu
MjEuYmIKaW5kZXggNjE0MzgxMjFkYS4uZTA0ODViMjRhMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGViaWFudXRpbHMvZGViaWFudXRpbHNfNS4yMC5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy9kZWJpYW51dGlsc181LjIxLmJiCkBAIC0xMSw3ICsx
MSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL2RlYmlhbi9jb3B5cmlnaHQ7bWQ1PTRi
NjY3ZjMwNDExZDIxYmM4ZmQ3ZGI4NWQ1MDJhOGU5CiBTUkNfVVJJID0gImdpdDovL3NhbHNhLmRl
Ymlhbi5vcmcvZGViaWFuL2RlYmlhbnV0aWxzLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFz
dGVyIFwKICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAiOWYzZDZmYTZiOGQ5MTg0OWE3OGQ2ODEy
OTRmYThlYTdiZmE5MDg2ZiIKK1NSQ1JFViA9ICJhZTAwMmI0OThmMmUzMTBjOTM0YTBiM2YwOTky
ZTgzMzkxZjEwOGM3IgogCiBpbmhlcml0IGF1dG90b29scyB1cGRhdGUtYWx0ZXJuYXRpdmVzCiAK
LS0gCjIuNDQuMQoK

--===============3555610790634138800==--

