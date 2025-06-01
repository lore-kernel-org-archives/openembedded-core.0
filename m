Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C25CC71133
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:56 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.27782.1748786120552370013
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=rEc7fxOB;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=q71STsn+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101972bc70b8a-f6e8ccd8-4d84-47d8-a6bf-18080e0e8eaa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786154;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q5fOV1EjoZDtYK+FsgWoK6OeHuNGYhaPXrZz0IvRWo8=;
	b=rEc7fxOB1EUxzJczUCoqqxC8hSY2xpz6TD2BgOF4uRPlMO/tELh7w5C7qYOQQnbp
	dW4oSpRj7xUd1RBY3kg0ZDMI5pvoAQu+xj64/gQPVNKzbYBy5RRlfODE+jsmEakdeF7
	u3e4LdbcHbHuM9KBcbkmNcDnGdXw1PxySQqpWr8w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786154;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q5fOV1EjoZDtYK+FsgWoK6OeHuNGYhaPXrZz0IvRWo8=;
	b=q71STsn+Yi/2ZwyqS/SdHNiMquX8qxgijke+P/9Pv0ryaUQtuS+jnDh78oXBU0rW
	Hb/FpdqX3P57xjGx/ZyqebpfBoGIUjiuqWGo4KFcHqQGqTSP2HuaMxLM9kU/YqQVbWr
	M2SBghwoBBx/mmRnkX+AavLMn+rhGq4uznH8F5ns=
Content-Type: multipart/mixed; boundary="===============0436182484604499979=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] taglib: upgrading to 2.1 SUCCEEDED
Message-ID: <010101972bc70b8a-f6e8ccd8-4d84-47d8-a6bf-18080e0e8eaa-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217669

--===============0436182484604499979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *taglib* to *2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-taglib-upgrade-2.0.2-2.1.patch
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
From 97992e5e8d84b9f7b04ca0989a2bc409cab5eb3f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 13:53:07 +0000
Subject: [PATCH] taglib: upgrade 2.0.2 -> 2.1

