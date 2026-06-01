Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82085CD6E6A
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:36:02 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1556.1780328132368531067
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aa6qgG78;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XfoTeY+K;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019e83d3d1f0-ff455bb4-43a7-484a-89b2-3a928f144729-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328157;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yxhiuT7leZmHXkOaWWBLcpdBGxX/TlIffsOIkf1qbFk=;
	b=aa6qgG78wuwhVhploZhqBrA7jf22UpfU36xeXAIbmBv8yw24a7mG1qqvgOrqV15K
	9YIhXrGdzAQPdbxtj4CM8fMn4lzprCCqSjZ+GDcm+oKNDlSV96i/BTWGRPhTN+BaIeU
	6XWP93IRylcH/8qdeoXemzVcx7u9XFBdzeYj9Uio=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328157;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yxhiuT7leZmHXkOaWWBLcpdBGxX/TlIffsOIkf1qbFk=;
	b=XfoTeY+K07nPsKsbsHgDGhHHAndkchNfMASoIwtSQorwZJJZbvJ8WcOMH58+CHzr
	o/nV8EO8jz6yiHlG5qJhtrEJTVbuXXZXnyjU3m+/D55iRdJoW4uJR3RRPs63Gf6rFR7
	2FBWN7W4ZDz3hpKXriUNwOKv9nJu6mAagbVWIR4s=
Content-Type: multipart/mixed; boundary="===============9059481658687458063=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] taglib: upgrading to 2.3 SUCCEEDED
Message-ID: <0101019e83d3d1f0-ff455bb4-43a7-484a-89b2-3a928f144729-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237964

--===============9059481658687458063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *taglib* to *2.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-taglib-upgrade-2.2.1-2.3.patch
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
From 279d4c04b79f00120d27d4bc5e3c1311a3892545 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 15:29:46 +0000
Subject: [PATCH] taglib: upgrade 2.2.1 -> 2.3

