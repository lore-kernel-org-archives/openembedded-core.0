Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54735E9A04C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:42:00 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1428.1771440109058787062
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=vM67vgnh;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Zrd+1Hz8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019c720f0e87-1584c681-c112-4ccc-9210-f93ebc34d917-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GvWr20JrrLiMIkrZp4sDgOTpE9hwJQqZWFQvc067+V0=;
	b=vM67vgnhaMhv323OuMcQIJ5R1D4120bD2otsuHXyWRuaVpVz6GrbLn5Jd7sPXcCk
	yoo2gcUF7FcFc/jTEbe8oE4mMK2YatXKYVDeg3a4di5WSmm5WKXMReLjv6uiIAnzFO2
	7MvGgCIvDRBeAoQ8I/hMonIAM4mbVQlhgR52txlA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GvWr20JrrLiMIkrZp4sDgOTpE9hwJQqZWFQvc067+V0=;
	b=Zrd+1Hz8ZxPTQ74jItn+WWHgJK5PrqUk2aTrbd4Ec3KDlp4R1hpWl34rGnl7P8Yw
	hm7CHpFPJy4LmcXnrthzK567WJjTMHbbOpXWbOb7hXTZOC7DUdPffD1IWzN4vIDWlxp
	Oxb7r4klJg7OuiWOZMAOpg1U05Naz98NXwYRwtxA=
Content-Type: multipart/mixed; boundary="===============2387636042936802069=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] taglib: upgrading to 2.2 SUCCEEDED
Message-ID: <0101019c720f0e87-1584c681-c112-4ccc-9210-f93ebc34d917-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:42:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231408

--===============2387636042936802069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *taglib* to *2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-taglib-upgrade-2.1.1-2.2.patch
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
From 238281ef90f1ffb494ab32769d9f9a0dcd286556 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 18:38:50 +0000
Subject: [PATCH] taglib: upgrade 2.1.1 -> 2.2

