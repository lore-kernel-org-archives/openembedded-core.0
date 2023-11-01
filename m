Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02689C19F21
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:16 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.8640.1698848702617669836
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=B83Ig2gJ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DA4kqz6s;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.193, mailfrom: 0101018b8b4602aa-d6c99bad-5942-4f3c-98b5-f2a6bf2f4d4a-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Kr+NypGQ9/Sxjo3XaC9bRrIfI80PoE17FXfDTydQ7Yc=;
	b=B83Ig2gJM8Jm9aLxgqtxXbhHw2MJns10/wv5dn0sG2w89J39vMLwag0AhrNTy5eU
	VhDtWje3n5k7hiBklDXNvI/bd+VfO9ZziDuyxr9mUPfQV0b4xmMF6sPWb9gX6FxvVPt
	FiFuYWStyE7/jIc0T5SR0/3lUkJXm3pltDBTj+aQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Kr+NypGQ9/Sxjo3XaC9bRrIfI80PoE17FXfDTydQ7Yc=;
	b=DA4kqz6s2Ya2VxbBNyNw1d46Odbd3yS8r68N9EQBFSqA0Ww7mhrJWjgPoWBFNbXM
	C6p7gOe7LAgg4W2Wpj97jBw+8HAeTishRCew8eAh0Rzq9ePRgpJHzQgIglEF/yaCZvY
	bLwmsf17oh79cFbtX/eU8zRQeil9c0szMB+kcbhc=
Content-Type: multipart/mixed; boundary="===============5532618225444920723=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-babel: upgrading to 2.13.1 SUCCEEDED
Message-ID: <0101018b8b4602aa-d6c99bad-5942-4f3c-98b5-f2a6bf2f4d4a-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189931

--===============5532618225444920723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-babel* to *2.13.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-babel-upgrade-2.13.0-2.13.1.patch
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
From 1eab395d937bab9e695acde34c9a336bf4805882 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 08:07:41 +0000
Subject: [PATCH] python3-babel: upgrade 2.13.0 -> 2.13.1

