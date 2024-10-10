Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D67DAD0EE0D
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:05 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.53280.1728588960804544588
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=HHlEgrAP;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=P9lIqJDy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019277ee5042-4a7d2ca0-a5d0-4672-847f-d2b0ef47598e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588960;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KlDFAPL0ODJCRE5Yl89nHEEgG0+q8wE1j6exsH2goyg=;
	b=HHlEgrAPHafSh4duvhEm7UwrpOfUhYBtZ/PFk+0kVZ0D5OYMKBX2ArHp0Fj+9TzD
	Z9lPeU4ul/RgsK91wCCXq5t7luNYSvoZmDbk7T2ZIClBJFSjo2xJCsW9Q1csGbj5sDz
	zcCvlIP7kaJjdt2ylKVjhd+XK+4IqEq2yCa5X1M8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588960;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KlDFAPL0ODJCRE5Yl89nHEEgG0+q8wE1j6exsH2goyg=;
	b=P9lIqJDy/OWmNIV8LyBpYbbp7o1ypwhWV/VN1JFoXOiz+m8RaKWiLJBXxMT+utXx
	AlcCGyNIWhuACVsXYikOEhrk1yY2Tgqi7z1AWcwaee3Xq3yUbtEAQWe5l78jiFlL0AS
	QmFAHOELZSpBIVqrWktAORU/9SeUevm9+kZAZVeg=
Content-Type: multipart/mixed; boundary="===============8158154977442504948=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fribidi: upgrading to 1.0.16 SUCCEEDED
Message-ID: <0101019277ee5042-4a7d2ca0-a5d0-4672-847f-d2b0ef47598e-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:35:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205495

--===============8158154977442504948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fribidi* to *1.0.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fribidi-upgrade-1.0.15-1.0.16.patch
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
From 85dae8db492d530b6958b5bc1d57f330c0eb6d48 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 16:18:24 +0000
Subject: [PATCH] fribidi: upgrade 1.0.15 -> 1.0.16

