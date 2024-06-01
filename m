Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C25C3065E
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:41 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.42242.1717263219090090527
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=FPQxqrU0;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=IzoGtlar;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018fd4dd39d2-ee92c756-39fa-4cb8-8dfa-e9f0db1b724d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MBng7hRTmMy/1u0SmPY8H8m/JoBYsQOo1Ibf728FflM=;
	b=FPQxqrU0+/sKBFZ5lVEGX2xtvqedkOgh/Hnx1ohJex08tjuCK+sXJsitq1bSX4y8
	O/awaL+itogI/ViUPxH3GNB69zCgvUz2fUCcoUzVPmiUDTNtoWrBXFsbdoQ6bfGEBjZ
	1ZwJWIoMPxvxkwJssY8M1gyabL3aMh1iXA42Pcx0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MBng7hRTmMy/1u0SmPY8H8m/JoBYsQOo1Ibf728FflM=;
	b=IzoGtlarAeaeUMPfKxUA11M2ncNIA230fTBxATjsYiOnerIfespwTO7LvrgeEQ9c
	BxsZiT1eqeNzpVnIL5uRnmktDJmbnW1eLuwiwLOPvKr/ElQMXBgwYWfGazXDdR3QvMN
	14UwH39V0ND4q4P0h8Idziky+gbJJct3K1gf4F4A=
Content-Type: multipart/mixed; boundary="===============2171935579839598822=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwlatdetect: upgrading to 2.7 SUCCEEDED
Message-ID: <0101018fd4dd39d2-ee92c756-39fa-4cb8-8dfa-e9f0db1b724d-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200184

--===============2171935579839598822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *hwlatdetect* to *2.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwlatdetect-upgrade-2.6-2.7.patch
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
From 0d5eb5487453f2dbce71bbe86d187085db3e59d5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jun 2024 15:22:27 +0000
Subject: [PATCH] hwlatdetect: upgrade 2.6 -> 2.7

---
 meta/recipes-rt/rt-tests/rt-tests.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 70315c4694..3fbdfa2038 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
-SRCREV = "217cd8518c5f7777d490892aa9c765a6b2782cb5"
-PV = "2.6"
+SRCREV = "5bd94923ffda2ab326d081926dbfc6775fb5050b"
+PV = "2.7"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main;protocol=https"
-- 
2.44.0


--===============2171935579839598822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-dbg: PKGV changed from 2.6 [default] to 2.7 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-dbg: PV changed from "2.6" to "2.7"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-dev: PKGV changed from 2.6 [default] to 2.7 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-dev: PV changed from "2.6" to "2.7"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-doc: PKGV changed from 2.6 [default] to 2.7 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-doc: PV changed from "2.6" to "2.7"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-locale: PKGV changed from 2.6 [default] to 2.7 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-locale: PV changed from "2.6" to "2.7"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-src: PKGV changed from 2.6 [default] to 2.7 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-src: PV changed from "2.6" to "2.7"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-staticdev: PKGV changed from 2.6 [default] to 2.7 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-staticdev: PV changed from "2.6" to "2.7"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect: PKGV changed from 2.6 [default] to 2.7 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect: PV changed from "2.6" to "2.7"
packages/core2-64-poky-linux/hwlatdetect: PKGV changed from 2.6 [default] to 2.7 [default]
packages/core2-64-poky-linux/hwlatdetect: PV changed from "2.6" to "2.7"

--===============2171935579839598822==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwlatdetect-upgrade-2.6-2.7.patch"

RnJvbSAwZDVlYjU0ODc0NTNmMmRiY2U3MWJiZTg2ZDE4NzA4NWRiM2U1OWQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdW4gMjAyNCAxNToyMjoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGh3
bGF0ZGV0ZWN0OiB1cGdyYWRlIDIuNiAtPiAyLjcKCi0tLQogbWV0YS9yZWNpcGVzLXJ0L3J0LXRl
c3RzL3J0LXRlc3RzLmluYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtcnQvcnQtdGVzdHMv
cnQtdGVzdHMuaW5jIGIvbWV0YS9yZWNpcGVzLXJ0L3J0LXRlc3RzL3J0LXRlc3RzLmluYwppbmRl
eCA3MDMxNWM0Njk0Li4zZmJkZmEyMDM4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtcnQvcnQt
dGVzdHMvcnQtdGVzdHMuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1ydC9ydC10ZXN0cy9ydC10ZXN0
cy5pbmMKQEAgLTEsNSArMSw1IEBACi1TUkNSRVYgPSAiMjE3Y2Q4NTE4YzVmNzc3N2Q0OTA4OTJh
YTljNzY1YTZiMjc4MmNiNSIKLVBWID0gIjIuNiIKK1NSQ1JFViA9ICI1YmQ5NDkyM2ZmZGEyYWIz
MjZkMDgxOTI2ZGJmYzY3NzVmYjUwNTBiIgorUFYgPSAiMi43IgogUEUgPSAiMSIKIAogU1JDX1VS
SSA9ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL3V0aWxzL3J0LXRlc3RzL3J0LXRlc3Rz
LmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwcyIKLS0gCjIuNDQuMAoK

--===============2171935579839598822==--

