Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3BA0C10F1B
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:14 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.8647.1698848703568689614
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dDq9ljFN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BVJc8rMS;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.192, mailfrom: 0101018b8b460df3-6136ec20-a8b3-4867-ba23-10d21e4819de-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zbI4fNkilbKgxCWEDPuPI9dQA7pEijrkXd2VPQ9xf4c=;
	b=dDq9ljFNP4Chxb+e5mMKzya4FkthSlTryLM368sH6XjwxzbTCBL6UASw8+7AEGUi
	1TBLs6VJfoewRliNW2d5gbvNVV/i9QZjjHKBeNRnWPIecUA/lrTvzbDdoLLyZcOPe+1
	rqDBITRjrCCwny4X1yWfL0xc6EbtUg3ikcOsoW+E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zbI4fNkilbKgxCWEDPuPI9dQA7pEijrkXd2VPQ9xf4c=;
	b=BVJc8rMSZyCU1cKuH0/JUWpK+jkC3c5/2Js4B4idmELhx4iwkkSD7Nh1k9mEj9iP
	PwF+eCG7Hl0vjBSy0dUwRK2O+62eUho6+GY6+CeL0Knr5n+jQa1lQ9/40Pmh28trYdQ
	2TZwhzqpUS+Xq1hBAbygS2zKdv0gi+M5BpUQ/ugQ=
Content-Type: multipart/mixed; boundary="===============1325422141059407627=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwlatdetect: upgrading to 2.6 SUCCEEDED
Message-ID: <0101018b8b460df3-6136ec20-a8b3-4867-ba23-10d21e4819de-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190026

--===============1325422141059407627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *hwlatdetect* to *2.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwlatdetect-upgrade-2.5-2.6.patch
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
From 4d58743055790a981c6b748c4d5056f50864d907 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 13:49:40 +0000
Subject: [PATCH] hwlatdetect: upgrade 2.5 -> 2.6

---
 meta/recipes-rt/rt-tests/rt-tests.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 527e14ad54..70315c4694 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
-SRCREV = "4579b9a6d85ae528f76e92421eb5e7b33cd26b17"
-PV = "2.5"
+SRCREV = "217cd8518c5f7777d490892aa9c765a6b2782cb5"
+PV = "2.6"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main;protocol=https"
-- 
2.39.2


--===============1325422141059407627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-dbg: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-dbg: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-dev: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-dev: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-doc: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-doc: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-locale: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-locale: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-src: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-src: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-staticdev: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-staticdev: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect: PKGSIZE changed from 17162 to 17229 (+0%)
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/hwlatdetect: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/hwlatdetect: PKGV changed from 2.5 [default] to 2.6 [default]

--===============1325422141059407627==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwlatdetect-upgrade-2.5-2.6.patch"

RnJvbSA0ZDU4NzQzMDU1NzkwYTk4MWM2Yjc0OGM0ZDUwNTZmNTA4NjRkOTA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMzo0OTo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGh3
bGF0ZGV0ZWN0OiB1cGdyYWRlIDIuNSAtPiAyLjYKCi0tLQogbWV0YS9yZWNpcGVzLXJ0L3J0LXRl
c3RzL3J0LXRlc3RzLmluYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtcnQvcnQtdGVzdHMv
cnQtdGVzdHMuaW5jIGIvbWV0YS9yZWNpcGVzLXJ0L3J0LXRlc3RzL3J0LXRlc3RzLmluYwppbmRl
eCA1MjdlMTRhZDU0Li43MDMxNWM0Njk0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtcnQvcnQt
dGVzdHMvcnQtdGVzdHMuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1ydC9ydC10ZXN0cy9ydC10ZXN0
cy5pbmMKQEAgLTEsNSArMSw1IEBACi1TUkNSRVYgPSAiNDU3OWI5YTZkODVhZTUyOGY3NmU5MjQy
MWViNWU3YjMzY2QyNmIxNyIKLVBWID0gIjIuNSIKK1NSQ1JFViA9ICIyMTdjZDg1MThjNWY3Nzc3
ZDQ5MDg5MmFhOWM3NjVhNmIyNzgyY2I1IgorUFYgPSAiMi42IgogUEUgPSAiMSIKIAogU1JDX1VS
SSA9ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL3V0aWxzL3J0LXRlc3RzL3J0LXRlc3Rz
LmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwcyIKLS0gCjIuMzkuMgoK

--===============1325422141059407627==--