---
 meta/recipes-support/taglib/{taglib_2.1.1.bb => taglib_2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/taglib/{taglib_2.1.1.bb => taglib_2.2.bb} (95%)

diff --git a/meta/recipes-support/taglib/taglib_2.1.1.bb b/meta/recipes-support/taglib/taglib_2.2.bb
similarity index 95%
rename from meta/recipes-support/taglib/taglib_2.1.1.bb
rename to meta/recipes-support/taglib/taglib_2.2.bb
index 6b700578b8..55a3d9d72f 100644
--- a/meta/recipes-support/taglib/taglib_2.1.1.bb
+++ b/meta/recipes-support/taglib/taglib_2.2.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib utfcpp"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "3716d31f7c83cbf17b67c8cf44dd82b2a2f17e6780472287a16823e70305ddba"
+SRC_URI[sha256sum] = "c89e7ebd450535e77c9230fac3985fcdce7bee05e06c9cd0bc36d50184e9c9dd"
 
 UPSTREAM_CHECK_URI = "https://taglib.org/"
 UPSTREAM_CHECK_REGEX = "taglib-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.47.1


--===============2387636042936802069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/taglib (sysroot):
  /usr/lib/libtag_c.so.2 changed symlink target from libtag_c.so.2.1.1 to libtag_c.so.2.2.0
  /usr/lib/libtag.so.2 changed symlink target from libtag.so.2.1.1 to libtag.so.2.2.0
  /usr/lib/libtag_c.so.2.1.1 moved to /usr/lib/libtag_c.so.2.2.0
  /usr/lib/libtag.so.2.1.1 moved to /usr/lib/libtag.so.2.2.0
  /usr/include/taglib/matroskaattachedfile.h was added
  /usr/include/taglib/matroskaattachments.h was added
  /usr/include/taglib/matroskachapteredition.h was added
  /usr/include/taglib/matroskachapter.h was added
  /usr/include/taglib/matroskachapters.h was added
  /usr/include/taglib/matroskaelement.h was added
  /usr/include/taglib/matroskafile.h was added
  /usr/include/taglib/matroskaproperties.h was added
  /usr/include/taglib/matroskasimpletag.h was added
  /usr/include/taglib/matroskatag.h was added
  /usr/include/taglib/mp4stem.h was added
packages/x86-64-v3-poky-linux/taglib/taglib-c: FILELIST: removed "/usr/lib/libtag_c.so.2.1.1", added "/usr/lib/libtag_c.so.2.2.0"
packages/x86-64-v3-poky-linux/taglib/taglib-dbg: PKGSIZE changed from 23418088 to 29084080 (+24%)
packages/x86-64-v3-poky-linux/taglib/taglib-dev: FILELIST: added "/usr/include/taglib/matroskaproperties.h /usr/include/taglib/matroskachapters.h /usr/include/taglib/matroskachapteredition.h /usr/include/taglib/matroskaattachedfile.h /usr/include/taglib/matroskasimpletag.h /usr/include/taglib/matroskaattachments.h /usr/include/taglib/matroskachapter.h /usr/include/taglib/matroskaelement.h /usr/include/taglib/matroskafile.h /usr/include/taglib/mp4stem.h /usr/include/taglib/matroskatag.h"
packages/x86-64-v3-poky-linux/taglib/taglib-src: PKGSIZE changed from 1694390 to 1963462 (+16%)
packages/x86-64-v3-poky-linux/taglib/taglib: FILELIST: removed "/usr/lib/libtag.so.2.1.1", added "/usr/lib/libtag.so.2.2.0"
packages/x86-64-v3-poky-linux/taglib/taglib: PKGSIZE changed from 1280111 to 1513583 (+18%)

--===============2387636042936802069==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-taglib-upgrade-2.1.1-2.2.patch"

RnJvbSAyMzgyODFlZjkwZjFmZmI0OTRhYjMyNzY5ZDlmOWEwZGNkMjg2NTU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTg6Mzg6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
YWdsaWI6IHVwZ3JhZGUgMi4xLjEgLT4gMi4yCgotLS0KIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Rh
Z2xpYi97dGFnbGliXzIuMS4xLmJiID0+IHRhZ2xpYl8yLjIuYmJ9IHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LXN1cHBvcnQvdGFnbGliL3t0YWdsaWJfMi4xLjEuYmIgPT4gdGFnbGliXzIuMi5iYn0gKDk1JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC90YWdsaWIvdGFnbGliXzIuMS4xLmJi
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdGFnbGliL3RhZ2xpYl8yLjIuYmIKc2ltaWxhcml0eSBp
bmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdGFnbGliL3RhZ2xpYl8y
LjEuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdGFnbGliL3RhZ2xpYl8yLjIu
YmIKaW5kZXggNmI3MDA1NzhiOC4uNTVhM2Q5ZDcyZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvdGFnbGliL3RhZ2xpYl8yLjEuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC90YWdsaWIvdGFnbGliXzIuMi5iYgpAQCAtMTEsNyArMTEsNyBAQCBERVBFTkRTID0gInpsaWIg
dXRmY3BwIgogCiBTUkNfVVJJID0gImh0dHA6Ly90YWdsaWIuZ2l0aHViLmlvL3JlbGVhc2VzLyR7
QlB9LnRhci5neiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM3MTZkMzFmN2M4M2NiZjE3YjY3
YzhjZjQ0ZGQ4MmIyYTJmMTdlNjc4MDQ3MjI4N2ExNjgyM2U3MDMwNWRkYmEiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiYzg5ZTdlYmQ0NTA1MzVlNzdjOTIzMGZhYzM5ODVmY2RjZTdiZWUwNWUwNmM5
Y2QwYmMzNmQ1MDE4NGU5YzlkZCIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vdGFn
bGliLm9yZy8iCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJ0YWdsaWItKD9QPHB2ZXI+XGQrKFwu
XGQrKSspXC50YXIiCi0tIAoyLjQ3LjEKCg==

--===============2387636042936802069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/taglib: PV changed from "2.1.1" to "2.2"
packages/x86-64-v3-poky-linux/taglib: PKGV changed from 2.1.1 [default] to 2.2 [default]
packages/x86-64-v3-poky-linux/taglib: SRC_URI changed from "http://taglib.github.io/releases/taglib-2.1.1.tar.gz" to "http://taglib.github.io/releases/taglib-2.2.tar.gz"
Changes to packages/x86-64-v3-poky-linux/taglib (sysroot):
  /usr/lib/libtag_c.so.2 changed symlink target from libtag_c.so.2.1.1 to libtag_c.so.2.2.0
  /usr/lib/libtag.so.2 changed symlink target from libtag.so.2.1.1 to libtag.so.2.2.0
  /usr/lib/libtag_c.so.2.1.1 moved to /usr/lib/libtag_c.so.2.2.0
  /usr/lib/libtag.so.2.1.1 moved to /usr/lib/libtag.so.2.2.0
  /usr/include/taglib/matroskaattachedfile.h was added
  /usr/include/taglib/matroskaattachments.h was added
  /usr/include/taglib/matroskachapteredition.h was added
  /usr/include/taglib/matroskachapter.h was added
  /usr/include/taglib/matroskachapters.h was added
  /usr/include/taglib/matroskaelement.h was added
  /usr/include/taglib/matroskafile.h was added
  /usr/include/taglib/matroskaproperties.h was added
  /usr/include/taglib/matroskasimpletag.h was added
  /usr/include/taglib/matroskatag.h was added
  /usr/include/taglib/mp4stem.h was added
packages/x86-64-v3-poky-linux/taglib/taglib-c: PV changed from "2.1.1" to "2.2"
packages/x86-64-v3-poky-linux/taglib/taglib-c: PKGV changed from 2.1.1 [default] to 2.2 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-c: FILELIST: removed "/usr/lib/libtag_c.so.2.1.1", added "/usr/lib/libtag_c.so.2.2.0"
packages/x86-64-v3-poky-linux/taglib/taglib-dbg: PV changed from "2.1.1" to "2.2"
packages/x86-64-v3-poky-linux/taglib/taglib-dbg: PKGV changed from 2.1.1 [default] to 2.2 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-dbg: FILELIST: removed "/usr/lib/.debug/libtag.so.2.1.1 /usr/lib/.debug/libtag_c.so.2.1.1", added "/usr/lib/.debug/libtag.so.2.2.0 /usr/lib/.debug/libtag_c.so.2.2.0"
packages/x86-64-v3-poky-linux/taglib/taglib-dbg: PKGSIZE changed from 23418088 to 29084080 (+24%)
packages/x86-64-v3-poky-linux/taglib/taglib-dev: PV changed from "2.1.1" to "2.2"
packages/x86-64-v3-poky-linux/taglib/taglib-dev: PKGV changed from 2.1.1 [default] to 2.2 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-dev: FILELIST: added "/usr/include/taglib/matroskatag.h /usr/include/taglib/matroskaelement.h /usr/include/taglib/matroskaproperties.h /usr/include/taglib/matroskaattachments.h /usr/include/taglib/matroskafile.h /usr/include/taglib/matroskasimpletag.h /usr/include/taglib/matroskaattachedfile.h /usr/include/taglib/mp4stem.h /usr/include/taglib/matroskachapters.h /usr/include/taglib/matroskachapter.h /usr/include/taglib/matroskachapteredition.h"
packages/x86-64-v3-poky-linux/taglib/taglib-dev: PKGSIZE changed from 765467 to 811971 (+6%)
packages/x86-64-v3-poky-linux/taglib/taglib-doc: PV changed from "2.1.1" to "2.2"
packages/x86-64-v3-poky-linux/taglib/taglib-doc: PKGV changed from 2.1.1 [default] to 2.2 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-locale: PV changed from "2.1.1" to "2.2"
packages/x86-64-v3-poky-linux/taglib/taglib-locale: PKGV changed from 2.1.1 [default] to 2.2 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-src: PV changed from "2.1.1" to "2.2"
packages/x86-64-v3-poky-linux/taglib/taglib-src: PKGV changed from 2.1.1 [default] to 2.2 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-src: FILELIST: directory renamed /usr/src/debug/taglib/2.1.1/taglib/toolkit -> /usr/src/debug/taglib/2.2/taglib/toolkit, directory renamed /usr/src/debug/taglib/2.1.1/taglib/riff/aiff -> /usr/src/debug/taglib/2.2/taglib/riff/aiff, directory renamed /usr/src/debug/taglib/2.1.1/taglib/asf -> /usr/src/debug/taglib/2.2/taglib/asf, directory renamed /usr/src/debug/taglib/2.1.1/taglib/wavpack -> /usr/src/debug/taglib/2.2/taglib/wavpack, directory renamed /usr/src/debug/taglib/2.1.1/taglib/trueaudio -> /usr/src/debug/taglib/2.2/taglib/trueaudio, directory renamed /usr/src/debug/taglib/2.1.1/taglib/mpc -> /usr/src/debug/taglib/2.2/taglib/mpc, directory renamed /usr/src/debug/taglib/2.1.1/taglib/shorten -> /usr/src/debug/taglib/2.2/taglib/shorten, directory renamed /usr/src/debug/taglib/2.1.1/taglib/ogg/opus -> /usr/src/debug/taglib/2.2/taglib/ogg/opus, directory renamed /usr/src/debug/taglib/2.1.1/taglib/mpeg/id3v1 -> /usr/src/debug/taglib/2.2/tagl
 ib/mpeg/id3v1, directory renamed /usr/src/debug/taglib/2.1.1/taglib/mod -> /usr/src/debug/taglib/2.2/taglib/mod, directory renamed /usr/src/debug/taglib/2.1.1/taglib/flac -> /usr/src/debug/taglib/2.2/taglib/flac, directory renamed /usr/src/debug/taglib/2.1.1/taglib/mpeg/id3v2 -> /usr/src/debug/taglib/2.2/taglib/mpeg/id3v2, directory renamed /usr/src/debug/taglib/2.1.1/taglib/ogg -> /usr/src/debug/taglib/2.2/taglib/ogg, directory renamed /usr/src/debug/taglib/2.1.1/bindings/c -> /usr/src/debug/taglib/2.2/bindings/c, directory renamed /usr/src/debug/taglib/2.1.1/taglib/ogg/vorbis -> /usr/src/debug/taglib/2.2/taglib/ogg/vorbis, directory renamed /usr/src/debug/taglib/2.1.1/taglib/ogg/speex -> /usr/src/debug/taglib/2.2/taglib/ogg/speex, directory renamed /usr/src/debug/taglib/2.1.1/taglib/it -> /usr/src/debug/taglib/2.2/taglib/it, directory renamed /usr/src/debug/taglib/2.1.1/taglib/riff/wav -> /usr/src/debug/taglib/2.2/taglib/riff/wav, directory renamed /usr/src/debug/taglib/2.1.1/tagl
 ib/dsf -> /usr/src/debug/taglib/2.2/taglib/dsf, directory renamed /usr/src/debug/taglib/2.1.1/taglib/ape -> /usr/src/debug/taglib/2.2/taglib/ape, directory renamed /usr/src/debug/taglib/2.1.1/taglib/mpeg -> /usr/src/debug/taglib/2.2/taglib/mpeg, directory renamed /usr/src/debug/taglib/2.1.1/taglib -> /usr/src/debug/taglib/2.2/taglib, directory renamed /usr/src/debug/taglib/2.1.1/taglib/mpeg/id3v2/frames -> /usr/src/debug/taglib/2.2/taglib/mpeg/id3v2/frames, directory renamed /usr/src/debug/taglib/2.1.1/taglib/dsdiff -> /usr/src/debug/taglib/2.2/taglib/dsdiff, directory renamed /usr/src/debug/taglib/2.1.1/taglib/riff -> /usr/src/debug/taglib/2.2/taglib/riff, directory renamed /usr/src/debug/taglib/2.1.1/taglib/xm -> /usr/src/debug/taglib/2.2/taglib/xm, directory renamed /usr/src/debug/taglib/2.1.1/taglib/s3m -> /usr/src/debug/taglib/2.2/taglib/s3m, directory renamed /usr/src/debug/taglib/2.1.1/taglib/ogg/flac -> /usr/src/debug/taglib/2.2/taglib/ogg/flac, removed "/usr/src/debug/tagli
 b/2.1.1/taglib/mp4/mp4coverart.cpp /usr/src/debug/taglib/2.1.1/taglib/mp4/mp4tag.h /usr/src/debug/taglib/2.1.1/taglib/mp4/mp4item.h /usr/src/debug/taglib/2.1.1/taglib/mp4/mp4coverart.h /usr/src/debug/taglib/2.1.1/taglib/mp4/mp4file.h /usr/src/debug/taglib/2.1.1/taglib/mp4/mp4properties.cpp /usr/src/debug/taglib/2.1.1/taglib/mp4/mp4file.cpp /usr/src/debug/taglib/2.1.1/taglib/mp4/mp4atom.cpp /usr/src/debug/taglib/2.1.1/taglib/mp4/mp4item.cpp /usr/src/debug/taglib/2.1.1/taglib/mp4/mp4properties.h /usr/src/debug/taglib/2.1.1/taglib/mp4/mp4tag.cpp /usr/src/debug/taglib/2.1.1/taglib/mp4/mp4itemfactory.h /usr/src/debug/taglib/2.1.1/taglib/mp4/mp4itemfactory.cpp /usr/src/debug/taglib/2.1.1/taglib/mp4/mp4atom.h", added "/usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmlbinaryelement.cpp /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmlmkinfo.cpp /usr/src/debug/taglib/2.2/taglib/matroska/matroskaattachedfile.h /usr/src/debug/taglib/2.2/taglib/matroska/matroskaattachedfile.cpp /usr/src/debu
 g/taglib/2.2/taglib/matroska/ebml/ebmlmkinfo.h /usr/src/debug/taglib/2.2/taglib/matroska/matroskachapteredition.cpp /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmlelement.cpp /usr/src/debug/taglib/2.2/taglib/mp4/mp4stem.h /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmlbinaryelement.h /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmlmasterelement.h /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmlmktracks.h /usr/src/debug/taglib/2.2/taglib/mp4/mp4tag.h /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmlmkchapters.h /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmluintelement.h /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmlvoidelement.h /usr/src/debug/taglib/2.2/taglib/mp4/mp4itemfactory.h /usr/src/debug/taglib/2.2/taglib/mp4/mp4file.h /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmlmkattachments.cpp /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmlmkattachments.h /usr/src/debug/taglib/2.2/taglib/matroska/matroskacues.cpp /usr/src/debug/taglib/2.2/taglib/matros
 ka/matroskafile.cpp /usr/src/debug/taglib/2.2/taglib/mp4/mp4coverart.cpp /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmlfloatelement.cpp /usr/src/debug/taglib/2.2/taglib/matroska/matroskaproperties.h /usr/src/debug/taglib/2.2/taglib/mp4/mp4item.cpp /usr/src/debug/taglib/2.2/taglib/matroska/matroskacues.h /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmlstringelement.h /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmlstringelement.cpp /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmlmkchapters.cpp /usr/src/debug/taglib/2.2/taglib/matroska/matroskachapter.cpp /usr/src/debug/taglib/2.2/taglib/matroska/matroskatag.cpp /usr/src/debug/taglib/2.2/taglib/matroska/matroskatag.h /usr/src/debug/taglib/2.2/taglib/matroska/matroskachapters.cpp /usr/src/debug/taglib/2.2/taglib/mp4/mp4itemfactory.cpp /usr/src/debug/taglib/2.2/taglib/mp4/mp4atom.h /usr/src/debug/taglib/2.2/taglib/mp4/mp4coverart.h /usr/src/debug/taglib/2.2/taglib/mp4/mp4stem.cpp /usr/src/debug/taglib/2.2/taglib/matroska/e
 bml/ebmlmkseekhead.cpp /usr/src/debug/taglib/2.2/taglib/matroska/matroskasimpletag.h /usr/src/debug/taglib/2.2/taglib/matroska/matroskafile.h /usr/src/debug/taglib/2.2/taglib/matroska/matroskaproperties.cpp /usr/src/debug/taglib/2.2/taglib/mp4/mp4properties.cpp /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmlmksegment.h /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmlmkcues.cpp /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmlmktags.cpp /usr/src/debug/taglib/2.2/taglib/matroska/matroskaattachments.h /usr/src/debug/taglib/2.2/taglib/mp4/mp4properties.h /usr/src/debug/taglib/2.2/taglib/matroska/matroskaattachments.cpp /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmlmkseekhead.h /usr/src/debug/taglib/2.2/taglib/mp4/mp4item.h /usr/src/debug/taglib/2.2/taglib/matroska/matroskasimpletag.cpp /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmlmasterelement.cpp /usr/src/debug/taglib/2.2/taglib/mp4/mp4file.cpp /usr/src/debug/taglib/2.2/taglib/matroska/matroskaseekhead.h /usr/src/de
 bug/taglib/2.2/taglib/matroska/ebml/ebmlmktracks.cpp /usr/src/debug/taglib/2.2/taglib/matroska/matroskachapteredition.h /usr/src/debug/taglib/2.2/taglib/mp4/mp4atom.cpp /usr/src/debug/taglib/2.2/taglib/matroska/matroskachapters.h /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmlmksegment.cpp /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmlelement.h /usr/src/debug/taglib/2.2/taglib/matroska/matroskaelement.cpp /usr/src/debug/taglib/2.2/taglib/matroska/matroskasegment.cpp /usr/src/debug/taglib/2.2/taglib/matroska/matroskaseekhead.cpp /usr/src/debug/taglib/2.2/taglib/matroska/matroskachapter.h /usr/src/debug/taglib/2.2/taglib/matroska/matroskaelement.h /usr/src/debug/taglib/2.2/taglib/matroska/matroskasegment.h /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmlmkcues.h /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmlmktags.h /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmlutils.h /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmlutils.cpp /usr/src/debug/taglib/2.2/taglib/m
 atroska/ebml/ebmlfloatelement.h /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmluintelement.cpp /usr/src/debug/taglib/2.2/taglib/matroska/ebml/ebmlvoidelement.cpp /usr/src/debug/taglib/2.2/taglib/mp4/mp4tag.cpp"
packages/x86-64-v3-poky-linux/taglib/taglib-src: PKGSIZE changed from 1694390 to 1963462 (+16%)
packages/x86-64-v3-poky-linux/taglib/taglib-staticdev: PV changed from "2.1.1" to "2.2"
packages/x86-64-v3-poky-linux/taglib/taglib-staticdev: PKGV changed from 2.1.1 [default] to 2.2 [default]
packages/x86-64-v3-poky-linux/taglib/taglib: PV changed from "2.1.1" to "2.2"
packages/x86-64-v3-poky-linux/taglib/taglib: PKGV changed from 2.1.1 [default] to 2.2 [default]
packages/x86-64-v3-poky-linux/taglib/taglib: FILELIST: removed "/usr/lib/libtag.so.2.1.1", added "/usr/lib/libtag.so.2.2.0"
packages/x86-64-v3-poky-linux/taglib/taglib: PKGSIZE changed from 1280111 to 1513583 (+18%)

--===============2387636042936802069==--