---
 .../python/{python3-babel_2.13.0.bb => python3-babel_2.13.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-babel_2.13.0.bb => python3-babel_2.13.1.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-babel_2.13.0.bb b/meta/recipes-devtools/python/python3-babel_2.13.1.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-babel_2.13.0.bb
rename to meta/recipes-devtools/python/python3-babel_2.13.1.bb
index 408f3344bb..6908d81326 100644
--- a/meta/recipes-devtools/python/python3-babel_2.13.0.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.13.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f97d9a63e91407b4c0d01efde91cfc0"
 
-SRC_URI[sha256sum] = "04c3e2d28d2b7681644508f836be388ae49e0cfe91465095340395b60d00f210"
+SRC_URI[sha256sum] = "33e0952d7dd6374af8dbf6768cc4ddf3ccfefc244f9986d4074704f2fbd18900"
 
 PYPI_PACKAGE = "Babel"
 
-- 
2.39.2


--===============5532618225444920723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-babel: PKGV changed from 2.13.0 [default] to 2.13.1 [default]
packages/core2-64-poky-linux/python3-babel: PV changed from "2.13.0" to "2.13.1"
packages/core2-64-poky-linux/python3-babel: SRC_URI changed from "https://files.pythonhosted.org/packages/source/B/Babel/Babel-2.13.0.tar.gz;downloadfilename=Babel-2.13.0.tar.gz" to "https://files.pythonhosted.org/packages/source/B/Babel/Babel-2.13.1.tar.gz;downloadfilename=Babel-2.13.1.tar.gz"
packages/core2-64-poky-linux/python3-babel/python3-babel-dbg: PKGV changed from 2.13.0 [default] to 2.13.1 [default]
packages/core2-64-poky-linux/python3-babel/python3-babel-dbg: PV changed from "2.13.0" to "2.13.1"
packages/core2-64-poky-linux/python3-babel/python3-babel-dev: PKGV changed from 2.13.0 [default] to 2.13.1 [default]
packages/core2-64-poky-linux/python3-babel/python3-babel-dev: PV changed from "2.13.0" to "2.13.1"
packages/core2-64-poky-linux/python3-babel/python3-babel-doc: PKGV changed from 2.13.0 [default] to 2.13.1 [default]
packages/core2-64-poky-linux/python3-babel/python3-babel-doc: PV changed from "2.13.0" to "2.13.1"
packages/core2-64-poky-linux/python3-babel/python3-babel-locale: PKGV changed from 2.13.0 [default] to 2.13.1 [default]
packages/core2-64-poky-linux/python3-babel/python3-babel-locale: PV changed from "2.13.0" to "2.13.1"
packages/core2-64-poky-linux/python3-babel/python3-babel-src: PKGV changed from 2.13.0 [default] to 2.13.1 [default]
packages/core2-64-poky-linux/python3-babel/python3-babel-src: PV changed from "2.13.0" to "2.13.1"
packages/core2-64-poky-linux/python3-babel/python3-babel-staticdev: PKGV changed from 2.13.0 [default] to 2.13.1 [default]
packages/core2-64-poky-linux/python3-babel/python3-babel-staticdev: PV changed from "2.13.0" to "2.13.1"
packages/core2-64-poky-linux/python3-babel/python3-babel: PKGV changed from 2.13.0 [default] to 2.13.1 [default]
packages/core2-64-poky-linux/python3-babel/python3-babel: PV changed from "2.13.0" to "2.13.1"
packages/core2-64-poky-linux/python3-babel/python3-babel: PKGSIZE changed from 32464871 to 32464910 (+0%)
Changes to packages/core2-64-poky-linux/python3-babel (sysroot):
  /usr/lib/python3.11/site-packages/Babel-2.13.0.dist-info moved to /usr/lib/python3.11/site-packages/Babel-2.13.1.dist-info

--===============5532618225444920723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-babel (sysroot):
  /usr/lib/python3.11/site-packages/Babel-2.13.0.dist-info moved to /usr/lib/python3.11/site-packages/Babel-2.13.1.dist-info

--===============5532618225444920723==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-babel-upgrade-2.13.0-2.13.1.patch"

RnJvbSAxZWFiMzk1ZDkzN2JhYjllNjk1YWNkZTM0YzlhMzM2YmY0ODA1ODgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwODowNzo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYmFiZWw6IHVwZ3JhZGUgMi4xMy4wIC0+IDIuMTMuMQoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLWJhYmVsXzIuMTMuMC5iYiA9PiBweXRob24zLWJhYmVsXzIuMTMuMS5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWJhYmVsXzIuMTMuMC5iYiA9PiBw
eXRob24zLWJhYmVsXzIuMTMuMS5iYn0gKDg2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmFiZWxfMi4xMy4wLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWJhYmVsXzIuMTMuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDg2
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmFiZWxf
Mi4xMy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
YmFiZWxfMi4xMy4xLmJiCmluZGV4IDQwOGYzMzQ0YmIuLjY5MDhkODEzMjYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iYWJlbF8yLjEzLjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJhYmVsXzIuMTMuMS5iYgpA
QCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cDovL2JhYmVsLmVkZ2V3YWxsLm9yZy8iCiBM
SUNFTlNFID0gIkJTRC0zLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VO
U0U7bWQ1PTBmOTdkOWE2M2U5MTQwN2I0YzBkMDFlZmRlOTFjZmMwIgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiMDRjM2UyZDI4ZDJiNzY4MTY0NDUwOGY4MzZiZTM4OGFlNDllMGNmZTkxNDY1MDk1
MzQwMzk1YjYwZDAwZjIxMCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzM2UwOTUyZDdkZDYzNzRh
ZjhkYmY2NzY4Y2M0ZGRmM2NjZmVmYzI0NGY5OTg2ZDQwNzQ3MDRmMmZiZDE4OTAwIgogCiBQWVBJ
X1BBQ0tBR0UgPSAiQmFiZWwiCiAKLS0gCjIuMzkuMgoK

--===============5532618225444920723==--

