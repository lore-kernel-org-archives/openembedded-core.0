Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC89F428C9
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:40 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19743.1776261880454230442
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PwvbH+eo;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=t4NC4CLn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019d917557ec-7c097923-6121-4a67-a9e1-f216997ac59c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261879;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rxz1r1C8LjDwMU8lYUvDL4AdtNvQCQia9SAT1L1lfWw=;
	b=PwvbH+eobpzUvdLiKo39DhffwWUS43Y4r3VodzECZpQ+DMALfz5BxYKzjk5sFZ5d
	OZMKcimLmYUVCTSXDJ0Kj8Jm4KMTWRjbb6rqd2KGMLLWjftvjs9POIKRmzSqyV2NlZ6
	MWkhNyAKw5T35re/7pdma0DmX+zmnklOFA5T+Ze0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261879;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rxz1r1C8LjDwMU8lYUvDL4AdtNvQCQia9SAT1L1lfWw=;
	b=t4NC4CLnwWPCupnDduIGvfB9JIlQW5Whl8wywqPtUBapKJfISWVaQuhHzFQDR8K+
	3/NaSTIzfzQCSwnOSeYKlZ9knUVDpSRxGeKRelBnCffIedGmjMmK+0flSQob9vZ1LQz
	3Db0WgXOHVac4Bo1V87iT5E4yd7/Pcz3WvK3ULJ0=
Content-Type: multipart/mixed; boundary="===============7605523665755329754=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-poetry-core: upgrading to 2.3.2 SUCCEEDED
Message-ID: <0101019d917557ec-7c097923-6121-4a67-a9e1-f216997ac59c-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235242

--===============7605523665755329754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-poetry-core* to *2.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-poetry-core-upgrade-2.3.1-2.3.2.patch
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
From e828bc0be2f061f3cc36b3bcc8225e73b8e93f7c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 08:36:07 +0000
Subject: [PATCH] python3-poetry-core: upgrade 2.3.1 -> 2.3.2

---
 ...ython3-poetry-core_2.3.1.bb => python3-poetry-core_2.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_2.3.1.bb => python3-poetry-core_2.3.2.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb b/meta/recipes-devtools/python/python3-poetry-core_2.3.2.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb
rename to meta/recipes-devtools/python/python3-poetry-core_2.3.2.bb
index 705e08d98b..0f55368d13 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_2.3.2.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
 "
 
-SRC_URI[sha256sum] = "96f791d5d7d4e040f3983d76779425cf9532690e2756a24fd5ca0f86af19ef82"
+SRC_URI[sha256sum] = "20cb71be27b774628da9f384effd9183dfceb53bcef84063248a8672aa47031f"
 
 inherit python_poetry_core pypi
 
-- 
2.47.1


--===============7605523665755329754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: FILELIST: directory renamed /usr/lib/python3.14/site-packages/poetry_core-2.3.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/poetry_core-2.3.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/poetry_core-2.3.1.dist-info -> /usr/lib/python3.14/site-packages/poetry_core-2.3.2.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-poetry-core (sysroot):
  /usr/lib/python3.14/site-packages/poetry_core-2.3.1.dist-info moved to /usr/lib/python3.14/site-packages/poetry_core-2.3.2.dist-info
Changes to packages/x86_64-linux/python3-poetry-core-native (sysroot):
  /usr/lib/python3.14/site-packages/poetry_core-2.3.1.dist-info moved to /usr/lib/python3.14/site-packages/poetry_core-2.3.2.dist-info

--===============7605523665755329754==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-poetry-core-upgrade-2.3.1-2.3.2.patch"

RnJvbSBlODI4YmMwYmUyZjA2MWYzY2MzNmIzYmNjODIyNWU3M2I4ZTkzZjdjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDg6MzY6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBvZXRyeS1jb3JlOiB1cGdyYWRlIDIuMy4xIC0+IDIuMy4yCgotLS0KIC4uLnl0aG9u
My1wb2V0cnktY29yZV8yLjMuMS5iYiA9PiBweXRob24zLXBvZXRyeS1jb3JlXzIuMy4yLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi4z
LjEuYmIgPT4gcHl0aG9uMy1wb2V0cnktY29yZV8yLjMuMi5iYn0gKDkzJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi4zLjEu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi4z
LjIuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBvZXRyeS1jb3JlXzIuMy4xLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi4zLjIuYmIKaW5kZXgg
NzA1ZTA4ZDk4Yi4uMGY1NTM2OGQxMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXBvZXRyeS1jb3JlXzIuMy4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2V0cnktY29yZV8yLjMuMi5iYgpAQCAtMTUsNyArMTUs
NyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gIlwKICAgICBmaWxlOi8vc3JjL3BvZXRyeS9jb3JlL192
ZW5kb3IvdG9tbGkvTElDRU5TRTttZDU9YWFhYWYwODc5ZDE3ZGYwMTEwZDFhYThjOGM5ZjQ2ZjUg
XAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTZmNzkxZDVkN2Q0ZTA0MGYzOTgzZDc2Nzc5
NDI1Y2Y5NTMyNjkwZTI3NTZhMjRmZDVjYTBmODZhZjE5ZWY4MiIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICIyMGNiNzFiZTI3Yjc3NDYyOGRhOWYzODRlZmZkOTE4M2RmY2ViNTNiY2VmODQwNjMyNDhh
ODY3MmFhNDcwMzFmIgogCiBpbmhlcml0IHB5dGhvbl9wb2V0cnlfY29yZSBweXBpCiAKLS0gCjIu
NDcuMQoK

--===============7605523665755329754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-poetry-core: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/poetry_core/poetry_core-2.3.1.tar.gz;downloadfilename=poetry_core-2.3.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/poetry_core/poetry_core-2.3.2.tar.gz;downloadfilename=poetry_core-2.3.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-poetry-core: PV changed from "2.3.1" to "2.3.2"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dbg: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dbg: PV changed from "2.3.1" to "2.3.2"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dev: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dev: PV changed from "2.3.1" to "2.3.2"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-doc: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-doc: PV changed from "2.3.1" to "2.3.2"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-locale: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-locale: PV changed from "2.3.1" to "2.3.2"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-src: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-src: PV changed from "2.3.1" to "2.3.2"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-staticdev: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-staticdev: PV changed from "2.3.1" to "2.3.2"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: FILELIST: directory renamed /usr/lib/python3.14/site-packages/poetry_core-2.3.1.dist-info -> /usr/lib/python3.14/site-packages/poetry_core-2.3.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/poetry_core-2.3.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/poetry_core-2.3.2.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: PKGSIZE changed from 2788311 to 2789869 (+0%)
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: PV changed from "2.3.1" to "2.3.2"
Changes to packages/x86-64-v3-poky-linux/python3-poetry-core (sysroot):
  /usr/lib/python3.14/site-packages/poetry_core-2.3.1.dist-info moved to /usr/lib/python3.14/site-packages/poetry_core-2.3.2.dist-info
Changes to packages/x86_64-linux/python3-poetry-core-native (sysroot):
  /usr/lib/python3.14/site-packages/poetry_core-2.3.1.dist-info moved to /usr/lib/python3.14/site-packages/poetry_core-2.3.2.dist-info

--===============7605523665755329754==--

