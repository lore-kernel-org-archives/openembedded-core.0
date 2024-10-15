Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4DFD1F9B1
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:02 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.11808.1728994561598114575
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=aceKCvgx;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=EbHC6YOW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010192901b4b04-b6df2eb8-f03a-4f96-9893-55017d22ebff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994560;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KsJHmf8mUs39B7gUszDO9Pu52fV/XRir5LkdN2HgcgM=;
	b=aceKCvgx9uF3iLl6wGOSZJ+sx+aSLlHdvscocB2JGbTQq0BVJy2KL71GVwT7zBGY
	o4lR+qmoYFKapVGFidCw73BKSTglwvlm5ENnb8j72qhmUUK73Oxmjajys23ai4WeOll
	fOFGCNTek3CZJ9mSOoMXO0aIODA10SmQyTO4ZhOQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994560;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KsJHmf8mUs39B7gUszDO9Pu52fV/XRir5LkdN2HgcgM=;
	b=EbHC6YOW2FDqf5pMW9Rr3rlb/INDmzXjKCm2tN0Tqt98Z8z5dPmW8u7HapHb9kZC
	9TTAx4ZgjE2Iexu0cIxJIJYWenCcW1tK+2rMY2kLjyD2Wjm8Ip7BBUOvDcExmzdq20M
	8T3knIotx4ENuky9crI4PH0rafDLcjLwQfWferHo=
Content-Type: multipart/mixed; boundary="===============5978647703990004040=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] repo: upgrading to 2.48 SUCCEEDED
Message-ID: <01010192901b4b04-b6df2eb8-f03a-4f96-9893-55017d22ebff-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:16:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205858

--===============5978647703990004040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.48* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.47-2.48.patch
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
From d3079c295b55bd3791fe74a7a92e45627722c62a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 09:07:49 +0000
Subject: [PATCH] repo: upgrade 2.47 -> 2.48

---
 meta/recipes-devtools/repo/{repo_2.47.bb => repo_2.48.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.47.bb => repo_2.48.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.47.bb b/meta/recipes-devtools/repo/repo_2.48.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.47.bb
rename to meta/recipes-devtools/repo/repo_2.48.bb
index adebea1c8e..8b72a9e71b 100644
--- a/meta/recipes-devtools/repo/repo_2.47.bb
+++ b/meta/recipes-devtools/repo/repo_2.48.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            "
-SRCREV = "1e19f7dd61923b8835d9c6e1a7e560575dafaf1e"
+SRCREV = "454fdaf1191c87e5c770ab865a911e10e600e178"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.44.1


--===============5978647703990004040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/repo: PV changed from "2.47" to "2.48"
packages/core2-64-poky-linux/repo: PKGV changed from 2.47 [default] to 2.48 [default]
packages/core2-64-poky-linux/repo/repo-dbg: PV changed from "2.47" to "2.48"
packages/core2-64-poky-linux/repo/repo-dbg: PKGV changed from 2.47 [default] to 2.48 [default]
packages/core2-64-poky-linux/repo/repo-dev: PV changed from "2.47" to "2.48"
packages/core2-64-poky-linux/repo/repo-dev: PKGV changed from 2.47 [default] to 2.48 [default]
packages/core2-64-poky-linux/repo/repo-doc: PV changed from "2.47" to "2.48"
packages/core2-64-poky-linux/repo/repo-doc: PKGV changed from 2.47 [default] to 2.48 [default]
packages/core2-64-poky-linux/repo/repo-locale: PV changed from "2.47" to "2.48"
packages/core2-64-poky-linux/repo/repo-locale: PKGV changed from 2.47 [default] to 2.48 [default]
packages/core2-64-poky-linux/repo/repo-src: PV changed from "2.47" to "2.48"
packages/core2-64-poky-linux/repo/repo-src: PKGV changed from 2.47 [default] to 2.48 [default]
packages/core2-64-poky-linux/repo/repo-staticdev: PV changed from "2.47" to "2.48"
packages/core2-64-poky-linux/repo/repo-staticdev: PKGV changed from 2.47 [default] to 2.48 [default]
packages/core2-64-poky-linux/repo/repo: PKGSIZE changed from 46943 to 47175 (+0%)
packages/core2-64-poky-linux/repo/repo: PV changed from "2.47" to "2.48"
packages/core2-64-poky-linux/repo/repo: PKGV changed from 2.47 [default] to 2.48 [default]

--===============5978647703990004040==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-repo-upgrade-2.47-2.48.patch"

RnJvbSBkMzA3OWMyOTViNTViZDM3OTFmZTc0YTdhOTJlNDU2Mjc3MjJjNjJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMDk6MDc6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZXBvOiB1cGdyYWRlIDIuNDcgLT4gMi40OAoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVw
by97cmVwb18yLjQ3LmJiID0+IHJlcG9fMi40OC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcmVwby97cmVwb18yLjQ3LmJiID0+IHJlcG9fMi40OC5iYn0gKDk0JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNDcuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcmVwby9yZXBvXzIuNDguYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjQ3LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNDguYmIKaW5kZXggYWRlYmVhMWM4ZS4uOGI3
MmE5ZTcxYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjQ3
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi40OC5iYgpAQCAtMTEs
NyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0zYjgzZWY5
NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9nZXJyaXQuZ29v
Z2xlc291cmNlLmNvbS9naXQtcmVwby5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4gXAog
ICAgICAgICAgICAiCi1TUkNSRVYgPSAiMWUxOWY3ZGQ2MTkyM2I4ODM1ZDljNmUxYTdlNTYwNTc1
ZGFmYWYxZSIKK1NSQ1JFViA9ICI0NTRmZGFmMTE5MWM4N2U1Yzc3MGFiODY1YTkxMWUxMGU2MDBl
MTc4IgogCiBNSVJST1JTICs9ICJnaXQ6Ly9nZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9naXQtcmVw
by5naXQgZ2l0Oi8vZ2l0aHViLmNvbS9HZXJyaXRDb2RlUmV2aWV3L2dpdC1yZXBvLmdpdCIKIAot
LSAKMi40NC4xCgo=

--===============5978647703990004040==--

