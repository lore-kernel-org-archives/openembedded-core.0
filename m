Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B8EC27C42
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.798.1686887481587551444
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QMhREY8z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010188c25445ec-a210611b-0fb4-476e-b36c-9fc14ac5fbd5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KdGDLODL096Xz0nW74Jj9WFMKiXzEHcVdotxvg2m5K0=;
	b=QMhREY8zdX6fyhsuSkUQesMxjvFqya0AXYGblRIntqAAaEfyn33Yd0DoIz+Dl/zA
	j8+DztXaiNgCWklQORHl22VgWvasLfQmunEU2KaA5oaKKTYhsOI2DE6TKxz+WG4T9Ki
	izhRuIFGWrhydzkBZyUH9sl7s8Y2VO9J8n5TQO4o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KdGDLODL096Xz0nW74Jj9WFMKiXzEHcVdotxvg2m5K0=;
	b=pZz8tiwKaxsUnT2jw8gKyL+66xJqqE5m+ceawF03j6Uf2ClZ8Wzyd6WkmVflZvCE
	P/AfQSWzCN+qLgjz7/zR7339h9XawRTSUHhPlmoWzHtu7kYHtJQlOsM0okYFEJ9wEEc
	eTW80OjuzzcFaHqn9jVcqq+0w6KQ1tel2FAjHvZE=
Content-Type: multipart/mixed; boundary="===============6098885966846679010=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytest: upgrading to 7.3.2 SUCCEEDED
Message-ID: <01010188c25445ec-a210611b-0fb4-476e-b36c-9fc14ac5fbd5-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182925

--===============6098885966846679010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pytest* to *7.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytest-upgrade-7.3.1-7.3.2.patch
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
From 8e463c91d3dbfe8e71bcd805a99a7cfe9f036030 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 13:51:22 +0000
Subject: [PATCH] python3-pytest: upgrade 7.3.1 -> 7.3.2

---
 .../python/{python3-pytest_7.3.1.bb => python3-pytest_7.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_7.3.1.bb => python3-pytest_7.3.2.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.3.1.bb b/meta/recipes-devtools/python/python3-pytest_7.3.2.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pytest_7.3.1.bb
rename to meta/recipes-devtools/python/python3-pytest_7.3.2.bb
index 914ea55346..725323a61d 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.3.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.3.2.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "434afafd78b1d78ed0addf160ad2b77a30d35d4bdf8af234fe621919d9ed15e3"
+SRC_URI[sha256sum] = "ee990a3cc55ba808b80795a79944756f315c67c12b56abd3ac993a7b8c17030b"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.39.2


--===============6098885966846679010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pytest: PKGV changed from 7.3.1 [default] to 7.3.2 [default]
packages/core2-32-poky-linux/python3-pytest: PV changed from "7.3.1" to "7.3.2"
packages/core2-32-poky-linux/python3-pytest: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytest/pytest-7.3.1.tar.gz;downloadfilename=pytest-7.3.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pytest/pytest-7.3.2.tar.gz;downloadfilename=pytest-7.3.2.tar.gz"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dbg: PKGV changed from 7.3.1 [default] to 7.3.2 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dbg: PV changed from "7.3.1" to "7.3.2"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dev: PKGV changed from 7.3.1 [default] to 7.3.2 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dev: PV changed from "7.3.1" to "7.3.2"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-doc: PKGV changed from 7.3.1 [default] to 7.3.2 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-doc: PV changed from "7.3.1" to "7.3.2"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-locale: PKGV changed from 7.3.1 [default] to 7.3.2 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-locale: PV changed from "7.3.1" to "7.3.2"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-src: PKGV changed from 7.3.1 [default] to 7.3.2 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-src: PV changed from "7.3.1" to "7.3.2"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-staticdev: PKGV changed from 7.3.1 [default] to 7.3.2 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-staticdev: PV changed from "7.3.1" to "7.3.2"
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PKGV changed from 7.3.1 [default] to 7.3.2 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PKGSIZE changed from 2642878 to 2645932 (+0%)
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PV changed from "7.3.1" to "7.3.2"
Changes to packages/core2-32-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.11/site-packages/pytest-7.3.1.dist-info moved to /usr/lib/python3.11/site-packages/pytest-7.3.2.dist-info

--===============6098885966846679010==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytest-upgrade-7.3.1-7.3.2.patch"

RnJvbSA4ZTQ2M2M5MWQzZGJmZThlNzFiY2Q4MDVhOTlhN2NmZTlmMDM2MDMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTM6NTE6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5dGVzdDogdXBncmFkZSA3LjMuMSAtPiA3LjMuMgoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXB5dGVzdF83LjMuMS5iYiA9PiBweXRob24zLXB5dGVzdF83LjMuMi5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5dGVzdF83LjMuMS5iYiA9PiBw
eXRob24zLXB5dGVzdF83LjMuMi5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0XzcuMy4xLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5dGVzdF83LjMuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDkz
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0
XzcuMy4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHl0ZXN0XzcuMy4yLmJiCmluZGV4IDkxNGVhNTUzNDYuLjcyNTMyM2E2MWQgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRlc3RfNy4zLjEuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dGVzdF83LjMuMi5iYgpA
QCAtNSw3ICs1LDcgQEAgREVTQ1JJUFRJT04gPSAiVGhlIHB5dGVzdCBmcmFtZXdvcmsgbWFrZXMg
aXQgZWFzeSB0byB3cml0ZSBzbWFsbCB0ZXN0cywgeWV0IHNjYWwKIExJQ0VOU0UgPSAiTUlUIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YmQyN2U0MWI2NTUwZmUwZmM0
NTM1NmQxZDgxZWUzN2MiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0MzRhZmFmZDc4YjFkNzhl
ZDBhZGRmMTYwYWQyYjc3YTMwZDM1ZDRiZGY4YWYyMzRmZTYyMTkxOWQ5ZWQxNWUzIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gImVlOTkwYTNjYzU1YmE4MDhiODA3OTVhNzk5NDQ3NTZmMzE1YzY3YzEy
YjU2YWJkM2FjOTkzYTdiOGMxNzAzMGIiCiAKIERFUEVORFMgKz0gInB5dGhvbjMtc2V0dXB0b29s
cy1zY20tbmF0aXZlIgogCi0tIAoyLjM5LjIKCg==

--===============6098885966846679010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.11/site-packages/pytest-7.3.1.dist-info moved to /usr/lib/python3.11/site-packages/pytest-7.3.2.dist-info

--===============6098885966846679010==--

