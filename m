Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 739D1C4450F
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 06:31:42 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9787.1783837893762551014
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 23:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WExMytpk;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hvGXESCQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019f550620a5-b5f8b06a-bc5a-4397-8350-8a197c33eda4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783837892;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8Lp59Xjhk6iBzqesQcVftC7aAosbzANxT+DeXKRvmA8=;
	b=WExMytpkTQ2qjz/6Bgj61uC2EGuMZxJFPtvmpmurE4fdF5/+9s7YNFy+pZ8sgKoa
	AXKE/dG4w9x6CnimQ9KkhCrH8hCrNDL5Gofr7p04GA2RElzl/FKQKlgnovEA8usRzjE
	8yQ0a3tr/II58ODrJCdK3LdGXSvJIEiUliTwk+2s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783837892;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8Lp59Xjhk6iBzqesQcVftC7aAosbzANxT+DeXKRvmA8=;
	b=hvGXESCQ2sDi9z4sU3Ss+iVAZNRwHDDEE3WqSvl5FhVCUbcLQLuA544odKyF4NV0
	5ISaAw2y9ZdglXow7v5+lKg06tyd1jxfNUzcUBgAQyfT5x+bI792lzi3djxlZtmhfmY
	pvyERbo4U7oO7onPU9qKy3LQG+LXKuywEabTcSfk=
Content-Type: multipart/mixed; boundary="===============2968076250668718156=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gn: upgrading to d2f537b1e397daa13e02a8085feb32f5ad7c5dec
 SUCCEEDED
Message-ID: <0101019f550620a5-b5f8b06a-bc5a-4397-8350-8a197c33eda4-000000@us-west-2.amazonses.com>
Date: Sun, 12 Jul 2026 06:31:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.12-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 06:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240757

--===============2968076250668718156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gn* to *d2f537b1e397daa13e02a8085feb32f5ad7c5dec* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gn-upgrade-to-latest-revision.patch
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
From b6f7d765fafa159658051336cec37ccfc7d1a58f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 12 Jul 2026 05:29:41 +0000
Subject: [PATCH] gn: upgrade to latest revision

---
 meta/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index 64217adbcb..40466136a4 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -8,7 +8,7 @@ UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main \
 "
-SRCREV = "1d86777e7f2562a86ecea77d1809ac4f82bb5bfe"
+SRCREV = "d2f537b1e397daa13e02a8085feb32f5ad7c5dec"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""
-- 
2.47.1


--===============2968076250668718156==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gn-upgrade-to-latest-revision.patch"

RnJvbSBiNmY3ZDc2NWZhZmExNTk2NTgwNTEzMzZjZWMzN2NjZmM3ZDFhNThmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTIgSnVsIDIwMjYgMDU6Mjk6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bjogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2duL2duX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nbi9nbl9naXQu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ24vZ25fZ2l0LmJiCmluZGV4IDY0MjE3YWRiY2Iu
LjQwNDY2MTM2YTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nbi9nbl9naXQu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2duL2duX2dpdC5iYgpAQCAtOCw3ICs4LDcg
QEAgVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIxIgogCiBTUkNfVVJJID0gImdpdDovL2duLmdv
b2dsZXNvdXJjZS5jb20vZ247cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4gXAogIgotU1JDUkVW
ID0gIjFkODY3NzdlN2YyNTYyYTg2ZWNlYTc3ZDE4MDlhYzRmODJiYjViZmUiCitTUkNSRVYgPSAi
ZDJmNTM3YjFlMzk3ZGFhMTNlMDJhODA4NWZlYjMyZjVhZDdjNWRlYyIKIFBWID0gIjArZ2l0Igog
CiBCQl9HSVRfU0hBTExPVyA9ICIiCi0tIAoyLjQ3LjEKCg==

--===============2968076250668718156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+1d86777e7f to 0+git0+d2f537b1e3
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+1d86777e7f to 0+git0+d2f537b1e3
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+1d86777e7f to 0+git0+d2f537b1e3
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+1d86777e7f to 0+git0+d2f537b1e3
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+1d86777e7f to 0+git0+d2f537b1e3
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+1d86777e7f to 0+git0+d2f537b1e3
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+1d86777e7f to 0+git0+d2f537b1e3

--===============2968076250668718156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+1d86777e7f to 0+git0+d2f537b1e3
packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGSIZE changed from 109933832 to 110364904 (+0%)
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+1d86777e7f to 0+git0+d2f537b1e3
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+1d86777e7f to 0+git0+d2f537b1e3
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+1d86777e7f to 0+git0+d2f537b1e3
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+1d86777e7f to 0+git0+d2f537b1e3
packages/x86-64-v3-poky-linux/gn/gn-src: PKGSIZE changed from 3248818 to 3257349 (+0%)
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+1d86777e7f to 0+git0+d2f537b1e3
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+1d86777e7f to 0+git0+d2f537b1e3
packages/x86-64-v3-poky-linux/gn/gn: PKGSIZE changed from 4108456 to 4141224 (+1%)

--===============2968076250668718156==--

