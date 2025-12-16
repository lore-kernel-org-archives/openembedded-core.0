Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2CDD5B161
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:23 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17387.1765872133847192755
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=2STahZoD;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=gupiLlCO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019b262e63c8-19c27b48-5476-4efc-bc71-294d97a1dc82-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872133;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zWOd8Dt2AduQLGekgtKxMRhrPAHI9JcZwwGfDY6AnHY=;
	b=2STahZoDXCn0e352xZWz6auYH2+qwbeioMxM3pzxIkfRIU052LGZ4uHsAoE3vLZu
	VMF5y2vIAPQ9zWeXt2P6xvFL2IoYryx4uu81tIbUXvN/pB/aaSOFZTGlznERF9+0GYN
	T1ro9wiXZ4ejOoQPAIsHzf/WVOiQbL0DU0BwxH50=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872133;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zWOd8Dt2AduQLGekgtKxMRhrPAHI9JcZwwGfDY6AnHY=;
	b=gupiLlCO+8onz6ZEk15ShXC1vzcH0eYBf90CF6YzBBuuQ3HHO3MXpp3U+YHmPZC6
	Zlu+YUrjJT9fdoRSUW7zaz/7cq4R2ggZ5RjXTrrS/zNp5KPN20Lf3Erg3kzkJ7q52DO
	VEoCTvd503uIqnYCsS4Fp20xv+Dhxp7TgUGdIf6g=
Content-Type: multipart/mixed; boundary="===============3073123787688175482=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xcb-util-cursor: upgrading to 0.1.6 SUCCEEDED
Message-ID: <0101019b262e63c8-19c27b48-5476-4efc-bc71-294d97a1dc82-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227771

--===============3073123787688175482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xcb-util-cursor* to *0.1.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xcb-util-cursor-upgrade-0.1.5-0.1.6.patch
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
From 19808a01a830ccacef790a0c0e5b2918ecb153d9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Dec 2025 21:25:10 +0000
Subject: [PATCH] xcb-util-cursor: upgrade 0.1.5 -> 0.1.6

