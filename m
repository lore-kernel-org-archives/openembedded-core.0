Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B88CCF9EF
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:36 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.17951.1759325539891320033
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ftMHzLKO;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=RfDd2O4t;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101999ff986f5-38c4977e-9683-4fb1-a465-804e59a63c94-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GlVGkmCfffMR1ni5rFuDqZctTkp4rCNccX5l09vdKUU=;
	b=ftMHzLKOvNWq5aaJN1kpbv0tdo9i6DiIRtmZYd7o0lYg0PyLzJj4j329RG53YrRW
	hFw9czyMSFZWzG0+JzDpuZimvMhNey2ceqVLwfMHxIEi81Dnexo2WTDKyPwm/75sqw9
	CfyB1FzejL1ZjugBoItIKDXHDGSUV3Z9PV/3if9Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GlVGkmCfffMR1ni5rFuDqZctTkp4rCNccX5l09vdKUU=;
	b=RfDd2O4tm6jZMNp/Rd+mf7EAF0mp58PMaKmhIU/JvJ2wlfKV4fLJKCdLR0TGzKFg
	bo2d6MGCtP/pDBNhnfkK4sKz0uMp0S3hqrKmiwubzisqTlUYMEU9ZIRxCwITF7Y7Tkk
	oXhYdV4PSpocbrT3Bzxoux8Im+b1jQEZLe95lJJM=
Content-Type: multipart/mixed; boundary="===============7963128656866891600=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] puzzles: upgrading to e00cb46718b6eed1b67197ba5a27f2c3be7b74b5
 SUCCEEDED
Message-ID: <010101999ff986f5-38c4977e-9683-4fb1-a465-804e59a63c94-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224290

--===============7963128656866891600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *puzzles* to *e00cb46718b6eed1b67197ba5a27f2c3be7b74b5* has Succeeded.

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
From 28f70b32bda59da41b9f7fb7e4332be6f3b660c8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 12:58:05 +0000
Subject: [PATCH] puzzles: upgrade to latest revision

---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 91b5740df3..3125239077 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "a7c7826bce5cbb9b9c337c11b9b7f8b278e76fba"
+SRCREV = "e00cb46718b6eed1b67197ba5a27f2c3be7b74b5"
 PE = "2"
 PV = "0.0+git"
 
-- 
2.47.1


--===============7963128656866891600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+e00cb46718
packages/x86-64-v3-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 21986144 to 21987136 (+0%)
packages/x86-64-v3-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+e00cb46718
packages/x86-64-v3-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+e00cb46718
packages/x86-64-v3-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+e00cb46718
packages/x86-64-v3-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+e00cb46718
packages/x86-64-v3-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3865943 to 3867633 (+0%)
packages/x86-64-v3-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+e00cb46718
packages/x86-64-v3-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+e00cb46718

--===============7963128656866891600==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSAyOGY3MGIzMmJkYTU5ZGE0MWI5ZjdmYjdlNDMzMmJlNmYzYjY2MGM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAxMjo1ODowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB1
enpsZXM6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1zYXRv
L3B1enpsZXMvcHV6emxlc19naXQuYmIgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by9wdXp6
bGVzL3B1enpsZXNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dp
dC5iYgppbmRleCA5MWI1NzQwZGYzLi4zMTI1MjM5MDc3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc2F0by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3B1
enpsZXMvcHV6emxlc19naXQuYmIKQEAgLTEwLDcgKzEwLDcgQEAgUkVRVUlSRURfRElTVFJPX0ZF
QVRVUkVTID0gIngxMSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0LnRhcnRhcnVzLm9yZy9zaW1vbi9w
dXp6bGVzLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwcyIKIAogVVBTVFJFQU1fQ0hFQ0tf
Q09NTUlUUyA9ICIxIgotU1JDUkVWID0gImE3Yzc4MjZiY2U1Y2JiOWI5YzMzN2MxMWI5YjdmOGIy
NzhlNzZmYmEiCitTUkNSRVYgPSAiZTAwY2I0NjcxOGI2ZWVkMWI2NzE5N2JhNWEyN2YyYzNiZTdi
NzRiNSIKIFBFID0gIjIiCiBQViA9ICIwLjArZ2l0IgogCi0tIAoyLjQ3LjEKCg==

--===============7963128656866891600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+e00cb46718
packages/x86-64-v3-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+e00cb46718
packages/x86-64-v3-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+e00cb46718
packages/x86-64-v3-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+e00cb46718
packages/x86-64-v3-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+e00cb46718
packages/x86-64-v3-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+e00cb46718
packages/x86-64-v3-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+e00cb46718

--===============7963128656866891600==--

