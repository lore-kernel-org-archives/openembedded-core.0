Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DFEC001DF
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:38 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.5963.1689456457109538255
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FVg8rrp+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101895b73b397-ea12f646-41c6-451a-8128-29e8ccdbfc60-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456456;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FswzisOsEhrAjxtwnu+Ire3JrRH1hclEXthSJkYKeV8=;
	b=FVg8rrp+/fThe0qwcVXJk3/XFY/QPFzBjCgiNtC943gpcfhjvelUMhyD0dFfJ4Ax
	ZOlCnOhqORkljfNUYABHoV01xMmiLnUJ0TMiUyoEEYDXRKMDZ7QwiqpAKJPKTwzsCgk
	d9h12pJr1o/VTOCm4dw0LBKTrS9D+2KhHLYscw2w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456456;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FswzisOsEhrAjxtwnu+Ire3JrRH1hclEXthSJkYKeV8=;
	b=f8izc/ONJgf6wA+Ho7901i1G/cbJDWJG4xsOhQWSIQfqyBzFU843WpPlMrYx6x91
	+sofeDanV7dJCt2Zps45PL+FY0W8PgktHXrGjU/QW0kSXFnSJF/osC/jciyZozWWTI1
	a/7znXEQhLUA7BzIsUxItZlwCKENwtJ+w0cMuZWw=
Content-Type: multipart/mixed; boundary="===============5774473637432424443=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] taglib: upgrading to 1.13.1 SUCCEEDED
Message-ID: <010101895b73b397-ea12f646-41c6-451a-8128-29e8ccdbfc60-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184406

--===============5774473637432424443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *taglib* to *1.13.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-taglib-upgrade-1.13-1.13.1.patch
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
From ff1cabbddd0b0f14da3a47e662c247eb8b8a0ef4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 21:22:53 +0000
Subject: [PATCH] taglib: upgrade 1.13 -> 1.13.1

