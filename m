Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D99C25B7E
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:19 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.1239.1715794337483687526
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=e58H6714;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=CjV8YBnj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018f7d4fdc0e-6911df69-84d0-4280-b832-98b6d6045942-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794336;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nl7hkMPQB17pXqvbdt2hAv/aVVQUibCNsC9vVrKWVzE=;
	b=e58H6714003FJXNTZcyvxphNtqMq1ln2xSnXgBHb6DIn9a5dTDItuThFJ/lJI8w5
	+DT3yLNf88jkqxW61ouK5JEsCv5qnSAUT65hl+YMTpxnRVXwYb4hMt7+IIVcqkWsVGH
	+CoYe5M2V6bd0DV53Rgqj8xCMzPy7CJj8OJr8X0E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794336;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nl7hkMPQB17pXqvbdt2hAv/aVVQUibCNsC9vVrKWVzE=;
	b=CjV8YBnjJfA5QLfr7xhD/o2GQW+QomKzdsFtAy83wiO2z4ymPJ20syQHrSnagyMj
	6GYWh9l+ghKi/iMlU/YJusLaeP0tE8vmOFLM8pJKqvTGTaGmxFMkBJnY2EhCQBkZOB+
	5AWXdRQrB1iqpS/AxQ5mh3xWcQUp+CBTzzi/DVIw=
Content-Type: multipart/mixed; boundary="===============3277514011809194197=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-networking: upgrading to 2.80.0 SUCCEEDED
Message-ID: <0101018f7d4fdc0e-6911df69-84d0-4280-b832-98b6d6045942-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199310

--===============3277514011809194197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-networking* to *2.80.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-networking-upgrade-2.78.1-2.80.0.patch
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
From b43a6501082bb21514c68c81a6f05ef496b96755 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 07:29:21 +0000
Subject: [PATCH] glib-networking: upgrade 2.78.1 -> 2.80.0

---
 meta/recipes-core/glib-networking/glib-networking/eagain.patch  | 2 +-
 .../{glib-networking_2.78.1.bb => glib-networking_2.80.0.bb}    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.78.1.bb => glib-networking_2.80.0.bb} (95%)

diff --git a/meta/recipes-core/glib-networking/glib-networking/eagain.patch b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
index 6c2e3c634b..88ac15e7d7 100644
--- a/meta/recipes-core/glib-networking/glib-networking/eagain.patch
+++ b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
@@ -1,4 +1,4 @@
-From 5604707bed4b4a4bc4658c7158a18c1774775775 Mon Sep 17 00:00:00 2001
+From 1bd273b207044a77fba6a6a57a743a1768b2676b Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sat, 6 May 2023 12:18:50 +0100
 Subject: [PATCH] In autobuilder testing we regularly see glib-networking ptest
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb
similarity index 95%
rename from meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.80.0.bb
index 5060d9fd7a..c8a1355548 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 SECTION = "libs"
 DEPENDS = "glib-2.0-native glib-2.0"
 
-SRC_URI[archive.sha256sum] = "e48f2ddbb049832cbb09230529c5e45daca9f0df0eda325f832f7379859bf09f"
+SRC_URI[archive.sha256sum] = "d8f4f1aab213179ae3351617b59dab5de6bcc9e785021eee178998ebd4bb3acf"
 
 # Upstream note that for the openssl backend, half the tests where this backend don't return
 # the expected error code or don't work as expected so default to gnutls
-- 
2.44.0


--===============3277514011809194197==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-networking-upgrade-2.78.1-2.80.0.patch"

