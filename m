Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 342DCC36006
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:20 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.10335.1742048297258881824
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=dZ7RdAVW;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=JgKmGIxA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101959a2b7e8c-5750d20f-2ebc-45e8-8278-d09f8417f592-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048296;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IBHVYRYnWj6Qmbi3/jlvrF+uUWXAhCAAD17BmXJeO28=;
	b=dZ7RdAVW16D0fEWqDFvnwzP0aLWUUqadaRvJytHL2bi+xR5220w1NBpQjGpZVazn
	RpDwmF215Y2Q26Gp/DIFDJZVaxf/Ckpi0GDf7Kp/NJApqpGpdmtZQDsDa1+vMB8wJml
	kdHSaIUCpz/0/8Kp6OdwF+REzvAB3zZMWVbfcbZM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048296;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IBHVYRYnWj6Qmbi3/jlvrF+uUWXAhCAAD17BmXJeO28=;
	b=JgKmGIxAmH+mcFpOPpqmd3aSzmgwcYJxwvLzgcRbM7oXjtSK4drQ8KEIQj/i+WBG
	azhkGDw7spG17+FGWbmtpQ2DbNeZ4h0Gt2cwfJmu7sZ/Cl/xcz0FwZRZxuTr43HiAyR
	vUY6StgyK1zw4L4JKpugyq5/oBWKiAx6EhPFVBw0=
Content-Type: multipart/mixed; boundary="===============5833077861335558226=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 2.4.3 SUCCEEDED
Message-ID: <010101959a2b7e8c-5750d20f-2ebc-45e8-8278-d09f8417f592-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212905

--===============5833077861335558226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pkgconf* to *2.4.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-2.3.0-2.4.3.patch
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
From e7cfd2c022504cb97d19fa1e8c8b6eed4ceba7ba Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 09:04:06 +0000
Subject: [PATCH] pkgconf: upgrade 2.3.0 -> 2.4.3