---
 meta/recipes-support/taglib/{taglib_2.0.2.bb => taglib_2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/taglib/{taglib_2.0.2.bb => taglib_2.1.bb} (95%)

diff --git a/meta/recipes-support/taglib/taglib_2.0.2.bb b/meta/recipes-support/taglib/taglib_2.1.bb
similarity index 95%
rename from meta/recipes-support/taglib/taglib_2.0.2.bb
rename to meta/recipes-support/taglib/taglib_2.1.bb
index 254119268c..a337af74d0 100644
--- a/meta/recipes-support/taglib/taglib_2.0.2.bb
+++ b/meta/recipes-support/taglib/taglib_2.1.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib utfcpp"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "0de288d7fe34ba133199fd8512f19cc1100196826eafcb67a33b224ec3a59737"
+SRC_URI[sha256sum] = "95b788b39eaebab41f7e6d1c1d05ceee01a5d1225e4b6d11ed8976e96ba90b0c"
 
 UPSTREAM_CHECK_URI = "https://taglib.org/"
 UPSTREAM_CHECK_REGEX = "taglib-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.47.1


--===============0436182484604499979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/taglib: PV changed from "2.0.2" to "2.1"
packages/core2-64-poky-linux/taglib: SRC_URI changed from "http://taglib.github.io/releases/taglib-2.0.2.tar.gz" to "http://taglib.github.io/releases/taglib-2.1.tar.gz"
packages/core2-64-poky-linux/taglib: PKGV changed from 2.0.2 [default] to 2.1 [default]
Changes to packages/core2-64-poky-linux/taglib (sysroot):
  /usr/lib/libtag_c.so.2 changed symlink target from libtag_c.so.2.0.2 to libtag_c.so.2.1.0
  /usr/lib/libtag.so.2 changed symlink target from libtag.so.2.0.2 to libtag.so.2.1.0
  /usr/lib/libtag_c.so.2.0.2 moved to /usr/lib/libtag_c.so.2.1.0
  /usr/lib/libtag.so.2.0.2 moved to /usr/lib/libtag.so.2.1.0
  /usr/include/taglib/shortenfile.h was added
  /usr/include/taglib/shortenproperties.h was added
  /usr/include/taglib/shortentag.h was added
  /usr/include/taglib/taglib_config.h was added
packages/core2-64-poky-linux/taglib/taglib-c: FILELIST: removed "/usr/lib/libtag_c.so.2.0.2", added "/usr/lib/libtag_c.so.2.1.0"
packages/core2-64-poky-linux/taglib/taglib-c: PV changed from "2.0.2" to "2.1"
packages/core2-64-poky-linux/taglib/taglib-c: PKGSIZE changed from 59473 to 63569 (+7%)
packages/core2-64-poky-linux/taglib/taglib-c: PKGV changed from 2.0.2 [default] to 2.1 [default]
packages/core2-64-poky-linux/taglib/taglib-dbg: FILELIST: removed "/usr/lib/.debug/libtag_c.so.2.0.2 /usr/lib/.debug/libtag.so.2.0.2", added "/usr/lib/.debug/libtag.so.2.1.0 /usr/lib/.debug/libtag_c.so.2.1.0"
packages/core2-64-poky-linux/taglib/taglib-dbg: PV changed from "2.0.2" to "2.1"
packages/core2-64-poky-linux/taglib/taglib-dbg: PKGSIZE changed from 23000008 to 23323792 (+1%)
packages/core2-64-poky-linux/taglib/taglib-dbg: PKGV changed from 2.0.2 [default] to 2.1 [default]
packages/core2-64-poky-linux/taglib/taglib-dev: FILELIST: added "/usr/include/taglib/taglib_config.h /usr/include/taglib/shortenproperties.h /usr/include/taglib/shortenfile.h /usr/include/taglib/shortentag.h"
packages/core2-64-poky-linux/taglib/taglib-dev: PV changed from "2.0.2" to "2.1"
packages/core2-64-poky-linux/taglib/taglib-dev: PKGSIZE changed from 751838 to 765443 (+2%)
packages/core2-64-poky-linux/taglib/taglib-dev: PKGV changed from 2.0.2 [default] to 2.1 [default]
packages/core2-64-poky-linux/taglib/taglib-doc: PV changed from "2.0.2" to "2.1"
packages/core2-64-poky-linux/taglib/taglib-doc: PKGV changed from 2.0.2 [default] to 2.1 [default]
packages/core2-64-poky-linux/taglib/taglib-locale: PV changed from "2.0.2" to "2.1"
packages/core2-64-poky-linux/taglib/taglib-locale: PKGV changed from 2.0.2 [default] to 2.1 [default]
packages/core2-64-poky-linux/taglib/taglib-src: FILELIST: directory renamed /usr/src/debug/taglib/2.0.2/taglib/trueaudio -> /usr/src/debug/taglib/2.1/taglib/trueaudio, directory renamed /usr/src/debug/taglib/2.0.2/taglib/flac -> /usr/src/debug/taglib/2.1/taglib/flac, directory renamed /usr/src/debug/taglib/2.0.2/taglib/s3m -> /usr/src/debug/taglib/2.1/taglib/s3m, directory renamed /usr/src/debug/taglib/2.0.2/bindings/c -> /usr/src/debug/taglib/2.1/bindings/c, directory renamed /usr/src/debug/taglib/2.0.2/taglib/ogg/vorbis -> /usr/src/debug/taglib/2.1/taglib/ogg/vorbis, directory renamed /usr/src/debug/taglib/2.0.2/taglib/mp4 -> /usr/src/debug/taglib/2.1/taglib/mp4, directory renamed /usr/src/debug/taglib/2.0.2/taglib/ogg/speex -> /usr/src/debug/taglib/2.1/taglib/ogg/speex, directory renamed /usr/src/debug/taglib/2.0.2/taglib/mpeg/id3v2/frames -> /usr/src/debug/taglib/2.1/taglib/mpeg/id3v2/frames, directory renamed /usr/src/debug/taglib/2.0.2/taglib/ape -> /usr/src/debug/taglib/2.1/ta
 glib/ape, directory renamed /usr/src/debug/taglib/2.0.2/taglib/toolkit -> /usr/src/debug/taglib/2.1/taglib/toolkit, directory renamed /usr/src/debug/taglib/2.0.2/taglib/mpeg/id3v1 -> /usr/src/debug/taglib/2.1/taglib/mpeg/id3v1, directory renamed /usr/src/debug/taglib/2.0.2/taglib/dsf -> /usr/src/debug/taglib/2.1/taglib/dsf, directory renamed /usr/src/debug/taglib/2.0.2/taglib/mpeg/id3v2 -> /usr/src/debug/taglib/2.1/taglib/mpeg/id3v2, directory renamed /usr/src/debug/taglib/2.0.2/taglib/riff/aiff -> /usr/src/debug/taglib/2.1/taglib/riff/aiff, directory renamed /usr/src/debug/taglib/2.0.2/taglib/ogg/opus -> /usr/src/debug/taglib/2.1/taglib/ogg/opus, directory renamed /usr/src/debug/taglib/2.0.2/taglib/riff/wav -> /usr/src/debug/taglib/2.1/taglib/riff/wav, directory renamed /usr/src/debug/taglib/2.0.2/taglib/xm -> /usr/src/debug/taglib/2.1/taglib/xm, directory renamed /usr/src/debug/taglib/2.0.2/taglib/mpc -> /usr/src/debug/taglib/2.1/taglib/mpc, directory renamed /usr/src/debug/taglib
 /2.0.2/taglib/mod -> /usr/src/debug/taglib/2.1/taglib/mod, directory renamed /usr/src/debug/taglib/2.0.2/taglib/dsdiff -> /usr/src/debug/taglib/2.1/taglib/dsdiff, directory renamed /usr/src/debug/taglib/2.0.2/taglib/ogg/flac -> /usr/src/debug/taglib/2.1/taglib/ogg/flac, directory renamed /usr/src/debug/taglib/2.0.2/taglib -> /usr/src/debug/taglib/2.1/taglib, directory renamed /usr/src/debug/taglib/2.0.2/taglib/wavpack -> /usr/src/debug/taglib/2.1/taglib/wavpack, directory renamed /usr/src/debug/taglib/2.0.2/taglib/mpeg -> /usr/src/debug/taglib/2.1/taglib/mpeg, directory renamed /usr/src/debug/taglib/2.0.2/taglib/it -> /usr/src/debug/taglib/2.1/taglib/it, directory renamed /usr/src/debug/taglib/2.0.2/taglib/riff -> /usr/src/debug/taglib/2.1/taglib/riff, directory renamed /usr/src/debug/taglib/2.0.2/taglib/asf -> /usr/src/debug/taglib/2.1/taglib/asf, directory renamed /usr/src/debug/taglib/2.0.2/taglib/ogg -> /usr/src/debug/taglib/2.1/taglib/ogg, added "/usr/src/debug/taglib/2.1/tagli
 b/shorten/shortenutils.h /usr/src/debug/taglib/2.1/taglib/shorten/shortenfile.cpp /usr/src/debug/taglib/2.1/taglib/shorten/shortenfile.h /usr/src/debug/taglib/2.1/taglib/shorten/shortenproperties.h /usr/src/debug/taglib/2.1/taglib/shorten/shortenproperties.cpp /usr/src/debug/taglib/2.1/taglib/shorten/shortentag.cpp /usr/src/debug/taglib/2.1/taglib/shorten/shortentag.h"
packages/core2-64-poky-linux/taglib/taglib-src: PV changed from "2.0.2" to "2.1"
packages/core2-64-poky-linux/taglib/taglib-src: PKGSIZE changed from 1648762 to 1691935 (+3%)
packages/core2-64-poky-linux/taglib/taglib-src: PKGV changed from 2.0.2 [default] to 2.1 [default]
packages/core2-64-poky-linux/taglib/taglib-staticdev: PV changed from "2.0.2" to "2.1"
packages/core2-64-poky-linux/taglib/taglib-staticdev: PKGV changed from 2.0.2 [default] to 2.1 [default]
packages/core2-64-poky-linux/taglib/taglib: FILELIST: removed "/usr/lib/libtag.so.2.0.2", added "/usr/lib/libtag.so.2.1.0"
packages/core2-64-poky-linux/taglib/taglib: PV changed from "2.0.2" to "2.1"
packages/core2-64-poky-linux/taglib/taglib: PKGSIZE changed from 1251439 to 1267823 (+1%)
packages/core2-64-poky-linux/taglib/taglib: PKGV changed from 2.0.2 [default] to 2.1 [default]

--===============0436182484604499979==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-taglib-upgrade-2.0.2-2.1.patch"

RnJvbSA5Nzk5MmU1ZThkODRiOWY3YjA0Y2EwOTg5YTJiYzQwOWNhYjVlYjNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAxMzo1MzowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHRh
Z2xpYjogdXBncmFkZSAyLjAuMiAtPiAyLjEKCi0tLQogbWV0YS9yZWNpcGVzLXN1cHBvcnQvdGFn
bGliL3t0YWdsaWJfMi4wLjIuYmIgPT4gdGFnbGliXzIuMS5iYn0gfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
c3VwcG9ydC90YWdsaWIve3RhZ2xpYl8yLjAuMi5iYiA9PiB0YWdsaWJfMi4xLmJifSAoOTUlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3RhZ2xpYi90YWdsaWJfMi4wLjIuYmIg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC90YWdsaWIvdGFnbGliXzIuMS5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC90YWdsaWIvdGFnbGliXzIu
MC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC90YWdsaWIvdGFnbGliXzIuMS5i
YgppbmRleCAyNTQxMTkyNjhjLi5hMzM3YWY3NGQwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC90YWdsaWIvdGFnbGliXzIuMC4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L3RhZ2xpYi90YWdsaWJfMi4xLmJiCkBAIC0xMSw3ICsxMSw3IEBAIERFUEVORFMgPSAiemxpYiB1
dGZjcHAiCiAKIFNSQ19VUkkgPSAiaHR0cDovL3RhZ2xpYi5naXRodWIuaW8vcmVsZWFzZXMvJHtC
UH0udGFyLmd6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGRlMjg4ZDdmZTM0YmExMzMxOTlm
ZDg1MTJmMTljYzExMDAxOTY4MjZlYWZjYjY3YTMzYjIyNGVjM2E1OTczNyIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICI5NWI3ODhiMzllYWViYWI0MWY3ZTZkMWMxZDA1Y2VlZTAxYTVkMTIyNWU0YjZk
MTFlZDg5NzZlOTZiYTkwYjBjIgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly90YWds
aWIub3JnLyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInRhZ2xpYi0oP1A8cHZlcj5cZCsoXC5c
ZCspKylcLnRhciIKLS0gCjIuNDcuMQoK

--===============0436182484604499979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/taglib (sysroot):
  /usr/lib/libtag_c.so.2 changed symlink target from libtag_c.so.2.0.2 to libtag_c.so.2.1.0
  /usr/lib/libtag.so.2 changed symlink target from libtag.so.2.0.2 to libtag.so.2.1.0
  /usr/lib/libtag_c.so.2.0.2 moved to /usr/lib/libtag_c.so.2.1.0
  /usr/lib/libtag.so.2.0.2 moved to /usr/lib/libtag.so.2.1.0
  /usr/include/taglib/shortenfile.h was added
  /usr/include/taglib/shortenproperties.h was added
  /usr/include/taglib/shortentag.h was added
  /usr/include/taglib/taglib_config.h was added
packages/core2-64-poky-linux/taglib/taglib-c: FILELIST: removed "/usr/lib/libtag_c.so.2.0.2", added "/usr/lib/libtag_c.so.2.1.0"
packages/core2-64-poky-linux/taglib/taglib-dev: FILELIST: added "/usr/include/taglib/shortenproperties.h /usr/include/taglib/taglib_config.h /usr/include/taglib/shortenfile.h /usr/include/taglib/shortentag.h"
packages/core2-64-poky-linux/taglib/taglib: FILELIST: removed "/usr/lib/libtag.so.2.0.2", added "/usr/lib/libtag.so.2.1.0"

--===============0436182484604499979==--

