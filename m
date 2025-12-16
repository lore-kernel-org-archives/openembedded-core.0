Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6EFD5C0DF
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:26 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17382.1765872127684878873
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KijSGxtj;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ol1vmZd/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019b262e81ec-27769f1f-a8a5-487f-9cea-b0f432cef6b4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872141;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zypM8V8bWSnLwYIihnwRGNKUB4/g/sLYCulsC5bEE4Q=;
	b=KijSGxtjcFoU95XSKqv+IxmWyPNqA4VZGPDiHWeEElqnFuyr2kloC6kHjkwKx+sK
	Yu/ec0/gCgQIm+O4WVCbApnQ9yeC8hWNSrKYMVaG+ddLf6fc3GDP6Z1YzoyhtM5N1ie
	P7LKuQ1uh3hy0f+G+H8V16FkiGB5PTm+XEsKIA1w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872141;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zypM8V8bWSnLwYIihnwRGNKUB4/g/sLYCulsC5bEE4Q=;
	b=ol1vmZd/KMSxCZodehBePXmy3GBBUGcir98vl0xxbaotHIvE01mX2GDtISTN2qxs
	bQ6oVAcXOYamb4tP9jYnvcJVPLxXOvFJywjStyD2ZIN53l30iU8PS8HspCsawJgIEl2
	EC2vnuCh2K8dTBQGZ/2IitU/bVrg1VgYy5i7SuIs=
Content-Type: multipart/mixed; boundary="===============5571826129966841480=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2025.12 SUCCEEDED
Message-ID: <0101019b262e81ec-27769f1f-a8a5-487f-9cea-b0f432cef6b4-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227802

--===============5571826129966841480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-dtschema* to *2025.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2025.8-2025.12.patch
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
From 75070c2fd1e7f665431ccaeba80fa26a07c2d5c4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Dec 2025 23:42:49 +0000
Subject: [PATCH] python3-dtschema: upgrade 2025.8 -> 2025.12

---
 .../{python3-dtschema_2025.8.bb => python3-dtschema_2025.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2025.8.bb => python3-dtschema_2025.12.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2025.8.bb b/meta/recipes-devtools/python/python3-dtschema_2025.12.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2025.8.bb
rename to meta/recipes-devtools/python/python3-dtschema_2025.12.bb
index 9aba5f85ee..5ae67805b9 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2025.8.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2025.12.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "3c63b643fa76215b32cc6cbea9fd0dc7627dc71c67f3dca14fc04d70a7e1235e"
+SRC_URI[sha256sum] = "327fdf5d5ec60934cc3eddab09e68be2310173a33e15eee24dffa89787706db7"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.47.1


--===============5571826129966841480==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2025.8-2025.12.patch"

RnJvbSA3NTA3MGMyZmQxZTdmNjY1NDMxY2NhZWJhODBmYTI2YTA3YzJkNWM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgRGVjIDIwMjUgMjM6NDI6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWR0c2NoZW1hOiB1cGdyYWRlIDIwMjUuOCAtPiAyMDI1LjEyCgotLS0KIC4uLi97cHl0
aG9uMy1kdHNjaGVtYV8yMDI1LjguYmIgPT4gcHl0aG9uMy1kdHNjaGVtYV8yMDI1LjEyLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtZHRzY2hlbWFfMjAyNS44
LmJiID0+IHB5dGhvbjMtZHRzY2hlbWFfMjAyNS4xMi5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyNS44LmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjUuMTIuYmIK
c2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjUuOC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjUuMTIuYmIKaW5kZXggOWFiYTVmODVl
ZS4uNWFlNjc4MDViOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWR0c2NoZW1hXzIwMjUuOC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyNS4xMi5iYgpAQCAtNyw3ICs3LDcgQEAgaW5oZXJpdCBw
eXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAogUFlQSV9QQUNLQUdFID0gImR0c2No
ZW1hIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2M2M2I2NDNmYTc2MjE1YjMyY2M2Y2JlYTlm
ZDBkYzc2MjdkYzcxYzY3ZjNkY2ExNGZjMDRkNzBhN2UxMjM1ZSIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICIzMjdmZGY1ZDVlYzYwOTM0Y2MzZWRkYWIwOWU2OGJlMjMxMDE3M2EzM2UxNWVlZTI0ZGZm
YTg5Nzg3NzA2ZGI3IgogCiBERVBFTkRTICs9ICJweXRob24zLXNldHVwdG9vbHMtc2NtLW5hdGl2
ZSIKIFJERVBFTkRTOiR7UE59ICs9ICJcCi0tIAoyLjQ3LjEKCg==

--===============5571826129966841480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info -> /usr/lib/python3.13/site-packages/dtschema-2025.12.dist-info, directory renamed /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/licenses -> /usr/lib/python3.13/site-packages/dtschema-2025.12.dist-info/licenses, added "/usr/lib/python3.13/site-packages/dtschema/schemas/sdram/sdram-consumer.yaml"
Changes to packages/x86-64-v3-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.13/site-packages/dtschema-2025.12.dist-info was added
  /usr/lib/python3.13/site-packages/dtschema-2025.12.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2025.12.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/dtschema-2025.12.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2025.12.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/dtschema-2025.12.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2025.12.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/dtschema/schemas/sdram was added
  /usr/lib/python3.13/site-packages/dtschema/schemas/sdram/sdram-consumer.yaml was added
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/WHEEL was removed

--===============5571826129966841480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-dtschema: PV changed from "2025.8" to "2025.12"
packages/x86-64-v3-poky-linux/python3-dtschema: PKGV changed from 2025.8 [default] to 2025.12 [default]
packages/x86-64-v3-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2025.8.tar.gz;downloadfilename=dtschema-2025.8.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2025.12.tar.gz;downloadfilename=dtschema-2025.12.tar.gz"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2025.8" to "2025.12"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2025.8 [default] to 2025.12 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2025.8" to "2025.12"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2025.8 [default] to 2025.12 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2025.8" to "2025.12"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2025.8 [default] to 2025.12 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2025.8" to "2025.12"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2025.8 [default] to 2025.12 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2025.8" to "2025.12"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2025.8 [default] to 2025.12 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2025.8" to "2025.12"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2025.8 [default] to 2025.12 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2025.8" to "2025.12"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2025.8 [default] to 2025.12 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info -> /usr/lib/python3.13/site-packages/dtschema-2025.12.dist-info, directory renamed /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/licenses -> /usr/lib/python3.13/site-packages/dtschema-2025.12.dist-info/licenses, added "/usr/lib/python3.13/site-packages/dtschema/schemas/sdram/sdram-consumer.yaml"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 399218 to 400472 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.13/site-packages/dtschema-2025.12.dist-info was added
  /usr/lib/python3.13/site-packages/dtschema-2025.12.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2025.12.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/dtschema-2025.12.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2025.12.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/dtschema-2025.12.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2025.12.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/dtschema/schemas/sdram was added
  /usr/lib/python3.13/site-packages/dtschema/schemas/sdram/sdram-consumer.yaml was added
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/WHEEL was removed

--===============5571826129966841480==--

