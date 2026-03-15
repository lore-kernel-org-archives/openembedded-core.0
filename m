Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339E0EFCBB3
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:42:09 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28972.1773582117682767656
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=j7g8N8Zf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=sb8N6qWy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019cf1bb954a-19b04eb6-59b3-4c09-a4c5-aafb33780fc3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582128;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=drT8RbIyk4VjdA4tRYDUOQ8UvKu4vpLBNnSS2citSEo=;
	b=j7g8N8ZfRwKCV9Uzmh3zjcDqKNG9kTdr6RF2BDuZXpZVrhV6sV/KJbyO2nDA5/Zu
	baS74z6BobcoCKXIb1wxIXwbs8pApxPsv2fx1jW9YaYOJhlEPmxeVqTMd/o+kJ6fcIu
	vNVTgv7E+XYTd0A6YhgmKFg2Rfg6yBtDWUmgXuUI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582128;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=drT8RbIyk4VjdA4tRYDUOQ8UvKu4vpLBNnSS2citSEo=;
	b=sb8N6qWyCuBQWy5wsDeCmmAWSm2lhlje5BK8KJzAVKP2UznES00v1gt683uFOgcQ
	DoHCqKsfXB50i2P0HDnA5L4h+Rc63FrMJx5TEDR3rMQPK3XV/20+ttP7qNA+CK8JUu7
	t8WQXIjEY4Q0yUAvYkk0tdgBO4TZz8fBy4dnwgRY=
Content-Type: multipart/mixed; boundary="===============5751435819259575344=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] taglib: upgrading to 2.2.1 SUCCEEDED
Message-ID: <0101019cf1bb954a-19b04eb6-59b3-4c09-a4c5-aafb33780fc3-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:42:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233195

--===============5751435819259575344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *taglib* to *2.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-taglib-upgrade-2.2-2.2.1.patch
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
From 97e963630457bc586e23588d162ed85aeffa0ce3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 13:36:53 +0000
Subject: [PATCH] taglib: upgrade 2.2 -> 2.2.1

