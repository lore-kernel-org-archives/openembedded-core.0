Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58463CCF983
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:26 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.5675.1693650553030104846
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Fu8Eta2D;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=i73Qyn2w;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018a5570939a-838a411a-4cc8-4006-b041-3b4d04e05062-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wf2bBbIdYBB2rSIEQ12DhhYNSJ9M+vOkUXtL36TYkog=;
	b=Fu8Eta2DIp2fPCXmzTd5YVowyV1thm8AAuRYiMplw5EMetYCxVOzSv0QF7MUeF+e
	h6QZD5NxiLpxaLQucaLq3bfDJoIFYhxkXTMIER4jtEoSB+Aco/v+66OxiYSzduFJX5r
	veWJLqqM4PXQRa1TCR+ukNZPZE1lfB5a7WXDhvMw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wf2bBbIdYBB2rSIEQ12DhhYNSJ9M+vOkUXtL36TYkog=;
	b=i73Qyn2wQKle1M3uhBIccutuN6agl5b0KwsKQO1BJtGAx3yxc5/0Iqpsm4aoOWuI
	0WzyvxVla98cwSEh3mKKW5wfOieWy/GCHWrJHuk59JSTXsgSm5/qvOw0383c0uIaOxF
	tzKhx3SRr4JZwfsWrjvQxx+X9na+KUWZ5/tf7Le8=
Content-Type: multipart/mixed; boundary="===============0364890461140600959=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] debianutils: upgrading to 5.11 SUCCEEDED
Message-ID: <0101018a5570939a-838a411a-4cc8-4006-b041-3b4d04e05062-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187132

--===============0364890461140600959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *debianutils* to *5.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-debianutils-upgrade-5.8-5.11.patch
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
From e25e30df2f370a45336da568bd00a2e7cb40cc67 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 2 Sep 2023 06:44:16 +0000
Subject: [PATCH] debianutils: upgrade 5.8 -> 5.11

---
 .../debianutils/{debianutils_5.8.bb => debianutils_5.11.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.8.bb => debianutils_5.11.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.8.bb b/meta/recipes-support/debianutils/debianutils_5.11.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.8.bb
rename to meta/recipes-support/debianutils/debianutils_5.11.bb
index fb17d2d24f..1470910d90 100644
--- a/meta/recipes-support/debianutils/debianutils_5.8.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.11.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=74765f57ae5dd2b10ffbc39528d98753
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
            "
 
-SRCREV = "69116b856177ceb270908103b5776f897d2863c3"
+SRCREV = "fe24f3af6f1a6ae91f9bb6f5ef2558985a71b6ed"
 
 inherit autotools update-alternatives
 
-- 
2.39.2


--===============0364890461140600959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/debianutils/debianutils-dbg: PKGV changed from 5.8 [default] to 5.11 [default]
packages/core2-32-poky-linux/debianutils/debianutils-dbg: PKGSIZE changed from 68504 to 68512 (+0%)
packages/core2-32-poky-linux/debianutils/debianutils-dbg: PV changed from "5.8" to "5.11"
packages/core2-32-poky-linux/debianutils/debianutils-dev: PKGV changed from 5.8 [default] to 5.11 [default]
packages/core2-32-poky-linux/debianutils/debianutils-dev: PV changed from "5.8" to "5.11"
packages/core2-32-poky-linux/debianutils/debianutils-doc: PKGV changed from 5.8 [default] to 5.11 [default]
packages/core2-32-poky-linux/debianutils/debianutils-doc: PKGSIZE changed from 13725 to 13539 (-1%)
packages/core2-32-poky-linux/debianutils/debianutils-doc: PV changed from "5.8" to "5.11"
packages/core2-32-poky-linux/debianutils/debianutils-locale: PKGV changed from 5.8 [default] to 5.11 [default]
packages/core2-32-poky-linux/debianutils/debianutils-locale: PV changed from "5.8" to "5.11"
packages/core2-32-poky-linux/debianutils/debianutils-run-parts: PKGV changed from 5.8 [default] to 5.11 [default]
packages/core2-32-poky-linux/debianutils/debianutils-run-parts: PV changed from "5.8" to "5.11"
packages/core2-32-poky-linux/debianutils/debianutils-src: PKGV changed from 5.8 [default] to 5.11 [default]
packages/core2-32-poky-linux/debianutils/debianutils-src: PKGSIZE changed from 30105 to 30106 (+0%)
packages/core2-32-poky-linux/debianutils/debianutils-src: PV changed from "5.8" to "5.11"
packages/core2-32-poky-linux/debianutils/debianutils-staticdev: PKGV changed from 5.8 [default] to 5.11 [default]
packages/core2-32-poky-linux/debianutils/debianutils-staticdev: PV changed from "5.8" to "5.11"
packages/core2-32-poky-linux/debianutils/debianutils: PKGV changed from 5.8 [default] to 5.11 [default]
packages/core2-32-poky-linux/debianutils/debianutils: PV changed from "5.8" to "5.11"
packages/core2-32-poky-linux/debianutils: PKGV changed from 5.8 [default] to 5.11 [default]
packages/core2-32-poky-linux/debianutils: PV changed from "5.8" to "5.11"

--===============0364890461140600959==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-debianutils-upgrade-5.8-5.11.patch"

RnJvbSBlMjVlMzBkZjJmMzcwYTQ1MzM2ZGE1NjhiZDAwYTJlN2NiNDBjYzY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMiBTZXAgMjAyMyAwNjo0NDoxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRl
YmlhbnV0aWxzOiB1cGdyYWRlIDUuOCAtPiA1LjExCgotLS0KIC4uLi9kZWJpYW51dGlscy97ZGVi
aWFudXRpbHNfNS44LmJiID0+IGRlYmlhbnV0aWxzXzUuMTEuYmJ9ICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2RlYmlhbnV0aWxzL3tkZWJpYW51dGlsc181LjguYmIgPT4gZGViaWFudXRp
bHNfNS4xMS5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kZWJp
YW51dGlscy9kZWJpYW51dGlsc181LjguYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kZWJpYW51
dGlscy9kZWJpYW51dGlsc181LjExLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2RlYmlhbnV0aWxzL2RlYmlhbnV0aWxzXzUuOC5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGViaWFudXRpbHMvZGViaWFudXRpbHNfNS4xMS5i
YgppbmRleCBmYjE3ZDJkMjRmLi4xNDcwOTEwZDkwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9kZWJpYW51dGlscy9kZWJpYW51dGlsc181LjguYmIKKysrIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvZGViaWFudXRpbHMvZGViaWFudXRpbHNfNS4xMS5iYgpAQCAtMTEsNyArMTEsNyBA
QCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9kZWJpYW4vY29weXJpZ2h0O21kNT03NDc2NWY1
N2FlNWRkMmIxMGZmYmMzOTUyOGQ5ODc1MwogU1JDX1VSSSA9ICJnaXQ6Ly9zYWxzYS5kZWJpYW4u
b3JnL2RlYmlhbi9kZWJpYW51dGlscy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciBc
CiAgICAgICAgICAgICIKIAotU1JDUkVWID0gIjY5MTE2Yjg1NjE3N2NlYjI3MDkwODEwM2I1Nzc2
Zjg5N2QyODYzYzMiCitTUkNSRVYgPSAiZmUyNGYzYWY2ZjFhNmFlOTFmOWJiNmY1ZWYyNTU4OTg1
YTcxYjZlZCIKIAogaW5oZXJpdCBhdXRvdG9vbHMgdXBkYXRlLWFsdGVybmF0aXZlcwogCi0tIAoy
LjM5LjIKCg==

--===============0364890461140600959==--

