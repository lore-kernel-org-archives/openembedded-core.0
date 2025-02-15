Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC4C5C28B24
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:35 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.8067.1739623343469077401
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=DFyWeIrV;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=CF+RbN4H;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019509a1c9f0-1f571862-85c6-4c3c-9120-59e7e94b3f37-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MU2dLF0vq6knhwrUc3vAhE7HAm45zuHaJccdsiKzU7I=;
	b=DFyWeIrVqGxdJD+O4u7ZGruyZZXfN6InbnLaZPxfRHtNlMjnNExXb8dgPB5XVgJN
	Tw512Simo+//82fqBurm7OVXvjyMLnrWcREUj2uy+4SoGzaj5O8MiSd1q6so6vLecuq
	jEYHmsvemJO2Oi2cgVTfHQ3Wa28EZQxLN9/UXf7g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MU2dLF0vq6knhwrUc3vAhE7HAm45zuHaJccdsiKzU7I=;
	b=CF+RbN4HyiU6CBtdx3GO1Fyg35d/KhuATdVQBL6+2XkWRacmEbD2NbxxZjZ5ssdV
	laTdNIOH+p4rUphYlYWtpofdTBJzKyQG9kLt2+TNdLPZufzdYLgkeb4kAG8TcuuqEQj
	5N5mcl7LE1hfA+/9a99KVYAqruW2F9MeMXC9/nzU=
Content-Type: multipart/mixed; boundary="===============6333463488502098617=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hiago.franco@toradex.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwdata: upgrading to 0.392 SUCCEEDED
Message-ID: <0101019509a1c9f0-1f571862-85c6-4c3c-9120-59e7e94b3f37-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211480

--===============6333463488502098617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *hwdata* to *0.392* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwdata-upgrade-0.391-0.392.patch
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
From 750b8ef14f8e79365f543e825d7ac204c029dd30 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 12:29:23 +0000
Subject: [PATCH] hwdata: upgrade 0.391 -> 0.392

---
 .../recipes-support/hwdata/{hwdata_0.391.bb => hwdata_0.392.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.391.bb => hwdata_0.392.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.391.bb b/meta/recipes-support/hwdata/hwdata_0.392.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.391.bb
rename to meta/recipes-support/hwdata/hwdata_0.392.bb
index b2fa87c275..e0a1a7fbb2 100644
--- a/meta/recipes-support/hwdata/hwdata_0.391.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.392.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
-SRCREV = "0955087d49d085d1ef2207d6bef0c07b02844b78"
+SRCREV = "e3aac7f6bed87ca6d701bb5ad30f29a8df857f66"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.1


--===============6333463488502098617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/hwdata/hwdata-dbg: PKGV changed from 0.391 [default] to 0.392 [default]
packages/all-poky-linux/hwdata/hwdata-dbg: PV changed from "0.391" to "0.392"
packages/all-poky-linux/hwdata/hwdata-dev: PKGV changed from 0.391 [default] to 0.392 [default]
packages/all-poky-linux/hwdata/hwdata-dev: PV changed from "0.391" to "0.392"
packages/all-poky-linux/hwdata/hwdata-doc: PKGV changed from 0.391 [default] to 0.392 [default]
packages/all-poky-linux/hwdata/hwdata-doc: PV changed from "0.391" to "0.392"
packages/all-poky-linux/hwdata/hwdata-locale: PKGV changed from 0.391 [default] to 0.392 [default]
packages/all-poky-linux/hwdata/hwdata-locale: PV changed from "0.391" to "0.392"
packages/all-poky-linux/hwdata/hwdata-src: PKGV changed from 0.391 [default] to 0.392 [default]
packages/all-poky-linux/hwdata/hwdata-src: PV changed from "0.391" to "0.392"
packages/all-poky-linux/hwdata/hwdata-staticdev: PKGV changed from 0.391 [default] to 0.392 [default]
packages/all-poky-linux/hwdata/hwdata-staticdev: PV changed from "0.391" to "0.392"
packages/all-poky-linux/hwdata/hwdata: PKGV changed from 0.391 [default] to 0.392 [default]
packages/all-poky-linux/hwdata/hwdata: PV changed from "0.391" to "0.392"
packages/all-poky-linux/hwdata/hwdata: PKGSIZE changed from 9802297 to 9845922 (+0%)
packages/all-poky-linux/hwdata: PKGV changed from 0.391 [default] to 0.392 [default]
packages/all-poky-linux/hwdata: PV changed from "0.391" to "0.392"

--===============6333463488502098617==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwdata-upgrade-0.391-0.392.patch"

RnJvbSA3NTBiOGVmMTRmOGU3OTM2NWY1NDNlODI1ZDdhYzIwNGMwMjlkZDMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMTI6Mjk6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
d2RhdGE6IHVwZ3JhZGUgMC4zOTEgLT4gMC4zOTIKCi0tLQogLi4uL3JlY2lwZXMtc3VwcG9ydC9o
d2RhdGEve2h3ZGF0YV8wLjM5MS5iYiA9PiBod2RhdGFfMC4zOTIuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvaHdkYXRhL3tod2RhdGFfMC4zOTEuYmIgPT4gaHdkYXRhXzAuMzkyLmJifSAo
OTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC4z
OTEuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuMzkyLmJiCnNpbWls
YXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9o
d2RhdGFfMC4zOTEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2Rh
dGFfMC4zOTIuYmIKaW5kZXggYjJmYTg3YzI3NS4uZTBhMWE3ZmJiMiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0YV8wLjM5MS5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuMzkyLmJiCkBAIC04LDcgKzgsNyBAQCBMSUNFTlNF
ID0gIkdQTC0yLjAtb3ItbGF0ZXIgfCBYMTEiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFO21kNT0xNTU2NTQ3NzExZTgyNDY5OTJiOTk5ZWRkOTQ0NWE1NyIKIAogU1JDX1VSSSA9
ICJnaXQ6Ly9naXRodWIuY29tL3ZjcmhvbmVrLyR7QlBOfS5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90
b2NvbD1odHRwcyIKLVNSQ1JFViA9ICIwOTU1MDg3ZDQ5ZDA4NWQxZWYyMjA3ZDZiZWYwYzA3YjAy
ODQ0Yjc4IgorU1JDUkVWID0gImUzYWFjN2Y2YmVkODdjYTZkNzAxYmI1YWQzMGYyOWE4ZGY4NTdm
NjYiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuNDQuMQoK

--===============6333463488502098617==--

