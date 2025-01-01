Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE37E7718B
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:35 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.11337.1735723943229020255
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Rgn2znxo;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=VQyY3nVy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101942135af85-02e5d461-8330-4197-8371-27ae114e26e1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723954;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+uKMta5CrB3+nIoZhEnAT4L14NmsnBMLL+D4THlWfeU=;
	b=Rgn2znxoO5RVLNK1TkW717ePYMJ7SgoFbJ9S8pRbN2aWvnhhfNccvYRJpucTsVhn
	z8Y2CqX2QhoaxWoBeJyFqhMVXFmkvRZ5sKx+K+Y9/XIftqt6Gq+ZjHpYX2JaEexb98/
	Cx29lfxc5Wk9lqM7jC8UVjzvxiChsa0PryXBn+H0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723954;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+uKMta5CrB3+nIoZhEnAT4L14NmsnBMLL+D4THlWfeU=;
	b=VQyY3nVyYietS5XNcHrWoOBgDH8oRak1o06aGILzeutFl7rCtrvxEf+fDwyb1mOX
	7l5KBgNwD+VQ3cIyq8eLYzj9seqQaRH3S3XIm7RzEpn5uCtbCFsd7HdvFoWoU6SMpsx
	Iz0c4JUGcZOOOomh7r+lZg9QeWD02HCUXzSOANs8=
Content-Type: multipart/mixed; boundary="===============2321063381146356156=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 79be403101d055d2fde3611a5f133135d4094ee9
 SUCCEEDED
Message-ID: <010101942135af85-02e5d461-8330-4197-8371-27ae114e26e1-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209239

--===============2321063381146356156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *puzzles* to *79be403101d055d2fde3611a5f133135d4094ee9* has Succeeded.

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
From f298d559307ff05954ae2890908f066c0507adf7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jan 2025 08:49:10 +0000
Subject: [PATCH] puzzles: upgrade to latest revision

---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 17ac1fe7e2..677a9e291e 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "8e83f39eb989d36f10fcf4be7c4dd5eaa0e69f02"
+SRCREV = "79be403101d055d2fde3611a5f133135d4094ee9"
 PE = "2"
 PV = "0.0+git"
 
-- 
2.44.1


--===============2321063381146356156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 19791960 to 19802064 (+0%)
packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+8e83f39eb9 to 0.0+git0+79be403101
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+8e83f39eb9 to 0.0+git0+79be403101
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+8e83f39eb9 to 0.0+git0+79be403101
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+8e83f39eb9 to 0.0+git0+79be403101
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3849034 to 3849408 (+0%)
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+8e83f39eb9 to 0.0+git0+79be403101
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+8e83f39eb9 to 0.0+git0+79be403101
packages/core2-64-poky-linux/puzzles/puzzles: PKGSIZE changed from 7011482 to 7019674 (+0%)
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+8e83f39eb9 to 0.0+git0+79be403101

--===============2321063381146356156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+8e83f39eb9 to 0.0+git0+79be403101
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+8e83f39eb9 to 0.0+git0+79be403101
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+8e83f39eb9 to 0.0+git0+79be403101
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+8e83f39eb9 to 0.0+git0+79be403101
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+8e83f39eb9 to 0.0+git0+79be403101
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+8e83f39eb9 to 0.0+git0+79be403101
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+8e83f39eb9 to 0.0+git0+79be403101

--===============2321063381146356156==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSBmMjk4ZDU1OTMwN2ZmMDU5NTRhZTI4OTA5MDhmMDY2YzA1MDdhZGY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKYW4gMjAyNSAwODo0OToxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB1
enpsZXM6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1zYXRv
L3B1enpsZXMvcHV6emxlc19naXQuYmIgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by9wdXp6
bGVzL3B1enpsZXNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dp
dC5iYgppbmRleCAxN2FjMWZlN2UyLi42NzdhOWUyOTFlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc2F0by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3B1
enpsZXMvcHV6emxlc19naXQuYmIKQEAgLTEwLDcgKzEwLDcgQEAgUkVRVUlSRURfRElTVFJPX0ZF
QVRVUkVTID0gIngxMSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0LnRhcnRhcnVzLm9yZy9zaW1vbi9w
dXp6bGVzLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwcyIKIAogVVBTVFJFQU1fQ0hFQ0tf
Q09NTUlUUyA9ICIxIgotU1JDUkVWID0gIjhlODNmMzllYjk4OWQzNmYxMGZjZjRiZTdjNGRkNWVh
YTBlNjlmMDIiCitTUkNSRVYgPSAiNzliZTQwMzEwMWQwNTVkMmZkZTM2MTFhNWYxMzMxMzVkNDA5
NGVlOSIKIFBFID0gIjIiCiBQViA9ICIwLjArZ2l0IgogCi0tIAoyLjQ0LjEKCg==

--===============2321063381146356156==--

