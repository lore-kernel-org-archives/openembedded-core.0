Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C95F30266
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:42:13 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28977.1773582122437177478
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZqtSp0z+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ahwleoog;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019cf1bb7bf8-32dd4984-4c03-40b5-a353-d9a98537265b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582122;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5pV1iBzhWkz2n7DrJVgYf+LKWB1c0xM28+m6siX+0+Y=;
	b=ZqtSp0z+sr6Rut5h7XsLEBA7QmlDm/iz+AHN2m/Rl4e3GLSML23bTyNnyZ9jIC6h
	VQgPPJAbRbjaFdUcOhFuA8R00vWla9mTuYs+wCmJGm4hN9EwtfwfOyXWc5KXxzdNlNf
	cC/++W/a8DP8hkdIRjP870HVC7rTejYShbbx6FeM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582122;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5pV1iBzhWkz2n7DrJVgYf+LKWB1c0xM28+m6siX+0+Y=;
	b=ahwleoogUNY+Bub/F0TUO7bYvtZV1HqIHEa0+2mMLxfDs76xYBj5oo9p3RWrXBAP
	TLqfKDIDK2FQXnCtqGkoZm7h6GG/LMDjFLi9aplwy6kASwSvncGuHQxJ415GWKrzW52
	2RQhiWU0aO4JSkEMS57Zw4+5gg3a1pxKbhzIvQ1k=
Content-Type: multipart/mixed; boundary="===============3145358609564469386=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lzlib: upgrading to 1.16 SUCCEEDED
Message-ID: <0101019cf1bb7bf8-32dd4984-4c03-40b5-a353-d9a98537265b-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:42:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233161

--===============3145358609564469386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lzlib* to *1.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lzlib-upgrade-1.15-1.16.patch
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
From be308db03d41ed8b9719ac7fb0a4ad0ec77cdfc5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 09:25:28 +0000
Subject: [PATCH] lzlib: upgrade 1.15 -> 1.16

