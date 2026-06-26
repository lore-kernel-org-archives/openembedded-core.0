Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B714CDE008
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 06:11:47 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29768.1782454299729004227
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 23:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=p+qgcy+J;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GGFOwkxk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019f028e293c-ae826b32-9905-43ea-832f-10c7748a7b23-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782454299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Zy/gHl2z8yooapprmcXu/MbqWmAikym3xX/Zqyhs6uk=;
	b=p+qgcy+JnaTFe9/rtAUv43+QulCUz1/phVHLZw4FUM69eiePRZdcl1dEBLsRWEFJ
	/rtXXT0xbSYUXnPdeFXavXWmIVfjOZUE3O5UIZF/9cxkR1z7lTygCT3rW9OKzGvaFvn
	wqDEFXD+a73j+GRLVI4AXdACXaCZ4aa2Ffof8a8I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782454299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Zy/gHl2z8yooapprmcXu/MbqWmAikym3xX/Zqyhs6uk=;
	b=GGFOwkxknhfBrjBx38O/MKvZVN7X0LxmBWiVHi4cVxNZ66MQXux9/PbiIMSn9YPh
	ZUJELWlhdaNtacO+3oGCwS4S3JQhR82+i0rPaeNqWrCVLQtuKGc936/4WCpt2axTqL4
	ngC70aWsHKA9H2eK+AIbZPh1nu/5zIFx2CF4J68s=
Content-Type: multipart/mixed; boundary="===============1069113859556146256=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ttyrun: upgrading to 2.43.0 SUCCEEDED
Message-ID: <0101019f028e293c-ae826b32-9905-43ea-832f-10c7748a7b23-000000@us-west-2.amazonses.com>
Date: Fri, 26 Jun 2026 06:11:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.26-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 06:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239596

--===============1069113859556146256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ttyrun* to *2.43.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ttyrun-upgrade-2.42.1-2.43.0.patch
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
From 3c9b3e6f6aba8934aa6f09eb3ae3dd2905163282 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 26 Jun 2026 05:45:35 +0000
Subject: [PATCH] ttyrun: upgrade 2.42.1 -> 2.43.0

---
 meta/recipes-core/ttyrun/{ttyrun_2.42.1.bb => ttyrun_2.43.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.42.1.bb => ttyrun_2.43.0.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.42.1.bb b/meta/recipes-core/ttyrun/ttyrun_2.43.0.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.42.1.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.43.0.bb
index c9dd4d564d..74204013c2 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.42.1.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.43.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "77083b1cbbd463a25cf1a94fc026b5401575bc5e"
+SRCREV = "f85c8ebba0b482e677de1f2c4d8b67b588fe654d"
 
 CVE_PRODUCT = "s390-tools"
 
-- 
2.47.1


--===============1069113859556146256==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ttyrun-upgrade-2.42.1-2.43.0.patch"

RnJvbSAzYzliM2U2ZjZhYmE4OTM0YWE2ZjA5ZWIzYWUzZGQyOTA1MTYzMjgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjYgSnVuIDIwMjYgMDU6NDU6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
dHlydW46IHVwZ3JhZGUgMi40Mi4xIC0+IDIuNDMuMAoKLS0tCiBtZXRhL3JlY2lwZXMtY29yZS90
dHlydW4ve3R0eXJ1bl8yLjQyLjEuYmIgPT4gdHR5cnVuXzIuNDMuMC5iYn0gfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29yZS90dHlydW4ve3R0eXJ1bl8yLjQyLjEuYmIgPT4gdHR5cnVuXzIuNDMuMC5iYn0g
KDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIuNDIu
MS5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5fMi40My4wLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5f
Mi40Mi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIuNDMu
MC5iYgppbmRleCBjOWRkNGQ1NjRkLi43NDIwNDAxM2MyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS90dHlydW4vdHR5cnVuXzIuNDIuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS90
dHlydW4vdHR5cnVuXzIuNDMuMC5iYgpAQCAtNyw3ICs3LDcgQEAgTElDRU5TRSA9ICJNSVQiCiBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1mNTExOGYxNjdiMDU1YmZkN2Mz
NDUwODAzZjE4NDdhZiIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2libS1zMzkwLWxp
bnV4L3MzOTAtdG9vbHM7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3Rlcjt0YWc9diR7UFZ9Igot
U1JDUkVWID0gIjc3MDgzYjFjYmJkNDYzYTI1Y2YxYTk0ZmMwMjZiNTQwMTU3NWJjNWUiCitTUkNS
RVYgPSAiZjg1YzhlYmJhMGI0ODJlNjc3ZGUxZjJjNGQ4YjY3YjU4OGZlNjU0ZCIKIAogQ1ZFX1BS
T0RVQ1QgPSAiczM5MC10b29scyIKIAotLSAKMi40Ny4xCgo=

--===============1069113859556146256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ttyrun: SRC_URI changed from "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v2.42.1" to "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v2.43.0"
packages/x86-64-v3-poky-linux/ttyrun: PKGV changed from 2.42.1 [default] to 2.43.0 [default]
packages/x86-64-v3-poky-linux/ttyrun: PV changed from "2.42.1" to "2.43.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dbg: PKGV changed from 2.42.1 [default] to 2.43.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dbg: PV changed from "2.42.1" to "2.43.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dev: PKGV changed from 2.42.1 [default] to 2.43.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dev: PV changed from "2.42.1" to "2.43.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-doc: PKGV changed from 2.42.1 [default] to 2.43.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-doc: PV changed from "2.42.1" to "2.43.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-locale: PKGV changed from 2.42.1 [default] to 2.43.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-locale: PV changed from "2.42.1" to "2.43.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: PKGV changed from 2.42.1 [default] to 2.43.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: FILELIST: directory renamed /usr/src/debug/ttyrun/2.42.1/iucvterm/src -> /usr/src/debug/ttyrun/2.43.0/iucvterm/src
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: PV changed from "2.42.1" to "2.43.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-staticdev: PKGV changed from 2.42.1 [default] to 2.43.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-staticdev: PV changed from "2.42.1" to "2.43.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun: PKGV changed from 2.42.1 [default] to 2.43.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun: PV changed from "2.42.1" to "2.43.0"

--===============1069113859556146256==--

