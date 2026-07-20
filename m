Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14A3C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 05:25:40 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2566.1784525118646243746
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 22:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DkKpaNDc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kLrpevnq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019f7dfc573d-302824c7-007b-4d68-8fb0-ee1a7506f09c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784525117;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=kdwAtWrLyiVe0caz/YI4nunUxRASIXZfZ/aVmVWFeME=;
	b=DkKpaNDc+5UU2Ui3+Iqms82Cidv3+rAKNteIeGjcKV7VH9DZKJcICArsu4d2PqpA
	+KaCyzTFEXXbQ0Tj0kSzw7n90HlVTv/OclgWDCqwby0y2ihupPor5guwHo8FGS4LGNA
	pLjvjOxYK9Q3AMy1+xL38JQWFHsclzxqyT1sL+iQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784525117;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=kdwAtWrLyiVe0caz/YI4nunUxRASIXZfZ/aVmVWFeME=;
	b=kLrpevnqTg+xCxRUwKTNY1trYIHDgMvSWv0eEIHf1lyAQ8TH4A83SpnKA91qN6Iw
	wdbquW8ESEzd6vLwTCkLzjIVq4WpMvS1euobb4B48zfU1NX5q7ur8TOTrgqVQQfVs5x
	0d1yKKvrTkxhUZP5a/Dx0yEdm9xjY6xQy72sxCgM=
Content-Type: multipart/mixed; boundary="===============4094970455054864117=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] taglib: upgrading to 2.3.1 SUCCEEDED
Message-ID: <0101019f7dfc573d-302824c7-007b-4d68-8fb0-ee1a7506f09c-000000@us-west-2.amazonses.com>
Date: Mon, 20 Jul 2026 05:25:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.20-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 05:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241316

--===============4094970455054864117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *taglib* to *2.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-taglib-upgrade-2.3-2.3.1.patch
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
From 3454b2f004dc18bbcb1e9dad10f5705f97dc6f9f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 20 Jul 2026 05:25:14 +0000
Subject: [PATCH] taglib: upgrade 2.3 -> 2.3.1