RnJvbSBiNDNhNjUwMTA4MmJiMjE1MTRjNjhjODFhNmYwNWVmNDk2Yjk2NzU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMDc6Mjk6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bGliLW5ldHdvcmtpbmc6IHVwZ3JhZGUgMi43OC4xIC0+IDIuODAuMAoKLS0tCiBtZXRhL3JlY2lw
ZXMtY29yZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nL2VhZ2Fpbi5wYXRjaCAgfCAy
ICstCiAuLi4ve2dsaWItbmV0d29ya2luZ18yLjc4LjEuYmIgPT4gZ2xpYi1uZXR3b3JraW5nXzIu
ODAuMC5iYn0gICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcve2ds
aWItbmV0d29ya2luZ18yLjc4LjEuYmIgPT4gZ2xpYi1uZXR3b3JraW5nXzIuODAuMC5iYn0gKDk1
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1u
ZXR3b3JraW5nL2VhZ2Fpbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2lu
Zy9nbGliLW5ldHdvcmtpbmcvZWFnYWluLnBhdGNoCmluZGV4IDZjMmUzYzYzNGIuLjg4YWMxNWU3
ZDcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2luZy9nbGliLW5l
dHdvcmtpbmcvZWFnYWluLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29y
a2luZy9nbGliLW5ldHdvcmtpbmcvZWFnYWluLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1
NjA0NzA3YmVkNGI0YTRiYzQ2NThjNzE1OGExOGMxNzc0Nzc1Nzc1IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSAxYmQyNzNiMjA3MDQ0YTc3ZmJhNmE2YTU3YTc0M2ExNzY4YjI2NzZiIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVy
ZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBTYXQsIDYgTWF5IDIwMjMgMTI6MTg6NTAg
KzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gSW4gYXV0b2J1aWxkZXIgdGVzdGluZyB3ZSByZWd1bGFy
bHkgc2VlIGdsaWItbmV0d29ya2luZyBwdGVzdApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYi1uZXR3b3JraW5nL2dsaWItbmV0d29ya2luZ18yLjc4LjEuYmIgYi9tZXRhL3JlY2lw
ZXMtY29yZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nXzIuODAuMC5iYgpzaW1pbGFy
aXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtp
bmcvZ2xpYi1uZXR3b3JraW5nXzIuNzguMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi1uZXR3b3JraW5nL2dsaWItbmV0d29ya2luZ18yLjgwLjAuYmIKaW5kZXggNTA2MGQ5ZmQ3
YS4uYzhhMTM1NTU0OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi1uZXR3b3Jr
aW5nL2dsaWItbmV0d29ya2luZ18yLjc4LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
Yi1uZXR3b3JraW5nL2dsaWItbmV0d29ya2luZ18yLjgwLjAuYmIKQEAgLTE0LDcgKzE0LDcgQEAg
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NGZiZDY1MzgwY2RkMjU1OTUx
MDc5MDA4YjM2NDUxNmMgXAogU0VDVElPTiA9ICJsaWJzIgogREVQRU5EUyA9ICJnbGliLTIuMC1u
YXRpdmUgZ2xpYi0yLjAiCiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImU0OGYyZGRi
YjA0OTgzMmNiYjA5MjMwNTI5YzVlNDVkYWNhOWYwZGYwZWRhMzI1ZjgzMmY3Mzc5ODU5YmYwOWYi
CitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJkOGY0ZjFhYWIyMTMxNzlhZTMzNTE2MTdi
NTlkYWI1ZGU2YmNjOWU3ODUwMjFlZWUxNzg5OThlYmQ0YmIzYWNmIgogCiAjIFVwc3RyZWFtIG5v
dGUgdGhhdCBmb3IgdGhlIG9wZW5zc2wgYmFja2VuZCwgaGFsZiB0aGUgdGVzdHMgd2hlcmUgdGhp
cyBiYWNrZW5kIGRvbid0IHJldHVybgogIyB0aGUgZXhwZWN0ZWQgZXJyb3IgY29kZSBvciBkb24n
dCB3b3JrIGFzIGV4cGVjdGVkIHNvIGRlZmF1bHQgdG8gZ251dGxzCi0tIAoyLjQ0LjAKCg==

