Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654F2C2BA15
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:11 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.13435.1713248038923158842
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PabXJR8X;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=p1vBruzf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018ee58a6ca0-5eb937fa-b4cc-4c07-b536-9c0e829fcb28-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VPJa1FKGaHAr8lp6Rgf8HyJ3yVAkw9LaPLq05Zj11xw=;
	b=PabXJR8XOdYTmCXBRqxEcSkuC8Y8JXag3GzM3wl69xVHvrfF9+yTT0gY4e+Al78j
	WE6lwJwQ24X/nriLlgC19ETZoryiPdrjghGWwDyXquiYIglY5EL3hjp1+CvBHG5aX6O
	Dv3Hfj7QfCt6k+WDCpMyM4YYo1gR3GVYHWXe5UCE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VPJa1FKGaHAr8lp6Rgf8HyJ3yVAkw9LaPLq05Zj11xw=;
	b=p1vBruzfVDK9fQa4h9OPOxzo1stwDQGluujEMEfFAh79bg8P4MuDDM/xSV1+mB8c
	tOgHhSwp4WmqjFxkgG2K3pJ0N5HgW8zf1DEOge7zRmzcYXS8KJSIPHharrLAohS+dVC
	vKw0LR4w0aqQ3ILLSaZ6KgNtIi1khWgvJM81Sr+g=
Content-Type: multipart/mixed; boundary="===============0560235409473795472=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ninja: upgrading to 1.12.0 SUCCEEDED
Message-ID: <0101018ee58a6ca0-5eb937fa-b4cc-4c07-b536-9c0e829fcb28-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198277

--===============0560235409473795472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ninja* to *1.12.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ninja-upgrade-1.11.1-1.12.0.patch
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
From 58606c053c0b677c5c3da483cb70fb15b9e2098d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 18:46:46 +0000
Subject: [PATCH] ninja: upgrade 1.11.1 -> 1.12.0

---
 .../recipes-devtools/ninja/{ninja_1.11.1.bb => ninja_1.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ninja/{ninja_1.11.1.bb => ninja_1.12.0.bb} (94%)

diff --git a/meta/recipes-devtools/ninja/ninja_1.11.1.bb b/meta/recipes-devtools/ninja/ninja_1.12.0.bb
similarity index 94%
rename from meta/recipes-devtools/ninja/ninja_1.11.1.bb
rename to meta/recipes-devtools/ninja/ninja_1.12.0.bb
index 8e297ec4d4..ef7f80d0ae 100644
--- a/meta/recipes-devtools/ninja/ninja_1.11.1.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.12.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
 
 DEPENDS = "re2c-native ninja-native"
 
-SRCREV = "a524bf3f6bacd1b4ad85d719eed2737d8562f27a"
+SRCREV = "65d0dfcbbea6b8ca7d8a3a0f673ecb522379e43c"
 
 SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
-- 
2.42.0


--===============0560235409473795472==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ninja-upgrade-1.11.1-1.12.0.patch"

RnJvbSA1ODYwNmMwNTNjMGI2NzdjNWMzZGE0ODNjYjcwZmIxNWI5ZTIwOThkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTg6NDY6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
aW5qYTogdXBncmFkZSAxLjExLjEgLT4gMS4xMi4wCgotLS0KIC4uLi9yZWNpcGVzLWRldnRvb2xz
L25pbmphL3tuaW5qYV8xLjExLjEuYmIgPT4gbmluamFfMS4xMi4wLmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9uaW5qYS97bmluamFfMS4xMS4xLmJiID0+IG5pbmphXzEuMTIuMC5iYn0g
KDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmluamEvbmluamFfMS4x
MS4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL25pbmphL25pbmphXzEuMTIuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmluamEv
bmluamFfMS4xMS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmluamEvbmlu
amFfMS4xMi4wLmJiCmluZGV4IDhlMjk3ZWM0ZDQuLmVmN2Y4MGQwYWUgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9uaW5qYS9uaW5qYV8xLjExLjEuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL25pbmphL25pbmphXzEuMTIuMC5iYgpAQCAtNiw3ICs2LDcgQEAgTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YTgxNTg2YTY0YWQ0ZTQ3NmM3OTFjZGE3
ZTJmMmM1MmUiCiAKIERFUEVORFMgPSAicmUyYy1uYXRpdmUgbmluamEtbmF0aXZlIgogCi1TUkNS
RVYgPSAiYTUyNGJmM2Y2YmFjZDFiNGFkODVkNzE5ZWVkMjczN2Q4NTYyZjI3YSIKK1NSQ1JFViA9
ICI2NWQwZGZjYmJlYTZiOGNhN2Q4YTNhMGY2NzNlY2I1MjIzNzllNDNjIgogCiBTUkNfVVJJID0g
ImdpdDovL2dpdGh1Yi5jb20vbmluamEtYnVpbGQvbmluamEuZ2l0O2JyYW5jaD1yZWxlYXNlO3By
b3RvY29sPWh0dHBzIgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAidig/UDxwdmVyPi4q
KSIKLS0gCjIuNDIuMAoK

--===============0560235409473795472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ninja: PV changed from "1.11.1" to "1.12.0"
packages/core2-64-poky-linux/ninja: PKGV changed from 1.11.1 [default] to 1.12.0 [default]
packages/core2-64-poky-linux/ninja/ninja-dbg: PV changed from "1.11.1" to "1.12.0"
packages/core2-64-poky-linux/ninja/ninja-dbg: PKGV changed from 1.11.1 [default] to 1.12.0 [default]
packages/core2-64-poky-linux/ninja/ninja-dbg: PKGSIZE changed from 7433976 to 7398856 (-0%)
packages/core2-64-poky-linux/ninja/ninja-dev: PV changed from "1.11.1" to "1.12.0"
packages/core2-64-poky-linux/ninja/ninja-dev: PKGV changed from 1.11.1 [default] to 1.12.0 [default]
packages/core2-64-poky-linux/ninja/ninja-doc: PV changed from "1.11.1" to "1.12.0"
packages/core2-64-poky-linux/ninja/ninja-doc: PKGV changed from 1.11.1 [default] to 1.12.0 [default]
packages/core2-64-poky-linux/ninja/ninja-locale: PV changed from "1.11.1" to "1.12.0"
packages/core2-64-poky-linux/ninja/ninja-locale: PKGV changed from 1.11.1 [default] to 1.12.0 [default]
packages/core2-64-poky-linux/ninja/ninja-src: PV changed from "1.11.1" to "1.12.0"
packages/core2-64-poky-linux/ninja/ninja-src: PKGV changed from 1.11.1 [default] to 1.12.0 [default]
packages/core2-64-poky-linux/ninja/ninja-src: PKGSIZE changed from 407229 to 427068 (+5%)
packages/core2-64-poky-linux/ninja/ninja-staticdev: PV changed from "1.11.1" to "1.12.0"
packages/core2-64-poky-linux/ninja/ninja-staticdev: PKGV changed from 1.11.1 [default] to 1.12.0 [default]
packages/core2-64-poky-linux/ninja/ninja: PV changed from "1.11.1" to "1.12.0"
packages/core2-64-poky-linux/ninja/ninja: PKGV changed from 1.11.1 [default] to 1.12.0 [default]

--===============0560235409473795472==--