---
 .../fribidi/{fribidi_1.0.15.bb => fribidi_1.0.16.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/fribidi/{fribidi_1.0.15.bb => fribidi_1.0.16.bb} (89%)

diff --git a/meta/recipes-support/fribidi/fribidi_1.0.15.bb b/meta/recipes-support/fribidi/fribidi_1.0.16.bb
similarity index 89%
rename from meta/recipes-support/fribidi/fribidi_1.0.15.bb
rename to meta/recipes-support/fribidi/fribidi_1.0.16.bb
index 14d901a530..9f75446da2 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.15.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.16.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.xz \
            "
-SRC_URI[sha256sum] = "0bbc7ff633bfa208ae32d7e369cf5a7d20d5d2557a0b067c9aa98bcbf9967587"
+SRC_URI[sha256sum] = "1b1cde5b235d40479e91be2f0e88a309e3214c8ab470ec8a2744d82a5a9ea05c"
 
 inherit meson lib_package pkgconfig github-releases
 
-- 
2.44.1


--===============8158154977442504948==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fribidi-upgrade-1.0.15-1.0.16.patch"

RnJvbSA4NWRhZThkYjQ5MmQ1MzBiNjk1OGI1YmMxZDU3ZjMzMGMwZWI2ZDQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMTY6MTg6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
cmliaWRpOiB1cGdyYWRlIDEuMC4xNSAtPiAxLjAuMTYKCi0tLQogLi4uL2ZyaWJpZGkve2ZyaWJp
ZGlfMS4wLjE1LmJiID0+IGZyaWJpZGlfMS4wLjE2LmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZnJpYmlkaS97ZnJpYmlkaV8xLjAuMTUuYmIgPT4gZnJpYmlkaV8xLjAu
MTYuYmJ9ICg4OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZnJpYmlkaS9m
cmliaWRpXzEuMC4xNS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2ZyaWJpZGkvZnJpYmlkaV8x
LjAuMTYuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvZnJpYmlkaS9mcmliaWRpXzEuMC4xNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvZnJpYmlkaS9mcmliaWRpXzEuMC4xNi5iYgppbmRleCAxNGQ5MDFhNTMwLi45Zjc1NDQ2
ZGEyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9mcmliaWRpL2ZyaWJpZGlfMS4w
LjE1LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2ZyaWJpZGkvZnJpYmlkaV8xLjAuMTYu
YmIKQEAgLTExLDcgKzExLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9YTkxNjQ2N2I5MTA3NmU2MzFkZDhlZGI3NDI0NzY5YzciCiAKIFNSQ19VUkkgPSAiJHtHSVRI
VUJfQkFTRV9VUkl9L2Rvd25sb2FkL3Yke1BWfS8ke0JQfS50YXIueHogXAogICAgICAgICAgICAi
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGJiYzdmZjYzM2JmYTIwOGFlMzJkN2UzNjljZjVhN2Qy
MGQ1ZDI1NTdhMGIwNjdjOWFhOThiY2JmOTk2NzU4NyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIx
YjFjZGU1YjIzNWQ0MDQ3OWU5MWJlMmYwZTg4YTMwOWUzMjE0YzhhYjQ3MGVjOGEyNzQ0ZDgyYTVh
OWVhMDVjIgogCiBpbmhlcml0IG1lc29uIGxpYl9wYWNrYWdlIHBrZ2NvbmZpZyBnaXRodWItcmVs
ZWFzZXMKIAotLSAKMi40NC4xCgo=

--===============8158154977442504948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/fribidi/fribidi-bin: PV changed from "1.0.15" to "1.0.16"
packages/core2-64-poky-linux/fribidi/fribidi-bin: PKGV changed from 1.0.15 [default] to 1.0.16 [default]
packages/core2-64-poky-linux/fribidi/fribidi-dbg: PV changed from "1.0.15" to "1.0.16"
packages/core2-64-poky-linux/fribidi/fribidi-dbg: PKGV changed from 1.0.15 [default] to 1.0.16 [default]
packages/core2-64-poky-linux/fribidi/fribidi-dev: PV changed from "1.0.15" to "1.0.16"
packages/core2-64-poky-linux/fribidi/fribidi-dev: PKGV changed from 1.0.15 [default] to 1.0.16 [default]
packages/core2-64-poky-linux/fribidi/fribidi-doc: PV changed from "1.0.15" to "1.0.16"
packages/core2-64-poky-linux/fribidi/fribidi-doc: PKGSIZE changed from 67636 to 67822 (+0%)
packages/core2-64-poky-linux/fribidi/fribidi-doc: PKGV changed from 1.0.15 [default] to 1.0.16 [default]
packages/core2-64-poky-linux/fribidi/fribidi-locale: PV changed from "1.0.15" to "1.0.16"
packages/core2-64-poky-linux/fribidi/fribidi-locale: PKGV changed from 1.0.15 [default] to 1.0.16 [default]
packages/core2-64-poky-linux/fribidi/fribidi-src: PV changed from "1.0.15" to "1.0.16"
packages/core2-64-poky-linux/fribidi/fribidi-src: PKGSIZE changed from 822026 to 827564 (+1%)
packages/core2-64-poky-linux/fribidi/fribidi-src: PKGV changed from 1.0.15 [default] to 1.0.16 [default]
packages/core2-64-poky-linux/fribidi/fribidi-staticdev: PV changed from "1.0.15" to "1.0.16"
packages/core2-64-poky-linux/fribidi/fribidi-staticdev: PKGV changed from 1.0.15 [default] to 1.0.16 [default]
packages/core2-64-poky-linux/fribidi/fribidi: PV changed from "1.0.15" to "1.0.16"
packages/core2-64-poky-linux/fribidi/fribidi: PKGSIZE changed from 125003 to 129099 (+3%)
packages/core2-64-poky-linux/fribidi/fribidi: PKGV changed from 1.0.15 [default] to 1.0.16 [default]
packages/core2-64-poky-linux/fribidi: SRC_URI changed from "https://github.com/fribidi/fribidi/releases//download/v1.0.15/fribidi-1.0.15.tar.xz" to "https://github.com/fribidi/fribidi/releases//download/v1.0.16/fribidi-1.0.16.tar.xz"
packages/core2-64-poky-linux/fribidi: PV changed from "1.0.15" to "1.0.16"
packages/core2-64-poky-linux/fribidi: PKGV changed from 1.0.15 [default] to 1.0.16 [default]

--===============8158154977442504948==--

