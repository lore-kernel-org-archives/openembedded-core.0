Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9DB6CD4F49
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:47 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34815.1778851225744947672
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BmR/wMFx;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SUDL3dYb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019e2bcbe97b-463dcd3d-d3b9-458d-a787-32c4fe75b8e4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851244;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mlhZmMrvZB57lo7MMFXp4Vqn9qnHs3cVqfSAlQmtx2g=;
	b=BmR/wMFx8syKqFaJDxRMzpW2qkz31XLs61K82mgyNdX2ATo/N8wGo5jCBVgW04i9
	RrHoLL01ooTvQBMS/HhyOlXEwSgWTEa2wYrzDayGtjiksOfpH5Tfw8pOe8wLMDV68rb
	le835Xmc/iXeZ1EVvdP3e3JisXRjyh0DnNkZY1B0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851244;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mlhZmMrvZB57lo7MMFXp4Vqn9qnHs3cVqfSAlQmtx2g=;
	b=SUDL3dYbIjE6i88J7g55NciKScAzQukj5F5m9F9wHBmWdYKItwzgo0evWuWRmZfx
	6hgVkgZOzGvAMTI24XKNeAEbd9UYLsIRuf4DeznnebG0P4Un8EiwyPZWrqD5oZn18FL
	c38i4YMFURcj7mCy8qN7qBeomTehsSboqVXf376o=
Content-Type: multipart/mixed; boundary="===============4152781724770156310=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] taglib: upgrading to 2.3 SUCCEEDED
Message-ID: <0101019e2bcbe97b-463dcd3d-d3b9-458d-a787-32c4fe75b8e4-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237173

--===============4152781724770156310==
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
From 46fb9ea54536d4b4f790c48ec4fac4212338623f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 13:17:23 +0000
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


--===============4152781724770156310==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-taglib-upgrade-2.2.1-2.3.patch"

RnJvbSA0NmZiOWVhNTQ1MzZkNGI0Zjc5MGM0OGVjNGZhYzQyMTIzMzg2MjNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMTM6MTc6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
YWdsaWI6IHVwZ3JhZGUgMi4yLjEgLT4gMi4zCgotLS0KIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Rh
Z2xpYi97dGFnbGliXzIuMi4xLmJiID0+IHRhZ2xpYl8yLjMuYmJ9IHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LXN1cHBvcnQvdGFnbGliL3t0YWdsaWJfMi4yLjEuYmIgPT4gdGFnbGliXzIuMy5iYn0gKDk1JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC90YWdsaWIvdGFnbGliXzIuMi4xLmJi
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdGFnbGliL3RhZ2xpYl8yLjMuYmIKc2ltaWxhcml0eSBp
bmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdGFnbGliL3RhZ2xpYl8y
LjIuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdGFnbGliL3RhZ2xpYl8yLjMu
YmIKaW5kZXggOWY1ZGJmZTljYi4uYjI5ZjI4NzAyZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvdGFnbGliL3RhZ2xpYl8yLjIuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC90YWdsaWIvdGFnbGliXzIuMy5iYgpAQCAtMTEsNyArMTEsNyBAQCBERVBFTkRTID0gInpsaWIg
dXRmY3BwIgogCiBTUkNfVVJJID0gImh0dHA6Ly90YWdsaWIuZ2l0aHViLmlvL3JlbGVhc2VzLyR7
QlB9LnRhci5neiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdlNzZiNTI5OWRjZWY0MjdjNDg2
YmZmZTQ1NTA5ODQ3MGM4ZGE5MWNmM2NjYjllYTgwNDg5M2RmNTczODliNWUiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiNzM0OWY2ZmQ5NDI0MThiYzcwMDllYmU3NDNlYjdjOWQwNTVmMDI5MjFlYzU2
ZmE0MzZlYzI1MDA3YzQ3ZmQzOCIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vdGFn
bGliLm9yZy8iCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJ0YWdsaWItKD9QPHB2ZXI+XGQrKFwu
XGQrKSspXC50YXIiCi0tIAoyLjQ3LjEKCg==