---
 .../{xcb-util-cursor_0.1.5.bb => xcb-util-cursor_0.1.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{xcb-util-cursor_0.1.5.bb => xcb-util-cursor_0.1.6.bb} (72%)

diff --git a/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.5.bb b/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.6.bb
similarity index 72%
rename from meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.5.bb
rename to meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.6.bb
index cd442db210..7c54f6d7a9 100644
--- a/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.5.bb
+++ b/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.6.bb
@@ -7,4 +7,4 @@ DEPENDS += "xcb-util xcb-util-renderutil xcb-util-image"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ce469b61c70ff8d7cce0547476891974"
 
-SRC_URI[sha256sum] = "0caf99b0d60970f81ce41c7ba694e5eaaf833227bb2cbcdb2f6dc9666a663c57"
+SRC_URI[sha256sum] = "fdeb8bd127873519be5cc70dcd0d3b5d33b667877200f9925a59fdcad8f7a933"
-- 
2.47.1


--===============3073123787688175482==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xcb-util-cursor-upgrade-0.1.5-0.1.6.patch"

RnJvbSAxOTgwOGEwMWE4MzBjY2FjZWY3OTBhMGMwZTViMjkxOGVjYjE1M2Q5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgRGVjIDIwMjUgMjE6MjU6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
Y2ItdXRpbC1jdXJzb3I6IHVwZ3JhZGUgMC4xLjUgLT4gMC4xLjYKCi0tLQogLi4uL3t4Y2ItdXRp
bC1jdXJzb3JfMC4xLjUuYmIgPT4geGNiLXV0aWwtY3Vyc29yXzAuMS42LmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3t4Y2ItdXRpbC1jdXJzb3JfMC4xLjUuYmIg
PT4geGNiLXV0aWwtY3Vyc29yXzAuMS42LmJifSAoNzIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLWxpYi94Y2ItdXRpbC1jdXJzb3JfMC4xLjUuYmIgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MveG9yZy1saWIveGNiLXV0aWwtY3Vyc29yXzAuMS42LmJiCnNpbWlsYXJp
dHkgaW5kZXggNzIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi94
Y2ItdXRpbC1jdXJzb3JfMC4xLjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLWxpYi94Y2ItdXRpbC1jdXJzb3JfMC4xLjYuYmIKaW5kZXggY2Q0NDJkYjIxMC4uN2M1NGY2
ZDdhOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3hjYi11dGls
LWN1cnNvcl8wLjEuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIveGNi
LXV0aWwtY3Vyc29yXzAuMS42LmJiCkBAIC03LDQgKzcsNCBAQCBERVBFTkRTICs9ICJ4Y2ItdXRp
bCB4Y2ItdXRpbC1yZW5kZXJ1dGlsIHhjYi11dGlsLWltYWdlIgogTElDRU5TRSA9ICJNSVQiCiBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1jZTQ2OWI2MWM3MGZmOGQ3Y2Nl
MDU0NzQ3Njg5MTk3NCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjBjYWY5OWIwZDYwOTcwZjgx
Y2U0MWM3YmE2OTRlNWVhYWY4MzMyMjdiYjJjYmNkYjJmNmRjOTY2NmE2NjNjNTciCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiZmRlYjhiZDEyNzg3MzUxOWJlNWNjNzBkY2QwZDNiNWQzM2I2Njc4Nzcy
MDBmOTkyNWE1OWZkY2FkOGY3YTkzMyIKLS0gCjIuNDcuMQoK

--===============3073123787688175482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xcb-util-cursor: PV changed from "0.1.5" to "0.1.6"
packages/x86-64-v3-poky-linux/xcb-util-cursor: SRC_URI changed from "http://xcb.freedesktop.org/dist/xcb-util-cursor-0.1.5.tar.xz" to "http://xcb.freedesktop.org/dist/xcb-util-cursor-0.1.6.tar.xz"
packages/x86-64-v3-poky-linux/xcb-util-cursor: PKGV changed from 0.1.5 [default] to 0.1.6 [default]
packages/x86-64-v3-poky-linux/xcb-util-cursor/xcb-util-cursor-dbg: PV changed from "0.1.5" to "0.1.6"
packages/x86-64-v3-poky-linux/xcb-util-cursor/xcb-util-cursor-dbg: PKGV changed from 0.1.5 [default] to 0.1.6 [default]
packages/x86-64-v3-poky-linux/xcb-util-cursor/xcb-util-cursor-dbg: PKGSIZE changed from 45800 to 45816 (+0%)
packages/x86-64-v3-poky-linux/xcb-util-cursor/xcb-util-cursor-dev: PV changed from "0.1.5" to "0.1.6"
packages/x86-64-v3-poky-linux/xcb-util-cursor/xcb-util-cursor-dev: PKGV changed from 0.1.5 [default] to 0.1.6 [default]
packages/x86-64-v3-poky-linux/xcb-util-cursor/xcb-util-cursor-doc: PV changed from "0.1.5" to "0.1.6"
packages/x86-64-v3-poky-linux/xcb-util-cursor/xcb-util-cursor-doc: PKGV changed from 0.1.5 [default] to 0.1.6 [default]
packages/x86-64-v3-poky-linux/xcb-util-cursor/xcb-util-cursor-locale: PV changed from "0.1.5" to "0.1.6"
packages/x86-64-v3-poky-linux/xcb-util-cursor/xcb-util-cursor-locale: PKGV changed from 0.1.5 [default] to 0.1.6 [default]
packages/x86-64-v3-poky-linux/xcb-util-cursor/xcb-util-cursor-src: PV changed from "0.1.5" to "0.1.6"
packages/x86-64-v3-poky-linux/xcb-util-cursor/xcb-util-cursor-src: PKGV changed from 0.1.5 [default] to 0.1.6 [default]
packages/x86-64-v3-poky-linux/xcb-util-cursor/xcb-util-cursor-src: FILELIST: directory renamed /usr/src/debug/xcb-util-cursor/0.1.5/cursor -> /usr/src/debug/xcb-util-cursor/0.1.6/cursor
packages/x86-64-v3-poky-linux/xcb-util-cursor/xcb-util-cursor-src: PKGSIZE changed from 32489 to 32460 (-0%)
packages/x86-64-v3-poky-linux/xcb-util-cursor/xcb-util-cursor-staticdev: PV changed from "0.1.5" to "0.1.6"
packages/x86-64-v3-poky-linux/xcb-util-cursor/xcb-util-cursor-staticdev: PKGV changed from 0.1.5 [default] to 0.1.6 [default]
packages/x86-64-v3-poky-linux/xcb-util-cursor/xcb-util-cursor: PV changed from "0.1.5" to "0.1.6"
packages/x86-64-v3-poky-linux/xcb-util-cursor/xcb-util-cursor: PKGV changed from 0.1.5 [default] to 0.1.6 [default]

--===============3073123787688175482==--

