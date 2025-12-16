Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4923D5C0EA
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:26 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17184.1765872136819102044
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=iB1vdeT6;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=J2UKLxD/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019b262e6ff3-7eede55a-ed05-40ae-b573-d9e41d33ee05-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872136;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GC9zvCiXwtxjdgLgWZMgqXT5mTL+rET/8UZxdviWYJA=;
	b=iB1vdeT6+BY+BzCr5icwZgXcZwALEgdgfiYr8dW3C9lsIK1fCfRKduGCm7g+au7d
	SviznyqmoC59gvqBA0F6hfu4Uh5jn+izDel+ThO6sDCJK5vWgJocVmLtn8ke7Z8oFll
	iMfePBmdG9p/A0TtMKBrbkJu4oBRBriix9la9UjE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872136;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GC9zvCiXwtxjdgLgWZMgqXT5mTL+rET/8UZxdviWYJA=;
	b=J2UKLxD/MsKhpv8JDOchGW1/uDg6NpxBTcZKEi79K5EBn4pmW7KqGu4Zp0DVQrG0
	eCc8ZKFe4FJSffvAsxSQwDfm4Jmp3sfo9Nak1LY9TTHVqRmimPx2/ZDwn1BWlY/ohnf
	dOowNRrk+dg+hdpgDewx7B5M3m02culRa07/kXm8=
Content-Type: multipart/mixed; boundary="===============7036099250256475406=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ttyrun: upgrading to 2.40.0 SUCCEEDED
Message-ID: <0101019b262e6ff3-7eede55a-ed05-40ae-b573-d9e41d33ee05-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227787

--===============7036099250256475406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ttyrun* to *2.40.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ttyrun-upgrade-2.39.0-2.40.0.patch
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
From ac636014f3a5320fb1606279e3575f78d97c8f12 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Dec 2025 22:53:24 +0000
Subject: [PATCH] ttyrun: upgrade 2.39.0 -> 2.40.0

---
 meta/recipes-core/ttyrun/{ttyrun_2.39.0.bb => ttyrun_2.40.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.39.0.bb => ttyrun_2.40.0.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.39.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.40.0.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.39.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.40.0.bb
index c7ca8f3ec3..974b0a8aa0 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.39.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.40.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "940ce6790021816f280fab66f443e4721d527833"
+SRCREV = "aca6704cfa27434452580369b4bc8a024bd0edee"
 
 CVE_PRODUCT = "s390-tools"
 
-- 
2.47.1


--===============7036099250256475406==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ttyrun-upgrade-2.39.0-2.40.0.patch"

RnJvbSBhYzYzNjAxNGYzYTUzMjBmYjE2MDYyNzllMzU3NWY3OGQ5N2M4ZjEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgRGVjIDIwMjUgMjI6NTM6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
dHlydW46IHVwZ3JhZGUgMi4zOS4wIC0+IDIuNDAuMAoKLS0tCiBtZXRhL3JlY2lwZXMtY29yZS90
dHlydW4ve3R0eXJ1bl8yLjM5LjAuYmIgPT4gdHR5cnVuXzIuNDAuMC5iYn0gfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29yZS90dHlydW4ve3R0eXJ1bl8yLjM5LjAuYmIgPT4gdHR5cnVuXzIuNDAuMC5iYn0g
KDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIuMzku
MC5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5fMi40MC4wLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5f
Mi4zOS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIuNDAu
MC5iYgppbmRleCBjN2NhOGYzZWMzLi45NzRiMGE4YWEwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS90dHlydW4vdHR5cnVuXzIuMzkuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS90
dHlydW4vdHR5cnVuXzIuNDAuMC5iYgpAQCAtNyw3ICs3LDcgQEAgTElDRU5TRSA9ICJNSVQiCiBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1mNTExOGYxNjdiMDU1YmZkN2Mz
NDUwODAzZjE4NDdhZiIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2libS1zMzkwLWxp
bnV4L3MzOTAtdG9vbHM7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3Rlcjt0YWc9diR7UFZ9Igot
U1JDUkVWID0gIjk0MGNlNjc5MDAyMTgxNmYyODBmYWI2NmY0NDNlNDcyMWQ1Mjc4MzMiCitTUkNS
RVYgPSAiYWNhNjcwNGNmYTI3NDM0NDUyNTgwMzY5YjRiYzhhMDI0YmQwZWRlZSIKIAogQ1ZFX1BS
T0RVQ1QgPSAiczM5MC10b29scyIKIAotLSAKMi40Ny4xCgo=

--===============7036099250256475406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ttyrun: PV changed from "2.39.0" to "2.40.0"
packages/x86-64-v3-poky-linux/ttyrun: PKGV changed from 2.39.0 [default] to 2.40.0 [default]
packages/x86-64-v3-poky-linux/ttyrun: SRC_URI changed from "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v2.39.0" to "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v2.40.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dbg: PV changed from "2.39.0" to "2.40.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dbg: PKGV changed from 2.39.0 [default] to 2.40.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dev: PV changed from "2.39.0" to "2.40.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dev: PKGV changed from 2.39.0 [default] to 2.40.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-doc: PV changed from "2.39.0" to "2.40.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-doc: PKGV changed from 2.39.0 [default] to 2.40.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-locale: PV changed from "2.39.0" to "2.40.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-locale: PKGV changed from 2.39.0 [default] to 2.40.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: PV changed from "2.39.0" to "2.40.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: FILELIST: directory renamed /usr/src/debug/ttyrun/2.39.0/iucvterm/src -> /usr/src/debug/ttyrun/2.40.0/iucvterm/src
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: PKGV changed from 2.39.0 [default] to 2.40.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-staticdev: PV changed from "2.39.0" to "2.40.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-staticdev: PKGV changed from 2.39.0 [default] to 2.40.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun: PV changed from "2.39.0" to "2.40.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun: PKGV changed from 2.39.0 [default] to 2.40.0 [default]

--===============7036099250256475406==--

