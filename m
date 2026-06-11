Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F76CD98E0
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:32:08 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50412.1781195498993592076
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KH6/IFS6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=sSQdWHM2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019eb786c7b8-808ba497-14df-422c-88f7-ab171d8909b9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195524;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6xvl/6sP8YoXm1FUGgWWRSEqcinCKJJF9PeaRmUQqyQ=;
	b=KH6/IFS6VwIvAs64GvHSyDrGqp75G0OUqh5ohVk7hoE4ruL/iGrLUIoS5DqU0G26
	XAoU4YGecfdZnQnGz7N/zqrA6U1bP6eAMqTqar3Sv0LtpFfjGaoHceQgkyQ0TehT8CE
	4B27Jb0e0N9GCTh3whX5jIxvjhLgkndBJRHcfGQg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195524;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6xvl/6sP8YoXm1FUGgWWRSEqcinCKJJF9PeaRmUQqyQ=;
	b=sSQdWHM2/JDT7piwTYtlyhzo3W8O5BDh16aadu9ZHIKNMmKKz2H6r4VSTlZ2w57p
	fnx0+HrZDN4ptjpDiABKdnZb/FxYB8MEIiiGZA63shTeDzCdahLW8cbnOP7sQ26KKJq
	exRdbc37yfgu2K/Al7UlWXVCrqbRobx/HZznb7sw=
Content-Type: multipart/mixed; boundary="===============6740144200650053256=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libgpg-error: upgrading to 1.61 SUCCEEDED
Message-ID: <0101019eb786c7b8-808ba497-14df-422c-88f7-ab171d8909b9-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:32:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238572

--===============6740144200650053256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libgpg-error* to *1.61* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libgpg-error-upgrade-1.60-1.61.patch
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
From 9d99c6ea40f13e1cf99e75303610758e813af616 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 15:43:19 +0000
Subject: [PATCH] libgpg-error: upgrade 1.60 -> 1.61

