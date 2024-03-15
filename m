Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D974FC54EE5
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:14 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1247.1710522012364854045
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EPcEQLE+;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=tuRJaFQk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018e430e9060-a05e86f1-ae08-43e8-afca-8e3daf582c73-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522011;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=WKO86sOAtlGgNmaIAZY+moWeePiZJaA3TOU1wFcT6sM=;
	b=EPcEQLE+MRlwJJ4IxkLExWWrCpmGChNjchqtPTBMegwz/TUvUOav/cjZT9BHx+zZ
	K7UJyv6Ij7G9TQEcQL5oiyhlh7CTpuIci2dK3WccbSMdWmt6a38uBMzft98dP3BrXk+
	jFM4nQS9JcZn9n0QXbCafJBgYrdLvBrXEwUlBBlA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522011;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=WKO86sOAtlGgNmaIAZY+moWeePiZJaA3TOU1wFcT6sM=;
	b=tuRJaFQk+UuWCXxt0DdnhgSRCBlrFrDxkkFMIDdfrnaIohx6xOB4r0rtvCFWOCto
	yRiv+fQbjI2xxpAm2NrD4zmgTXlB+wSMMWPGkI9vftHC4T7Z8c3Qd1jiS/vYX1+woBU
	iY5QYDXgnmlRv9lJPlXJ75FssRmyCZDZATUqZ6Ts=
Content-Type: multipart/mixed; boundary="===============7204056126335505212=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.44 SUCCEEDED
Message-ID: <0101018e430e9060-a05e86f1-ae08-43e8-afca-8e3daf582c73-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197181

--===============7204056126335505212==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *repo* to *2.44* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.42-2.44.patch
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
From 4168a0404d8415c8a3774ef75b005d93c97c5146 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 09:36:13 +0000
Subject: [PATCH] repo: upgrade 2.42 -> 2.44

---
 meta/recipes-devtools/repo/{repo_2.42.bb => repo_2.44.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.42.bb => repo_2.44.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.42.bb b/meta/recipes-devtools/repo/repo_2.44.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.42.bb
rename to meta/recipes-devtools/repo/repo_2.44.bb
index 9bb5000fab..875897851a 100644
--- a/meta/recipes-devtools/repo/repo_2.42.bb
+++ b/meta/recipes-devtools/repo/repo_2.44.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            "
-SRCREV = "5554572f02537b8646139d59ab520e59e1d5f7b3"
+SRCREV = "fff1d2d74c2078b62cc9c2561330e41a842dc197"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.42.0


--===============7204056126335505212==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/repo: PV changed from "2.42" to "2.44"
packages/core2-64-poky-linux/repo: PKGV changed from 2.42 [default] to 2.44 [default]
packages/core2-64-poky-linux/repo/repo-dbg: PV changed from "2.42" to "2.44"
packages/core2-64-poky-linux/repo/repo-dbg: PKGV changed from 2.42 [default] to 2.44 [default]
packages/core2-64-poky-linux/repo/repo-dev: PV changed from "2.42" to "2.44"
packages/core2-64-poky-linux/repo/repo-dev: PKGV changed from 2.42 [default] to 2.44 [default]
packages/core2-64-poky-linux/repo/repo-doc: PV changed from "2.42" to "2.44"
packages/core2-64-poky-linux/repo/repo-doc: PKGV changed from 2.42 [default] to 2.44 [default]
packages/core2-64-poky-linux/repo/repo-locale: PV changed from "2.42" to "2.44"
packages/core2-64-poky-linux/repo/repo-locale: PKGV changed from 2.42 [default] to 2.44 [default]
packages/core2-64-poky-linux/repo/repo-src: PV changed from "2.42" to "2.44"
packages/core2-64-poky-linux/repo/repo-src: PKGV changed from 2.42 [default] to 2.44 [default]
packages/core2-64-poky-linux/repo/repo-staticdev: PV changed from "2.42" to "2.44"
packages/core2-64-poky-linux/repo/repo-staticdev: PKGV changed from 2.42 [default] to 2.44 [default]
packages/core2-64-poky-linux/repo/repo: PV changed from "2.42" to "2.44"
packages/core2-64-poky-linux/repo/repo: PKGV changed from 2.42 [default] to 2.44 [default]

--===============7204056126335505212==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-repo-upgrade-2.42-2.44.patch"

RnJvbSA0MTY4YTA0MDRkODQxNWM4YTM3NzRlZjc1YjAwNWQ5M2M5N2M1MTQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMDk6MzY6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZXBvOiB1cGdyYWRlIDIuNDIgLT4gMi40NAoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVw
by97cmVwb18yLjQyLmJiID0+IHJlcG9fMi40NC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcmVwby97cmVwb18yLjQyLmJiID0+IHJlcG9fMi40NC5iYn0gKDk0JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNDIuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcmVwby9yZXBvXzIuNDQuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjQyLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNDQuYmIKaW5kZXggOWJiNTAwMGZhYi4uODc1
ODk3ODUxYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjQy
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi40NC5iYgpAQCAtMTEs
NyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0zYjgzZWY5
NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9nZXJyaXQuZ29v
Z2xlc291cmNlLmNvbS9naXQtcmVwby5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4gXAog
ICAgICAgICAgICAiCi1TUkNSRVYgPSAiNTU1NDU3MmYwMjUzN2I4NjQ2MTM5ZDU5YWI1MjBlNTll
MWQ1ZjdiMyIKK1NSQ1JFViA9ICJmZmYxZDJkNzRjMjA3OGI2MmNjOWMyNTYxMzMwZTQxYTg0MmRj
MTk3IgogCiBNSVJST1JTICs9ICJnaXQ6Ly9nZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9naXQtcmVw
by5naXQgZ2l0Oi8vZ2l0aHViLmNvbS9HZXJyaXRDb2RlUmV2aWV3L2dpdC1yZXBvLmdpdCIKIAot
LSAKMi40Mi4wCgo=

--===============7204056126335505212==--