--===============4152781724770156310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/taglib: SRC_URI changed from "http://taglib.github.io/releases/taglib-2.2.1.tar.gz" to "http://taglib.github.io/releases/taglib-2.3.tar.gz"
packages/x86-64-v3-poky-linux/taglib: PKGV changed from 2.2.1 [default] to 2.3 [default]
packages/x86-64-v3-poky-linux/taglib: PV changed from "2.2.1" to "2.3"
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
packages/x86-64-v3-poky-linux/taglib/taglib-c: PKGV changed from 2.2.1 [default] to 2.3 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-c: FILELIST: removed "/usr/lib/libtag_c.so.2.2.1", added "/usr/lib/libtag_c.so.2.3.0"
packages/x86-64-v3-poky-linux/taglib/taglib-c: PV changed from "2.2.1" to "2.3"
packages/x86-64-v3-poky-linux/taglib/taglib-dbg: PKGSIZE changed from 29449056 to 30658216 (+4%)
packages/x86-64-v3-poky-linux/taglib/taglib-dbg: PKGV changed from 2.2.1 [default] to 2.3 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-dbg: FILELIST: removed "/usr/lib/.debug/libtag.so.2.2.1 /usr/lib/.debug/libtag_c.so.2.2.1", added "/usr/lib/.debug/libtag.so.2.3.0 /usr/lib/.debug/libtag_c.so.2.3.0"
packages/x86-64-v3-poky-linux/taglib/taglib-dbg: PV changed from "2.2.1" to "2.3"
packages/x86-64-v3-poky-linux/taglib/taglib-dev: PKGSIZE changed from 813795 to 835738 (+3%)
packages/x86-64-v3-poky-linux/taglib/taglib-dev: PKGV changed from 2.2.1 [default] to 2.3 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-dev: FILELIST: added "/usr/include/taglib/mp4chapter.h /usr/include/taglib/mp4qtchapterlist.h /usr/include/taglib/mp4nerochapterlist.h /usr/include/taglib/matroskawritestyle.h /usr/include/taglib/mp4chapterholder.h"
packages/x86-64-v3-poky-linux/taglib/taglib-dev: PV changed from "2.2.1" to "2.3"
packages/x86-64-v3-poky-linux/taglib/taglib-doc: PKGV changed from 2.2.1 [default] to 2.3 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-doc: PV changed from "2.2.1" to "2.3"
packages/x86-64-v3-poky-linux/taglib/taglib-locale: PKGV changed from 2.2.1 [default] to 2.3 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-locale: PV changed from "2.2.1" to "2.3"
packages/x86-64-v3-poky-linux/taglib/taglib-src: PKGSIZE changed from 1971314 to 2080518 (+6%)
packages/x86-64-v3-poky-linux/taglib/taglib-src: PKGV changed from 2.2.1 [default] to 2.3 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-src: FILELIST: directory renamed /usr/src/debug/taglib/2.2.1/taglib/it -> /usr/src/debug/taglib/2.3/taglib/it, directory renamed /usr/src/debug/taglib/2.2.1/taglib/toolkit -> /usr/src/debug/taglib/2.3/taglib/toolkit, directory renamed /usr/src/debug/taglib/2.2.1/taglib/flac -> /usr/src/debug/taglib/2.3/taglib/flac, directory renamed /usr/src/debug/taglib/2.2.1/taglib/dsdiff -> /usr/src/debug/taglib/2.3/taglib/dsdiff, directory renamed /usr/src/debug/taglib/2.2.1/taglib/mod -> /usr/src/debug/taglib/2.3/taglib/mod, directory renamed /usr/src/debug/taglib/2.2.1/taglib/ogg/vorbis -> /usr/src/debug/taglib/2.3/taglib/ogg/vorbis, directory renamed /usr/src/debug/taglib/2.2.1/taglib -> /usr/src/debug/taglib/2.3/taglib, directory renamed /usr/src/debug/taglib/2.2.1/taglib/trueaudio -> /usr/src/debug/taglib/2.3/taglib/trueaudio, directory renamed /usr/src/debug/taglib/2.2.1/taglib/matroska/ebml -> /usr/src/debug/taglib/2.3/taglib/matroska/ebml, direc
 tory renamed /usr/src/debug/taglib/2.2.1/taglib/riff/aiff -> /usr/src/debug/taglib/2.3/taglib/riff/aiff, directory renamed /usr/src/debug/taglib/2.2.1/taglib/ogg/opus -> /usr/src/debug/taglib/2.3/taglib/ogg/opus, directory renamed /usr/src/debug/taglib/2.2.1/taglib/riff -> /usr/src/debug/taglib/2.3/taglib/riff, directory renamed /usr/src/debug/taglib/2.2.1/bindings/c -> /usr/src/debug/taglib/2.3/bindings/c, directory renamed /usr/src/debug/taglib/2.2.1/taglib/ogg/speex -> /usr/src/debug/taglib/2.3/taglib/ogg/speex, directory renamed /usr/src/debug/taglib/2.2.1/taglib/mpeg -> /usr/src/debug/taglib/2.3/taglib/mpeg, directory renamed /usr/src/debug/taglib/2.2.1/taglib/mpc -> /usr/src/debug/taglib/2.3/taglib/mpc, directory renamed /usr/src/debug/taglib/2.2.1/taglib/ogg -> /usr/src/debug/taglib/2.3/taglib/ogg, directory renamed /usr/src/debug/taglib/2.2.1/taglib/ogg/flac -> /usr/src/debug/taglib/2.3/taglib/ogg/flac, directory renamed /usr/src/debug/taglib/2.2.1/taglib/asf -> /usr/src/deb
 ug/taglib/2.3/taglib/asf, directory renamed /usr/src/debug/taglib/2.2.1/taglib/mpeg/id3v2/frames -> /usr/src/debug/taglib/2.3/taglib/mpeg/id3v2/frames, directory renamed /usr/src/debug/taglib/2.2.1/taglib/ape -> /usr/src/debug/taglib/2.3/taglib/ape, directory renamed /usr/src/debug/taglib/2.2.1/taglib/mpeg/id3v2 -> /usr/src/debug/taglib/2.3/taglib/mpeg/id3v2, directory renamed /usr/src/debug/taglib/2.2.1/taglib/dsf -> /usr/src/debug/taglib/2.3/taglib/dsf, directory renamed /usr/src/debug/taglib/2.2.1/taglib/mpeg/id3v1 -> /usr/src/debug/taglib/2.3/taglib/mpeg/id3v1, directory renamed /usr/src/debug/taglib/2.2.1/taglib/xm -> /usr/src/debug/taglib/2.3/taglib/xm, directory renamed /usr/src/debug/taglib/2.2.1/taglib/shorten -> /usr/src/debug/taglib/2.3/taglib/shorten, directory renamed /usr/src/debug/taglib/2.2.1/taglib/s3m -> /usr/src/debug/taglib/2.3/taglib/s3m, directory renamed /usr/src/debug/taglib/2.2.1/taglib/riff/wav -> /usr/src/debug/taglib/2.3/taglib/riff/wav, directory renamed
  /usr/src/debug/taglib/2.2.1/taglib/wavpack -> /usr/src/debug/taglib/2.3/taglib/wavpack, removed "/usr/src/debug/taglib/2.2.1/taglib/matroska/matroskacues.h /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4tag.h /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskafile.h /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskatag.cpp /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskachapters.h /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskaproperties.h /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4coverart.cpp /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskasegment.h /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskaelement.h /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskaseekhead.cpp /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskaelement.cpp /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskasegment.cpp /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskaproperties.cpp /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskasimpletag.cpp /usr/src/debug/taglib/2.2.1/taglib/matro
 ska/matroskaattachments.cpp /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskachapter.cpp /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskaattachedfile.cpp /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4coverart.h /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskacues.cpp /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskafile.cpp /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskaattachedfile.h /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskasimpletag.h /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4tag.cpp /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4itemfactory.cpp /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4properties.h /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4item.h /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4itemfactory.h /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4atom.h /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskachapteredition.cpp /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4stem.h /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskachapter.h /usr/src/debug/taglib/2.2.1/tag
 lib/matroska/matroskachapteredition.h /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskaseekhead.h /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4atom.cpp /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4file.cpp /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4file.h /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskachapters.cpp /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskaattachments.h /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4item.cpp /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4stem.cpp /usr/src/debug/taglib/2.2.1/taglib/matroska/matroskatag.h /usr/src/debug/taglib/2.2.1/taglib/mp4/mp4properties.cpp", added "/usr/src/debug/taglib/2.3/taglib/matroska/matroskaseekhead.h /usr/src/debug/taglib/2.3/taglib/mp4/mp4file.h /usr/src/debug/taglib/2.3/taglib/matroska/matroskachapteredition.h /usr/src/debug/taglib/2.3/taglib/mp4/mp4tag.h /usr/src/debug/taglib/2.3/taglib/mp4/mp4chapter.h /usr/src/debug/taglib/2.3/taglib/matroska/matroskachapters.cpp /usr/src/debug/taglib/2.3/taglib/matroska/matroskachap
 ters.h /usr/src/debug/taglib/2.3/taglib/mp4/mp4item.cpp /usr/src/debug/taglib/2.3/taglib/matroska/matroskaattachedfile.cpp /usr/src/debug/taglib/2.3/taglib/mp4/mp4atom.h /usr/src/debug/taglib/2.3/taglib/mp4/mp4stem.h /usr/src/debug/taglib/2.3/taglib/mp4/mp4properties.cpp /usr/src/debug/taglib/2.3/taglib/matroska/matroskachapteredition.cpp /usr/src/debug/taglib/2.3/taglib/matroska/matroskaattachedfile.h /usr/src/debug/taglib/2.3/taglib/matroska/matroskacues.cpp /usr/src/debug/taglib/2.3/taglib/matroska/matroskafile.cpp /usr/src/debug/taglib/2.3/taglib/mp4/mp4properties.h /usr/src/debug/taglib/2.3/taglib/matroska/matroskaproperties.h /usr/src/debug/taglib/2.3/taglib/matroska/matroskaelement.cpp /usr/src/debug/taglib/2.3/taglib/matroska/matroskasegment.cpp /usr/src/debug/taglib/2.3/taglib/matroska/matroskafile.h /usr/src/debug/taglib/2.3/taglib/matroska/matroskaseekhead.cpp /usr/src/debug/taglib/2.3/taglib/mp4/mp4nerochapterlist.cpp /usr/src/debug/taglib/2.3/taglib/mp4/mp4atom.cpp /usr
 /src/debug/taglib/2.3/taglib/mp4/mp4stem.cpp /usr/src/debug/taglib/2.3/taglib/matroska/matroskaproperties.cpp /usr/src/debug/taglib/2.3/taglib/mp4/mp4chapter.cpp /usr/src/debug/taglib/2.3/taglib/matroska/matroskaattachments.h /usr/src/debug/taglib/2.3/taglib/matroska/matroskasimpletag.cpp /usr/src/debug/taglib/2.3/taglib/matroska/matroskawritestyle.h /usr/src/debug/taglib/2.3/taglib/mp4/mp4itemfactory.h /usr/src/debug/taglib/2.3/taglib/mp4/mp4itemfactory.cpp /usr/src/debug/taglib/2.3/taglib/mp4/mp4item.h /usr/src/debug/taglib/2.3/taglib/matroska/matroskaattachments.cpp /usr/src/debug/taglib/2.3/taglib/matroska/matroskatag.h /usr/src/debug/taglib/2.3/taglib/mp4/mp4chapterholder.h /usr/src/debug/taglib/2.3/taglib/mp4/mp4nerochapterlist.h /usr/src/debug/taglib/2.3/taglib/mp4/mp4tag.cpp /usr/src/debug/taglib/2.3/taglib/matroska/matroskaelement.h /usr/src/debug/taglib/2.3/taglib/matroska/matroskasegment.h /usr/src/debug/taglib/2.3/taglib/mp4/mp4coverart.h /usr/src/debug/taglib/2.3/taglib
 /mp4/mp4qtchapterlist.cpp /usr/src/debug/taglib/2.3/taglib/matroska/matroskasimpletag.h /usr/src/debug/taglib/2.3/taglib/matroska/matroskachapter.cpp /usr/src/debug/taglib/2.3/taglib/matroska/matroskacues.h /usr/src/debug/taglib/2.3/taglib/mp4/mp4file.cpp /usr/src/debug/taglib/2.3/taglib/mp4/mp4coverart.cpp /usr/src/debug/taglib/2.3/taglib/matroska/matroskachapter.h /usr/src/debug/taglib/2.3/taglib/matroska/matroskatag.cpp /usr/src/debug/taglib/2.3/taglib/mp4/mp4qtchapterlist.h"