---
 meta/recipes-support/taglib/{taglib_2.3.bb => taglib_2.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/taglib/{taglib_2.3.bb => taglib_2.3.1.bb} (95%)

diff --git a/meta/recipes-support/taglib/taglib_2.3.bb b/meta/recipes-support/taglib/taglib_2.3.1.bb
similarity index 95%
rename from meta/recipes-support/taglib/taglib_2.3.bb
rename to meta/recipes-support/taglib/taglib_2.3.1.bb
index b29f28702d..3f3831f1f8 100644
--- a/meta/recipes-support/taglib/taglib_2.3.bb
+++ b/meta/recipes-support/taglib/taglib_2.3.1.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib utfcpp"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "7349f6fd942418bc7009ebe743eb7c9d055f02921ec56fa436ec25007c47fd38"
+SRC_URI[sha256sum] = "a19d90e6fd41d09a0281ec0fe762d51491d7a6ccffc923c4f7868c5e647ca230"
 
 UPSTREAM_CHECK_URI = "https://taglib.org/"
 UPSTREAM_CHECK_REGEX = "taglib-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.47.1


--===============4094970455054864117==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-taglib-upgrade-2.3-2.3.1.patch"

RnJvbSAzNDU0YjJmMDA0ZGMxOGJiY2IxZTlkYWQxMGY1NzA1Zjk3ZGM2ZjlmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMjAgSnVsIDIwMjYgMDU6MjU6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
YWdsaWI6IHVwZ3JhZGUgMi4zIC0+IDIuMy4xCgotLS0KIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Rh
Z2xpYi97dGFnbGliXzIuMy5iYiA9PiB0YWdsaWJfMi4zLjEuYmJ9IHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LXN1cHBvcnQvdGFnbGliL3t0YWdsaWJfMi4zLmJiID0+IHRhZ2xpYl8yLjMuMS5iYn0gKDk1JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC90YWdsaWIvdGFnbGliXzIuMy5iYiBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L3RhZ2xpYi90YWdsaWJfMi4zLjEuYmIKc2ltaWxhcml0eSBp
bmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdGFnbGliL3RhZ2xpYl8y
LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3RhZ2xpYi90YWdsaWJfMi4zLjEu
YmIKaW5kZXggYjI5ZjI4NzAyZC4uM2YzODMxZjFmOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvdGFnbGliL3RhZ2xpYl8yLjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
dGFnbGliL3RhZ2xpYl8yLjMuMS5iYgpAQCAtMTEsNyArMTEsNyBAQCBERVBFTkRTID0gInpsaWIg
dXRmY3BwIgogCiBTUkNfVVJJID0gImh0dHA6Ly90YWdsaWIuZ2l0aHViLmlvL3JlbGVhc2VzLyR7
QlB9LnRhci5neiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjczNDlmNmZkOTQyNDE4YmM3MDA5
ZWJlNzQzZWI3YzlkMDU1ZjAyOTIxZWM1NmZhNDM2ZWMyNTAwN2M0N2ZkMzgiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiYTE5ZDkwZTZmZDQxZDA5YTAyODFlYzBmZTc2MmQ1MTQ5MWQ3YTZjY2ZmYzky
M2M0Zjc4NjhjNWU2NDdjYTIzMCIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vdGFn
bGliLm9yZy8iCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJ0YWdsaWItKD9QPHB2ZXI+XGQrKFwu
XGQrKSspXC50YXIiCi0tIAoyLjQ3LjEKCg==

--===============4094970455054864117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/taglib: PKGV changed from 2.3 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/taglib: SRC_URI changed from "http://taglib.github.io/releases/taglib-2.3.tar.gz" to "http://taglib.github.io/releases/taglib-2.3.1.tar.gz"
packages/x86-64-v3-poky-linux/taglib: PV changed from "2.3" to "2.3.1"
Changes to packages/x86-64-v3-poky-linux/taglib (sysroot):
  /usr/lib/libtag_c.so.2 changed symlink target from libtag_c.so.2.3.0 to libtag_c.so.2.3.1
  /usr/lib/libtag.so.2 changed symlink target from libtag.so.2.3.0 to libtag.so.2.3.1
  /usr/lib/libtag_c.so.2.3.0 moved to /usr/lib/libtag_c.so.2.3.1
  /usr/lib/libtag.so.2.3.0 moved to /usr/lib/libtag.so.2.3.1
packages/x86-64-v3-poky-linux/taglib/taglib-c: PKGV changed from 2.3 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-c: FILELIST: removed "/usr/lib/libtag_c.so.2.3.0", added "/usr/lib/libtag_c.so.2.3.1"
packages/x86-64-v3-poky-linux/taglib/taglib-c: PV changed from "2.3" to "2.3.1"
packages/x86-64-v3-poky-linux/taglib/taglib-dbg: PKGV changed from 2.3 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-dbg: FILELIST: removed "/usr/lib/.debug/libtag.so.2.3.0 /usr/lib/.debug/libtag_c.so.2.3.0", added "/usr/lib/.debug/libtag.so.2.3.1 /usr/lib/.debug/libtag_c.so.2.3.1"
packages/x86-64-v3-poky-linux/taglib/taglib-dbg: PKGSIZE changed from 31428208 to 31484080 (+0%)
packages/x86-64-v3-poky-linux/taglib/taglib-dbg: PV changed from "2.3" to "2.3.1"
packages/x86-64-v3-poky-linux/taglib/taglib-dev: PKGV changed from 2.3 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-dev: PKGSIZE changed from 835738 to 835775 (+0%)
packages/x86-64-v3-poky-linux/taglib/taglib-dev: PV changed from "2.3" to "2.3.1"
packages/x86-64-v3-poky-linux/taglib/taglib-doc: PKGV changed from 2.3 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-doc: PV changed from "2.3" to "2.3.1"
packages/x86-64-v3-poky-linux/taglib/taglib-locale: PKGV changed from 2.3 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-locale: PV changed from "2.3" to "2.3.1"
packages/x86-64-v3-poky-linux/taglib/taglib-src: PKGV changed from 2.3 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-src: FILELIST: directory renamed /usr/src/debug/taglib/2.3/taglib/ogg/opus -> /usr/src/debug/taglib/2.3.1/taglib/ogg/opus, directory renamed /usr/src/debug/taglib/2.3/taglib/riff/wav -> /usr/src/debug/taglib/2.3.1/taglib/riff/wav, directory renamed /usr/src/debug/taglib/2.3/taglib/dsdiff -> /usr/src/debug/taglib/2.3.1/taglib/dsdiff, directory renamed /usr/src/debug/taglib/2.3/taglib/matroska -> /usr/src/debug/taglib/2.3.1/taglib/matroska, directory renamed /usr/src/debug/taglib/2.3/taglib/ogg/flac -> /usr/src/debug/taglib/2.3.1/taglib/ogg/flac, directory renamed /usr/src/debug/taglib/2.3/taglib/flac -> /usr/src/debug/taglib/2.3.1/taglib/flac, directory renamed /usr/src/debug/taglib/2.3/taglib/asf -> /usr/src/debug/taglib/2.3.1/taglib/asf, directory renamed /usr/src/debug/taglib/2.3/taglib/matroska/ebml -> /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml, directory renamed /usr/src/debug/taglib/2.3/taglib/mpeg/id3v2/frames -> /usr/src/debug/
 taglib/2.3.1/taglib/mpeg/id3v2/frames, directory renamed /usr/src/debug/taglib/2.3/taglib/mpc -> /usr/src/debug/taglib/2.3.1/taglib/mpc, directory renamed /usr/src/debug/taglib/2.3/taglib -> /usr/src/debug/taglib/2.3.1/taglib, directory renamed /usr/src/debug/taglib/2.3/taglib/mpeg -> /usr/src/debug/taglib/2.3.1/taglib/mpeg, directory renamed /usr/src/debug/taglib/2.3/taglib/riff/aiff -> /usr/src/debug/taglib/2.3.1/taglib/riff/aiff, directory renamed /usr/src/debug/taglib/2.3/taglib/wavpack -> /usr/src/debug/taglib/2.3.1/taglib/wavpack, directory renamed /usr/src/debug/taglib/2.3/taglib/it -> /usr/src/debug/taglib/2.3.1/taglib/it, directory renamed /usr/src/debug/taglib/2.3/taglib/trueaudio -> /usr/src/debug/taglib/2.3.1/taglib/trueaudio, directory renamed /usr/src/debug/taglib/2.3/taglib/toolkit -> /usr/src/debug/taglib/2.3.1/taglib/toolkit, directory renamed /usr/src/debug/taglib/2.3/taglib/ape -> /usr/src/debug/taglib/2.3.1/taglib/ape, directory renamed /usr/src/debug/taglib/2.3/
 taglib/ogg/vorbis -> /usr/src/debug/taglib/2.3.1/taglib/ogg/vorbis, directory renamed /usr/src/debug/taglib/2.3/taglib/mod -> /usr/src/debug/taglib/2.3.1/taglib/mod, directory renamed /usr/src/debug/taglib/2.3/taglib/mp4 -> /usr/src/debug/taglib/2.3.1/taglib/mp4, directory renamed /usr/src/debug/taglib/2.3/taglib/xm -> /usr/src/debug/taglib/2.3.1/taglib/xm, directory renamed /usr/src/debug/taglib/2.3/taglib/dsf -> /usr/src/debug/taglib/2.3.1/taglib/dsf, directory renamed /usr/src/debug/taglib/2.3/taglib/ogg/speex -> /usr/src/debug/taglib/2.3.1/taglib/ogg/speex, directory renamed /usr/src/debug/taglib/2.3/taglib/s3m -> /usr/src/debug/taglib/2.3.1/taglib/s3m, directory renamed /usr/src/debug/taglib/2.3/taglib/shorten -> /usr/src/debug/taglib/2.3.1/taglib/shorten, directory renamed /usr/src/debug/taglib/2.3/taglib/mpeg/id3v2 -> /usr/src/debug/taglib/2.3.1/taglib/mpeg/id3v2, directory renamed /usr/src/debug/taglib/2.3/taglib/ogg -> /usr/src/debug/taglib/2.3.1/taglib/ogg, directory renam
 ed /usr/src/debug/taglib/2.3/taglib/riff -> /usr/src/debug/taglib/2.3.1/taglib/riff, directory renamed /usr/src/debug/taglib/2.3/taglib/mpeg/id3v1 -> /usr/src/debug/taglib/2.3.1/taglib/mpeg/id3v1, directory renamed /usr/src/debug/taglib/2.3/bindings/c -> /usr/src/debug/taglib/2.3.1/bindings/c
packages/x86-64-v3-poky-linux/taglib/taglib-src: PKGSIZE changed from 2080518 to 2084558 (+0%)
packages/x86-64-v3-poky-linux/taglib/taglib-src: PV changed from "2.3" to "2.3.1"
packages/x86-64-v3-poky-linux/taglib/taglib-staticdev: PKGV changed from 2.3 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-staticdev: PV changed from "2.3" to "2.3.1"
packages/x86-64-v3-poky-linux/taglib/taglib: PKGV changed from 2.3 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/taglib/taglib: FILELIST: removed "/usr/lib/libtag.so.2.3.0", added "/usr/lib/libtag.so.2.3.1"
packages/x86-64-v3-poky-linux/taglib/taglib: PKGSIZE changed from 1632367 to 1632375 (+0%)
packages/x86-64-v3-poky-linux/taglib/taglib: PV changed from "2.3" to "2.3.1"

--===============4094970455054864117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/taglib (sysroot):
  /usr/lib/libtag_c.so.2 changed symlink target from libtag_c.so.2.3.0 to libtag_c.so.2.3.1
  /usr/lib/libtag.so.2 changed symlink target from libtag.so.2.3.0 to libtag.so.2.3.1
  /usr/lib/libtag_c.so.2.3.0 moved to /usr/lib/libtag_c.so.2.3.1
  /usr/lib/libtag.so.2.3.0 moved to /usr/lib/libtag.so.2.3.1
packages/x86-64-v3-poky-linux/taglib/taglib-c: FILELIST: removed "/usr/lib/libtag_c.so.2.3.0", added "/usr/lib/libtag_c.so.2.3.1"
packages/x86-64-v3-poky-linux/taglib/taglib: FILELIST: removed "/usr/lib/libtag.so.2.3.0", added "/usr/lib/libtag.so.2.3.1"

--===============4094970455054864117==--

