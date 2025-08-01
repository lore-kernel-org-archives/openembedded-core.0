Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D67CA0ED3
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:00 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.88618.1754057264357149762
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UyW8Ys6X;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=miSwjPtX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019865f5fb6a-1e6b454d-3474-48d2-97bc-502113710a56-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057276;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SGe6+RoD5IqE/016ArvSkecybDNTZujBEnqs32W6vc0=;
	b=UyW8Ys6XAv/s3nI4NSLCvgwsnpthXuDMEaqxrLEmxOMRr3dLYTSp2WchcbLw1mTt
	avQbhOAmyGSHDb6OzANwke+LXeV76kfhVZ6cSqJ1jblsUUIxsbq4c05cD82vBNtqbhI
	puvS1q5nozG0UzdJSUKNAeOiFNaI+YN1jUmFx6KM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057276;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SGe6+RoD5IqE/016ArvSkecybDNTZujBEnqs32W6vc0=;
	b=miSwjPtX2PRohDVpDpGyLjKdSNx+Nl++Y+L3B7opF9P/Yg5QRNdVrc7Lveu5JW3a
	dwatRIvunoZIp+g9a+Sd5SYh/Sz0NUYZT8v+wX9+huI4pmo3PN46OOhtntcarMni4o5
	rxkjwK8LrKMrYAGntxQ6Ot7+P/u2gw+5Kkeb1+nU=
Content-Type: multipart/mixed; boundary="===============1911963004356153810=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] repo: upgrading to 2.57.2 SUCCEEDED
Message-ID: <0101019865f5fb6a-1e6b454d-3474-48d2-97bc-502113710a56-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221288

--===============1911963004356153810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.57.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.56-2.57.2.patch
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
From b861e05b3aca090b6ea690ca615f66d74e62c641 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 10:10:37 +0000
Subject: [PATCH] repo: upgrade 2.56 -> 2.57.2

---
 meta/recipes-devtools/repo/{repo_2.56.bb => repo_2.57.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.56.bb => repo_2.57.2.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.56.bb b/meta/recipes-devtools/repo/repo_2.57.2.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.56.bb
rename to meta/recipes-devtools/repo/repo_2.57.2.bb
index efdb9bd0c9..5e126c07a1 100644
--- a/meta/recipes-devtools/repo/repo_2.56.bb
+++ b/meta/recipes-devtools/repo/repo_2.57.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "99b5a17f2c951fe5979100c36e7e1dbb4c61b36c"
+SRCREV = "239fad7146e04c631825c340f23d6e69947aac50"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.1


--===============1911963004356153810==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.56-2.57.2.patch"

RnJvbSBiODYxZTA1YjNhY2EwOTBiNmVhNjkwY2E2MTVmNjZkNzRlNjJjNjQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAxMDoxMDozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
cG86IHVwZ3JhZGUgMi41NiAtPiAyLjU3LjIKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Jl
cG8ve3JlcG9fMi41Ni5iYiA9PiByZXBvXzIuNTcuMi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcmVwby97cmVwb18yLjU2LmJiID0+IHJlcG9fMi41Ny4yLmJifSAoOTQlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi41Ni5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi41Ny4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi41Ni5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjU3LjIuYmIKaW5kZXggZWZkYjli
ZDBjOS4uNWUxMjZjMDdhMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8v
cmVwb18yLjU2LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi41Ny4y
LmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogCiBTUkNfVVJJID0gImdpdDov
L2dlcnJpdC5nb29nbGVzb3VyY2UuY29tL2dpdC1yZXBvLmdpdDtwcm90b2NvbD1odHRwczticmFu
Y2g9bWFpbjt0YWc9diR7UFZ9IFwKICAgICAgICAgICAgIgotU1JDUkVWID0gIjk5YjVhMTdmMmM5
NTFmZTU5NzkxMDBjMzZlN2UxZGJiNGM2MWIzNmMiCitTUkNSRVYgPSAiMjM5ZmFkNzE0NmUwNGM2
MzE4MjVjMzQwZjIzZDZlNjk5NDdhYWM1MCIKIAogTUlSUk9SUyArPSAiZ2l0Oi8vZ2Vycml0Lmdv
b2dsZXNvdXJjZS5jb20vZ2l0LXJlcG8uZ2l0IGdpdDovL2dpdGh1Yi5jb20vR2Vycml0Q29kZVJl
dmlldy9naXQtcmVwby5naXQiCiAKLS0gCjIuNDcuMQoK

--===============1911963004356153810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/repo: PV changed from "2.56" to "2.57.2"
packages/core2-64-poky-linux/repo: SRC_URI changed from "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.56" to "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.57.2"
packages/core2-64-poky-linux/repo: PKGV changed from 2.56 [default] to 2.57.2 [default]
packages/core2-64-poky-linux/repo/repo-dbg: PV changed from "2.56" to "2.57.2"
packages/core2-64-poky-linux/repo/repo-dbg: PKGV changed from 2.56 [default] to 2.57.2 [default]
packages/core2-64-poky-linux/repo/repo-dev: PV changed from "2.56" to "2.57.2"
packages/core2-64-poky-linux/repo/repo-dev: PKGV changed from 2.56 [default] to 2.57.2 [default]
packages/core2-64-poky-linux/repo/repo-doc: PV changed from "2.56" to "2.57.2"
packages/core2-64-poky-linux/repo/repo-doc: PKGV changed from 2.56 [default] to 2.57.2 [default]
packages/core2-64-poky-linux/repo/repo-locale: PV changed from "2.56" to "2.57.2"
packages/core2-64-poky-linux/repo/repo-locale: PKGV changed from 2.56 [default] to 2.57.2 [default]
packages/core2-64-poky-linux/repo/repo-src: PV changed from "2.56" to "2.57.2"
packages/core2-64-poky-linux/repo/repo-src: PKGV changed from 2.56 [default] to 2.57.2 [default]
packages/core2-64-poky-linux/repo/repo-staticdev: PV changed from "2.56" to "2.57.2"
packages/core2-64-poky-linux/repo/repo-staticdev: PKGV changed from 2.56 [default] to 2.57.2 [default]
packages/core2-64-poky-linux/repo/repo: PV changed from "2.56" to "2.57.2"
packages/core2-64-poky-linux/repo/repo: PKGV changed from 2.56 [default] to 2.57.2 [default]

--===============1911963004356153810==--