---
 meta/recipes-support/taglib/{taglib_2.2.bb => taglib_2.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/taglib/{taglib_2.2.bb => taglib_2.2.1.bb} (95%)

diff --git a/meta/recipes-support/taglib/taglib_2.2.bb b/meta/recipes-support/taglib/taglib_2.2.1.bb
similarity index 95%
rename from meta/recipes-support/taglib/taglib_2.2.bb
rename to meta/recipes-support/taglib/taglib_2.2.1.bb
index 55a3d9d72f..9f5dbfe9cb 100644
--- a/meta/recipes-support/taglib/taglib_2.2.bb
+++ b/meta/recipes-support/taglib/taglib_2.2.1.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib utfcpp"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "c89e7ebd450535e77c9230fac3985fcdce7bee05e06c9cd0bc36d50184e9c9dd"
+SRC_URI[sha256sum] = "7e76b5299dcef427c486bffe455098470c8da91cf3ccb9ea804893df57389b5e"
 
 UPSTREAM_CHECK_URI = "https://taglib.org/"
 UPSTREAM_CHECK_REGEX = "taglib-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.47.1


--===============5751435819259575344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/taglib: PV changed from "2.2" to "2.2.1"
packages/x86-64-v3-poky-linux/taglib: SRC_URI changed from "http://taglib.github.io/releases/taglib-2.2.tar.gz" to "http://taglib.github.io/releases/taglib-2.2.1.tar.gz"
packages/x86-64-v3-poky-linux/taglib: PKGV changed from 2.2 [default] to 2.2.1 [default]
Changes to packages/x86-64-v3-poky-linux/taglib (sysroot):
  /usr/lib/libtag_c.so.2 changed symlink target from libtag_c.so.2.2.0 to libtag_c.so.2.2.1
  /usr/lib/libtag.so.2 changed symlink target from libtag.so.2.2.0 to libtag.so.2.2.1
  /usr/lib/libtag_c.so.2.2.0 moved to /usr/lib/libtag_c.so.2.2.1
  /usr/lib/libtag.so.2.2.0 moved to /usr/lib/libtag.so.2.2.1
packages/x86-64-v3-poky-linux/taglib/taglib-c: PV changed from "2.2" to "2.2.1"
packages/x86-64-v3-poky-linux/taglib/taglib-c: FILELIST: removed "/usr/lib/libtag_c.so.2.2.0", added "/usr/lib/libtag_c.so.2.2.1"
packages/x86-64-v3-poky-linux/taglib/taglib-c: PKGV changed from 2.2 [default] to 2.2.1 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-dbg: PV changed from "2.2" to "2.2.1"
packages/x86-64-v3-poky-linux/taglib/taglib-dbg: PKGSIZE changed from 29403400 to 29449056 (+0%)
packages/x86-64-v3-poky-linux/taglib/taglib-dbg: FILELIST: removed "/usr/lib/.debug/libtag.so.2.2.0 /usr/lib/.debug/libtag_c.so.2.2.0", added "/usr/lib/.debug/libtag_c.so.2.2.1 /usr/lib/.debug/libtag.so.2.2.1"
packages/x86-64-v3-poky-linux/taglib/taglib-dbg: PKGV changed from 2.2 [default] to 2.2.1 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-dev: PV changed from "2.2" to "2.2.1"
packages/x86-64-v3-poky-linux/taglib/taglib-dev: PKGSIZE changed from 811971 to 813795 (+0%)
packages/x86-64-v3-poky-linux/taglib/taglib-dev: PKGV changed from 2.2 [default] to 2.2.1 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-doc: PV changed from "2.2" to "2.2.1"
packages/x86-64-v3-poky-linux/taglib/taglib-doc: PKGV changed from 2.2 [default] to 2.2.1 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-locale: PV changed from "2.2" to "2.2.1"
packages/x86-64-v3-poky-linux/taglib/taglib-locale: PKGV changed from 2.2 [default] to 2.2.1 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-src: PV changed from "2.2" to "2.2.1"
packages/x86-64-v3-poky-linux/taglib/taglib-src: PKGSIZE changed from 1963462 to 1971314 (+0%)
packages/x86-64-v3-poky-linux/taglib/taglib-src: FILELIST: directory renamed /usr/src/debug/taglib/2.2/bindings/c -> /usr/src/debug/taglib/2.2.1/bindings/c, directory renamed /usr/src/debug/taglib/2.2/taglib/mpeg/id3v1 -> /usr/src/debug/taglib/2.2.1/taglib/mpeg/id3v1, directory renamed /usr/src/debug/taglib/2.2/taglib/mpeg/id3v2 -> /usr/src/debug/taglib/2.2.1/taglib/mpeg/id3v2, directory renamed /usr/src/debug/taglib/2.2/taglib/riff/aiff -> /usr/src/debug/taglib/2.2.1/taglib/riff/aiff, directory renamed /usr/src/debug/taglib/2.2/taglib/mp4 -> /usr/src/debug/taglib/2.2.1/taglib/mp4, directory renamed /usr/src/debug/taglib/2.2/taglib/ogg -> /usr/src/debug/taglib/2.2.1/taglib/ogg, directory renamed /usr/src/debug/taglib/2.2/taglib/s3m -> /usr/src/debug/taglib/2.2.1/taglib/s3m, directory renamed /usr/src/debug/taglib/2.2/taglib/matroska/ebml -> /usr/src/debug/taglib/2.2.1/taglib/matroska/ebml, directory renamed /usr/src/debug/taglib/2.2/taglib/mod -> /usr/src/debug/taglib/2.2.1/taglib/mo
 d, directory renamed /usr/src/debug/taglib/2.2/taglib/dsf -> /usr/src/debug/taglib/2.2.1/taglib/dsf, directory renamed /usr/src/debug/taglib/2.2/taglib -> /usr/src/debug/taglib/2.2.1/taglib, directory renamed /usr/src/debug/taglib/2.2/taglib/asf -> /usr/src/debug/taglib/2.2.1/taglib/asf, directory renamed /usr/src/debug/taglib/2.2/taglib/ogg/vorbis -> /usr/src/debug/taglib/2.2.1/taglib/ogg/vorbis, directory renamed /usr/src/debug/taglib/2.2/taglib/toolkit -> /usr/src/debug/taglib/2.2.1/taglib/toolkit, directory renamed /usr/src/debug/taglib/2.2/taglib/riff -> /usr/src/debug/taglib/2.2.1/taglib/riff, directory renamed /usr/src/debug/taglib/2.2/taglib/flac -> /usr/src/debug/taglib/2.2.1/taglib/flac, directory renamed /usr/src/debug/taglib/2.2/taglib/mpc -> /usr/src/debug/taglib/2.2.1/taglib/mpc, directory renamed /usr/src/debug/taglib/2.2/taglib/ogg/speex -> /usr/src/debug/taglib/2.2.1/taglib/ogg/speex, directory renamed /usr/src/debug/taglib/2.2/taglib/xm -> /usr/src/debug/taglib/2.2
 .1/taglib/xm, directory renamed /usr/src/debug/taglib/2.2/taglib/wavpack -> /usr/src/debug/taglib/2.2.1/taglib/wavpack, directory renamed /usr/src/debug/taglib/2.2/taglib/ogg/flac -> /usr/src/debug/taglib/2.2.1/taglib/ogg/flac, directory renamed /usr/src/debug/taglib/2.2/taglib/matroska -> /usr/src/debug/taglib/2.2.1/taglib/matroska, directory renamed /usr/src/debug/taglib/2.2/taglib/trueaudio -> /usr/src/debug/taglib/2.2.1/taglib/trueaudio, directory renamed /usr/src/debug/taglib/2.2/taglib/shorten -> /usr/src/debug/taglib/2.2.1/taglib/shorten, directory renamed /usr/src/debug/taglib/2.2/taglib/mpeg/id3v2/frames -> /usr/src/debug/taglib/2.2.1/taglib/mpeg/id3v2/frames, directory renamed /usr/src/debug/taglib/2.2/taglib/riff/wav -> /usr/src/debug/taglib/2.2.1/taglib/riff/wav, directory renamed /usr/src/debug/taglib/2.2/taglib/ogg/opus -> /usr/src/debug/taglib/2.2.1/taglib/ogg/opus, directory renamed /usr/src/debug/taglib/2.2/taglib/ape -> /usr/src/debug/taglib/2.2.1/taglib/ape, direc
 tory renamed /usr/src/debug/taglib/2.2/taglib/mpeg -> /usr/src/debug/taglib/2.2.1/taglib/mpeg, directory renamed /usr/src/debug/taglib/2.2/taglib/it -> /usr/src/debug/taglib/2.2.1/taglib/it, directory renamed /usr/src/debug/taglib/2.2/taglib/dsdiff -> /usr/src/debug/taglib/2.2.1/taglib/dsdiff
packages/x86-64-v3-poky-linux/taglib/taglib-src: PKGV changed from 2.2 [default] to 2.2.1 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-staticdev: PV changed from "2.2" to "2.2.1"
packages/x86-64-v3-poky-linux/taglib/taglib-staticdev: PKGV changed from 2.2 [default] to 2.2.1 [default]
packages/x86-64-v3-poky-linux/taglib/taglib: PV changed from "2.2" to "2.2.1"
packages/x86-64-v3-poky-linux/taglib/taglib: PKGSIZE changed from 1513583 to 1517679 (+0%)
packages/x86-64-v3-poky-linux/taglib/taglib: FILELIST: removed "/usr/lib/libtag.so.2.2.0", added "/usr/lib/libtag.so.2.2.1"
packages/x86-64-v3-poky-linux/taglib/taglib: PKGV changed from 2.2 [default] to 2.2.1 [default]

--===============5751435819259575344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/taglib (sysroot):
  /usr/lib/libtag_c.so.2 changed symlink target from libtag_c.so.2.2.0 to libtag_c.so.2.2.1
  /usr/lib/libtag.so.2 changed symlink target from libtag.so.2.2.0 to libtag.so.2.2.1
  /usr/lib/libtag_c.so.2.2.0 moved to /usr/lib/libtag_c.so.2.2.1
  /usr/lib/libtag.so.2.2.0 moved to /usr/lib/libtag.so.2.2.1
packages/x86-64-v3-poky-linux/taglib/taglib-c: FILELIST: removed "/usr/lib/libtag_c.so.2.2.0", added "/usr/lib/libtag_c.so.2.2.1"
packages/x86-64-v3-poky-linux/taglib/taglib: FILELIST: removed "/usr/lib/libtag.so.2.2.0", added "/usr/lib/libtag.so.2.2.1"

--===============5751435819259575344==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-taglib-upgrade-2.2-2.2.1.patch"

RnJvbSA5N2U5NjM2MzA0NTdiYzU4NmUyMzU4OGQxNjJlZDg1YWVmZmEwY2UzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMTM6MzY6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
YWdsaWI6IHVwZ3JhZGUgMi4yIC0+IDIuMi4xCgotLS0KIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Rh
Z2xpYi97dGFnbGliXzIuMi5iYiA9PiB0YWdsaWJfMi4yLjEuYmJ9IHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LXN1cHBvcnQvdGFnbGliL3t0YWdsaWJfMi4yLmJiID0+IHRhZ2xpYl8yLjIuMS5iYn0gKDk1JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC90YWdsaWIvdGFnbGliXzIuMi5iYiBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L3RhZ2xpYi90YWdsaWJfMi4yLjEuYmIKc2ltaWxhcml0eSBp
bmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdGFnbGliL3RhZ2xpYl8y
LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3RhZ2xpYi90YWdsaWJfMi4yLjEu
YmIKaW5kZXggNTVhM2Q5ZDcyZi4uOWY1ZGJmZTljYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvdGFnbGliL3RhZ2xpYl8yLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
dGFnbGliL3RhZ2xpYl8yLjIuMS5iYgpAQCAtMTEsNyArMTEsNyBAQCBERVBFTkRTID0gInpsaWIg
dXRmY3BwIgogCiBTUkNfVVJJID0gImh0dHA6Ly90YWdsaWIuZ2l0aHViLmlvL3JlbGVhc2VzLyR7
QlB9LnRhci5neiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImM4OWU3ZWJkNDUwNTM1ZTc3Yzky
MzBmYWMzOTg1ZmNkY2U3YmVlMDVlMDZjOWNkMGJjMzZkNTAxODRlOWM5ZGQiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiN2U3NmI1Mjk5ZGNlZjQyN2M0ODZiZmZlNDU1MDk4NDcwYzhkYTkxY2YzY2Ni
OWVhODA0ODkzZGY1NzM4OWI1ZSIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vdGFn
bGliLm9yZy8iCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJ0YWdsaWItKD9QPHB2ZXI+XGQrKFwu
XGQrKSspXC50YXIiCi0tIAoyLjQ3LjEKCg==

--===============5751435819259575344==--

