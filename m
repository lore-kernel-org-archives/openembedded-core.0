Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E586C83029
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:57 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.27791.1748786151434291086
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=F81p9YKD;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=a5WxpwNS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101972bc6fdc5-750cd2c6-180f-4f2c-84ac-14089d451315-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786150;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rzA8/2uVV9ZxJMBc3gTlVthDvQTHqCFQqQhMyJCb2nU=;
	b=F81p9YKD+P2l/KsCOecYU432dQsto60oB4upH+IJIeE92Xsspa5j6bFenCB/nEgu
	UcGs+vZiFdFQ4i2FVBwRdQpRtULyYyYJvo8tG0uRF7wtRkjanV/PyCv7eRSOA06zR8A
	SYqGshPACikgWLAAVQ43LOWzoDk58m0wfZnfG6LA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786150;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rzA8/2uVV9ZxJMBc3gTlVthDvQTHqCFQqQhMyJCb2nU=;
	b=a5WxpwNS0z/0iDJINcWPwcN6Y06uRJ/tZUAHXosTTaMqdyIcwSe2V7fkDl41rp1s
	LqNtDRvafXzJuRCqe29ox4SMN8WjH8qGkFH3lW1n/smJg1teFTfFy88uyxS+lUOdm4t
	Fve1cgMMEWD6WROoazMFgzYVeC0LGBx6puJ1euog=
Content-Type: multipart/mixed; boundary="===============1950793118774799844=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 7fa03051562ee81e2a5371f8b3a6d0bb6e646aa0
 SUCCEEDED
Message-ID: <010101972bc6fdc5-750cd2c6-180f-4f2c-84ac-14089d451315-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217656

--===============1950793118774799844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *puzzles* to *7fa03051562ee81e2a5371f8b3a6d0bb6e646aa0* has Succeeded.

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
From 6c7be455df4ba92099031758f6a5534d68f462b5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 12:47:16 +0000
Subject: [PATCH] puzzles: upgrade to latest revision

---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 15f6979bec..23eb20d350 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "7da46412223273b3adf6d513466342b9d3a5c869"
+SRCREV = "7fa03051562ee81e2a5371f8b3a6d0bb6e646aa0"
 PE = "2"
 PV = "0.0+git"
 
-- 
2.47.1


--===============1950793118774799844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 21972928 to 21962600 (-0%)
packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+7da4641222 to 0.0+git0+7fa0305156
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+7da4641222 to 0.0+git0+7fa0305156
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+7da4641222 to 0.0+git0+7fa0305156
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+7da4641222 to 0.0+git0+7fa0305156
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3856462 to 3856684 (+0%)
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+7da4641222 to 0.0+git0+7fa0305156
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+7da4641222 to 0.0+git0+7fa0305156
packages/core2-64-poky-linux/puzzles/puzzles: PKGSIZE changed from 7101594 to 7085210 (-0%)
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+7da4641222 to 0.0+git0+7fa0305156

--===============1950793118774799844==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSA2YzdiZTQ1NWRmNGJhOTIwOTkwMzE3NThmNmE1NTM0ZDY4ZjQ2MmI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAxMjo0NzoxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB1
enpsZXM6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1zYXRv
L3B1enpsZXMvcHV6emxlc19naXQuYmIgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by9wdXp6
bGVzL3B1enpsZXNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dp
dC5iYgppbmRleCAxNWY2OTc5YmVjLi4yM2ViMjBkMzUwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc2F0by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3B1
enpsZXMvcHV6emxlc19naXQuYmIKQEAgLTEwLDcgKzEwLDcgQEAgUkVRVUlSRURfRElTVFJPX0ZF
QVRVUkVTID0gIngxMSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0LnRhcnRhcnVzLm9yZy9zaW1vbi9w
dXp6bGVzLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwcyIKIAogVVBTVFJFQU1fQ0hFQ0tf
Q09NTUlUUyA9ICIxIgotU1JDUkVWID0gIjdkYTQ2NDEyMjIzMjczYjNhZGY2ZDUxMzQ2NjM0MmI5
ZDNhNWM4NjkiCitTUkNSRVYgPSAiN2ZhMDMwNTE1NjJlZTgxZTJhNTM3MWY4YjNhNmQwYmI2ZTY0
NmFhMCIKIFBFID0gIjIiCiBQViA9ICIwLjArZ2l0IgogCi0tIAoyLjQ3LjEKCg==

--===============1950793118774799844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+7da4641222 to 0.0+git0+7fa0305156
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+7da4641222 to 0.0+git0+7fa0305156
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+7da4641222 to 0.0+git0+7fa0305156
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+7da4641222 to 0.0+git0+7fa0305156
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+7da4641222 to 0.0+git0+7fa0305156
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+7da4641222 to 0.0+git0+7fa0305156
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+7da4641222 to 0.0+git0+7fa0305156

--===============1950793118774799844==--