packages/x86-64-v3-poky-linux/taglib/taglib-src: PV changed from "2.2.1" to "2.3"
packages/x86-64-v3-poky-linux/taglib/taglib-staticdev: PKGV changed from 2.2.1 [default] to 2.3 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-staticdev: PV changed from "2.2.1" to "2.3"
packages/x86-64-v3-poky-linux/taglib/taglib: PKGSIZE changed from 1517679 to 1595503 (+5%)
packages/x86-64-v3-poky-linux/taglib/taglib: PKGV changed from 2.2.1 [default] to 2.3 [default]
packages/x86-64-v3-poky-linux/taglib/taglib: FILELIST: removed "/usr/lib/libtag.so.2.2.1", added "/usr/lib/libtag.so.2.3.0"
packages/x86-64-v3-poky-linux/taglib/taglib: PV changed from "2.2.1" to "2.3"

--===============4152781724770156310==
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
packages/x86-64-v3-poky-linux/taglib/taglib-dev: FILELIST: added "/usr/include/taglib/matroskawritestyle.h /usr/include/taglib/mp4qtchapterlist.h /usr/include/taglib/mp4chapterholder.h /usr/include/taglib/mp4chapter.h /usr/include/taglib/mp4nerochapterlist.h"
packages/x86-64-v3-poky-linux/taglib/taglib: FILELIST: removed "/usr/lib/libtag.so.2.2.1", added "/usr/lib/libtag.so.2.3.0"

--===============4152781724770156310==--

