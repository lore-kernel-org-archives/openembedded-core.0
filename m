Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C2EC3DA6F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:17 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.13625.1713248050721934606
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QGsSHhD6;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=sb73hhli;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018ee58a9c1b-618d9247-ad5a-48b8-8188-f386ec8734e7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248050;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=oxJ/B8h1I8ab5EE9Va3fUp0yD7DuV3AcSApG2XW3c4A=;
	b=QGsSHhD6YspxlzREufNuVh3Zqqa53SUIdeeUe3pZjfzmyRWUDW5u8n7ye6AsW5Xe
	FLCf2Wi8WhaxEgmcXnsafjcnIljM8xagYLfJd3S9pcqbjR2GIRgvsDh/C0E2DEk7EWe
	37Fu0NmZBvnYO1eNhZ0bf1Tk9mY44yl0ILEre+Uo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248050;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=oxJ/B8h1I8ab5EE9Va3fUp0yD7DuV3AcSApG2XW3c4A=;
	b=sb73hhliYehxFj1Fs4L8bNfVg7bGmlXzkfAk0pbTTHb3dQ5Yik0gnKXEUnpsaGaA
	cQsTWMAEeQUhtJJ6YsQbiSn7ViQovEY0WkRIzed+ehBarNzdLMYLmyXVq2Cq17KSTkO
	2vwqaGJ/UunVenYOFKrEB+ym4Dgqm77JJXxAXHC8=
Content-Type: multipart/mixed; boundary="===============4000776544661699055=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] encodings: upgrading to 1.1.0 SUCCEEDED
Message-ID: <0101018ee58a9c1b-618d9247-ad5a-48b8-8188-f386ec8734e7-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198377

--===============4000776544661699055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *encodings* to *1.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-encodings-upgrade-1.0.7-1.1.0.patch
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
From 533753a4c6e0284ee32fac76cf0d48f057693b87 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Apr 2024 00:21:10 +0000
Subject: [PATCH] encodings: upgrade 1.0.7 -> 1.1.0

