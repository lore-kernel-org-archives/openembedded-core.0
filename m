Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6D5C4828F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:53 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.63139.1702649863638533798
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EvA5UnIf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Bov/9A3q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018c6dd71b1f-59a0a3e8-e53d-4386-a378-4f175ab28ffa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649863;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1WkcLldHPlClNUwf4C1rKkonZ66JebPJba/2CvUU1qA=;
	b=EvA5UnIfjr3dt95WJVna1Lv5qsGvcFOSA/LICGxr1V1feTUq5oRuznVZuh3m5OHf
	jgV6FjqCNmqaG+XeaDEGl4wcKAIEyi+fcFSguYjQCDqcDUYMKEo4H0+VeMIdDyDwwYR
	h0udnqCMqbNGh9lEidk29+9gQcN1zLY5Ke9e93es=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649863;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1WkcLldHPlClNUwf4C1rKkonZ66JebPJba/2CvUU1qA=;
	b=Bov/9A3qr9kWFG13piWckUz7ewVLyQ2jxxJ0iXQp9VrTVvzlBUYmab6rIuZUXhJD
	Q+RJtyBruU6iWBTKyygX6oGGQHfpNqkbM3k+oW91SgScpiE+zRtRnijs2NX4Hx7hwko
	Bi4MFdPjsAiWpNw5ecHIlK4AZ90ify9jmE/Qt3gA=
Content-Type: multipart/mixed; boundary="===============8939906272762207446=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 2.1.0 SUCCEEDED
Message-ID: <0101018c6dd71b1f-59a0a3e8-e53d-4386-a378-4f175ab28ffa-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:42 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192457

--===============8939906272762207446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pkgconf* to *2.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-2.0.3-2.1.0.patch
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
From ad430f2217755c12d924d795c71d592b76e19587 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Dec 2023 07:27:27 +0000
Subject: [PATCH] pkgconf: upgrade 2.0.3 -> 2.1.0

---
 .../pkgconf/{pkgconf_2.0.3.bb => pkgconf_2.1.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_2.0.3.bb => pkgconf_2.1.0.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.0.3.bb b/meta/recipes-devtools/pkgconf/pkgconf_2.1.0.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_2.0.3.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_2.1.0.bb
index 5aa5a191f2..1921f3a086 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.0.3.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.1.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "cabdf3c474529854f7ccce8573c5ac68ad34a7e621037535cbc3981f6b23836c"
+SRC_URI[sha256sum] = "266d5861ee51c52bc710293a1d36622ae16d048d71ec56034a02eb9cf9677761"
 
 inherit autotools
 
-- 
2.42.0


--===============8939906272762207446==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-2.0.3-2.1.0.patch"

RnJvbSBhZDQzMGYyMjE3NzU1YzEyZDkyNGQ3OTVjNzFkNTkyYjc2ZTE5NTg3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgRGVjIDIwMjMgMDc6Mjc6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
a2djb25mOiB1cGdyYWRlIDIuMC4zIC0+IDIuMS4wCgotLS0KIC4uLi9wa2djb25mL3twa2djb25m
XzIuMC4zLmJiID0+IHBrZ2NvbmZfMi4xLjAuYmJ9ICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9wa2djb25mL3twa2djb25mXzIuMC4zLmJiID0+IHBrZ2NvbmZfMi4xLjAu
YmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtn
Y29uZl8yLjAuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMi4x
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BrZ2NvbmYvcGtnY29uZl8yLjAuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BrZ2NvbmYvcGtnY29uZl8yLjEuMC5iYgppbmRleCA1YWE1YTE5MWYyLi4xOTIxZjNhMDg2
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzIuMC4z
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMi4xLjAuYmIK
QEAgLTIwLDcgKzIwLDcgQEAgU1JDX1VSSSA9ICJcCiAgICAgZmlsZTovL3BrZy1jb25maWctbmF0
aXZlLmluIFwKICAgICBmaWxlOi8vcGtnLWNvbmZpZy1lc2RrLmluIFwKICIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICJjYWJkZjNjNDc0NTI5ODU0ZjdjY2NlODU3M2M1YWM2OGFkMzRhN2U2MjEwMzc1
MzVjYmMzOTgxZjZiMjM4MzZjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI2NmQ1ODYxZWU1MWM1
MmJjNzEwMjkzYTFkMzY2MjJhZTE2ZDA0OGQ3MWVjNTYwMzRhMDJlYjljZjk2Nzc3NjEiCiAKIGlu
aGVyaXQgYXV0b3Rvb2xzCiAKLS0gCjIuNDIuMAoK

--===============8939906272762207446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/pkgconf: PKGV changed from 2.0.3 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.ariadne.space/pkgconf/pkgconf-2.0.3.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.ariadne.space/pkgconf/pkgconf-2.1.0.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/core2-64-poky-linux/pkgconf: PV changed from "2.0.3" to "2.1.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 2.0.3 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 310288 to 314232 (+1%)
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: PV changed from "2.0.3" to "2.1.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 2.0.3 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-dev: PKGSIZE changed from 24195 to 24354 (+1%)
packages/core2-64-poky-linux/pkgconf/pkgconf-dev: PV changed from "2.0.3" to "2.1.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 2.0.3 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-doc: PV changed from "2.0.3" to "2.1.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 2.0.3 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-locale: PV changed from "2.0.3" to "2.1.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-src: PKGV changed from 2.0.3 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 269541 to 273448 (+1%)
packages/core2-64-poky-linux/pkgconf/pkgconf-src: PV changed from "2.0.3" to "2.1.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 2.0.3 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "2.0.3" to "2.1.0"
packages/core2-64-poky-linux/pkgconf/pkgconf: PKGV changed from 2.0.3 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf: PKGSIZE changed from 154025 to 154057 (+0%)
packages/core2-64-poky-linux/pkgconf/pkgconf: PV changed from "2.0.3" to "2.1.0"

--===============8939906272762207446==--

