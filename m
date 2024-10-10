Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D9DD1A424
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:29 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.53280.1728588960804544588
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=O72zNwbo;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=IuSfXLOt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019277eeb9a9-4681be58-597b-4931-8c9f-59500dc8e375-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588986;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mUg+8sUfe9m/a0+57S4lznBhXZnQmsICki9PumlwOa0=;
	b=O72zNwbo88+SJrO94B4Gb45/yHFkhcM5bxtBMLYatfyaLXEPymTAzGxxAV2R1tOd
	4yVDDmWvsSCRd8E7qXeF2kVrHizPXUBRJ31p6vt22VHB4GLS16H9DJRLddi9OIb0EA9
	CBYHWzVBWNn3i48SBg/WpPSaCF6CkZSzXtXZDPxA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588986;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mUg+8sUfe9m/a0+57S4lznBhXZnQmsICki9PumlwOa0=;
	b=IuSfXLOtLT3qx4jKzPHSSHqxINIJG3PJLS8DcgqSFOKP7EdSLOwYDXX0QwSEY22y
	kSxZaN/bI5PVK8wPvDdIn+AkbmQVUtKWeATIgBdSB2gpxAKBWlQr5ThsnuHNeNYPkRw
	YjMCHlVD15Twf3HrbnxzRtT7bYOPopvRzfNBqYKM=
Content-Type: multipart/mixed; boundary="===============6554327034213870619=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ttyrun: upgrading to 2.35.0 SUCCEEDED
Message-ID: <0101019277eeb9a9-4681be58-597b-4931-8c9f-59500dc8e375-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205578

--===============6554327034213870619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ttyrun* to *2.35.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ttyrun-upgrade-2.34.0-2.35.0.patch
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
From 296169ad162b40357dda423978438472d244b02a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 12:32:30 +0000
Subject: [PATCH] ttyrun: upgrade 2.34.0 -> 2.35.0

---
 meta/recipes-core/ttyrun/{ttyrun_2.34.0.bb => ttyrun_2.35.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.34.0.bb => ttyrun_2.35.0.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.34.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.35.0.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.34.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.35.0.bb
index 7fbd48c83a..c505bd7160 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.34.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.35.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master"
-SRCREV = "4c922b105b4ccb85c51e7e48153d073742b88510"
+SRCREV = "c2db7ce05fdc3ebd63cccbcb1edc2b606709e21f"
 
 CVE_PRODUCT = "s390-tools"
 
-- 
2.44.1


--===============6554327034213870619==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ttyrun-upgrade-2.34.0-2.35.0.patch"

RnJvbSAyOTYxNjlhZDE2MmI0MDM1N2RkYTQyMzk3ODQzODQ3MmQyNDRiMDJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMTI6MzI6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
dHlydW46IHVwZ3JhZGUgMi4zNC4wIC0+IDIuMzUuMAoKLS0tCiBtZXRhL3JlY2lwZXMtY29yZS90
dHlydW4ve3R0eXJ1bl8yLjM0LjAuYmIgPT4gdHR5cnVuXzIuMzUuMC5iYn0gfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29yZS90dHlydW4ve3R0eXJ1bl8yLjM0LjAuYmIgPT4gdHR5cnVuXzIuMzUuMC5iYn0g
KDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIuMzQu
MC5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5fMi4zNS4wLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5f
Mi4zNC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIuMzUu
MC5iYgppbmRleCA3ZmJkNDhjODNhLi5jNTA1YmQ3MTYwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS90dHlydW4vdHR5cnVuXzIuMzQuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS90
dHlydW4vdHR5cnVuXzIuMzUuMC5iYgpAQCAtNyw3ICs3LDcgQEAgTElDRU5TRSA9ICJNSVQiCiBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1mNTExOGYxNjdiMDU1YmZkN2Mz
NDUwODAzZjE4NDdhZiIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2libS1zMzkwLWxp
bnV4L3MzOTAtdG9vbHM7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciIKLVNSQ1JFViA9ICI0
YzkyMmIxMDViNGNjYjg1YzUxZTdlNDgxNTNkMDczNzQyYjg4NTEwIgorU1JDUkVWID0gImMyZGI3
Y2UwNWZkYzNlYmQ2M2NjY2JjYjFlZGMyYjYwNjcwOWUyMWYiCiAKIENWRV9QUk9EVUNUID0gInMz
OTAtdG9vbHMiCiAKLS0gCjIuNDQuMQoK

--===============6554327034213870619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ttyrun: PKGV changed from 2.34.0 [default] to 2.35.0 [default]
packages/core2-64-poky-linux/ttyrun: PV changed from "2.34.0" to "2.35.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-dbg: PKGV changed from 2.34.0 [default] to 2.35.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-dbg: PV changed from "2.34.0" to "2.35.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-dev: PKGV changed from 2.34.0 [default] to 2.35.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-dev: PV changed from "2.34.0" to "2.35.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-doc: PKGV changed from 2.34.0 [default] to 2.35.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-doc: PV changed from "2.34.0" to "2.35.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-locale: PKGV changed from 2.34.0 [default] to 2.35.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-locale: PV changed from "2.34.0" to "2.35.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-src: PKGV changed from 2.34.0 [default] to 2.35.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-src: PV changed from "2.34.0" to "2.35.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-staticdev: PKGV changed from 2.34.0 [default] to 2.35.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-staticdev: PV changed from "2.34.0" to "2.35.0"
packages/core2-64-poky-linux/ttyrun/ttyrun: PKGV changed from 2.34.0 [default] to 2.35.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun: PV changed from "2.34.0" to "2.35.0"

--===============6554327034213870619==--