---
 .../xorg-font/{encodings_1.0.7.bb => encodings_1.1.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-font/{encodings_1.0.7.bb => encodings_1.1.0.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb b/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-font/encodings_1.0.7.bb
rename to meta/recipes-graphics/xorg-font/encodings_1.1.0.bb
index 5906da416a..7432c08ec0 100644
--- a/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb
+++ b/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb
@@ -11,7 +11,7 @@ PE = "1"
 DEPENDS = "mkfontscale-native mkfontdir-native font-util-native"
 RDEPENDS:${PN} = ""
 
-SRC_URI[sha256sum] = "3a39a9f43b16521cdbd9f810090952af4f109b44fa7a865cd555f8febcea70a4"
+SRC_URI[sha256sum] = "9ff13c621756cfa12e95f32ba48a5b23839e8f577d0048beda66c67dab4de975"
 
 SRC_URI_EXT = "xz"
 
-- 
2.42.0


--===============4000776544661699055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/encodings/encodings: FILELIST: added "/usr/share/fonts/X11/encodings/iso8859-14.enc.gz"

--===============4000776544661699055==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-encodings-upgrade-1.0.7-1.1.0.patch"

RnJvbSA1MzM3NTNhNGM2ZTAyODRlZTMyZmFjNzZjZjBkNDhmMDU3NjkzYjg3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgQXByIDIwMjQgMDA6MjE6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
bmNvZGluZ3M6IHVwZ3JhZGUgMS4wLjcgLT4gMS4xLjAKCi0tLQogLi4uL3hvcmctZm9udC97ZW5j
b2RpbmdzXzEuMC43LmJiID0+IGVuY29kaW5nc18xLjEuMC5iYn0gICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3hvcmctZm9udC97ZW5jb2RpbmdzXzEuMC43LmJiID0+IGVuY29kaW5n
c18xLjEuMC5iYn0gKDg2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9y
Zy1mb250L2VuY29kaW5nc18xLjAuNy5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWZv
bnQvZW5jb2RpbmdzXzEuMS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggODYlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWZvbnQvZW5jb2RpbmdzXzEuMC43LmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1mb250L2VuY29kaW5nc18xLjEuMC5iYgppbmRl
eCA1OTA2ZGE0MTZhLi43NDMyYzA4ZWMwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MveG9yZy1mb250L2VuY29kaW5nc18xLjAuNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MveG9yZy1mb250L2VuY29kaW5nc18xLjEuMC5iYgpAQCAtMTEsNyArMTEsNyBAQCBQRSA9ICIx
IgogREVQRU5EUyA9ICJta2ZvbnRzY2FsZS1uYXRpdmUgbWtmb250ZGlyLW5hdGl2ZSBmb250LXV0
aWwtbmF0aXZlIgogUkRFUEVORFM6JHtQTn0gPSAiIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
M2EzOWE5ZjQzYjE2NTIxY2RiZDlmODEwMDkwOTUyYWY0ZjEwOWI0NGZhN2E4NjVjZDU1NWY4ZmVi
Y2VhNzBhNCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5ZmYxM2M2MjE3NTZjZmExMmU5NWYzMmJh
NDhhNWIyMzgzOWU4ZjU3N2QwMDQ4YmVkYTY2YzY3ZGFiNGRlOTc1IgogCiBTUkNfVVJJX0VYVCA9
ICJ4eiIKIAotLSAKMi40Mi4wCgo=

--===============4000776544661699055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/encodings/encodings-dbg: PKGV changed from 1.0.7 [default] to 1.1.0 [default]
packages/all-poky-linux/encodings/encodings-dbg: PV changed from "1.0.7" to "1.1.0"
packages/all-poky-linux/encodings/encodings-dev: PKGV changed from 1.0.7 [default] to 1.1.0 [default]
packages/all-poky-linux/encodings/encodings-dev: PV changed from "1.0.7" to "1.1.0"
packages/all-poky-linux/encodings/encodings-doc: PKGV changed from 1.0.7 [default] to 1.1.0 [default]
packages/all-poky-linux/encodings/encodings-doc: PV changed from "1.0.7" to "1.1.0"
packages/all-poky-linux/encodings/encodings-locale: PKGV changed from 1.0.7 [default] to 1.1.0 [default]
packages/all-poky-linux/encodings/encodings-locale: PV changed from "1.0.7" to "1.1.0"
packages/all-poky-linux/encodings/encodings-src: PKGV changed from 1.0.7 [default] to 1.1.0 [default]
packages/all-poky-linux/encodings/encodings-src: PV changed from "1.0.7" to "1.1.0"
packages/all-poky-linux/encodings/encodings-staticdev: PKGV changed from 1.0.7 [default] to 1.1.0 [default]
packages/all-poky-linux/encodings/encodings-staticdev: PV changed from "1.0.7" to "1.1.0"
packages/all-poky-linux/encodings/encodings: FILELIST: added "/usr/share/fonts/X11/encodings/iso8859-14.enc.gz"
packages/all-poky-linux/encodings/encodings: PKGV changed from 1.0.7 [default] to 1.1.0 [default]
packages/all-poky-linux/encodings/encodings: PV changed from "1.0.7" to "1.1.0"
packages/all-poky-linux/encodings/encodings: PKGSIZE changed from 643033 to 644033 (+0%)
packages/all-poky-linux/encodings: PKGV changed from 1.0.7 [default] to 1.1.0 [default]
packages/all-poky-linux/encodings: SRC_URI changed from "https://www.x.org/releases//individual/font/encodings-1.0.7.tar.xz" to "https://www.x.org/releases//individual/font/encodings-1.1.0.tar.xz"
packages/all-poky-linux/encodings: PV changed from "1.0.7" to "1.1.0"

--===============4000776544661699055==--

