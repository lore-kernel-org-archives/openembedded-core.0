Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87404C18E1B
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:28 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.841.1686887485213775265
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CnRpW2wF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010188c2544d17-6b2a2ce8-ecb0-4e11-8560-d2c1a53fc8bf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887484;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Kj4lcnXhRhR4BPTI88F1YNMVlJcuNkh3Qi+oYCmEOac=;
	b=CnRpW2wFH2W7JcfvJb5MU1J8on9BIjb1ebjakpUflVzwgMf2gQ0dZxA3LRlc65Co
	mMzj6AS7/6ttGabBiSIzUACVnxc2gGyzausrfOUhFH2m/tKXGSPkITs4Bh7eVpJ5a6/
	Fh7VlHocYugNgWs9bzZo+GjkWY9pwdnLEsuZVjjk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887484;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Kj4lcnXhRhR4BPTI88F1YNMVlJcuNkh3Qi+oYCmEOac=;
	b=EhxO18U1HJzZWDCvo2rTg2x3EF6uHlZGQj+ykmB+WlTr/hagMC+LzNtVGfMzdsDZ
	bPGbfCj2vhRZRixxmkgOMm4STc3RVooodJEWfPYZm2Ws5Xozu0hqV4oiN2t+QKTe7Tf
	79sWVER/dmxnlLYapJtfe/AvNkdkVbx4HAMojLwg=
Content-Type: multipart/mixed; boundary="===============4330582073984530316=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libx11: upgrading to 1.8.5 SUCCEEDED
Message-ID: <01010188c2544d17-6b2a2ce8-ecb0-4e11-8560-d2c1a53fc8bf-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182950

--===============4330582073984530316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libx11* to *1.8.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libx11-upgrade-1.8.4-1.8.5.patch
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
From 2f4c63f51b0a36c9088301a87ce09ca1145f7edc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 21:43:42 +0000
Subject: [PATCH] libx11: upgrade 1.8.4 -> 1.8.5

---
 .../xorg-lib/{libx11_1.8.4.bb => libx11_1.8.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.8.4.bb => libx11_1.8.5.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.5.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.8.5.bb
index 9058c1844e..cf2e29471a 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.5.bb
@@ -24,7 +24,7 @@ XORG_PN = "libX11"
 
 SRC_URI += "file://disable_tests.patch"
 
-SRC_URI[sha256sum] = "c9a287a5aefa9804ce3cfafcf516fe96ed3f7e8e45c0e2ee59e84c86757df518"
+SRC_URI[sha256sum] = "e362c6f03c793171becd1ce2078c64789504c7d7ff48ee40a76ff76b59f6b561"
 
 inherit gettext
 
-- 
2.39.2


--===============4330582073984530316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libx11: PV changed from "1.8.4" to "1.8.5"
packages/core2-32-poky-linux/libx11: SRC_URI changed from "https://www.x.org/releases//individual/lib/libX11-1.8.4.tar.xz file://disable_tests.patch" to "https://www.x.org/releases//individual/lib/libX11-1.8.5.tar.xz file://disable_tests.patch"
packages/core2-32-poky-linux/libx11: PKGV changed from 1.8.4 [default] to 1.8.5 [default]
packages/core2-32-poky-linux/libx11/libx11-dbg: PKGV changed from 1.8.4 [default] to 1.8.5 [default]
packages/core2-32-poky-linux/libx11/libx11-dbg: PV changed from "1.8.4" to "1.8.5"
packages/core2-32-poky-linux/libx11/libx11-dev: PKGV changed from 1.8.4 [default] to 1.8.5 [default]
packages/core2-32-poky-linux/libx11/libx11-dev: PV changed from "1.8.4" to "1.8.5"
packages/core2-32-poky-linux/libx11/libx11-doc: PKGV changed from 1.8.4 [default] to 1.8.5 [default]
packages/core2-32-poky-linux/libx11/libx11-doc: PKGSIZE changed from 1992507 to 1995030 (+0%)
packages/core2-32-poky-linux/libx11/libx11-doc: PV changed from "1.8.4" to "1.8.5"
packages/core2-32-poky-linux/libx11/libx11-locale: PKGV changed from 1.8.4 [default] to 1.8.5 [default]
packages/core2-32-poky-linux/libx11/libx11-locale: PKGSIZE changed from 1163179 to 1111561 (-4%)
packages/core2-32-poky-linux/libx11/libx11-locale: PV changed from "1.8.4" to "1.8.5"
packages/core2-32-poky-linux/libx11/libx11-src: PKGV changed from 1.8.4 [default] to 1.8.5 [default]
packages/core2-32-poky-linux/libx11/libx11-src: PV changed from "1.8.4" to "1.8.5"
packages/core2-32-poky-linux/libx11/libx11-staticdev: PKGV changed from 1.8.4 [default] to 1.8.5 [default]
packages/core2-32-poky-linux/libx11/libx11-staticdev: PV changed from "1.8.4" to "1.8.5"
packages/core2-32-poky-linux/libx11/libx11-xcb: PKGV changed from 1.8.4 [default] to 1.8.5 [default]
packages/core2-32-poky-linux/libx11/libx11-xcb: PV changed from "1.8.4" to "1.8.5"
packages/core2-32-poky-linux/libx11/libx11: PKGV changed from 1.8.4 [default] to 1.8.5 [default]
packages/core2-32-poky-linux/libx11/libx11: PV changed from "1.8.4" to "1.8.5"

--===============4330582073984530316==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libx11-upgrade-1.8.4-1.8.5.patch"

RnJvbSAyZjRjNjNmNTFiMGEzNmM5MDg4MzAxYTg3Y2UwOWNhMTE0NWY3ZWRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMjE6NDM6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4MTE6IHVwZ3JhZGUgMS44LjQgLT4gMS44LjUKCi0tLQogLi4uL3hvcmctbGliL3tsaWJ4MTFf
MS44LjQuYmIgPT4gbGlieDExXzEuOC41LmJifSAgICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3hvcmctbGliL3tsaWJ4MTFfMS44LjQuYmIgPT4gbGlieDExXzEuOC41LmJi
fSAoOTIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4
MTFfMS44LjQuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieDExXzEuOC41
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy94b3JnLWxpYi9saWJ4MTFfMS44LjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy94b3JnLWxpYi9saWJ4MTFfMS44LjUuYmIKaW5kZXggOTA1OGMxODQ0ZS4uY2YyZTI5NDcxYSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYngxMV8xLjguNC5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieDExXzEuOC41LmJiCkBA
IC0yNCw3ICsyNCw3IEBAIFhPUkdfUE4gPSAibGliWDExIgogCiBTUkNfVVJJICs9ICJmaWxlOi8v
ZGlzYWJsZV90ZXN0cy5wYXRjaCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImM5YTI4N2E1YWVm
YTk4MDRjZTNjZmFmY2Y1MTZmZTk2ZWQzZjdlOGU0NWMwZTJlZTU5ZTg0Yzg2NzU3ZGY1MTgiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZTM2MmM2ZjAzYzc5MzE3MWJlY2QxY2UyMDc4YzY0Nzg5NTA0
YzdkN2ZmNDhlZTQwYTc2ZmY3NmI1OWY2YjU2MSIKIAogaW5oZXJpdCBnZXR0ZXh0CiAKLS0gCjIu
MzkuMgoK

--===============4330582073984530316==--

