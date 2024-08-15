Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EFD4C61CE5
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:08 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.131095.1723748334008170013
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=K5KmfJVY;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=a9d5yodW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010191576836a3-14a9b21c-87f2-4c92-99c6-c3c0528ae168-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=o/yqCANYGLUm8Q6Ynf6DTKuEUC/8nftASSCceShMnDQ=;
	b=K5KmfJVYgWDpKn7hezlHr6v4vvWsJ1unc7UCBfWrHUNkiT3CnEto6SpoSIw+mxLB
	R+f3764rLlmE4Tf839Gm1TPxhTlvd/MMmneM8vVv3qadLZSxDq3ZPifVvMm7i7Dq9zP
	7eZ8ab/eNQ1biQPa7MLUIdVyfF5Om3UEaCDGWwPo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=o/yqCANYGLUm8Q6Ynf6DTKuEUC/8nftASSCceShMnDQ=;
	b=a9d5yodWBU7jf5xI8owgPZvxqOSRBAym4qjd9XcA7dhtq05Lio86ER0B/oU19EYY
	zph7E2RHJzGt/nr7KrzRCJlcRc9UsYEhsLnsDyHF6tNdWQv0yf5ruSjrjI+QiZCZuX0
	sbtLDfmdyDEC5tFKt2s8kg+/NFdt3Mw9WH5mgK9Q=
Content-Type: multipart/mixed; boundary="===============5831268520557167801=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ttyrun: upgrading to 2.34.0 SUCCEEDED
Message-ID: <01010191576836a3-14a9b21c-87f2-4c92-99c6-c3c0528ae168-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203356

--===============5831268520557167801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ttyrun* to *2.34.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ttyrun-upgrade-2.33.1-2.34.0.patch
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
From d13c87c416c26b4f52bac49d5da8b2cfb91a8596 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 09:22:35 +0000
Subject: [PATCH] ttyrun: upgrade 2.33.1 -> 2.34.0

---
 meta/recipes-core/ttyrun/{ttyrun_2.33.1.bb => ttyrun_2.34.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.33.1.bb => ttyrun_2.34.0.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.33.1.bb b/meta/recipes-core/ttyrun/ttyrun_2.34.0.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.33.1.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.34.0.bb
index ccb7f9b268..7fbd48c83a 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.33.1.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.34.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master"
-SRCREV = "686262fdcdaed7903ca1720d7dd0b1f9f5621d7b"
+SRCREV = "4c922b105b4ccb85c51e7e48153d073742b88510"
 
 CVE_PRODUCT = "s390-tools"
 
-- 
2.44.0


--===============5831268520557167801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ttyrun: PKGV changed from 2.33.1 [default] to 2.34.0 [default]
packages/core2-64-poky-linux/ttyrun: PV changed from "2.33.1" to "2.34.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-dbg: PKGV changed from 2.33.1 [default] to 2.34.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-dbg: PV changed from "2.33.1" to "2.34.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-dev: PKGV changed from 2.33.1 [default] to 2.34.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-dev: PV changed from "2.33.1" to "2.34.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-doc: PKGV changed from 2.33.1 [default] to 2.34.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-doc: PV changed from "2.33.1" to "2.34.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-locale: PKGV changed from 2.33.1 [default] to 2.34.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-locale: PV changed from "2.33.1" to "2.34.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-src: PKGV changed from 2.33.1 [default] to 2.34.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-src: PV changed from "2.33.1" to "2.34.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-staticdev: PKGV changed from 2.33.1 [default] to 2.34.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-staticdev: PV changed from "2.33.1" to "2.34.0"
packages/core2-64-poky-linux/ttyrun/ttyrun: PKGV changed from 2.33.1 [default] to 2.34.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun: PV changed from "2.33.1" to "2.34.0"

--===============5831268520557167801==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ttyrun-upgrade-2.33.1-2.34.0.patch"

RnJvbSBkMTNjODdjNDE2YzI2YjRmNTJiYWM0OWQ1ZGE4YjJjZmI5MWE4NTk2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMDk6MjI6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
dHlydW46IHVwZ3JhZGUgMi4zMy4xIC0+IDIuMzQuMAoKLS0tCiBtZXRhL3JlY2lwZXMtY29yZS90
dHlydW4ve3R0eXJ1bl8yLjMzLjEuYmIgPT4gdHR5cnVuXzIuMzQuMC5iYn0gfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29yZS90dHlydW4ve3R0eXJ1bl8yLjMzLjEuYmIgPT4gdHR5cnVuXzIuMzQuMC5iYn0g
KDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIuMzMu
MS5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5fMi4zNC4wLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5f
Mi4zMy4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIuMzQu
MC5iYgppbmRleCBjY2I3ZjliMjY4Li43ZmJkNDhjODNhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS90dHlydW4vdHR5cnVuXzIuMzMuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS90
dHlydW4vdHR5cnVuXzIuMzQuMC5iYgpAQCAtNyw3ICs3LDcgQEAgTElDRU5TRSA9ICJNSVQiCiBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1mNTExOGYxNjdiMDU1YmZkN2Mz
NDUwODAzZjE4NDdhZiIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2libS1zMzkwLWxp
bnV4L3MzOTAtdG9vbHM7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciIKLVNSQ1JFViA9ICI2
ODYyNjJmZGNkYWVkNzkwM2NhMTcyMGQ3ZGQwYjFmOWY1NjIxZDdiIgorU1JDUkVWID0gIjRjOTIy
YjEwNWI0Y2NiODVjNTFlN2U0ODE1M2QwNzM3NDJiODg1MTAiCiAKIENWRV9QUk9EVUNUID0gInMz
OTAtdG9vbHMiCiAKLS0gCjIuNDQuMAoK

--===============5831268520557167801==--