---
 meta/recipes-support/taglib/{taglib_2.2.1.bb => taglib_2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/taglib/{taglib_2.2.1.bb => taglib_2.3.bb} (95%)

diff --git a/meta/recipes-support/taglib/taglib_2.2.1.bb b/meta/recipes-support/taglib/taglib_2.3.bb
similarity index 95%
rename from meta/recipes-support/taglib/taglib_2.2.1.bb
rename to meta/recipes-support/taglib/taglib_2.3.bb
index 9f5dbfe9cb..b29f28702d 100644
--- a/meta/recipes-support/taglib/taglib_2.2.1.bb
+++ b/meta/recipes-support/taglib/taglib_2.3.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib utfcpp"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "7e76b5299dcef427c486bffe455098470c8da91cf3ccb9ea804893df57389b5e"
+SRC_URI[sha256sum] = "7349f6fd942418bc7009ebe743eb7c9d055f02921ec56fa436ec25007c47fd38"
 
 UPSTREAM_CHECK_URI = "https://taglib.org/"
 UPSTREAM_CHECK_REGEX = "taglib-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.47.1


--===============9059481658687458063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/taglib (sysroot):
  /usr/lib/libtag_c.so.2 changed symlink target from libtag_c.so.2.2.1 to libtag_c.so.2.3.0
  /usr/lib/libtag.so.2 changed symlink target from libtag.so.2.2.1 to libtag.so.2.3.0
  /usr/lib/libtag_c.so.2.2.1 moved to /usr/lib/libtag_c.so.2.3.0
  /usr/lib/libtag.so.2.2.1 moved to /usr/lib/libtag.so.2.3.0
  /usr/include/taglib/matroskawritestyle.h was added
  /usr/include/taglib/mp4chapter.h was added
  /usr/include/taglib/mp4chapterholder.h was added
  /usr/include/taglib/mp4nerochapterlist.h was added
  /usr/include/taglib/mp4qtchapterlist.h was added
packages/x86-64-v3-poky-linux/taglib/taglib-c: FILELIST: removed "/usr/lib/libtag_c.so.2.2.1", added "/usr/lib/libtag_c.so.2.3.0"
packages/x86-64-v3-poky-linux/taglib/taglib-dev: FILELIST: added "/usr/include/taglib/mp4qtchapterlist.h /usr/include/taglib/matroskawritestyle.h /usr/include/taglib/mp4nerochapterlist.h /usr/include/taglib/mp4chapter.h /usr/include/taglib/mp4chapterholder.h"
packages/x86-64-v3-poky-linux/taglib/taglib: FILELIST: removed "/usr/lib/libtag.so.2.2.1", added "/usr/lib/libtag.so.2.3.0"

--===============9059481658687458063==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-taglib-upgrade-2.2.1-2.3.patch"

RnJvbSAyNzlkNGMwNGI3OWYwMDEyMGQyN2Q0YmM1ZTNjMTMxMWEzODkyNTQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxNToyOTo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHRh
Z2xpYjogdXBncmFkZSAyLjIuMSAtPiAyLjMKCi0tLQogbWV0YS9yZWNpcGVzLXN1cHBvcnQvdGFn
bGliL3t0YWdsaWJfMi4yLjEuYmIgPT4gdGFnbGliXzIuMy5iYn0gfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
c3VwcG9ydC90YWdsaWIve3RhZ2xpYl8yLjIuMS5iYiA9PiB0YWdsaWJfMi4zLmJifSAoOTUlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3RhZ2xpYi90YWdsaWJfMi4yLjEuYmIg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC90YWdsaWIvdGFnbGliXzIuMy5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC90YWdsaWIvdGFnbGliXzIu
Mi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC90YWdsaWIvdGFnbGliXzIuMy5i
YgppbmRleCA5ZjVkYmZlOWNiLi5iMjlmMjg3MDJkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC90YWdsaWIvdGFnbGliXzIuMi4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L3RhZ2xpYi90YWdsaWJfMi4zLmJiCkBAIC0xMSw3ICsxMSw3IEBAIERFUEVORFMgPSAiemxpYiB1
dGZjcHAiCiAKIFNSQ19VUkkgPSAiaHR0cDovL3RhZ2xpYi5naXRodWIuaW8vcmVsZWFzZXMvJHtC
UH0udGFyLmd6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2U3NmI1Mjk5ZGNlZjQyN2M0ODZi
ZmZlNDU1MDk4NDcwYzhkYTkxY2YzY2NiOWVhODA0ODkzZGY1NzM4OWI1ZSIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICI3MzQ5ZjZmZDk0MjQxOGJjNzAwOWViZTc0M2ViN2M5ZDA1NWYwMjkyMWVjNTZm
YTQzNmVjMjUwMDdjNDdmZDM4IgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly90YWds
aWIub3JnLyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInRhZ2xpYi0oP1A8cHZlcj5cZCsoXC5c
ZCspKylcLnRhciIKLS0gCjIuNDcuMQoK

--===============9059481658687458063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/taglib: PKGV changed from 2.2.1 [default] to 2.3 [default]
packages/x86-64-v3-poky-linux/taglib: PV changed from "2.2.1" to "2.3"
packages/x86-64-v3-poky-linux/taglib: SRC_URI changed from "http://taglib.github.io/releases/taglib-2.2.1.tar.gz" to "http://taglib.github.io/releases/taglib-2.3.tar.gz"
Changes to packages/x86-64-v3-poky-linux/taglib (sysroot):
  /usr/lib/libtag_c.so.2 changed symlink target from libtag_c.so.2.2.1 to libtag_c.so.2.3.0
  /usr/lib/libtag.so.2 changed symlink target from libtag.so.2.2.1 to libtag.so.2.3.0
  /usr/lib/libtag_c.so.2.2.1 moved to /usr/lib/libtag_c.so.2.3.0
  /usr/lib/libtag.so.2.2.1 moved to /usr/lib/libtag.so.2.3.0
  /usr/include/taglib/matroskawritestyle.h was added
  /usr/include/taglib/mp4chapter.h was added
  /usr/include/taglib/mp4chapterholder.h was added
  /usr/include/taglib/mp4nerochapterlist.h was added
  /usr/include/taglib/mp4qtchapterlist.h was added
packages/x86-64-v3-poky-linux/taglib/taglib-c: FILELIST: removed "/usr/lib/libtag_c.so.2.2.1", added "/usr/lib/libtag_c.so.2.3.0"
packages/x86-64-v3-poky-linux/taglib/taglib-c: PV changed from "2.2.1" to "2.3"
packages/x86-64-v3-poky-linux/taglib/taglib-c: PKGV changed from 2.2.1 [default] to 2.3 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-dbg: FILELIST: removed "/usr/lib/.debug/libtag.so.2.2.1 /usr/lib/.debug/libtag_c.so.2.2.1", added "/usr/lib/.debug/libtag.so.2.3.0 /usr/lib/.debug/libtag_c.so.2.3.0"
packages/x86-64-v3-poky-linux/taglib/taglib-dbg: PKGSIZE changed from 30150784 to 31428208 (+4%)
packages/x86-64-v3-poky-linux/taglib/taglib-dbg: PV changed from "2.2.1" to "2.3"
packages/x86-64-v3-poky-linux/taglib/taglib-dbg: PKGV changed from 2.2.1 [default] to 2.3 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-dev: FILELIST: added "/usr/include/taglib/mp4qtchapterlist.h /usr/include/taglib/matroskawritestyle.h /usr/include/taglib/mp4nerochapterlist.h /usr/include/taglib/mp4chapterholder.h /usr/include/taglib/mp4chapter.h"
packages/x86-64-v3-poky-linux/taglib/taglib-dev: PKGSIZE changed from 813795 to 835738 (+3%)
packages/x86-64-v3-poky-linux/taglib/taglib-dev: PV changed from "2.2.1" to "2.3"
packages/x86-64-v3-poky-linux/taglib/taglib-dev: PKGV changed from 2.2.1 [default] to 2.3 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-doc: PV changed from "2.2.1" to "2.3"
packages/x86-64-v3-poky-linux/taglib/taglib-doc: PKGV changed from 2.2.1 [default] to 2.3 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-locale: PV changed from "2.2.1" to "2.3"
packages/x86-64-v3-poky-linux/taglib/taglib-locale: PKGV changed from 2.2.1 [default] to 2.3 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-src: FILELIST: directory renamed /usr/src/debug/taglib/2.2.1/taglib/ape -> /usr/src/debug/taglib/2.3/taglib/ape, directory renamed /usr/src/debug/taglib/2.2.1/taglib/ogg/speex -> /usr/src/debug/taglib/2.3/taglib/ogg/speex, directory renamed /usr/src/debug/taglib/2.2.1/taglib/mpeg/id3v1 -> /usr/src/debug/taglib/2.3/taglib/mpeg/id3v1, directory renamed /usr/src/debug/taglib/2.2.1/taglib/mpeg/id3v2 -> /usr/src/debug/taglib/2.3/taglib/mpeg/id3v2, directory renamed /usr/src/debug/taglib/2.2.1/taglib/riff -> /usr/src/debug/taglib/2.3/taglib/riff, directory renamed /usr/src/debug/taglib/2.2.1/taglib/trueaudio -> /usr/src/debug/taglib/2.3/taglib/trueaudio, directory renamed /usr/src/debug/taglib/2.2.1/taglib/it -> /usr/src/debug/taglib/2.3/taglib/it, directory renamed /usr/src/debug/taglib/2.2.1/bindings/c -> /usr/src/debug/taglib/2.3/bindings/c, directory renamed /usr/src/debug/taglib/2.2.1/taglib/mpeg/id3v2/frames -> /usr/src/debug/taglib/2.3/tag
 lib/mpeg/id3v2/frames, directory renamed /usr/src/debug/taglib/2.2.1/taglib/ogg/vorbis -> /usr/src/debug/taglib/2.3/taglib/ogg/vorbis, directory renamed /usr/src/debug/taglib/2.2.1/taglib/xm -> /usr/src/debug/taglib/2.3/taglib/xm, directory renamed /usr/src/debug/taglib/2.2.1/taglib/matroska/ebml -> /usr/src/debug/taglib/2.3/taglib/matroska/ebml, directory renamed /usr/src/debug/taglib/2.2.1/taglib/shorten -> /usr/src/debug/taglib/2.3/taglib/shorten, directory renamed /usr/src/debug/taglib/2.2.1/taglib/ogg/flac -> /usr/src/debug/taglib/2.3/taglib/ogg/flac, directory renamed /usr/src/debug/taglib/2.2.1/taglib/ogg/opus -> /usr/src/debug/taglib/2.3/taglib/ogg/opus, directory renamed /usr/src/debug/taglib/2.2.1/taglib/ogg -> /usr/src/debug/taglib/2.3/taglib/ogg, directory renamed /usr/src/debug/taglib/2.2.1/taglib/mpeg -> /usr/src/debug/taglib/2.3/taglib/mpeg, directory renamed /usr/src/debug/taglib/2.2.1/taglib/mod -> /usr/src/debug/taglib/2.3/taglib/mod, directory renamed /usr/src/deb
 ug/taglib/2.2.1/taglib/riff/aiff -> /usr/src/debug/taglib/2.3/taglib/riff/aiff, directory renamed /usr/src/debug/taglib/2.2.1/taglib/wavpack -> /usr/src/debug/taglib/2.3/taglib/wavpack, directory renamed /usr/src/debug/taglib/2.2.1/taglib/asf -> /usr/src/debug/taglib/2.3/taglib/asf, directory renamed /usr/src/debug/taglib/2.2.1/taglib/toolkit -> /usr/src/debug/taglib/2.3/taglib/toolkit, directory renamed /usr/src/debug/taglib/2.2.1/taglib/mpc -> /usr/src/debug/taglib/2.3/taglib/mpc, directory renamed /usr/src/debug/taglib/2.2.1/taglib/flac -> /usr/src/debug/taglib/2.3/taglib/flac, directory renamed /usr/src/debug/taglib/2.2.1/taglib/riff/wav -> /usr/src/debug/taglib/2.3/taglib/riff/wav, directory renamed /usr/src/debug/taglib/2.2.1/taglib -> /usr/src/debug/taglib/2.3/taglib, directory renamed /usr/src/debug/taglib/2.2.1/taglib/dsf -> /usr/src/debug/taglib/2.3/taglib/dsf, directory renamed /usr/src/debug/taglib/2.2.1/taglib/s3m -> /usr/src/debug/taglib/2.3/taglib/s3m, directory renam
 ed /usr/src/debug/taglib/2.2.1/taglib/dsdiff -> /usr/src/debug/taglib/2.3/taglib/dsdiff, removed "/usr/src/debug/taglib/2.2.1/taglib/mp4/mp4properties.cpp /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskachapters.h /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4itemfactory.cpp /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4properties.h /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskaattachments.h /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4coverart.cpp /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskaattachedfile.h /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskaattachedfile.cpp /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskacues.h /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskafile.h /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskatag.h /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskasimpletag.cpp /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskatag.cpp /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4itemfactory.h /usr/src/debug/taglib/2.2.1/taglib/matroska/matrosk
 achapter.h /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4file.h /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskachapteredition.cpp /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4item.h /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskachapteredition.h /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4stem.h /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4tag.cpp /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskaseekhead.cpp /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskacues.cpp /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskafile.cpp /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4item.cpp /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4stem.cpp /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4atom.cpp /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskaelement.h /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskasegment.h /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskachapter.cpp /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskaproperties.cpp /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskapr
 operties.h /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskaseekhead.h /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskasimpletag.h /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskaelement.cpp /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskasegment.cpp /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskaattachments.cpp /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskachapters.cpp /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4coverart.h /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4tag.h /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4atom.h /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4file.cpp", added "/usr/src/debug/taglib/2.3/taglib/matroska/matroskachapteredition.h /usr/src/debug/taglib/2.3/taglib/matroska/matroskachapters.h /usr/src/debug/taglib/2.3/taglib/mp4/mp4stem.cpp /usr/src/debug/taglib/2.3/taglib/matroska/matroskaattachedfile.cpp /usr/src/debug/taglib/2.3/taglib/matroska/matroskaseekhead.cpp /usr/src/debug/taglib/2.3/taglib/mp4/mp4tag.cpp /usr/src/debug/taglib/2.3/taglib/
 mp4/mp4qtchapterlist.h /usr/src/debug/taglib/2.3/taglib/matroska/matroskachapter.cpp /usr/src/debug/taglib/2.3/taglib/matroska/matroskaseekhead.h /usr/src/debug/taglib/2.3/taglib/mp4/mp4chapter.h /usr/src/debug/taglib/2.3/taglib/matroska/matroskafile.h /usr/src/debug/taglib/2.3/taglib/mp4/mp4properties.h /usr/src/debug/taglib/2.3/taglib/mp4/mp4properties.cpp /usr/src/debug/taglib/2.3/taglib/matroska/matroskaelement.cpp /usr/src/debug/taglib/2.3/taglib/matroska/matroskasegment.cpp /usr/src/debug/taglib/2.3/taglib/mp4/mp4itemfactory.h /usr/src/debug/taglib/2.3/taglib/matroska/matroskacues.h /usr/src/debug/taglib/2.3/taglib/matroska/matroskawritestyle.h /usr/src/debug/taglib/2.3/taglib/mp4/mp4itemfactory.cpp /usr/src/debug/taglib/2.3/taglib/mp4/mp4coverart.h /usr/src/debug/taglib/2.3/taglib/mp4/mp4stem.h /usr/src/debug/taglib/2.3/taglib/matroska/matroskaelement.h /usr/src/debug/taglib/2.3/taglib/matroska/matroskasegment.h /usr/src/debug/taglib/2.3/taglib/mp4/mp4atom.h /usr/src/debug/ta
 glib/2.3/taglib/matroska/matroskaattachments.cpp /usr/src/debug/taglib/2.3/taglib/mp4/mp4coverart.cpp /usr/src/debug/taglib/2.3/taglib/mp4/mp4file.cpp /usr/src/debug/taglib/2.3/taglib/mp4/mp4nerochapterlist.cpp /usr/src/debug/taglib/2.3/taglib/mp4/mp4nerochapterlist.h /usr/src/debug/taglib/2.3/taglib/mp4/mp4item.h /usr/src/debug/taglib/2.3/taglib/matroska/matroskasimpletag.cpp /usr/src/debug/taglib/2.3/taglib/matroska/matroskacues.cpp /usr/src/debug/taglib/2.3/taglib/matroska/matroskafile.cpp /usr/src/debug/taglib/2.3/taglib/mp4/mp4file.h /usr/src/debug/taglib/2.3/taglib/mp4/mp4chapter.cpp /usr/src/debug/taglib/2.3/taglib/matroska/matroskaattachedfile.h /usr/src/debug/taglib/2.3/taglib/matroska/matroskaproperties.cpp /usr/src/debug/taglib/2.3/taglib/matroska/matroskasimpletag.h /usr/src/debug/taglib/2.3/taglib/matroska/matroskatag.cpp /usr/src/debug/taglib/2.3/taglib/mp4/mp4chapterholder.h /usr/src/debug/taglib/2.3/taglib/matroska/matroskaproperties.h /usr/src/debug/taglib/2.3/tagli
 b/matroska/matroskaattachments.h /usr/src/debug/taglib/2.3/taglib/mp4/mp4item.cpp /usr/src/debug/taglib/2.3/taglib/mp4/mp4atom.cpp /usr/src/debug/taglib/2.3/taglib/matroska/matroskatag.h /usr/src/debug/taglib/2.3/taglib/matroska/matroskachapteredition.cpp /usr/src/debug/taglib/2.3/taglib/mp4/mp4qtchapterlist.cpp /usr/src/debug/taglib/2.3/taglib/mp4/mp4tag.h /usr/src/debug/taglib/2.3/taglib/matroska/matroskachapters.cpp /usr/src/debug/taglib/2.3/taglib/matroska/matroskachapter.h"
packages/x86-64-v3-poky-linux/taglib/taglib-src: PKGSIZE changed from 1971314 to 2080518 (+6%)
packages/x86-64-v3-poky-linux/taglib/taglib-src: PV changed from "2.2.1" to "2.3"
packages/x86-64-v3-poky-linux/taglib/taglib-src: PKGV changed from 2.2.1 [default] to 2.3 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-staticdev: PV changed from "2.2.1" to "2.3"
packages/x86-64-v3-poky-linux/taglib/taglib-staticdev: PKGV changed from 2.2.1 [default] to 2.3 [default]
packages/x86-64-v3-poky-linux/taglib/taglib: FILELIST: removed "/usr/lib/libtag.so.2.2.1", added "/usr/lib/libtag.so.2.3.0"
packages/x86-64-v3-poky-linux/taglib/taglib: PKGSIZE changed from 1554543 to 1632367 (+5%)
packages/x86-64-v3-poky-linux/taglib/taglib: PV changed from "2.2.1" to "2.3"
packages/x86-64-v3-poky-linux/taglib/taglib: PKGV changed from 2.2.1 [default] to 2.3 [default]

--===============9059481658687458063==--

