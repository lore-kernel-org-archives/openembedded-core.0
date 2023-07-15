Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83FE1C2FC21
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:40 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.6014.1689456453642951403
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cG6ZtfWG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101895b73a433-5cd0e843-db97-4407-9037-30ffd47bd11e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456452;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Va8eZ5+X0H5gbSonP4SALAUKtd01jTP4yMyQVYrDkJg=;
	b=cG6ZtfWGJVAyuA1HGvRz74RWUs6ve7fu3ETMFUeaYFq/6dOWPW4XfOfpS7wP5w9S
	rCLV4SJXYQ+zLcSDI4vpmHSRuTdn1wDZBdGhihfs3S02G0vaP82qg0BkKX78Ci+gwV5
	yqw3j3WmSZoGylTlO6Q97ldEd+KIH6EpkkvfWS6I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456452;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Va8eZ5+X0H5gbSonP4SALAUKtd01jTP4yMyQVYrDkJg=;
	b=i0syjNTnLerIjvfBbLPq3kCEBC+yR0DS7rEI/7nK3QYCJHA9Bn+4E6Mq397WjIio
	oor/qZLbAFtAW12FeZamWuN1XFptYeVJuUnu/oEeltElHBbwHbd1MSUY30Tm5n7fq2j
	aFUbmt15Z77lVQwwTmcIpORs7UEIYx6RIEhXJNbc=
Content-Type: multipart/mixed; boundary="===============4971536495635312098=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libuv: upgrading to 1.46.0 SUCCEEDED
Message-ID: <010101895b73a433-5cd0e843-db97-4407-9037-30ffd47bd11e-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184317

--===============4971536495635312098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libuv* to *1.46.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libuv-upgrade-1.45.0-1.46.0.patch
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
From a1ce888986963e5cb12bd1ca046bf3a0f63a7841 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 08:24:22 +0000
Subject: [PATCH] libuv: upgrade 1.45.0 -> 1.46.0

