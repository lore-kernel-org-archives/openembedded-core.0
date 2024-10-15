Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F1C3CFC29E
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:02 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.11787.1728994547021533567
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hN5LKYER;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=or/sERVT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010192901b383e-36f29e67-af9d-4e03-9b9d-9b72e76010e7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VzDSIuWuXJRrqQflDSpM9TNJc72Q4AUsvydIkHw9nZ8=;
	b=hN5LKYER5/sIv0IYHClkHl1SUqz37jgaza2feQoK5WYbwfUBfheLHy3TIVSD1UEy
	gCRq56lPhSgX7ylViv3Hmk2o2HQ531+zrST8Nkx8pOxN9MHlYMoGZaMTQoAtYe1gft8
	i7IT3xfLj29lMCo+dBKeb5X8lzrrDBFIprAqADKQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VzDSIuWuXJRrqQflDSpM9TNJc72Q4AUsvydIkHw9nZ8=;
	b=or/sERVTyk+MvtuB922nGBzd573Um5VldurpbmAH50uW54nwjGxAdHRNU8SzB6DD
	5q1LztFtI3MlQXuzqLEDOZ9slZ6eSBFq6Z8lVkIH9RLgPwRE1+RLDf5BcIa9hPn/I4s
	gum1wubn8bcAvRy0MIFJJjnpeVgAwvEctVTm9Xg0=
Content-Type: multipart/mixed; boundary="===============5806067026593639921=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonschema-specifications: upgrading to 2024.10.1
 SUCCEEDED
Message-ID: <01010192901b383e-36f29e67-af9d-4e03-9b9d-9b72e76010e7-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:15:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205840

--===============5806067026593639921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-jsonschema-specifications* to *2024.10.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonschema-specifications-upgrade-2023.12.1-.patch
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
From 23762796e84115b3df4d71b447697807954cc137 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 08:29:07 +0000
Subject: [PATCH] python3-jsonschema-specifications: upgrade 2023.12.1 ->
 2024.10.1

---
 ...3.12.1.bb => python3-jsonschema-specifications_2024.10.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema-specifications_2023.12.1.bb => python3-jsonschema-specifications_2024.10.1.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb b/meta/recipes-devtools/python/python3-jsonschema-specifications_2024.10.1.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb
rename to meta/recipes-devtools/python/python3-jsonschema-specifications_2024.10.1.bb
index 4ee0dd9b12..6ef83e0554 100644
--- a/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema-specifications_2024.10.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://pypi.org/project/jsonschema-specifications/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=93eb9740964b59e9ba30281255b044e2"
 
-SRC_URI[sha256sum] = "48a76787b3e70f5ed53f1160d2b81f586e4ca6d1548c5de7085d1682674764cc"
+SRC_URI[sha256sum] = "0f38b83639958ce1152d02a7f062902c41c8fd20d558b0c34344292d417ae272"
 
 inherit pypi python_hatchling
 
-- 
2.44.1


--===============5806067026593639921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-jsonschema-specifications (sysroot):
  /usr/lib/python3.12/site-packages/jsonschema_specifications-2023.12.1.dist-info moved to /usr/lib/python3.12/site-packages/jsonschema_specifications-2024.10.1.dist-info

