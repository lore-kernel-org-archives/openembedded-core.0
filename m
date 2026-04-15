Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782DCF419BD
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:36 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19738.1776261874123920073
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TC1ZeeoW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=1Io2yfjQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019d91754702-4ae60130-de5f-4a67-8b1c-864f1a1bb09f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261875;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hMJxx1fbQdFMEMar/SPyRGHb53Fcu8AICP//U7MsFAc=;
	b=TC1ZeeoWGGm4/JyRuafT9fTjXuJYypjYzWjTJF3F8Y9/mZGjBP/ghAcG7o4vOTTz
	IBIig1gGYmq90hKgxAtJWTPPIYbqlq2v5ti2XqYMXT+dpDdf09F+P7BFk7Vx6a09xxj
	k4kQWSDWekkF+6fCIjuu3+QYaMGm5wB5SHkrY71A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261875;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hMJxx1fbQdFMEMar/SPyRGHb53Fcu8AICP//U7MsFAc=;
	b=1Io2yfjQJoxt3cda/VDImKJxlTwZNL26BGliRTuOs5Qt9emmObPJgvSLcIWntpkl
	wMAIAyvMF6sBy28dZzlLgBC1DTvkyGzWONVKmaMPnhEYV0TVjK0yE1pbpyhObmJaCeg
	11RTQNlfaflI1Q773YU+MC85F26myevM16QG53QQ=
Content-Type: multipart/mixed; boundary="===============1359008033860452698=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gn: upgrading to ec56d4d935a0e2ab9d52b88dd00c93ec51233055
 SUCCEEDED
Message-ID: <0101019d91754702-4ae60130-de5f-4a67-8b1c-864f1a1bb09f-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235222

--===============1359008033860452698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gn* to *ec56d4d935a0e2ab9d52b88dd00c93ec51233055* has Succeeded.

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
From b87de3ba6e2a48d2c05fe03fad7bbe3aeea2364c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 07:00:21 +0000
Subject: [PATCH] gn: upgrade to latest revision

---
 meta/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index 852c095861..8d2c0821a0 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -7,7 +7,7 @@ DEPENDS += "ninja-native"
 UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
-SRCREV = "9d19a7870add65151ff91bcc26252bb7521065cf"
+SRCREV = "ec56d4d935a0e2ab9d52b88dd00c93ec51233055"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""
-- 
2.47.1


--===============1359008033860452698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+9d19a7870a to 0+git0+ec56d4d935
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+9d19a7870a to 0+git0+ec56d4d935
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+9d19a7870a to 0+git0+ec56d4d935
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+9d19a7870a to 0+git0+ec56d4d935
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+9d19a7870a to 0+git0+ec56d4d935
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+9d19a7870a to 0+git0+ec56d4d935
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+9d19a7870a to 0+git0+ec56d4d935

--===============1359008033860452698==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gn-upgrade-to-latest-revision.patch"

RnJvbSBiODdkZTNiYTZlMmE0OGQyYzA1ZmUwM2ZhZDdiYmUzYWVlYTIzNjRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDc6MDA6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bjogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2duL2duX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nbi9nbl9naXQu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ24vZ25fZ2l0LmJiCmluZGV4IDg1MmMwOTU4NjEu
LjhkMmMwODIxYTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nbi9nbl9naXQu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2duL2duX2dpdC5iYgpAQCAtNyw3ICs3LDcg
QEAgREVQRU5EUyArPSAibmluamEtbmF0aXZlIgogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIx
IgogCiBTUkNfVVJJID0gImdpdDovL2duLmdvb2dsZXNvdXJjZS5jb20vZ247cHJvdG9jb2w9aHR0
cHM7YnJhbmNoPW1haW4iCi1TUkNSRVYgPSAiOWQxOWE3ODcwYWRkNjUxNTFmZjkxYmNjMjYyNTJi
Yjc1MjEwNjVjZiIKK1NSQ1JFViA9ICJlYzU2ZDRkOTM1YTBlMmFiOWQ1MmI4OGRkMDBjOTNlYzUx
MjMzMDU1IgogUFYgPSAiMCtnaXQiCiAKIEJCX0dJVF9TSEFMTE9XID0gIiIKLS0gCjIuNDcuMQoK

--===============1359008033860452698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGSIZE changed from 100806296 to 102634872 (+2%)
packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+9d19a7870a to 0+git0+ec56d4d935
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+9d19a7870a to 0+git0+ec56d4d935
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+9d19a7870a to 0+git0+ec56d4d935
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+9d19a7870a to 0+git0+ec56d4d935
packages/x86-64-v3-poky-linux/gn/gn-src: PKGSIZE changed from 3139692 to 3180177 (+1%)
packages/x86-64-v3-poky-linux/gn/gn-src: FILELIST: added "/usr/src/debug/gn/0+git/src/base/memory/ref_counted.cc"
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+9d19a7870a to 0+git0+ec56d4d935
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+9d19a7870a to 0+git0+ec56d4d935
packages/x86-64-v3-poky-linux/gn/gn: PKGSIZE changed from 3698872 to 3731640 (+1%)
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+9d19a7870a to 0+git0+ec56d4d935

--===============1359008033860452698==--