---
 .../libuv/{libuv_1.45.0.bb => libuv_1.46.0.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.45.0.bb => libuv_1.46.0.bb} (85%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.45.0.bb b/meta/recipes-connectivity/libuv/libuv_1.46.0.bb
similarity index 85%
rename from meta/recipes-connectivity/libuv/libuv_1.45.0.bb
rename to meta/recipes-connectivity/libuv/libuv_1.46.0.bb
index 456cb2f962..c9aa25c518 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.45.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.46.0.bb
@@ -6,8 +6,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=74b6f2f7818a4e3a80d03556f71b129b \
                     file://LICENSE-extra;md5=f9307417749e19bd1d6d68a394b49324"
 
-SRCREV = "96e05543f53b19d9642b4b0dd73b86ad3cea313e"
-SRC_URI = "git://github.com/libuv/libuv.git;branch=master;protocol=https"
+SRCREV = "f0bb7e40f0508bedf6fad33769b3f87bb8aedfa6"
+SRC_URI = "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.39.2


--===============4971536495635312098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libuv: SRC_URI changed from "git://github.com/libuv/libuv.git;branch=master;protocol=https" to "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https"
packages/core2-32-poky-linux/libuv: PV changed from "1.45.0" to "1.46.0"
packages/core2-32-poky-linux/libuv: PKGV changed from 1.45.0 [default] to 1.46.0 [default]
packages/core2-32-poky-linux/libuv/libuv-dbg: PV changed from "1.45.0" to "1.46.0"
packages/core2-32-poky-linux/libuv/libuv-dbg: PKGV changed from 1.45.0 [default] to 1.46.0 [default]
packages/core2-32-poky-linux/libuv/libuv-dbg: PKGSIZE changed from 617756 to 648948 (+5%)
packages/core2-32-poky-linux/libuv/libuv-dev: PV changed from "1.45.0" to "1.46.0"
packages/core2-32-poky-linux/libuv/libuv-dev: PKGV changed from 1.45.0 [default] to 1.46.0 [default]
packages/core2-32-poky-linux/libuv/libuv-dev: PKGSIZE changed from 104549 to 105460 (+1%)
packages/core2-32-poky-linux/libuv/libuv-doc: PV changed from "1.45.0" to "1.46.0"
packages/core2-32-poky-linux/libuv/libuv-doc: PKGV changed from 1.45.0 [default] to 1.46.0 [default]
packages/core2-32-poky-linux/libuv/libuv-locale: PV changed from "1.45.0" to "1.46.0"
packages/core2-32-poky-linux/libuv/libuv-locale: PKGV changed from 1.45.0 [default] to 1.46.0 [default]
packages/core2-32-poky-linux/libuv/libuv-src: PV changed from "1.45.0" to "1.46.0"
packages/core2-32-poky-linux/libuv/libuv-src: PKGV changed from 1.45.0 [default] to 1.46.0 [default]
packages/core2-32-poky-linux/libuv/libuv-src: PKGSIZE changed from 602926 to 608069 (+1%)
packages/core2-32-poky-linux/libuv/libuv-staticdev: PV changed from "1.45.0" to "1.46.0"
packages/core2-32-poky-linux/libuv/libuv-staticdev: PKGV changed from 1.45.0 [default] to 1.46.0 [default]
packages/core2-32-poky-linux/libuv/libuv: PV changed from "1.45.0" to "1.46.0"
packages/core2-32-poky-linux/libuv/libuv: PKGV changed from 1.45.0 [default] to 1.46.0 [default]

--===============4971536495635312098==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libuv-upgrade-1.45.0-1.46.0.patch"

RnJvbSBhMWNlODg4OTg2OTYzZTVjYjEyYmQxY2EwNDZiZjNhMGY2M2E3ODQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMDg6MjQ6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ1djogdXBncmFkZSAxLjQ1LjAgLT4gMS40Ni4wCgotLS0KIC4uLi9saWJ1di97bGlidXZfMS40
NS4wLmJiID0+IGxpYnV2XzEuNDYuMC5iYn0gICAgICAgICAgICAgICAgfCA0ICsrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJ1di97bGlidXZfMS40NS4wLmJiID0+IGxpYnV2XzEuNDYu
MC5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYnV2
L2xpYnV2XzEuNDUuMC5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlidXYvbGlidXZf
MS40Ni4wLmJiCnNpbWlsYXJpdHkgaW5kZXggODUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvbGlidXYvbGlidXZfMS40NS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2xpYnV2L2xpYnV2XzEuNDYuMC5iYgppbmRleCA0NTZjYjJmOTYyLi5jOWFh
MjVjNTE4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYnV2L2xpYnV2
XzEuNDUuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYnV2L2xpYnV2XzEu
NDYuMC5iYgpAQCAtNiw4ICs2LDggQEAgTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT03NGI2ZjJmNzgxOGE0ZTNhODBkMDM1NTZmNzFiMTI5YiBc
CiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFLWV4dHJhO21kNT1mOTMwNzQxNzc0
OWUxOWJkMWQ2ZDY4YTM5NGI0OTMyNCIKIAotU1JDUkVWID0gIjk2ZTA1NTQzZjUzYjE5ZDk2NDJi
NGIwZGQ3M2I4NmFkM2NlYTMxM2UiCi1TUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vbGlidXYv
bGlidXYuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMiCitTUkNSRVYgPSAiZjBiYjdl
NDBmMDUwOGJlZGY2ZmFkMzM3NjliM2Y4N2JiOGFlZGZhNiIKK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0
aHViLmNvbS9saWJ1di9saWJ1di5naXQ7YnJhbmNoPXYxLng7cHJvdG9jb2w9aHR0cHMiCiBVUFNU
UkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICJ2KD9QPHB2ZXI+XGQrKFwuXGQrKSspIgogCiBTID0g
IiR7V09SS0RJUn0vZ2l0IgotLSAKMi4zOS4yCgo=

--===============4971536495635312098==--

