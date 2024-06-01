Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2ADAC25B76
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:41 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.42229.1717263217979766766
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ZOAvEot+;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=cBzhxvaT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018fd4dd3a61-044c713d-42f8-4a8a-a02e-efd886394b89-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CavigTsrFysDXJh0xDG7FAdqsEN5eqdX4yXsvmXOmOM=;
	b=ZOAvEot+4A39aNn6FwkwAtrkpNF1SHqxNCH9Wbeev/9Wlijc2I80mTnJx+52XPGH
	CXYGsByzNGbiIVmK7quXtgT3Dn3S3cAjJYL+aXtNWDug6Wlt+nAWeYzTDdhbJaNzQg7
	yxh5n8l98SrPvPQjNxDRkloytIe7C0HIv+6S4Zpg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CavigTsrFysDXJh0xDG7FAdqsEN5eqdX4yXsvmXOmOM=;
	b=cBzhxvaTNGCXL59zgjX39FS8C0r2LrUB70xcGlvd/0Iz8+TGGvjBn+f3eV/mzp9o
	lMGi2BS/Vqz8qKvLOwT5Do3bFFlr0JRqyyyWPzcbg9HCN4TQONhAvzxUrGOvrj5pVrM
	altVWt7Hc/mN1fFXZvEzCbJjH9lqmJhvDQWK+QsA=
Content-Type: multipart/mixed; boundary="===============1698850501076861882=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to fd304c53cc45dc05b3f95c20a466e20a7e1c9194
 SUCCEEDED
Message-ID: <0101018fd4dd3a61-044c713d-42f8-4a8a-a02e-efd886394b89-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200179

--===============1698850501076861882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *fd304c53cc45dc05b3f95c20a466e20a7e1c9194* has Succeeded.

Next steps:
    - apply the patch: git am 0001-puzzles-upgrade-to-latest-revision.patch
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
From b3583a9bf88bad1318ded62a8359635a53ec1c20 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jun 2024 15:29:37 +0000
Subject: [PATCH] puzzles: upgrade to latest revision

---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index e9403ee130..0ed066a5b5 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "80aac3104096aee4057b675c53ece8e60793aa90"
+SRCREV = "fd304c53cc45dc05b3f95c20a466e20a7e1c9194"
 PE = "2"
 PV = "0.0+git"
 
-- 
2.44.0


--===============1698850501076861882==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSBiMzU4M2E5YmY4OGJhZDEzMThkZWQ2MmE4MzU5NjM1YTUzZWMxYzIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdW4gMjAyNCAxNToyOTozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB1
enpsZXM6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1zYXRv
L3B1enpsZXMvcHV6emxlc19naXQuYmIgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by9wdXp6
bGVzL3B1enpsZXNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dp
dC5iYgppbmRleCBlOTQwM2VlMTMwLi4wZWQwNjZhNWI1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc2F0by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3B1
enpsZXMvcHV6emxlc19naXQuYmIKQEAgLTEwLDcgKzEwLDcgQEAgUkVRVUlSRURfRElTVFJPX0ZF
QVRVUkVTID0gIngxMSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0LnRhcnRhcnVzLm9yZy9zaW1vbi9w
dXp6bGVzLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwcyIKIAogVVBTVFJFQU1fQ0hFQ0tf
Q09NTUlUUyA9ICIxIgotU1JDUkVWID0gIjgwYWFjMzEwNDA5NmFlZTQwNTdiNjc1YzUzZWNlOGU2
MDc5M2FhOTAiCitTUkNSRVYgPSAiZmQzMDRjNTNjYzQ1ZGMwNWIzZjk1YzIwYTQ2NmUyMGE3ZTFj
OTE5NCIKIFBFID0gIjIiCiBQViA9ICIwLjArZ2l0IgogCi0tIAoyLjQ0LjAKCg==

--===============1698850501076861882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 19609384 to 19609416 (+0%)
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3838603 to 3839116 (+0%)
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc

--===============1698850501076861882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc

--===============1698850501076861882==--

