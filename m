Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A293C3ABD2
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:34:09 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.1812.1746113623390356142
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VOXDcMLO;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=MohBtl1o;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101968c7bb331-70fd7adb-45b2-41f0-9a69-21c40b8183a3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113639;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=J3FaAcPp+KX690NMZk63v+Xg2f6KRuqExa7olduaDpo=;
	b=VOXDcMLOp37+q4UlClSCulwueNx7WlKbs+V48ROdDRKwGbNETBDQtlhSycqC90QX
	ttEuGUfYGMI2+tx/4bfszNQuSdk2SrNQSb9UKvOE27GuOnxR2+jIx6lctZRHstgun/a
	RRLrToV/FRvhkXnCLZDHeQWwphOsmGqCmEQml6ns=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113639;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=J3FaAcPp+KX690NMZk63v+Xg2f6KRuqExa7olduaDpo=;
	b=MohBtl1oMMIViL19eiO5b3glygV9ZkHtzmwN/hg6yc8IgznLxYwUOdyUJMwa1qJ+
	xR/leFOb7bbuufVkL0936prdq7wO1iuohA8S0o3fqDMJ5Lh1vFSnjvre5HNr54axJFs
	A+SmBG18JFt7AldjuRGYQCavsN26M6bqxQdTP3J4=
Content-Type: multipart/mixed; boundary="===============8798288055780412089=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] debianutils: upgrading to 5.22 SUCCEEDED
Message-ID: <010101968c7bb331-70fd7adb-45b2-41f0-9a69-21c40b8183a3-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215887

--===============8798288055780412089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *debianutils* to *5.22* has Succeeded.

Next steps:
    - apply the patch: git am 0001-debianutils-upgrade-5.21-5.22.patch
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
From cc88897fe1f78b228b385e423aa51cc1bbac0b8e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 14:33:09 +0000
Subject: [PATCH] debianutils: upgrade 5.21 -> 5.22

---
 .../debianutils/{debianutils_5.21.bb => debianutils_5.22.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.21.bb => debianutils_5.22.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.21.bb b/meta/recipes-support/debianutils/debianutils_5.22.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.21.bb
rename to meta/recipes-support/debianutils/debianutils_5.22.bb
index e0485b24a3..6c66e31072 100644
--- a/meta/recipes-support/debianutils/debianutils_5.21.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.22.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
            "
 
-SRCREV = "ae002b498f2e310c934a0b3f0992e83391f108c7"
+SRCREV = "528fac5c7448989f33c54599ae6e4c2b84d41e21"
 
 inherit autotools update-alternatives
 
-- 
2.47.1


--===============8798288055780412089==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-debianutils-upgrade-5.21-5.22.patch"

RnJvbSBjYzg4ODk3ZmUxZjc4YjIyOGIzODVlNDIzYWE1MWNjMWJiYWMwYjhlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAxNDozMzowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRl
YmlhbnV0aWxzOiB1cGdyYWRlIDUuMjEgLT4gNS4yMgoKLS0tCiAuLi4vZGViaWFudXRpbHMve2Rl
YmlhbnV0aWxzXzUuMjEuYmIgPT4gZGViaWFudXRpbHNfNS4yMi5iYn0gICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy97ZGViaWFudXRpbHNfNS4yMS5iYiA9PiBkZWJpYW51
dGlsc181LjIyLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Rl
YmlhbnV0aWxzL2RlYmlhbnV0aWxzXzUuMjEuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kZWJp
YW51dGlscy9kZWJpYW51dGlsc181LjIyLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2RlYmlhbnV0aWxzL2RlYmlhbnV0aWxzXzUuMjEuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2RlYmlhbnV0aWxzL2RlYmlhbnV0aWxzXzUu
MjIuYmIKaW5kZXggZTA0ODViMjRhMy4uNmM2NmUzMTA3MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGViaWFudXRpbHMvZGViaWFudXRpbHNfNS4yMS5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy9kZWJpYW51dGlsc181LjIyLmJiCkBAIC0xMSw3ICsx
MSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL2RlYmlhbi9jb3B5cmlnaHQ7bWQ1PTRi
NjY3ZjMwNDExZDIxYmM4ZmQ3ZGI4NWQ1MDJhOGU5CiBTUkNfVVJJID0gImdpdDovL3NhbHNhLmRl
Ymlhbi5vcmcvZGViaWFuL2RlYmlhbnV0aWxzLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFz
dGVyIFwKICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAiYWUwMDJiNDk4ZjJlMzEwYzkzNGEwYjNm
MDk5MmU4MzM5MWYxMDhjNyIKK1NSQ1JFViA9ICI1MjhmYWM1Yzc0NDg5ODlmMzNjNTQ1OTlhZTZl
NGMyYjg0ZDQxZTIxIgogCiBpbmhlcml0IGF1dG90b29scyB1cGRhdGUtYWx0ZXJuYXRpdmVzCiAK
LS0gCjIuNDcuMQoK

--===============8798288055780412089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/debianutils/debianutils-dbg: PKGSIZE changed from 93632 to 93776 (+0%)
packages/core2-64-poky-linux/debianutils/debianutils-dbg: PKGV changed from 5.21 [default] to 5.22 [default]
packages/core2-64-poky-linux/debianutils/debianutils-dbg: PV changed from "5.21" to "5.22"
packages/core2-64-poky-linux/debianutils/debianutils-dev: PKGV changed from 5.21 [default] to 5.22 [default]
packages/core2-64-poky-linux/debianutils/debianutils-dev: PV changed from "5.21" to "5.22"
packages/core2-64-poky-linux/debianutils/debianutils-doc: PKGV changed from 5.21 [default] to 5.22 [default]
packages/core2-64-poky-linux/debianutils/debianutils-doc: PV changed from "5.21" to "5.22"
packages/core2-64-poky-linux/debianutils/debianutils-locale: PKGV changed from 5.21 [default] to 5.22 [default]
packages/core2-64-poky-linux/debianutils/debianutils-locale: PV changed from "5.21" to "5.22"
packages/core2-64-poky-linux/debianutils/debianutils-run-parts: PKGV changed from 5.21 [default] to 5.22 [default]
packages/core2-64-poky-linux/debianutils/debianutils-run-parts: PV changed from "5.21" to "5.22"
packages/core2-64-poky-linux/debianutils/debianutils-src: PKGV changed from 5.21 [default] to 5.22 [default]
packages/core2-64-poky-linux/debianutils/debianutils-src: PV changed from "5.21" to "5.22"
packages/core2-64-poky-linux/debianutils/debianutils-staticdev: PKGV changed from 5.21 [default] to 5.22 [default]
packages/core2-64-poky-linux/debianutils/debianutils-staticdev: PV changed from "5.21" to "5.22"
packages/core2-64-poky-linux/debianutils/debianutils: PKGV changed from 5.21 [default] to 5.22 [default]
packages/core2-64-poky-linux/debianutils/debianutils: PV changed from "5.21" to "5.22"
packages/core2-64-poky-linux/debianutils: PKGV changed from 5.21 [default] to 5.22 [default]
packages/core2-64-poky-linux/debianutils: PV changed from "5.21" to "5.22"

--===============8798288055780412089==--

