Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1811BD5CCBE
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:39 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17192.1765872145451731656
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HU2OVVK+;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=gOVT6YO2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019b262ea536-fb2530cb-17da-4518-9dd5-4eb3db857ea1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872149;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yUVxX3z4+6A144/UkB3i9TfxnmR2Ludy48ZXM2QXexM=;
	b=HU2OVVK+3jRXN3DUkkJe6QnaR1AWTldQXJzQfb7CHvObIZNtLEWCAzSJwj16ycGN
	5wPAwl8JhMQxWDY+bDjpCALdHuASI3pDSLS+nlm179UYjbwpJkr9uZ3z+fFCfQZygEA
	RX4S5xNMz02BDRCBCMA/53euysbz1zeJpN7llwKA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872149;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yUVxX3z4+6A144/UkB3i9TfxnmR2Ludy48ZXM2QXexM=;
	b=gOVT6YO2Z7MgnSYHGZfqcwI1L/Xc7MzdL90SCPyBbN30zQsPf+Hrzee4nVHPKm1E
	0c+fxd94epwPz2CJeNPMnGIUUHCb/2PsDKR03bIvHlK4kXSRlW2160NQtd+rcqJiK+c
	4znHH2mJ9K79EIJ8H2j0/ochFn4QoiFbpdJMEiCw=
Content-Type: multipart/mixed; boundary="===============4854364568242574264=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wcwidth: upgrading to 0.2.14 SUCCEEDED
Message-ID: <0101019b262ea536-fb2530cb-17da-4518-9dd5-4eb3db857ea1-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227832

--===============4854364568242574264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-wcwidth* to *0.2.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wcwidth-upgrade-0.2.13-0.2.14.patch
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
From be5d4c8e6f96decb4077a30c3060c5c68e57a27c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 01:38:19 +0000
Subject: [PATCH] python3-wcwidth: upgrade 0.2.13 -> 0.2.14

---
 .../{python3-wcwidth_0.2.13.bb => python3-wcwidth_0.2.14.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.2.13.bb => python3-wcwidth_0.2.14.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb b/meta/recipes-devtools/python/python3-wcwidth_0.2.14.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.2.14.bb
index 71bb1a2703..da2dc60263 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.2.14.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "72ea0c06399eb286d978fdedb6923a9eb47e1c486ce63e9b4e64fc18303972b5"
+SRC_URI[sha256sum] = "4d478375d31bc5395a3c55c40ccdf3354688364cd61c4f6adacaa9215d0b3605"
 
 inherit pypi setuptools3 ptest-python-pytest
 
-- 
2.47.1


--===============4854364568242574264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: FILELIST: directory renamed /usr/lib/python3.13/site-packages/wcwidth-0.2.13.dist-info -> /usr/lib/python3.13/site-packages/wcwidth-0.2.14.dist-info, directory renamed /usr/lib/python3.13/site-packages/wcwidth-0.2.13.dist-info/licenses -> /usr/lib/python3.13/site-packages/wcwidth-0.2.14.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGSIZE changed from 546870 to 616750 (+13%)
Changes to packages/x86-64-v3-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.13/site-packages/wcwidth-0.2.13.dist-info moved to /usr/lib/python3.13/site-packages/wcwidth-0.2.14.dist-info

--===============4854364568242574264==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wcwidth-upgrade-0.2.13-0.2.14.patch"

RnJvbSBiZTVkNGM4ZTZmOTZkZWNiNDA3N2EzMGMzMDYwYzVjNjhlNTdhMjdjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDE6Mzg6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdjd2lkdGg6IHVwZ3JhZGUgMC4yLjEzIC0+IDAuMi4xNAoKLS0tCiAuLi4ve3B5dGhv
bjMtd2N3aWR0aF8wLjIuMTMuYmIgPT4gcHl0aG9uMy13Y3dpZHRoXzAuMi4xNC5iYn0gICAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXdjd2lkdGhfMC4yLjEzLmJi
ID0+IHB5dGhvbjMtd2N3aWR0aF8wLjIuMTQuYmJ9ICg4NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdjd2lkdGhfMC4yLjEzLmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdjd2lkdGhfMC4yLjE0LmJiCnNpbWlsYXJp
dHkgaW5kZXggODQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy13Y3dpZHRoXzAuMi4xMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXdjd2lkdGhfMC4yLjE0LmJiCmluZGV4IDcxYmIxYTI3MDMuLmRhMmRjNjAy
NjMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13Y3dp
ZHRoXzAuMi4xMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
d2N3aWR0aF8wLjIuMTQuYmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0
aHViLmNvbS9qcXVhc3Qvd2N3aWR0aCIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YjE1OTc5YzM5YTI1NDM4OTJmY2E4Y2Q4NmI0YjUyY2Ii
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3MmVhMGMwNjM5OWViMjg2ZDk3OGZkZWRiNjkyM2E5
ZWI0N2UxYzQ4NmNlNjNlOWI0ZTY0ZmMxODMwMzk3MmI1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjRkNDc4Mzc1ZDMxYmM1Mzk1YTNjNTVjNDBjY2RmMzM1NDY4ODM2NGNkNjFjNGY2YWRhY2FhOTIx
NWQwYjM2MDUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMyBwdGVzdC1weXRob24tcHl0ZXN0
CiAKLS0gCjIuNDcuMQoK

--===============4854364568242574264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-wcwidth: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.2.13.tar.gz;downloadfilename=wcwidth-0.2.13.tar.gz" to "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.2.14.tar.gz;downloadfilename=wcwidth-0.2.14.tar.gz"
packages/x86-64-v3-poky-linux/python3-wcwidth: PV changed from "0.2.13" to "0.2.14"
packages/x86-64-v3-poky-linux/python3-wcwidth: PKGV changed from 0.2.13 [default] to 0.2.14 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PV changed from "0.2.13" to "0.2.14"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PKGV changed from 0.2.13 [default] to 0.2.14 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: PV changed from "0.2.13" to "0.2.14"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: PKGV changed from 0.2.13 [default] to 0.2.14 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-doc: PV changed from "0.2.13" to "0.2.14"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-doc: PKGV changed from 0.2.13 [default] to 0.2.14 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-locale: PV changed from "0.2.13" to "0.2.14"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-locale: PKGV changed from 0.2.13 [default] to 0.2.14 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGSIZE changed from 317339 to 317322 (-0%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PV changed from "0.2.13" to "0.2.14"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGV changed from 0.2.13 [default] to 0.2.14 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PV changed from "0.2.13" to "0.2.14"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PKGV changed from 0.2.13 [default] to 0.2.14 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PV changed from "0.2.13" to "0.2.14"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PKGV changed from 0.2.13 [default] to 0.2.14 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGSIZE changed from 546870 to 616750 (+13%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PV changed from "0.2.13" to "0.2.14"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGV changed from 0.2.13 [default] to 0.2.14 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: FILELIST: directory renamed /usr/lib/python3.13/site-packages/wcwidth-0.2.13.dist-info/licenses -> /usr/lib/python3.13/site-packages/wcwidth-0.2.14.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/wcwidth-0.2.13.dist-info -> /usr/lib/python3.13/site-packages/wcwidth-0.2.14.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.13/site-packages/wcwidth-0.2.13.dist-info moved to /usr/lib/python3.13/site-packages/wcwidth-0.2.14.dist-info

--===============4854364568242574264==--