---
 .../0001-Do-not-fail-when-testing-config-scripts.patch          | 2 +-
 meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch  | 2 +-
 .../libgpg-error/{libgpg-error_1.60.bb => libgpg-error_1.61.bb} | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.60.bb => libgpg-error_1.61.bb} (95%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
index 3484af63b3..8dd1d46fed 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
@@ -1,4 +1,4 @@
-From 48d457a819d1bf4171c6cc7fe161cdfc66770be2 Mon Sep 17 00:00:00 2001
+From 31c996b40ab91ef3ba26faab642560c42e666f10 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 28 Feb 2020 09:19:56 +0000
 Subject: [PATCH] Do not fail when testing config scripts
diff --git a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
index 485c079a2b..b563751e36 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
@@ -1,4 +1,4 @@
-From 3648accd954d86b14f7a4eb72b9ffa4fe57b72d5 Mon Sep 17 00:00:00 2001
+From 9e0af7a9a4c6712ba14c93ee069fbec3a7edc97a Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 21 Aug 2024 20:03:29 -0700
 Subject: [PATCH] support pkgconfig
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb
similarity index 95%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.60.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.61.bb
index 622827c2ca..de3918a998 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "11b2a738e212f3eab0fe8637bc341d3181ca964e97bb2654de91aab7dae4ce09"
+SRC_URI[sha256sum] = "7a85413f2bc354f4f8aa832b718af122e48965e9e0eb9012ee659c13c6385c93"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.47.1


--===============6740144200650053256==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libgpg-error-upgrade-1.60-1.61.patch"

RnJvbSA5ZDk5YzZlYTQwZjEzZTFjZjk5ZTc1MzAzNjEwNzU4ZTgxM2FmNjE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTU6NDM6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJncGctZXJyb3I6IHVwZ3JhZGUgMS42MCAtPiAxLjYxCgotLS0KIC4uLi8wMDAxLURvLW5vdC1m
YWlsLXdoZW4tdGVzdGluZy1jb25maWctc2NyaXB0cy5wYXRjaCAgICAgICAgICB8IDIgKy0KIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdwZy1lcnJvci9saWJncGctZXJyb3IvcGtnY29uZmlnLnBh
dGNoICB8IDIgKy0KIC4uLi9saWJncGctZXJyb3Ive2xpYmdwZy1lcnJvcl8xLjYwLmJiID0+IGxp
YmdwZy1lcnJvcl8xLjYxLmJifSB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdwZy1l
cnJvci97bGliZ3BnLWVycm9yXzEuNjAuYmIgPT4gbGliZ3BnLWVycm9yXzEuNjEuYmJ9ICg5NSUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ3BnLWVycm9yL2xpYmdwZy1l
cnJvci8wMDAxLURvLW5vdC1mYWlsLXdoZW4tdGVzdGluZy1jb25maWctc2NyaXB0cy5wYXRjaCBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdwZy1lcnJvci9saWJncGctZXJyb3IvMDAwMS1Eby1u
b3QtZmFpbC13aGVuLXRlc3RpbmctY29uZmlnLXNjcmlwdHMucGF0Y2gKaW5kZXggMzQ4NGFmNjNi
My4uOGRkMWQ0NmZlZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ3BnLWVy
cm9yL2xpYmdwZy1lcnJvci8wMDAxLURvLW5vdC1mYWlsLXdoZW4tdGVzdGluZy1jb25maWctc2Ny
aXB0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJncGctZXJyb3IvbGliZ3Bn
LWVycm9yLzAwMDEtRG8tbm90LWZhaWwtd2hlbi10ZXN0aW5nLWNvbmZpZy1zY3JpcHRzLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0OGQ0NTdhODE5ZDFiZjQxNzFjNmNjN2ZlMTYxY2RmYzY2
NzcwYmUyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzMWM5OTZiNDBhYjkxZWYzYmEy
NmZhYWI2NDI1NjBjNDJlNjY2ZjEwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxl
eGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDI4IEZl
YiAyMDIwIDA5OjE5OjU2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIERvIG5vdCBmYWlsIHdoZW4g
dGVzdGluZyBjb25maWcgc2NyaXB0cwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGliZ3BnLWVycm9yL2xpYmdwZy1lcnJvci9wa2djb25maWcucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJncGctZXJyb3IvbGliZ3BnLWVycm9yL3BrZ2NvbmZpZy5wYXRjaAppbmRleCA0
ODVjMDc5YTJiLi5iNTYzNzUxZTM2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJncGctZXJyb3IvbGliZ3BnLWVycm9yL3BrZ2NvbmZpZy5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9saWJncGctZXJyb3IvbGliZ3BnLWVycm9yL3BrZ2NvbmZpZy5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gMzY0OGFjY2Q5NTRkODZiMTRmN2E0ZWI3MmI5ZmZhNGZlNTdiNzJk
NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOWUwYWY3YTlhNGM2NzEyYmExNGM5M2Vl
MDY5ZmJlYzNhN2VkYzk3YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhvbmd4dSBK
aWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgMjEgQXVnIDIwMjQgMjA6
MDM6MjkgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gc3VwcG9ydCBwa2djb25maWcKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdwZy1lcnJvci9saWJncGctZXJyb3JfMS42MC5i
YiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdwZy1lcnJvci9saWJncGctZXJyb3JfMS42MS5i
YgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJncGctZXJyb3IvbGliZ3BnLWVycm9yXzEuNjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1z
dXBwb3J0L2xpYmdwZy1lcnJvci9saWJncGctZXJyb3JfMS42MS5iYgppbmRleCA2MjI4MjdjMmNh
Li5kZTM5MThhOTk4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJncGctZXJy
b3IvbGliZ3BnLWVycm9yXzEuNjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ3Bn
LWVycm9yL2xpYmdwZy1lcnJvcl8xLjYxLmJiCkBAIC0xOSw3ICsxOSw3IEBAIFNSQ19VUkkgPSAi
JHtHTlVQR19NSVJST1J9L2xpYmdwZy1lcnJvci9saWJncGctZXJyb3ItJHtQVn0udGFyLmJ6MiBc
CiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICAiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICIxMWIyYTczOGUyMTJmM2VhYjBmZTg2MzdiYzM0MWQzMTgxY2E5NjRlOTdi
YjI2NTRkZTkxYWFiN2RhZTRjZTA5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdhODU0MTNmMmJj
MzU0ZjRmOGFhODMyYjcxOGFmMTIyZTQ4OTY1ZTllMGViOTAxMmVlNjU5YzEzYzYzODVjOTMiCiAK
IEJJTkNPTkZJRyA9ICIke2JpbmRpcn0vZ3BnLWVycm9yLWNvbmZpZyIKIAotLSAKMi40Ny4xCgo=

--===============6740144200650053256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libgpg-error: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.60.tar.bz2 file://pkgconfig.patch file://0001-Do-not-fail-when-testing-config-scripts.patch file://run-ptest" to "https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.61.tar.bz2 file://pkgconfig.patch file://0001-Do-not-fail-when-testing-config-scripts.patch file://run-ptest"
packages/x86-64-v3-poky-linux/libgpg-error: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dbg: PKGSIZE changed from 1397744 to 1400160 (+0%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dbg: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dbg: FILELIST: removed "/usr/lib/.debug/libgpg-error.so.0.42.0", added "/usr/lib/.debug/libgpg-error.so.0.42.1"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dbg: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dev: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dev: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-doc: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-doc: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-cs: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-cs: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-da: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-da: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-de: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-de: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-eo: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-eo: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-es: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-es: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-fr: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-fr: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-hu: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-hu: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-it: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-it: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ja: PKGSIZE changed from 39127 to 39527 (+1%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ja: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ja: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-nl: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-nl: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-pl: PKGSIZE changed from 35073 to 35396 (+1%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-pl: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-pl: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-pt: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-pt: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ro: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ro: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ru: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ru: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-sr: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-sr: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-sv: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-sv: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-tr: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-tr: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-uk: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-uk: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-vi: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-vi: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-zh-cn: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-zh-cn: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-zh-tw: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-zh-tw: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-ptest: PKGSIZE changed from 299838 to 308030 (+3%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-ptest: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-ptest: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-src: PKGSIZE changed from 1025216 to 1028616 (+0%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-src: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-src: FILELIST: directory renamed /usr/src/debug/libgpg-error/1.60/tests -> /usr/src/debug/libgpg-error/1.61/tests, directory renamed /usr/src/debug/libgpg-error/1.60/src -> /usr/src/debug/libgpg-error/1.61/src, directory renamed /usr/src/debug/libgpg-error/1.60/doc -> /usr/src/debug/libgpg-error/1.61/doc
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-src: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-staticdev: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-staticdev: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error: FILELIST: removed "/usr/lib/libgpg-error.so.0.42.0", added "/usr/lib/libgpg-error.so.0.42.1"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error: PKGV changed from 1.60 [default] to 1.61 [default]
Changes to packages/x86-64-v3-poky-linux/libgpg-error (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.42.0 to libgpg-error.so.0.42.1
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.42.0 to libgpg-error.so.0.42.1
  /usr/lib/libgpg-error.so.0.42.0 moved to /usr/lib/libgpg-error.so.0.42.1
Changes to packages/x86_64-linux/libgpg-error-native (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.42.0 to libgpg-error.so.0.42.1
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.42.0 to libgpg-error.so.0.42.1
  /usr/lib/libgpg-error.so.0.42.0 moved to /usr/lib/libgpg-error.so.0.42.1

--===============6740144200650053256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error: FILELIST: removed "/usr/lib/libgpg-error.so.0.42.0", added "/usr/lib/libgpg-error.so.0.42.1"
Changes to packages/x86-64-v3-poky-linux/libgpg-error (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.42.0 to libgpg-error.so.0.42.1
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.42.0 to libgpg-error.so.0.42.1
  /usr/lib/libgpg-error.so.0.42.0 moved to /usr/lib/libgpg-error.so.0.42.1
Changes to packages/x86_64-linux/libgpg-error-native (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.42.0 to libgpg-error.so.0.42.1
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.42.0 to libgpg-error.so.0.42.1
  /usr/lib/libgpg-error.so.0.42.0 moved to /usr/lib/libgpg-error.so.0.42.1

--===============6740144200650053256==--

