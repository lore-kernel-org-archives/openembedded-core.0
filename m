Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF638C531F0
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:42:00 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1401.1771440112887408710
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nbetjE6g;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Tfte3JVk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019c720f076c-b5fb3143-993f-4eac-9026-84108f2d417c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3Y5jF826ZJj/4VPYogurlSciJ4aNdCcaz8J9VMpP7uA=;
	b=nbetjE6g//u0lxdeglamvO/ObDgDDB7tjZLXLsvsH5loYDhk2c8E5ZM7Ku3wIMI4
	e3m4TraujR7+pXRojk8wkfF7Q6pkF+DqxPR6YXa9MQKV8TmWdF+IEEao5rvlFh/FQla
	e1fUCf9KjnbzGkgoO42EGrYshkBsYPJi6qyvpr+Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3Y5jF826ZJj/4VPYogurlSciJ4aNdCcaz8J9VMpP7uA=;
	b=Tfte3JVk9KsBssu9I9EeVwVkH4pqQsAxTCtY9bV6PUW218ZLJ+lzS9BxXsp67Jms
	/UjkmxFldGmO58RBN1o3OC/eBTK8M18GdxEiXCm562ReNlNKW67VxUSyllERS1mpaCO
	U6ZvxkzaF1/Hg3ZSzUwvvR2DWOGDRZC/4ejDSR7U=
Content-Type: multipart/mixed; boundary="===============4298870371467255314=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 312 SUCCEEDED
Message-ID: <0101019c720f076c-b5fb3143-993f-4eac-9026-84108f2d417c-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:42:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231400

--===============4298870371467255314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *312* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-311-312.patch
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
From 4b535de98c3dfd11a34f6718b6f9cf72d90c2fb4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 18:06:04 +0000
Subject: [PATCH] diffoscope: upgrade 311 -> 312

---
 .../diffoscope/{diffoscope_311.bb => diffoscope_312.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_311.bb => diffoscope_312.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_311.bb b/meta/recipes-support/diffoscope/diffoscope_312.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_311.bb
rename to meta/recipes-support/diffoscope/diffoscope_312.bb
index e947bc0219..2b3477df60 100644
--- a/meta/recipes-support/diffoscope/diffoscope_311.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_312.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9316493c0ba14d6f7537dd4e4ade7d4cd5cfef86b63fe687f0e7073861c5ba8b"
+SRC_URI[sha256sum] = "aaa22b238d5b1d1804ee86b7a0526759b2984935f260a9ea8d72da7dd3c41c7f"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============4298870371467255314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-311.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-312.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-311.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-312.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-311.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-312.dist-info

--===============4298870371467255314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PV changed from "311" to "312"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 311 [default] to 312 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PV changed from "311" to "312"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 311 [default] to 312 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PV changed from "311" to "312"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 311 [default] to 312 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PV changed from "311" to "312"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 311 [default] to 312 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PV changed from "311" to "312"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PKGV changed from 311 [default] to 312 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "311" to "312"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 311 [default] to 312 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PV changed from "311" to "312"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGV changed from 311 [default] to 312 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-311.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-312.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-311.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-312.dist-info/licenses
packages/x86-64-v3-poky-linux/diffoscope: PV changed from "311" to "312"
packages/x86-64-v3-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-311.tar.gz;downloadfilename=diffoscope-311.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-312.tar.gz;downloadfilename=diffoscope-312.tar.gz"
packages/x86-64-v3-poky-linux/diffoscope: PKGV changed from 311 [default] to 312 [default]
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-311.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-312.dist-info

--===============4298870371467255314==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-311-312.patch"

RnJvbSA0YjUzNWRlOThjM2RmZDExYTM0ZjY3MThiNmY5Y2Y3MmQ5MGMyZmI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTg6MDY6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDMxMSAtPiAzMTIKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMzExLmJiID0+IGRpZmZvc2NvcGVfMzEyLmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8zMTEuYmIgPT4gZGlmZm9zY29wZV8z
MTIuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzMxMS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8zMTIuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMxMS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMxMi5iYgppbmRleCBlOTQ3YmMw
MjE5Li4yYjM0NzdkZjYwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMzExLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8zMTIuYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiOTMxNjQ5M2MwYmExNGQ2Zjc1MzdkZDRlNGFkZTdkNGNkNWNmZWY4NmI2M2ZlNjg3ZjBl
NzA3Mzg2MWM1YmE4YiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhYWEyMmIyMzhkNWIxZDE4MDRl
ZTg2YjdhMDUyNjc1OWIyOTg0OTM1ZjI2MGE5ZWE4ZDcyZGE3ZGQzYzQxYzdmIgogCiBSREVQRU5E
Uzoke1BOfSArPSAiXAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ3LjEKCg==

--===============4298870371467255314==--