---
 meta/recipes-extended/lzip/{lzlib_1.15.bb => lzlib_1.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lzip/{lzlib_1.15.bb => lzlib_1.16.bb} (93%)

diff --git a/meta/recipes-extended/lzip/lzlib_1.15.bb b/meta/recipes-extended/lzip/lzlib_1.16.bb
similarity index 93%
rename from meta/recipes-extended/lzip/lzlib_1.15.bb
rename to meta/recipes-extended/lzip/lzlib_1.16.bb
index 087b781873..e076581e05 100644
--- a/meta/recipes-extended/lzip/lzlib_1.15.bb
+++ b/meta/recipes-extended/lzip/lzlib_1.16.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=04d943636aa1482e0a97d924d9f4f68f \
                     "
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/lzip/lzlib/lzlib-${PV}.tar.gz"
-SRC_URI[sha256sum] = "4afab907a46d5a7d14e927a1080c3f4d7e3ca5a0f9aea81747d8fed0292377ff"
+SRC_URI[sha256sum] = "203228de911780309dad6813e51541d7ea89469784f01cb661edba080ff1b038"
 
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
-- 
2.47.1


--===============3145358609564469386==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-lzlib-upgrade-1.15-1.16.patch"

RnJvbSBiZTMwOGRiMDNkNDFlZDhiOTcxOWFjN2ZiMGE0YWQwZWM3N2NkZmM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDk6MjU6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
emxpYjogdXBncmFkZSAxLjE1IC0+IDEuMTYKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x6
aXAve2x6bGliXzEuMTUuYmIgPT4gbHpsaWJfMS4xNi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvbHppcC97bHpsaWJfMS4xNS5iYiA9PiBsemxpYl8xLjE2LmJifSAoOTMlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9semlwL2x6bGliXzEuMTUuYmIgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbHppcC9semxpYl8xLjE2LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9semlwL2x6bGliXzEuMTUuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9semlwL2x6bGliXzEuMTYuYmIKaW5kZXggMDg3Yjc4
MTg3My4uZTA3NjU4MWUwNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x6aXAv
bHpsaWJfMS4xNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHppcC9semxpYl8xLjE2
LmJiCkBAIC02LDcgKzYsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21k
NT0wNGQ5NDM2MzZhYTE0ODJlMGE5N2Q5MjRkOWY0ZjY4ZiBcCiAgICAgICAgICAgICAgICAgICAg
ICIKIAogU1JDX1VSSSA9ICIke1NBVkFOTkFIX0dOVV9NSVJST1J9L2x6aXAvbHpsaWIvbHpsaWIt
JHtQVn0udGFyLmd6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRhZmFiOTA3YTQ2ZDVhN2QxNGU5
MjdhMTA4MGMzZjRkN2UzY2E1YTBmOWFlYTgxNzQ3ZDhmZWQwMjkyMzc3ZmYiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiMjAzMjI4ZGU5MTE3ODAzMDlkYWQ2ODEzZTUxNTQxZDdlYTg5NDY5Nzg0ZjAx
Y2I2NjFlZGJhMDgwZmYxYjAzOCIKIAogQiA9ICIke1dPUktESVJ9L2J1aWxkIgogZG9fY29uZmln
dXJlW2NsZWFuZGlyc10gPSAiJHtCfSIKLS0gCjIuNDcuMQoK

--===============3145358609564469386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/lzlib: PKGV changed from 1.15 [default] to 1.16 [default]
packages/x86-64-v3-poky-linux/lzlib: PV changed from "1.15" to "1.16"
packages/x86-64-v3-poky-linux/lzlib: SRC_URI changed from "https://download.savannah.gnu.org/releases/lzip/lzlib/lzlib-1.15.tar.gz" to "https://download.savannah.gnu.org/releases/lzip/lzlib/lzlib-1.16.tar.gz"
packages/x86-64-v3-poky-linux/lzlib/lzlib-dbg: PKGV changed from 1.15 [default] to 1.16 [default]
packages/x86-64-v3-poky-linux/lzlib/lzlib-dbg: FILELIST: removed "/usr/lib/.debug/liblz.so.1.15", added "/usr/lib/.debug/liblz.so.1.16"
packages/x86-64-v3-poky-linux/lzlib/lzlib-dbg: PV changed from "1.15" to "1.16"
packages/x86-64-v3-poky-linux/lzlib/lzlib-dev: PKGV changed from 1.15 [default] to 1.16 [default]
packages/x86-64-v3-poky-linux/lzlib/lzlib-dev: PV changed from "1.15" to "1.16"
packages/x86-64-v3-poky-linux/lzlib/lzlib-doc: PKGV changed from 1.15 [default] to 1.16 [default]
packages/x86-64-v3-poky-linux/lzlib/lzlib-doc: PV changed from "1.15" to "1.16"
packages/x86-64-v3-poky-linux/lzlib/lzlib-doc: PKGSIZE changed from 55692 to 60676 (+9%)
packages/x86-64-v3-poky-linux/lzlib/lzlib-locale: PKGV changed from 1.15 [default] to 1.16 [default]
packages/x86-64-v3-poky-linux/lzlib/lzlib-locale: PV changed from "1.15" to "1.16"
packages/x86-64-v3-poky-linux/lzlib/lzlib-src: PKGV changed from 1.15 [default] to 1.16 [default]
packages/x86-64-v3-poky-linux/lzlib/lzlib-src: PV changed from "1.15" to "1.16"
packages/x86-64-v3-poky-linux/lzlib/lzlib-staticdev: PKGV changed from 1.15 [default] to 1.16 [default]
packages/x86-64-v3-poky-linux/lzlib/lzlib-staticdev: PV changed from "1.15" to "1.16"
packages/x86-64-v3-poky-linux/lzlib/lzlib: PKGV changed from 1.15 [default] to 1.16 [default]
packages/x86-64-v3-poky-linux/lzlib/lzlib: FILELIST: removed "/usr/lib/liblz.so.1.15", added "/usr/lib/liblz.so.1.16"
packages/x86-64-v3-poky-linux/lzlib/lzlib: PV changed from "1.15" to "1.16"
Changes to packages/x86-64-v3-poky-linux/lzlib (sysroot):
  /usr/lib/liblz.so.1 changed symlink target from liblz.so.1.15 to liblz.so.1.16
  /usr/lib/liblz.so changed symlink target from liblz.so.1.15 to liblz.so.1.16
  /usr/lib/liblz.so.1.15 moved to /usr/lib/liblz.so.1.16
Changes to packages/x86_64-linux/lzlib-native (sysroot):
  /usr/lib/liblz.so.1 changed symlink target from liblz.so.1.15 to liblz.so.1.16
  /usr/lib/liblz.so changed symlink target from liblz.so.1.15 to liblz.so.1.16
  /usr/lib/liblz.so.1.15 moved to /usr/lib/liblz.so.1.16

--===============3145358609564469386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/lzlib/lzlib: FILELIST: removed "/usr/lib/liblz.so.1.15", added "/usr/lib/liblz.so.1.16"
Changes to packages/x86-64-v3-poky-linux/lzlib (sysroot):
  /usr/lib/liblz.so.1 changed symlink target from liblz.so.1.15 to liblz.so.1.16
  /usr/lib/liblz.so changed symlink target from liblz.so.1.15 to liblz.so.1.16
  /usr/lib/liblz.so.1.15 moved to /usr/lib/liblz.so.1.16
Changes to packages/x86_64-linux/lzlib-native (sysroot):
  /usr/lib/liblz.so.1 changed symlink target from liblz.so.1.15 to liblz.so.1.16
  /usr/lib/liblz.so changed symlink target from liblz.so.1.15 to liblz.so.1.16
  /usr/lib/liblz.so.1.15 moved to /usr/lib/liblz.so.1.16

--===============3145358609564469386==--