---
 .../recipes-support/taglib/{taglib_1.13.bb => taglib_1.13.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/taglib/{taglib_1.13.bb => taglib_1.13.1.bb} (95%)

diff --git a/meta/recipes-support/taglib/taglib_1.13.bb b/meta/recipes-support/taglib/taglib_1.13.1.bb
similarity index 95%
rename from meta/recipes-support/taglib/taglib_1.13.bb
rename to meta/recipes-support/taglib/taglib_1.13.1.bb
index 6560bc3660..3f0a759f95 100644
--- a/meta/recipes-support/taglib/taglib_1.13.bb
+++ b/meta/recipes-support/taglib/taglib_1.13.1.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "58f08b4db3dc31ed152c04896ee9172d22052bc7ef12888028c01d8b1d60ade0"
+SRC_URI[sha256sum] = "c8da2b10f1bfec2cd7dbfcd33f4a2338db0765d851a50583d410bacf055cfd0b"
 
 UPSTREAM_CHECK_URI = "https://taglib.org/"
 
-- 
2.39.2


--===============5774473637432424443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/taglib: PV changed from "1.13" to "1.13.1"
packages/core2-32-poky-linux/taglib: SRC_URI changed from "http://taglib.github.io/releases/taglib-1.13.tar.gz" to "http://taglib.github.io/releases/taglib-1.13.1.tar.gz"
packages/core2-32-poky-linux/taglib: PKGV changed from 1.13 [default] to 1.13.1 [default]
Changes to packages/core2-32-poky-linux/taglib (sysroot):
  /usr/lib/libtag.so.1 changed symlink target from libtag.so.1.19.0 to libtag.so.1.19.1
  /usr/lib/libtag.so.1.19.0 moved to /usr/lib/libtag.so.1.19.1
packages/core2-32-poky-linux/taglib/taglib-c: PV changed from "1.13" to "1.13.1"
packages/core2-32-poky-linux/taglib/taglib-c: PKGV changed from 1.13 [default] to 1.13.1 [default]
packages/core2-32-poky-linux/taglib/taglib-dbg: PV changed from "1.13" to "1.13.1"
packages/core2-32-poky-linux/taglib/taglib-dbg: FILELIST: removed "/usr/lib/.debug/libtag.so.1.19.0", added "/usr/lib/.debug/libtag.so.1.19.1"
packages/core2-32-poky-linux/taglib/taglib-dbg: PKGV changed from 1.13 [default] to 1.13.1 [default]
packages/core2-32-poky-linux/taglib/taglib-dbg: PKGSIZE changed from 5977992 to 5979472 (+0%)
packages/core2-32-poky-linux/taglib/taglib-dev: PV changed from "1.13" to "1.13.1"
packages/core2-32-poky-linux/taglib/taglib-dev: PKGV changed from 1.13 [default] to 1.13.1 [default]
packages/core2-32-poky-linux/taglib/taglib-dev: PKGSIZE changed from 660052 to 663820 (+1%)
packages/core2-32-poky-linux/taglib/taglib-doc: PV changed from "1.13" to "1.13.1"
packages/core2-32-poky-linux/taglib/taglib-doc: PKGV changed from 1.13 [default] to 1.13.1 [default]
packages/core2-32-poky-linux/taglib/taglib-locale: PV changed from "1.13" to "1.13.1"
packages/core2-32-poky-linux/taglib/taglib-locale: PKGV changed from 1.13 [default] to 1.13.1 [default]
packages/core2-32-poky-linux/taglib/taglib-src: PV changed from "1.13" to "1.13.1"
packages/core2-32-poky-linux/taglib/taglib-src: PKGV changed from 1.13 [default] to 1.13.1 [default]
packages/core2-32-poky-linux/taglib/taglib-src: PKGSIZE changed from 1510558 to 1515885 (+0%)
packages/core2-32-poky-linux/taglib/taglib-staticdev: PV changed from "1.13" to "1.13.1"
packages/core2-32-poky-linux/taglib/taglib-staticdev: PKGV changed from 1.13 [default] to 1.13.1 [default]
packages/core2-32-poky-linux/taglib/taglib: PV changed from "1.13" to "1.13.1"
packages/core2-32-poky-linux/taglib/taglib: FILELIST: removed "/usr/lib/libtag.so.1.19.0", added "/usr/lib/libtag.so.1.19.1"
packages/core2-32-poky-linux/taglib/taglib: PKGV changed from 1.13 [default] to 1.13.1 [default]

--===============5774473637432424443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/taglib (sysroot):
  /usr/lib/libtag.so.1 changed symlink target from libtag.so.1.19.0 to libtag.so.1.19.1
  /usr/lib/libtag.so.1.19.0 moved to /usr/lib/libtag.so.1.19.1
packages/core2-32-poky-linux/taglib/taglib: FILELIST: removed "/usr/lib/libtag.so.1.19.0", added "/usr/lib/libtag.so.1.19.1"

--===============5774473637432424443==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-taglib-upgrade-1.13-1.13.1.patch"

RnJvbSBmZjFjYWJiZGRkMGIwZjE0ZGEzYTQ3ZTY2MmMyNDdlYjhiOGEwZWY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMjE6MjI6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
YWdsaWI6IHVwZ3JhZGUgMS4xMyAtPiAxLjEzLjEKCi0tLQogLi4uL3JlY2lwZXMtc3VwcG9ydC90
YWdsaWIve3RhZ2xpYl8xLjEzLmJiID0+IHRhZ2xpYl8xLjEzLjEuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvdGFnbGliL3t0YWdsaWJfMS4xMy5iYiA9PiB0YWdsaWJfMS4xMy4xLmJifSAo
OTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3RhZ2xpYi90YWdsaWJfMS4x
My5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3RhZ2xpYi90YWdsaWJfMS4xMy4xLmJiCnNpbWls
YXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3RhZ2xpYi90
YWdsaWJfMS4xMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdGFnbGliL3RhZ2xp
Yl8xLjEzLjEuYmIKaW5kZXggNjU2MGJjMzY2MC4uM2YwYTc1OWY5NSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvdGFnbGliL3RhZ2xpYl8xLjEzLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L3RhZ2xpYi90YWdsaWJfMS4xMy4xLmJiCkBAIC0xMSw3ICsxMSw3IEBAIERFUEVO
RFMgPSAiemxpYiIKIAogU1JDX1VSSSA9ICJodHRwOi8vdGFnbGliLmdpdGh1Yi5pby9yZWxlYXNl
cy8ke0JQfS50YXIuZ3oiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1OGYwOGI0ZGIzZGMzMWVk
MTUyYzA0ODk2ZWU5MTcyZDIyMDUyYmM3ZWYxMjg4ODAyOGMwMWQ4YjFkNjBhZGUwIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gImM4ZGEyYjEwZjFiZmVjMmNkN2RiZmNkMzNmNGEyMzM4ZGIwNzY1ZDg1
MWE1MDU4M2Q0MTBiYWNmMDU1Y2ZkMGIiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczov
L3RhZ2xpYi5vcmcvIgogCi0tIAoyLjM5LjIKCg==

--===============5774473637432424443==--