--===============3277514011809194197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/glib-networking/glib-networking-dbg: PKGSIZE changed from 840656 to 840840 (+0%)
packages/core2-64-poky-linux/glib-networking/glib-networking-dbg: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-dbg: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-dev: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-dev: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-doc: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-doc: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ab: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ab: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-an: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-an: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ar: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ar: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-as: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-as: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-be: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-be: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-bg: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-bg: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-bn-in: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-bn-in: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-bs: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-bs: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ca+valencia: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ca+valencia: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ca: PKGSIZE changed from 8462 to 8914 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ca: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ca: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-cs: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-cs: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-da: PKGSIZE changed from 7631 to 8085 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-da: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-da: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-de: PKGSIZE changed from 8338 to 8452 (+1%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-de: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-de: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-el: PKGSIZE changed from 4443 to 7344 (+65%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-el: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-el: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-en-ca: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-en-ca: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-en-gb: PKGSIZE changed from 7261 to 7753 (+7%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-en-gb: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-en-gb: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-eo: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-eo: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-es: PKGSIZE changed from 7951 to 8379 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-es: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-es: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-et: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-et: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-eu: PKGSIZE changed from 7652 to 8106 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-eu: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-eu: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fa: PKGSIZE changed from 9523 to 10017 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fa: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fa: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fi: PKGSIZE changed from 5360 to 6010 (+12%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fi: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fi: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fr: PKGSIZE changed from 8335 to 8877 (+7%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fr: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fr: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fur: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fur: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gd: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gd: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gl: PKGSIZE changed from 8313 to 8780 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gl: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gl: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gu: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gu: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-he: PKGSIZE changed from 9064 to 9530 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-he: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-he: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hi: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hi: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hr: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hr: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hu: PKGSIZE changed from 8124 to 8600 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hu: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hu: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-id: PKGSIZE changed from 7414 to 7832 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-id: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-id: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-it: PKGSIZE changed from 8047 to 8523 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-it: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-it: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ja: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ja: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ka: PKGSIZE changed from 11868 to 12595 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ka: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ka: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-kk: PKGSIZE changed from 9719 to 10296 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-kk: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-kk: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-km: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-km: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-kn: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-kn: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ko: PKGSIZE changed from 8342 to 8805 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ko: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ko: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-lt: PKGSIZE changed from 7830 to 8264 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-lt: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-lt: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-lv: PKGSIZE changed from 7953 to 8489 (+7%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-lv: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-lv: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ml: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ml: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-mr: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-mr: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ms: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ms: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-nb: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-nb: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ne: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ne: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-nl: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-nl: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-oc: PKGSIZE changed from 8173 to 8616 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-oc: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-oc: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-or: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-or: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pa: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pa: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pl: PKGSIZE changed from 8219 to 8699 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pl: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pl: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pt-br: PKGSIZE changed from 8060 to 8248 (+2%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pt-br: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pt-br: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pt: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pt: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ro: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ro: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ru: PKGSIZE changed from 10411 to 10968 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ru: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ru: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sk: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sk: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sl: PKGSIZE changed from 8193 to 8607 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sl: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sl: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sr+latin: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sr+latin: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sr: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sr: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sv: PKGSIZE changed from 7752 to 8181 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sv: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sv: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ta: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ta: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-te: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-te: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-tg: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-tg: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-th: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-th: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-tr: PKGSIZE changed from 7403 to 7805 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-tr: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-tr: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ug: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ug: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-uk: PKGSIZE changed from 11136 to 11741 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-uk: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-uk: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-vi: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-vi: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-cn: PKGSIZE changed from 6775 to 7146 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-cn: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-cn: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-hk: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-hk: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-tw: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-tw: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-ptest: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-ptest: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-src: PKGSIZE changed from 744568 to 744834 (+0%)
packages/core2-64-poky-linux/glib-networking/glib-networking-src: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-src: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-staticdev: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-staticdev: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking: SRC_URI changed from "https://download.gnome.org/sources//glib-networking/2.78/glib-networking-2.78.1.tar.xz;name=archive file://run-ptest file://eagain.patch" to "https://download.gnome.org/sources//glib-networking/2.80/glib-networking-2.80.0.tar.xz;name=archive file://run-ptest file://eagain.patch"

--===============3277514011809194197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/glib-networking/glib-networking-locale-el: PKGSIZE changed from 4443 to 7344 (+65%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fi: PKGSIZE changed from 5360 to 6010 (+12%)

--===============3277514011809194197==--

