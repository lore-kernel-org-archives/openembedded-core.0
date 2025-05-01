Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 257BBC3ABCD
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:45 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1789.1746113616102970307
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=R3Qzkawl;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Dx2d5un4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101968c7b5d99-564ebacd-f78d-494f-a022-a527fe65dfa3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113617;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FKbNc4GvHSlzXXcbvuPmG3qm4EagPLU0bq2RqZQLEa8=;
	b=R3QzkawlLyuoTkNLCobz4HCMf7HsEGYfs1PmWLbCteUgIOYMmOn7oPuFDQPdd9EC
	TRRT0dtL6MBInlLocoTyyiBkmP9407caN0PFJdLKZ7tNvEUsqiaURBFaZqx/252UscY
	hIRUdUK5bJ5ERpaP4a2lMr3NE9aAG/Jl/GqrFg0E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113617;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FKbNc4GvHSlzXXcbvuPmG3qm4EagPLU0bq2RqZQLEa8=;
	b=Dx2d5un4ALO1mIZSdevP0R0ZHB6ejyt1OX4jYt+n6B7909KG+jjld/qwika47Zjf
	lYcCLXNk11yAbCZ737KoR1bY66nZlRkWCQsdbthPoVdf4nXifs62wtbQCZiYZ84oF/n
	v4lg/P/QF0RO2SDiUq4Qv9WncTRw7sdXolCAD0AA=
Content-Type: multipart/mixed; boundary="===============0511444450165425024=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mmc-utils: upgrading to
 a23ad7875b89df0dedc23f0b173926374f01bc76 SUCCEEDED
Message-ID: <010101968c7b5d99-564ebacd-f78d-494f-a022-a527fe65dfa3-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215818

--===============0511444450165425024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mmc-utils* to *a23ad7875b89df0dedc23f0b173926374f01bc76* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mmc-utils-upgrade-to-latest-revision.patch
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
From 293abc6a58703c50445e6f9313290fb46e320c9e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 08:39:08 +0000
Subject: [PATCH] mmc-utils: upgrade to latest revision

---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index a5e9d53deb..043ac71846 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "2aef4cd9a84ddc76349fc0d7e10d675e7fa596fa"
+SRCREV = "a23ad7875b89df0dedc23f0b173926374f01bc76"
 
 PV = "0.1+git"
 
-- 
2.47.1


--===============0511444450165425024==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mmc-utils-upgrade-to-latest-revision.patch"

RnJvbSAyOTNhYmM2YTU4NzAzYzUwNDQ1ZTZmOTMxMzI5MGZiNDZlMzIwYzllIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAwODozOTowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1t
Yy11dGlsczogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL21tYy9tbWMtdXRpbHNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL21tYy9tbWMtdXRpbHNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21tYy9tbWMt
dXRpbHNfZ2l0LmJiCmluZGV4IGE1ZTlkNTNkZWIuLjA0M2FjNzE4NDYgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbW1jL21tYy11dGlsc19naXQuYmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0Ug
PSAiR1BMLTIuMC1vbmx5IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vbW1jLmM7YmVnaW5s
aW5lPTE7ZW5kbGluZT0yMDttZDU9ZmFlMzI3OTJlMjBmNGQyN2FkZTFjNWE3NjJkMTZiN2QiCiAK
IFNSQ0JSQU5DSCA/PSAibWFzdGVyIgotU1JDUkVWID0gIjJhZWY0Y2Q5YTg0ZGRjNzYzNDlmYzBk
N2UxMGQ2NzVlN2ZhNTk2ZmEiCitTUkNSRVYgPSAiYTIzYWQ3ODc1Yjg5ZGYwZGVkYzIzZjBiMTcz
OTI2Mzc0ZjAxYmM3NiIKIAogUFYgPSAiMC4xK2dpdCIKIAotLSAKMi40Ny4xCgo=

--===============0511444450165425024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+2aef4cd9a8 to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dbg: PKGSIZE changed from 351136 to 357112 (+2%)
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+2aef4cd9a8 to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+2aef4cd9a8 to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+2aef4cd9a8 to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+2aef4cd9a8 to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-src: PKGSIZE changed from 220251 to 225668 (+2%)
packages/core2-64-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+2aef4cd9a8 to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+2aef4cd9a8 to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils: PKGSIZE changed from 123600 to 127632 (+3%)

--===============0511444450165425024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+2aef4cd9a8 to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+2aef4cd9a8 to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+2aef4cd9a8 to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+2aef4cd9a8 to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+2aef4cd9a8 to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+2aef4cd9a8 to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+2aef4cd9a8 to 0.1+git0+a23ad7875b

--===============0511444450165425024==--

