Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B45D489B4
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:26:03 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1486.1768526757658865956
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QRhOH1gf;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=RRG2g3WJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019bc468bc3d-960bfb47-918a-4641-94b1-69a6131dc9e1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526757;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=A7McuGMRayndUp0ZkywPQrm2k6P0n7+JnXwcuzclbvs=;
	b=QRhOH1gfMrlDBl6z9KpQ2o32oFSPr1syk3pOZw6cFgc9I6YHF2fxHCVwWjR0XS8C
	AjM5z+MIc0JgZbfm7LkMvmYex6BW2sT2Ch08bsjyo7Cq24UcdDHm08xx24Xo2qNVu53
	W9x38cE4FK40UNxRxCOA6KOykxKNwmp4M27f953g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526757;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=A7McuGMRayndUp0ZkywPQrm2k6P0n7+JnXwcuzclbvs=;
	b=RRG2g3WJf3olWqRyqMqq8AUiZd1PIHl4E6LjrZbkae1fuPw2EKg5o3O09ULwpdGg
	JkJN1rKdhcZRmP33KHOzM/83umxdde0hy6dFET3vQU4WTlKywczUh+D6YFcGa3s13Ny
	Iwh3YEDIediqWP6T//Mf/Y/HL0+b0p46P4inNFlI=
Content-Type: multipart/mixed; boundary="===============3382730445940893053=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gstreamer1.0-vaapi: upgrading to 1.26.10 SUCCEEDED
Message-ID: <0101019bc468bc3d-960bfb47-918a-4641-94b1-69a6131dc9e1-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229508

--===============3382730445940893053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-vaapi* to *1.26.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-vaapi-upgrade-1.26.9-1.26.10.patch
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
From 435e99a0e57687a2856df2b3fa4e4006e03eb344 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 16 Jan 2026 00:40:56 +0000
Subject: [PATCH] gstreamer1.0-vaapi: upgrade 1.26.9 -> 1.26.10

---
 ...treamer1.0-vaapi_1.26.9.bb => gstreamer1.0-vaapi_1.26.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.26.9.bb => gstreamer1.0-vaapi_1.26.10.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb
index dc5055bb0c..4f7dfd580c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "bf989040404515dc9b042f4fdc49ff33a6dccf49d544736150e967b42665598e"
+SRC_URI[sha256sum] = "64633e188d0b6005847fd8e3ad70c0c20c86caeeae4f211f3e383b1455fc5d09"
 
 S = "${UNPACKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.47.1


--===============3382730445940893053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PKGSIZE changed from 3665744 to 3665840 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0-vaapi/1.26.9/gst/vaapi -> /usr/src/debug/gstreamer1.0-vaapi/1.26.10/gst/vaapi, directory renamed /usr/src/debug/gstreamer1.0-vaapi/1.26.9/gst-libs/gst/vaapi -> /usr/src/debug/gstreamer1.0-vaapi/1.26.10/gst-libs/gst/vaapi
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.26.9.tar.xz" to "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.26.10.tar.xz"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi: PV changed from "1.26.9" to "1.26.10"

--===============3382730445940893053==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-vaapi-upgrade-1.26.9-1.26.10.patch"

RnJvbSA0MzVlOTlhMGU1NzY4N2EyODU2ZGYyYjNmYTRlNDAwNmUwM2ViMzQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTYgSmFuIDIwMjYgMDA6NDA6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtdmFhcGk6IHVwZ3JhZGUgMS4yNi45IC0+IDEuMjYuMTAKCi0tLQogLi4udHJl
YW1lcjEuMC12YWFwaV8xLjI2LjkuYmIgPT4gZ3N0cmVhbWVyMS4wLXZhYXBpXzEuMjYuMTAuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtdmFh
cGlfMS4yNi45LmJiID0+IGdzdHJlYW1lcjEuMC12YWFwaV8xLjI2LjEwLmJifSAoOTUlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAt
dmFhcGlfMS4yNi45LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJl
YW1lcjEuMC12YWFwaV8xLjI2LjEwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtdmFhcGlfMS4y
Ni45LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLXZhYXBpXzEuMjYuMTAuYmIKaW5kZXggZGM1MDU1YmIwYy4uNGY3ZGZkNTgwYyAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC12
YWFwaV8xLjI2LjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC12YWFwaV8xLjI2LjEwLmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0NPUFlJTkcuTElCO21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhi
MzY0NTE2YyIKIAogU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcv
c3JjLyR7UkVBTFBOfS8ke1JFQUxQTn0tJHtQVn0udGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiYmY5ODkwNDA0MDQ1MTVkYzliMDQyZjRmZGM0OWZmMzNhNmRjY2Y0OWQ1NDQ3MzYxNTBl
OTY3YjQyNjY1NTk4ZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2NDYzM2UxODhkMGI2MDA1ODQ3
ZmQ4ZTNhZDcwYzBjMjBjODZjYWVlYWU0ZjIxMWYzZTM4M2IxNDU1ZmM1ZDA5IgogCiBTID0gIiR7
VU5QQUNLRElSfS8ke1JFQUxQTn0tJHtQVn0iCiBERVBFTkRTID0gImxpYnZhIGdzdHJlYW1lcjEu
MCBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlIGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZCIKLS0g
CjIuNDcuMQoK

--===============3382730445940893053==--

