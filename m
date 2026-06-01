Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1AFFCD6E7C
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:36:02 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1556.1780328132416134511
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=N0eBlxFb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=tVTbr3x5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019e83d3d1ca-7639ec6a-7eb3-4739-a5cf-2efeb60c7ad7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328157;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=I8XUxYab+SqYT7GkGrNZz3zgfTP+zVpfm212GxTtifo=;
	b=N0eBlxFbZr4Uh4tV0d11Bim7xiIZaJe2E6KhA1UItj0DBoUKOSjAbIr5rxr6lgPM
	o3y/pqOEOlzqhGH/521Y+w8r2cExoUwisrZAtHCTDRFxcF4WObCAlmIpl1Nen6JgRBS
	rAvFADyMH66aW/0Lb/jCZgcVNJkQU/OLZ6+HO+QQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328157;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=I8XUxYab+SqYT7GkGrNZz3zgfTP+zVpfm212GxTtifo=;
	b=tVTbr3x5elSCAN+/mqL2X5b7x3wTSaf1x0Wc0xT/1o5w9KNvW7bnCfiykU+vAyNY
	jDJTODJECZ0M9cplV4F5UX3I06zNp97nGy3zpddFPANCmstgC6CAZ2OCTL9QXhVcp4o
	XtJSOQAwGARxtVWfNHuHl2o/uWr4n/yPvfn9OKGo=
Content-Type: multipart/mixed; boundary="===============3715284020614950241=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] utfcpp: upgrading to 4.1.1 SUCCEEDED
Message-ID: <0101019e83d3d1ca-7639ec6a-7eb3-4739-a5cf-2efeb60c7ad7-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237959

--===============3715284020614950241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *utfcpp* to *4.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-utfcpp-upgrade-4.0.9-4.1.1.patch
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
From a8a6abe63b4e10030fd22c0ccd8f8d7ac9b6b126 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 15:32:28 +0000
Subject: [PATCH] utfcpp: upgrade 4.0.9 -> 4.1.1

---
 .../recipes-support/utfcpp/{utfcpp_4.0.9.bb => utfcpp_4.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/utfcpp/{utfcpp_4.0.9.bb => utfcpp_4.1.1.bb} (94%)

diff --git a/meta/recipes-support/utfcpp/utfcpp_4.0.9.bb b/meta/recipes-support/utfcpp/utfcpp_4.1.1.bb
similarity index 94%
rename from meta/recipes-support/utfcpp/utfcpp_4.0.9.bb
rename to meta/recipes-support/utfcpp/utfcpp_4.1.1.bb
index 55780b1c7c..80da59bf90 100644
--- a/meta/recipes-support/utfcpp/utfcpp_4.0.9.bb
+++ b/meta/recipes-support/utfcpp/utfcpp_4.1.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c \
 SRC_URI = "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v${PV} \
            file://run-ptest"
 
-SRCREV = "63d64de49fd6b829f7c8694df5ab2ee625cb7134"
+SRCREV = "819011bb01628fe1aa2f1da9f2c842a48fd5680b"
 
 inherit cmake ptest
 
-- 
2.47.1


--===============3715284020614950241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dbg: PKGSIZE changed from 2822184 to 3547752 (+26%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-ptest: PKGSIZE changed from 267225 to 328657 (+23%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: PKGSIZE changed from 86752 to 104766 (+21%)

--===============3715284020614950241==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-utfcpp-upgrade-4.0.9-4.1.1.patch"

RnJvbSBhOGE2YWJlNjNiNGUxMDAzMGZkMjJjMGNjZDhmOGQ3YWM5YjZiMTI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxNTozMjoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHV0
ZmNwcDogdXBncmFkZSA0LjAuOSAtPiA0LjEuMQoKLS0tCiAuLi4vcmVjaXBlcy1zdXBwb3J0L3V0
ZmNwcC97dXRmY3BwXzQuMC45LmJiID0+IHV0ZmNwcF80LjEuMS5iYn0gfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC91dGZjcHAve3V0ZmNwcF80LjAuOS5iYiA9PiB1dGZjcHBfNC4xLjEuYmJ9ICg5
NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdXRmY3BwL3V0ZmNwcF80LjAu
OS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3V0ZmNwcC91dGZjcHBfNC4xLjEuYmIKc2ltaWxh
cml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdXRmY3BwL3V0
ZmNwcF80LjAuOS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdXRmY3BwL3V0ZmNw
cF80LjEuMS5iYgppbmRleCA1NTc4MGIxYzdjLi44MGRhNTliZjkwIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC91dGZjcHAvdXRmY3BwXzQuMC45LmJiCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L3V0ZmNwcC91dGZjcHBfNC4xLjEuYmIKQEAgLTExLDcgKzExLDcgQEAgTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZTQyMjRjY2FlY2IxNGQ5NDJjNzFkMzFi
ZWYyMGQ3OGMgXAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL25lbXRyaWYvdXRmY3BwO3By
b3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXI7dGFnPXYke1BWfSBcCiAgICAgICAgICAgIGZpbGU6
Ly9ydW4tcHRlc3QiCiAKLVNSQ1JFViA9ICI2M2Q2NGRlNDlmZDZiODI5ZjdjODY5NGRmNWFiMmVl
NjI1Y2I3MTM0IgorU1JDUkVWID0gIjgxOTAxMWJiMDE2MjhmZTFhYTJmMWRhOWYyYzg0MmE0OGZk
NTY4MGIiCiAKIGluaGVyaXQgY21ha2UgcHRlc3QKIAotLSAKMi40Ny4xCgo=

--===============3715284020614950241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/utfcpp: SRC_URI changed from "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v4.0.9 file://run-ptest" to "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v4.1.1 file://run-ptest"
packages/x86-64-v3-poky-linux/utfcpp: PKGV changed from 4.0.9 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/utfcpp: PV changed from "4.0.9" to "4.1.1"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dbg: PKGSIZE changed from 2822184 to 3547752 (+26%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dbg: PKGV changed from 4.0.9 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dbg: PV changed from "4.0.9" to "4.1.1"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dev: PKGSIZE changed from 61021 to 64363 (+5%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dev: PKGV changed from 4.0.9 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dev: PV changed from "4.0.9" to "4.1.1"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-doc: PKGV changed from 4.0.9 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-doc: PV changed from "4.0.9" to "4.1.1"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-locale: PKGV changed from 4.0.9 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-locale: PV changed from "4.0.9" to "4.1.1"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-ptest: PKGSIZE changed from 267225 to 328657 (+23%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-ptest: PKGV changed from 4.0.9 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-ptest: PV changed from "4.0.9" to "4.1.1"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: FILELIST: directory renamed /usr/src/debug/utfcpp/4.0.9/source/utf8 -> /usr/src/debug/utfcpp/4.1.1/source/utf8, directory renamed /usr/src/debug/utfcpp/4.0.9/tests -> /usr/src/debug/utfcpp/4.1.1/tests
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: PKGSIZE changed from 86752 to 104766 (+21%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: PKGV changed from 4.0.9 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: PV changed from "4.0.9" to "4.1.1"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-staticdev: PKGV changed from 4.0.9 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-staticdev: PV changed from "4.0.9" to "4.1.1"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp: PKGV changed from 4.0.9 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp: PV changed from "4.0.9" to "4.1.1"

--===============3715284020614950241==--