--===============5806067026593639921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-jsonschema-specifications: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonschema_specifications/jsonschema_specifications-2023.12.1.tar.gz;downloadfilename=jsonschema_specifications-2023.12.1.tar.gz" to "https://files.pythonhosted.org/packages/source/j/jsonschema_specifications/jsonschema_specifications-2024.10.1.tar.gz;downloadfilename=jsonschema_specifications-2024.10.1.tar.gz"
packages/core2-64-poky-linux/python3-jsonschema-specifications: PKGV changed from 2023.12.1 [default] to 2024.10.1 [default]
packages/core2-64-poky-linux/python3-jsonschema-specifications: PV changed from "2023.12.1" to "2024.10.1"
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications-dbg: PKGV changed from 2023.12.1 [default] to 2024.10.1 [default]
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications-dbg: PV changed from "2023.12.1" to "2024.10.1"
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications-dev: PKGV changed from 2023.12.1 [default] to 2024.10.1 [default]
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications-dev: PV changed from "2023.12.1" to "2024.10.1"
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications-doc: PKGV changed from 2023.12.1 [default] to 2024.10.1 [default]
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications-doc: PV changed from "2023.12.1" to "2024.10.1"
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications-locale: PKGV changed from 2023.12.1 [default] to 2024.10.1 [default]
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications-locale: PV changed from "2023.12.1" to "2024.10.1"
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications-src: PKGV changed from 2023.12.1 [default] to 2024.10.1 [default]
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications-src: PV changed from "2023.12.1" to "2024.10.1"
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications-staticdev: PKGV changed from 2023.12.1 [default] to 2024.10.1 [default]
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications-staticdev: PV changed from "2023.12.1" to "2024.10.1"
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications: PKGSIZE changed from 51378 to 51387 (+0%)
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications: PKGV changed from 2023.12.1 [default] to 2024.10.1 [default]
packages/core2-64-poky-linux/python3-jsonschema-specifications/python3-jsonschema-specifications: PV changed from "2023.12.1" to "2024.10.1"
Changes to packages/core2-64-poky-linux/python3-jsonschema-specifications (sysroot):
  /usr/lib/python3.12/site-packages/jsonschema_specifications-2023.12.1.dist-info moved to /usr/lib/python3.12/site-packages/jsonschema_specifications-2024.10.1.dist-info

--===============5806067026593639921==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonschema-specifications-upgrade-2023.12.1-.patch"

RnJvbSAyMzc2Mjc5NmU4NDExNWIzZGY0ZDcxYjQ0NzY5NzgwNzk1NGNjMTM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMDg6Mjk6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWpzb25zY2hlbWEtc3BlY2lmaWNhdGlvbnM6IHVwZ3JhZGUgMjAyMy4xMi4xIC0+CiAy
MDI0LjEwLjEKCi0tLQogLi4uMy4xMi4xLmJiID0+IHB5dGhvbjMtanNvbnNjaGVtYS1zcGVjaWZp
Y2F0aW9uc18yMDI0LjEwLjEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97
cHl0aG9uMy1qc29uc2NoZW1hLXNwZWNpZmljYXRpb25zXzIwMjMuMTIuMS5iYiA9PiBweXRob24z
LWpzb25zY2hlbWEtc3BlY2lmaWNhdGlvbnNfMjAyNC4xMC4xLmJifSAoODYlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1hLXNwZWNp
ZmljYXRpb25zXzIwMjMuMTIuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1qc29uc2NoZW1hLXNwZWNpZmljYXRpb25zXzIwMjQuMTAuMS5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDg2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
anNvbnNjaGVtYS1zcGVjaWZpY2F0aW9uc18yMDIzLjEyLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1hLXNwZWNpZmljYXRpb25zXzIw
MjQuMTAuMS5iYgppbmRleCA0ZWUwZGQ5YjEyLi42ZWY4M2UwNTU0IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYS1zcGVjaWZpY2F0aW9u
c18yMDIzLjEyLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWpzb25zY2hlbWEtc3BlY2lmaWNhdGlvbnNfMjAyNC4xMC4xLmJiCkBAIC01LDcgKzUsNyBAQCBI
T01FUEFHRSA9ICJodHRwczovL3B5cGkub3JnL3Byb2plY3QvanNvbnNjaGVtYS1zcGVjaWZpY2F0
aW9ucy8iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJ
Tkc7bWQ1PTkzZWI5NzQwOTY0YjU5ZTliYTMwMjgxMjU1YjA0NGUyIgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiNDhhNzY3ODdiM2U3MGY1ZWQ1M2YxMTYwZDJiODFmNTg2ZTRjYTZkMTU0OGM1ZGU3
MDg1ZDE2ODI2NzQ3NjRjYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwZjM4YjgzNjM5OTU4Y2Ux
MTUyZDAyYTdmMDYyOTAyYzQxYzhmZDIwZDU1OGIwYzM0MzQ0MjkyZDQxN2FlMjcyIgogCiBpbmhl
cml0IHB5cGkgcHl0aG9uX2hhdGNobGluZwogCi0tIAoyLjQ0LjEKCg==

--===============5806067026593639921==--