---
 .../pkgconf/{pkgconf_2.3.0.bb => pkgconf_2.4.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_2.3.0.bb => pkgconf_2.4.3.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.3.0.bb b/meta/recipes-devtools/pkgconf/pkgconf_2.4.3.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_2.3.0.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_2.4.3.bb
index c95ab74838..9695e37bbd 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.3.0.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.4.3.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "3a9080ac51d03615e7c1910a0a2a8df08424892b5f13b0628a204d3fcce0ea8b"
+SRC_URI[sha256sum] = "51203d99ed573fa7344bf07ca626f10c7cc094e0846ac4aa0023bd0c83c25a41"
 
 inherit autotools
 
-- 
2.44.1


--===============5833077861335558226==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-2.3.0-2.4.3.patch"

RnJvbSBlN2NmZDJjMDIyNTA0Y2I5N2QxOWZhMWU4YzhiNmVlZDRjZWJhN2JhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMDk6MDQ6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
a2djb25mOiB1cGdyYWRlIDIuMy4wIC0+IDIuNC4zCgotLS0KIC4uLi9wa2djb25mL3twa2djb25m
XzIuMy4wLmJiID0+IHBrZ2NvbmZfMi40LjMuYmJ9ICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9wa2djb25mL3twa2djb25mXzIuMy4wLmJiID0+IHBrZ2NvbmZfMi40LjMu
YmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtn
Y29uZl8yLjMuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMi40
LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BrZ2NvbmYvcGtnY29uZl8yLjMuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BrZ2NvbmYvcGtnY29uZl8yLjQuMy5iYgppbmRleCBjOTVhYjc0ODM4Li45Njk1ZTM3YmJk
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzIuMy4w
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMi40LjMuYmIK
QEAgLTIwLDcgKzIwLDcgQEAgU1JDX1VSSSA9ICJcCiAgICAgZmlsZTovL3BrZy1jb25maWctbmF0
aXZlLmluIFwKICAgICBmaWxlOi8vcGtnLWNvbmZpZy1lc2RrLmluIFwKICIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICIzYTkwODBhYzUxZDAzNjE1ZTdjMTkxMGEwYTJhOGRmMDg0MjQ4OTJiNWYxM2Iw
NjI4YTIwNGQzZmNjZTBlYThiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjUxMjAzZDk5ZWQ1NzNm
YTczNDRiZjA3Y2E2MjZmMTBjN2NjMDk0ZTA4NDZhYzRhYTAwMjNiZDBjODNjMjVhNDEiCiAKIGlu
aGVyaXQgYXV0b3Rvb2xzCiAKLS0gCjIuNDQuMQoK

--===============5833077861335558226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/pkgconf: PKGV changed from 2.3.0 [default] to 2.4.3 [default]
packages/core2-64-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.ariadne.space/pkgconf/pkgconf-2.3.0.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.ariadne.space/pkgconf/pkgconf-2.4.3.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/core2-64-poky-linux/pkgconf: PV changed from "2.3.0" to "2.4.3"
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 339224 to 361072 (+6%)
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: FILELIST: removed "/usr/lib/.debug/libpkgconf.so.5.0.0", added "/usr/lib/.debug/libpkgconf.so.6.0.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 2.3.0 [default] to 2.4.3 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: PV changed from "2.3.0" to "2.4.3"
packages/core2-64-poky-linux/pkgconf/pkgconf-dev: PKGSIZE changed from 24551 to 25651 (+4%)
packages/core2-64-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 2.3.0 [default] to 2.4.3 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-dev: PV changed from "2.3.0" to "2.4.3"
packages/core2-64-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 2.3.0 [default] to 2.4.3 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-doc: PV changed from "2.3.0" to "2.4.3"
packages/core2-64-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 2.3.0 [default] to 2.4.3 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-locale: PV changed from "2.3.0" to "2.4.3"
packages/core2-64-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 279444 to 288390 (+3%)
packages/core2-64-poky-linux/pkgconf/pkgconf-src: FILELIST: directory renamed /usr/src/debug/pkgconf/2.3.0/cli/bomtool -> /usr/src/debug/pkgconf/2.4.3/cli/bomtool, directory renamed /usr/src/debug/pkgconf/2.3.0/cli -> /usr/src/debug/pkgconf/2.4.3/cli, removed "/usr/src/debug/pkgconf/2.3.0/libpkgconf/audit.c /usr/src/debug/pkgconf/2.3.0/libpkgconf/libpkgconf.h /usr/src/debug/pkgconf/2.3.0/libpkgconf/client.c /usr/src/debug/pkgconf/2.3.0/libpkgconf/parser.c /usr/src/debug/pkgconf/2.3.0/libpkgconf/pkg.c /usr/src/debug/pkgconf/2.3.0/libpkgconf/queue.c /usr/src/debug/pkgconf/2.3.0/libpkgconf/iter.h /usr/src/debug/pkgconf/2.3.0/libpkgconf/argvsplit.c /usr/src/debug/pkgconf/2.3.0/libpkgconf/cache.c /usr/src/debug/pkgconf/2.3.0/libpkgconf/dependency.c /usr/src/debug/pkgconf/2.3.0/libpkgconf/bsdstubs.h /usr/src/debug/pkgconf/2.3.0/libpkgconf/fileio.c /usr/src/debug/pkgconf/2.3.0/libpkgconf/fragment.c /usr/src/debug/pkgconf/2.3.0/libpkgconf/tuple.c /usr/src/debug/pkgconf/2.3.0/libpkgconf/path.
 c /usr/src/debug/pkgconf/2.3.0/libpkgconf/bsdstubs.c /usr/src/debug/pkgconf/2.3.0/libpkgconf/personality.c", added "/usr/src/debug/pkgconf/2.4.3/libpkgconf/audit.c /usr/src/debug/pkgconf/2.4.3/libpkgconf/libpkgconf.h /usr/src/debug/pkgconf/2.4.3/libpkgconf/client.c /usr/src/debug/pkgconf/2.4.3/libpkgconf/parser.c /usr/src/debug/pkgconf/2.4.3/libpkgconf/pkg.c /usr/src/debug/pkgconf/2.4.3/libpkgconf/buffer.c /usr/src/debug/pkgconf/2.4.3/libpkgconf/iter.h /usr/src/debug/pkgconf/2.4.3/libpkgconf/argvsplit.c /usr/src/debug/pkgconf/2.4.3/libpkgconf/cache.c /usr/src/debug/pkgconf/2.4.3/libpkgconf/dependency.c /usr/src/debug/pkgconf/2.4.3/libpkgconf/bsdstubs.h /usr/src/debug/pkgconf/2.4.3/libpkgconf/fileio.c /usr/src/debug/pkgconf/2.4.3/libpkgconf/fragment.c /usr/src/debug/pkgconf/2.4.3/libpkgconf/queue.c /usr/src/debug/pkgconf/2.4.3/libpkgconf/path.c /usr/src/debug/pkgconf/2.4.3/libpkgconf/bsdstubs.c /usr/src/debug/pkgconf/2.4.3/libpkgconf/personality.c /usr/src/debug/pkgconf/2.4.3/libpkgc
 onf/tuple.c"
packages/core2-64-poky-linux/pkgconf/pkgconf-src: PKGV changed from 2.3.0 [default] to 2.4.3 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-src: PV changed from "2.3.0" to "2.4.3"
packages/core2-64-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 2.3.0 [default] to 2.4.3 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "2.3.0" to "2.4.3"
packages/core2-64-poky-linux/pkgconf/pkgconf: PKGSIZE changed from 154584 to 162725 (+5%)
packages/core2-64-poky-linux/pkgconf/pkgconf: FILELIST: removed "/usr/lib/libpkgconf.so.5 /usr/lib/libpkgconf.so.5.0.0", added "/usr/lib/libpkgconf.so.6 /usr/lib/libpkgconf.so.6.0.0"
packages/core2-64-poky-linux/pkgconf/pkgconf: PKGV changed from 2.3.0 [default] to 2.4.3 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf: PV changed from "2.3.0" to "2.4.3"
Changes to packages/core2-64-poky-linux/pkgconf (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.5.0.0 to libpkgconf.so.6.0.0
  /usr/lib/libpkgconf.so.5.0.0 moved to /usr/lib/libpkgconf.so.6.0.0
  /usr/lib/libpkgconf.so.5 moved to /usr/lib/libpkgconf.so.6

--===============5833077861335558226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/pkgconf/pkgconf: FILELIST: removed "/usr/lib/libpkgconf.so.5.0.0 /usr/lib/libpkgconf.so.5", added "/usr/lib/libpkgconf.so.6.0.0 /usr/lib/libpkgconf.so.6"
Changes to packages/core2-64-poky-linux/pkgconf (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.5.0.0 to libpkgconf.so.6.0.0
  /usr/lib/libpkgconf.so.5.0.0 moved to /usr/lib/libpkgconf.so.6.0.0
  /usr/lib/libpkgconf.so.5 moved to /usr/lib/libpkgconf.so.6

--===============5833077861335558226==--

