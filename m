Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B91C4D5CC8F
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:27 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17178.1765872128910473755
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=rEmwcikY;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=h8nJ8b4y;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019b262e94ec-eaa3b45b-c84d-4186-beb8-6eaebc45cd65-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872145;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4tr8Nqj8fGb1gQaWUfzXV8zkR6iPnoQu4SYJNlED1xA=;
	b=rEmwcikYRWQlAhYOuqZ3IsQwDLo/5D0VQF2+G1f5Semtv050qyU+/Ur78J/eKIUH
	5e1Nwdg9vebE0NlgQ3S3SJFbY9FMtD0Yus2tc24Pqh0eFcx1Meq06zREKUI6G9NoCz5
	naWOaDYPcJZ4PkBJ6nBIjvl5Vpab4vM8zAjgY8+Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872145;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4tr8Nqj8fGb1gQaWUfzXV8zkR6iPnoQu4SYJNlED1xA=;
	b=h8nJ8b4yBO+97NS+5FKySCuL7/GVpqdKoscjiLAeD44mPPoq1EhrQOYxNG3Vs2T4
	sBq/RzcvXYU0ar+SyEQ22w1r2gx1jSgwx9iI21hxmXaVotC3Y0/3T5M8ZHVBTXMjCRD
	96iUYXSBm0v6uGU9EVg3Zy3pyJYDDMcqo3ibRKaw=
Content-Type: multipart/mixed; boundary="===============6436932911959219449=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyparsing: upgrading to 3.2.5 SUCCEEDED
Message-ID: <0101019b262e94ec-eaa3b45b-c84d-4186-beb8-6eaebc45cd65-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227816

--===============6436932911959219449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyparsing* to *3.2.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyparsing-upgrade-3.2.4-3.2.5.patch
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
From 50cff63d83b0774969ba50357902f3e0f4c1c298 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 00:58:28 +0000
Subject: [PATCH] python3-pyparsing: upgrade 3.2.4 -> 3.2.5

---
 .../{python3-pyparsing_3.2.4.bb => python3-pyparsing_3.2.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.2.4.bb => python3-pyparsing_3.2.5.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.2.4.bb b/meta/recipes-devtools/python/python3-pyparsing_3.2.5.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pyparsing_3.2.4.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.2.5.bb
index 46556e6fb8..e94bebae38 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.2.4.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.2.5.bb
@@ -10,7 +10,7 @@ BUGTRACKER = "https://github.com/pyparsing/pyparsing/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[sha256sum] = "fff89494f45559d0f2ce46613b419f632bbb6afbdaed49696d322bcf98a58e99"
+SRC_URI[sha256sum] = "2df8d5b7b2802ef88e8d016a2eb9c7aeaa923529cd251ed0fe4608275d4105b6"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============6436932911959219449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pyparsing-3.2.4.dist-info -> /usr/lib/python3.13/site-packages/pyparsing-3.2.5.dist-info, directory renamed /usr/lib/python3.13/site-packages/pyparsing-3.2.4.dist-info/licenses -> /usr/lib/python3.13/site-packages/pyparsing-3.2.5.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pyparsing (sysroot):
  /usr/lib/python3.13/site-packages/pyparsing-3.2.4.dist-info moved to /usr/lib/python3.13/site-packages/pyparsing-3.2.5.dist-info

--===============6436932911959219449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pyparsing: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyparsing/pyparsing-3.2.4.tar.gz;downloadfilename=pyparsing-3.2.4.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyparsing/pyparsing-3.2.5.tar.gz;downloadfilename=pyparsing-3.2.5.tar.gz"
packages/x86-64-v3-poky-linux/python3-pyparsing: PKGV changed from 3.2.4 [default] to 3.2.5 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing: PV changed from "3.2.4" to "3.2.5"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-dbg: PKGV changed from 3.2.4 [default] to 3.2.5 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-dbg: PV changed from "3.2.4" to "3.2.5"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-dev: PKGV changed from 3.2.4 [default] to 3.2.5 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-dev: PV changed from "3.2.4" to "3.2.5"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-doc: PKGV changed from 3.2.4 [default] to 3.2.5 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-doc: PV changed from "3.2.4" to "3.2.5"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-locale: PKGV changed from 3.2.4 [default] to 3.2.5 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-locale: PV changed from "3.2.4" to "3.2.5"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-src: PKGV changed from 3.2.4 [default] to 3.2.5 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-src: PV changed from "3.2.4" to "3.2.5"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-staticdev: PKGV changed from 3.2.4 [default] to 3.2.5 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-staticdev: PV changed from "3.2.4" to "3.2.5"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing: PKGV changed from 3.2.4 [default] to 3.2.5 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pyparsing-3.2.4.dist-info -> /usr/lib/python3.13/site-packages/pyparsing-3.2.5.dist-info, directory renamed /usr/lib/python3.13/site-packages/pyparsing-3.2.4.dist-info/licenses -> /usr/lib/python3.13/site-packages/pyparsing-3.2.5.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing: PV changed from "3.2.4" to "3.2.5"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing: PKGSIZE changed from 929097 to 929285 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-pyparsing (sysroot):
  /usr/lib/python3.13/site-packages/pyparsing-3.2.4.dist-info moved to /usr/lib/python3.13/site-packages/pyparsing-3.2.5.dist-info

--===============6436932911959219449==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyparsing-upgrade-3.2.4-3.2.5.patch"

RnJvbSA1MGNmZjYzZDgzYjA3NzQ5NjliYTUwMzU3OTAyZjNlMGY0YzFjMjk4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDA6NTg6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5cGFyc2luZzogdXBncmFkZSAzLjIuNCAtPiAzLjIuNQoKLS0tCiAuLi4ve3B5dGhv
bjMtcHlwYXJzaW5nXzMuMi40LmJiID0+IHB5dGhvbjMtcHlwYXJzaW5nXzMuMi41LmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5cGFyc2luZ18zLjIuNC5i
YiA9PiBweXRob24zLXB5cGFyc2luZ18zLjIuNS5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlwYXJzaW5nXzMuMi40LmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5cGFyc2luZ18zLjIuNS5iYgpzaW1p
bGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHlwYXJzaW5nXzMuMi40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcHlwYXJzaW5nXzMuMi41LmJiCmluZGV4IDQ2NTU2ZTZmYjguLmU5
NGJlYmFlMzggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1weXBhcnNpbmdfMy4yLjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXB5cGFyc2luZ18zLjIuNS5iYgpAQCAtMTAsNyArMTAsNyBAQCBCVUdUUkFDS0VSID0g
Imh0dHBzOi8vZ2l0aHViLmNvbS9weXBhcnNpbmcvcHlwYXJzaW5nL2lzc3VlcyIKIExJQ0VOU0Ug
PSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NjU3YTU2NjIz
Mzg4ODUxM2UxZjA3YmExM2UyZjQ3ZjEiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmZmY4OTQ5
NGY0NTU1OWQwZjJjZTQ2NjEzYjQxOWY2MzJiYmI2YWZiZGFlZDQ5Njk2ZDMyMmJjZjk4YTU4ZTk5
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJkZjhkNWI3YjI4MDJlZjg4ZThkMDE2YTJlYjljN2Fl
YWE5MjM1MjljZDI1MWVkMGZlNDYwODI3NWQ0MTA1YjYiCiAKIGluaGVyaXQgcHlwaSBweXRob25f
ZmxpdF9jb3JlCiAKLS0gCjIuNDcuMQoK

--===============6436932911959219449==--

