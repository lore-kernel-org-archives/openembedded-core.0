Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E60CA0EF5
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:23 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.11430.1755263241161990126
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=OmMeaDDe;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=JPUlMvJY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010198add789ec-0e091ba1-1aec-4190-9ad2-dc85af18c55f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263240;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iwCBsy9ll0S5W2hTbkS1qyP6XZL0cVi1BhJxC12WRvw=;
	b=OmMeaDDeKKdVE25K+9rXIkTWhQccgS7W+Nyl9T7zbZKWKrAwTQNwpCUU7V3sm/cD
	NWwQtH54L4FjLV9XvFTDk7Qk564S1fb4saR1jB1qk1K7NEHJTjmdGbDUdrHcLEsWU05
	e96ixD7SX9sxdK3FiXxkzSdErHFEV4yJfx+YEfVo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263240;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iwCBsy9ll0S5W2hTbkS1qyP6XZL0cVi1BhJxC12WRvw=;
	b=JPUlMvJY3zB5gVfzZdlXe5a5JoLbFaWFHZpYcWO2yUAzT48+F7V4YkGMOWHX43CX
	aJ3tGTYLhlSYT43hTX4YJJRkCoO/zePfqnLhaSMqOSw9UTpUkU8htDo2MlubMu5Sdxl
	goaei+hEiCB1uYLX1eYuQTzJ6S6kt4ucBfPDnDro=
Content-Type: multipart/mixed; boundary="===============0085997257559632582=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] boost-build-native: upgrading to 1.89.0 SUCCEEDED
Message-ID: <01010198add789ec-0e091ba1-1aec-4190-9ad2-dc85af18c55f-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221957

--===============0085997257559632582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *boost-build-native* to *1.89.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-boost-build-native-upgrade-1.87.0-1.89.0.patch
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
From 9f9322a2865b865634ac886447a5c6a55222a857 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 12:24:37 +0000
Subject: [PATCH] boost-build-native: upgrade 1.87.0 -> 1.89.0

---
 ...oost-build-native_1.87.0.bb => boost-build-native_1.89.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/boost/{boost-build-native_1.87.0.bb => boost-build-native_1.89.0.bb} (92%)

diff --git a/meta/recipes-support/boost/boost-build-native_1.87.0.bb b/meta/recipes-support/boost/boost-build-native_1.89.0.bb
similarity index 92%
rename from meta/recipes-support/boost/boost-build-native_1.87.0.bb
rename to meta/recipes-support/boost/boost-build-native_1.89.0.bb
index 5b914b6f88..c6304e3417 100644
--- a/meta/recipes-support/boost/boost-build-native_1.87.0.bb
+++ b/meta/recipes-support/boost/boost-build-native_1.89.0.bb
@@ -7,7 +7,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/boostorg/build;protocol=https;branch=master"
-SRCREV = "4a52d8c06635435b64e31a56eaf7ca5dc912a71d"
+SRCREV = "be69c44857e34fae250aa1321808a05c1d88bfde"
 PE = "1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "boost-(?P<pver>(\d+(\.\d+)+))"
-- 
2.47.1


--===============0085997257559632582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86_64-linux/boost-build-native (sysroot):
  /usr/share/b2/src/tools/cc.jam was added
  /usr/share/b2/src/tools/ibmcxx.jam was added
  /usr/share/b2/src/tools/vacpp.jam was removed
  /usr/share/b2/src/tools/xlcpp.jam was removed

--===============0085997257559632582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/x86_64-linux/boost-build-native (sysroot):
  /usr/share/b2/src/tools/cc.jam was added
  /usr/share/b2/src/tools/ibmcxx.jam was added
  /usr/share/b2/src/tools/vacpp.jam was removed
  /usr/share/b2/src/tools/xlcpp.jam was removed

--===============0085997257559632582==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-boost-build-native-upgrade-1.87.0-1.89.0.patch"

RnJvbSA5ZjkzMjJhMjg2NWI4NjU2MzRhYzg4NjQ0N2E1YzZhNTUyMjJhODU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMTI6MjQ6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
b29zdC1idWlsZC1uYXRpdmU6IHVwZ3JhZGUgMS44Ny4wIC0+IDEuODkuMAoKLS0tCiAuLi5vb3N0
LWJ1aWxkLW5hdGl2ZV8xLjg3LjAuYmIgPT4gYm9vc3QtYnVpbGQtbmF0aXZlXzEuODkuMC5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC97Ym9vc3QtYnVpbGQtbmF0aXZlXzEuODcu
MC5iYiA9PiBib29zdC1idWlsZC1uYXRpdmVfMS44OS4wLmJifSAoOTIlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2Jvb3N0L2Jvb3N0LWJ1aWxkLW5hdGl2ZV8xLjg3LjAuYmIg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC9ib29zdC1idWlsZC1uYXRpdmVfMS44OS4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2Jv
b3N0L2Jvb3N0LWJ1aWxkLW5hdGl2ZV8xLjg3LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1z
dXBwb3J0L2Jvb3N0L2Jvb3N0LWJ1aWxkLW5hdGl2ZV8xLjg5LjAuYmIKaW5kZXggNWI5MTRiNmY4
OC4uYzYzMDRlMzQxNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3QvYm9v
c3QtYnVpbGQtbmF0aXZlXzEuODcuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29z
dC9ib29zdC1idWlsZC1uYXRpdmVfMS44OS4wLmJiCkBAIC03LDcgKzcsNyBAQCBMSUNFTlNFID0g
IkJTTC0xLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9ZTQy
MjRjY2FlY2IxNGQ5NDJjNzFkMzFiZWYyMGQ3OGMiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHVi
LmNvbS9ib29zdG9yZy9idWlsZDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIgotU1JDUkVW
ID0gIjRhNTJkOGMwNjYzNTQzNWI2NGUzMWE1NmVhZjdjYTVkYzkxMmE3MWQiCitTUkNSRVYgPSAi
YmU2OWM0NDg1N2UzNGZhZTI1MGFhMTMyMTgwOGEwNWMxZDg4YmZkZSIKIFBFID0gIjEiCiAKIFVQ
U1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gImJvb3N0LSg/UDxwdmVyPihcZCsoXC5cZCspKykp
IgotLSAKMi40Ny4xCgo=

--===============0085997257559632582==--

