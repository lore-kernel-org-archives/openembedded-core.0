Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC135D0EE34
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:16 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.53349.1728588940440488457
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Huc9y77U;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=J0zXMj/i;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019277ee88bb-e3628280-1f42-4ab7-807b-8a68a7a98940-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588974;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TEzz93OA4QBmaQZiVQYscZO42XZc5w8IBGJdKuIrQqU=;
	b=Huc9y77U90M/rTT1tcxZGK8UNul5behkBJ1aWe66ZYJQuuz7rw2v3zEA9qlUV0SL
	NAr1cWiHQJhokYt2ycs+Ye6S8MMFc1scfmvrvNp8t0RrF/fWk5Ht0MN628TDFITBHb/
	td7sYQBaHCX/A1jmdsCvazXqm2DkH4OjsJjeHhWQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588974;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TEzz93OA4QBmaQZiVQYscZO42XZc5w8IBGJdKuIrQqU=;
	b=J0zXMj/iMExXbtlGSTvxYOdwgdhsjRfZVy8xPHPud4C3URjrZqiPyVnVbPbo8HsT
	a5QSh5q4LejPxfkCN1Y3Qp7ME0O4k2f8DhDDgLzyaqMNedjjmaGK4q1VtEMMsXYWPR4
	xU1kKcPNWRzYeoMiJxPZaVXq5Mt9WI4A5nKY5Xg4=
Content-Type: multipart/mixed; boundary="===============0357681899290439237=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dbusmock: upgrading to 0.32.2 SUCCEEDED
Message-ID: <0101019277ee88bb-e3628280-1f42-4ab7-807b-8a68a7a98940-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205539

--===============0357681899290439237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-dbusmock* to *0.32.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dbusmock-upgrade-0.32.1-0.32.2.patch
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
From 7e38030cecf89fc426d256b3210f29a04242648f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 13:22:44 +0000
Subject: [PATCH] python3-dbusmock: upgrade 0.32.1 -> 0.32.2

---
 .../{python3-dbusmock_0.32.1.bb => python3-dbusmock_0.32.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.32.1.bb => python3-dbusmock_0.32.2.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.32.1.bb b/meta/recipes-devtools/python/python3-dbusmock_0.32.2.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-dbusmock_0.32.1.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.32.2.bb
index db7011831b..436b82d1a0 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.32.1.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.32.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "f02c34493d420b3cf2d8d341b79a60841593b7b7615adc3ece17ff86f8275924"
+SRC_URI[sha256sum] = "357c269d53a5bb3f87983bec7ff700a0c4d071481f7cf7221ec8376224fc4316"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.44.1


--===============0357681899290439237==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dbusmock-upgrade-0.32.1-0.32.2.patch"

RnJvbSA3ZTM4MDMwY2VjZjg5ZmM0MjZkMjU2YjMyMTBmMjlhMDQyNDI2NDhmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMTM6MjI6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWRidXNtb2NrOiB1cGdyYWRlIDAuMzIuMSAtPiAwLjMyLjIKCi0tLQogLi4uL3tweXRo
b24zLWRidXNtb2NrXzAuMzIuMS5iYiA9PiBweXRob24zLWRidXNtb2NrXzAuMzIuMi5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1kYnVzbW9ja18wLjMyLjEu
YmIgPT4gcHl0aG9uMy1kYnVzbW9ja18wLjMyLjIuYmJ9ICg4NyUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWRidXNtb2NrXzAuMzIuMS5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kYnVzbW9ja18wLjMyLjIuYmIKc2lt
aWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWRidXNtb2NrXzAuMzIuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWRidXNtb2NrXzAuMzIuMi5iYgppbmRleCBkYjcwMTE4MzFiLi40
MzZiODJkMWEwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtZGJ1c21vY2tfMC4zMi4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1kYnVzbW9ja18wLjMyLjIuYmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0
dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9weXRob24tZGJ1c21vY2svIgogTElDRU5TRSA9ICJHUEwt
My4wLW9ubHkiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1lNmE2MDBm
ZDVlMWQ5Y2JkZTJkOTgzNjgwMjMzYWQwMiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImYwMmMz
NDQ5M2Q0MjBiM2NmMmQ4ZDM0MWI3OWE2MDg0MTU5M2I3Yjc2MTVhZGMzZWNlMTdmZjg2ZjgyNzU5
MjQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzU3YzI2OWQ1M2E1YmIzZjg3OTgzYmVjN2ZmNzAw
YTBjNGQwNzE0ODFmN2NmNzIyMWVjODM3NjIyNGZjNDMxNiIKIAogUFlQSV9QQUNLQUdFID0gInB5
dGhvbi1kYnVzbW9jayIKIAotLSAKMi40NC4xCgo=

--===============0357681899290439237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-dbusmock (sysroot):
  /usr/lib/python3.12/site-packages/python_dbusmock-0.32.1.dist-info moved to /usr/lib/python3.12/site-packages/python_dbusmock-0.32.2.dist-info

--===============0357681899290439237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-dbusmock: PV changed from "0.32.1" to "0.32.2"
packages/core2-64-poky-linux/python3-dbusmock: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/python-dbusmock/python-dbusmock-0.32.1.tar.gz;downloadfilename=python-dbusmock-0.32.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/python-dbusmock/python-dbusmock-0.32.2.tar.gz;downloadfilename=python-dbusmock-0.32.2.tar.gz"
packages/core2-64-poky-linux/python3-dbusmock: PKGV changed from 0.32.1 [default] to 0.32.2 [default]
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock-dbg: PV changed from "0.32.1" to "0.32.2"
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock-dbg: PKGV changed from 0.32.1 [default] to 0.32.2 [default]
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock-dev: PV changed from "0.32.1" to "0.32.2"
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock-dev: PKGV changed from 0.32.1 [default] to 0.32.2 [default]
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock-doc: PV changed from "0.32.1" to "0.32.2"
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock-doc: PKGV changed from 0.32.1 [default] to 0.32.2 [default]
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock-locale: PV changed from "0.32.1" to "0.32.2"
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock-locale: PKGV changed from 0.32.1 [default] to 0.32.2 [default]
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock-src: PV changed from "0.32.1" to "0.32.2"
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock-src: PKGV changed from 0.32.1 [default] to 0.32.2 [default]
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: PV changed from "0.32.1" to "0.32.2"
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: PKGV changed from 0.32.1 [default] to 0.32.2 [default]
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock: PKGSIZE changed from 505705 to 501977 (-1%)
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock: PV changed from "0.32.1" to "0.32.2"
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock: PKGV changed from 0.32.1 [default] to 0.32.2 [default]
Changes to packages/core2-64-poky-linux/python3-dbusmock (sysroot):
  /usr/lib/python3.12/site-packages/python_dbusmock-0.32.1.dist-info moved to /usr/lib/python3.12/site-packages/python_dbusmock-0.32.2.dist-info

--===============0357681899290439237==--

