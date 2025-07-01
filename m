Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B5CCC87FDB
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:37 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.1424.1751386807485108968
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kJjzu30f;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=NbmzkcJy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010197c6ca48a8-87b6d738-9552-4a1a-a896-1171bf112297-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386835;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0wripCqDk1zXzJyheqiKD0HQAQKZzHYb5UL+893ZtpM=;
	b=kJjzu30fW0IhzybXU8zoAoqSv3GZ/R0b3uumaQ3dLYANQIJ8kZMsgHI6WMuV1r6O
	3Y7W9cgymhbyDZ/zG3ctP+RV+/YfJUxfLQLKHZhF81MjbMjDwI6oRB4DXcTY2Y8IYmw
	jAuLHk/r7VDQNPGvTlDgcLSlcf/0TjWuakJXTBtQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386835;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0wripCqDk1zXzJyheqiKD0HQAQKZzHYb5UL+893ZtpM=;
	b=NbmzkcJyIOynAm7NDfK2byrhzYfkMz1UhvAaquP+4m7FwvYHBlOj+zvebcCg9SMH
	DC3K25dEtkhEROUrCrxLCkHKi5HgfaOj8Z9usc/Sr7jQ+O9WKqnsHQmI3dqJBppiFrX
	cxmR9rMTMWUB7NyWALx9CGq+tpgQDKx572UOPoA8=
Content-Type: multipart/mixed; boundary="===============6661545699625743645=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] taglib: upgrading to 2.1.1 SUCCEEDED
Message-ID: <01010197c6ca48a8-87b6d738-9552-4a1a-a896-1171bf112297-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219708

--===============6661545699625743645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *taglib* to *2.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-taglib-upgrade-2.1-2.1.1.patch
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
From e5f3d1e5b1f1fbbb361a7ffba628e403e50d6cc4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 16:17:39 +0000
Subject: [PATCH] taglib: upgrade 2.1 -> 2.1.1

---
 meta/recipes-support/taglib/{taglib_2.1.bb => taglib_2.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/taglib/{taglib_2.1.bb => taglib_2.1.1.bb} (95%)

diff --git a/meta/recipes-support/taglib/taglib_2.1.bb b/meta/recipes-support/taglib/taglib_2.1.1.bb
similarity index 95%
rename from meta/recipes-support/taglib/taglib_2.1.bb
rename to meta/recipes-support/taglib/taglib_2.1.1.bb
index a337af74d0..6b700578b8 100644
--- a/meta/recipes-support/taglib/taglib_2.1.bb
+++ b/meta/recipes-support/taglib/taglib_2.1.1.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib utfcpp"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "95b788b39eaebab41f7e6d1c1d05ceee01a5d1225e4b6d11ed8976e96ba90b0c"
+SRC_URI[sha256sum] = "3716d31f7c83cbf17b67c8cf44dd82b2a2f17e6780472287a16823e70305ddba"
 
 UPSTREAM_CHECK_URI = "https://taglib.org/"
 UPSTREAM_CHECK_REGEX = "taglib-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.47.1


--===============6661545699625743645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/taglib (sysroot):
  /usr/lib/libtag_c.so.2 changed symlink target from libtag_c.so.2.1.0 to libtag_c.so.2.1.1
  /usr/lib/libtag.so.2 changed symlink target from libtag.so.2.1.0 to libtag.so.2.1.1
  /usr/lib/libtag_c.so.2.1.0 moved to /usr/lib/libtag_c.so.2.1.1
  /usr/lib/libtag.so.2.1.0 moved to /usr/lib/libtag.so.2.1.1
packages/core2-64-poky-linux/taglib/taglib-c: FILELIST: removed "/usr/lib/libtag_c.so.2.1.0", added "/usr/lib/libtag_c.so.2.1.1"
packages/core2-64-poky-linux/taglib/taglib: FILELIST: removed "/usr/lib/libtag.so.2.1.0", added "/usr/lib/libtag.so.2.1.1"

--===============6661545699625743645==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-taglib-upgrade-2.1-2.1.1.patch"

RnJvbSBlNWYzZDFlNWIxZjFmYmJiMzYxYTdmZmJhNjI4ZTQwM2U1MGQ2Y2M0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxNjoxNzozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHRh
Z2xpYjogdXBncmFkZSAyLjEgLT4gMi4xLjEKCi0tLQogbWV0YS9yZWNpcGVzLXN1cHBvcnQvdGFn
bGliL3t0YWdsaWJfMi4xLmJiID0+IHRhZ2xpYl8yLjEuMS5iYn0gfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
c3VwcG9ydC90YWdsaWIve3RhZ2xpYl8yLjEuYmIgPT4gdGFnbGliXzIuMS4xLmJifSAoOTUlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3RhZ2xpYi90YWdsaWJfMi4xLmJiIGIv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvdGFnbGliL3RhZ2xpYl8yLjEuMS5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC90YWdsaWIvdGFnbGliXzIu
MS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdGFnbGliL3RhZ2xpYl8yLjEuMS5i
YgppbmRleCBhMzM3YWY3NGQwLi42YjcwMDU3OGI4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC90YWdsaWIvdGFnbGliXzIuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC90
YWdsaWIvdGFnbGliXzIuMS4xLmJiCkBAIC0xMSw3ICsxMSw3IEBAIERFUEVORFMgPSAiemxpYiB1
dGZjcHAiCiAKIFNSQ19VUkkgPSAiaHR0cDovL3RhZ2xpYi5naXRodWIuaW8vcmVsZWFzZXMvJHtC
UH0udGFyLmd6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTViNzg4YjM5ZWFlYmFiNDFmN2U2
ZDFjMWQwNWNlZWUwMWE1ZDEyMjVlNGI2ZDExZWQ4OTc2ZTk2YmE5MGIwYyIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICIzNzE2ZDMxZjdjODNjYmYxN2I2N2M4Y2Y0NGRkODJiMmEyZjE3ZTY3ODA0NzIy
ODdhMTY4MjNlNzAzMDVkZGJhIgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly90YWds
aWIub3JnLyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInRhZ2xpYi0oP1A8cHZlcj5cZCsoXC5c
ZCspKylcLnRhciIKLS0gCjIuNDcuMQoK

--===============6661545699625743645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/taglib: PV changed from "2.1" to "2.1.1"
packages/core2-64-poky-linux/taglib: SRC_URI changed from "http://taglib.github.io/releases/taglib-2.1.tar.gz" to "http://taglib.github.io/releases/taglib-2.1.1.tar.gz"
packages/core2-64-poky-linux/taglib: PKGV changed from 2.1 [default] to 2.1.1 [default]
Changes to packages/core2-64-poky-linux/taglib (sysroot):
  /usr/lib/libtag_c.so.2 changed symlink target from libtag_c.so.2.1.0 to libtag_c.so.2.1.1
  /usr/lib/libtag.so.2 changed symlink target from libtag.so.2.1.0 to libtag.so.2.1.1
  /usr/lib/libtag_c.so.2.1.0 moved to /usr/lib/libtag_c.so.2.1.1
  /usr/lib/libtag.so.2.1.0 moved to /usr/lib/libtag.so.2.1.1
packages/core2-64-poky-linux/taglib/taglib-c: PV changed from "2.1" to "2.1.1"
packages/core2-64-poky-linux/taglib/taglib-c: PKGV changed from 2.1 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/taglib/taglib-c: FILELIST: removed "/usr/lib/libtag_c.so.2.1.0", added "/usr/lib/libtag_c.so.2.1.1"
packages/core2-64-poky-linux/taglib/taglib-dbg: PV changed from "2.1" to "2.1.1"
packages/core2-64-poky-linux/taglib/taglib-dbg: PKGV changed from 2.1 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/taglib/taglib-dbg: FILELIST: removed "/usr/lib/.debug/libtag.so.2.1.0 /usr/lib/.debug/libtag_c.so.2.1.0", added "/usr/lib/.debug/libtag.so.2.1.1 /usr/lib/.debug/libtag_c.so.2.1.1"
packages/core2-64-poky-linux/taglib/taglib-dbg: PKGSIZE changed from 23323792 to 23354064 (+0%)
packages/core2-64-poky-linux/taglib/taglib-dev: PV changed from "2.1" to "2.1.1"
packages/core2-64-poky-linux/taglib/taglib-dev: PKGV changed from 2.1 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/taglib/taglib-dev: PKGSIZE changed from 765443 to 765468 (+0%)
packages/core2-64-poky-linux/taglib/taglib-doc: PV changed from "2.1" to "2.1.1"
packages/core2-64-poky-linux/taglib/taglib-doc: PKGV changed from 2.1 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/taglib/taglib-locale: PV changed from "2.1" to "2.1.1"
packages/core2-64-poky-linux/taglib/taglib-locale: PKGV changed from 2.1 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/taglib/taglib-src: PV changed from "2.1" to "2.1.1"
packages/core2-64-poky-linux/taglib/taglib-src: PKGV changed from 2.1 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/taglib/taglib-src: PKGSIZE changed from 1691935 to 1694390 (+0%)
packages/core2-64-poky-linux/taglib/taglib-staticdev: PV changed from "2.1" to "2.1.1"
packages/core2-64-poky-linux/taglib/taglib-staticdev: PKGV changed from 2.1 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/taglib/taglib: PV changed from "2.1" to "2.1.1"
packages/core2-64-poky-linux/taglib/taglib: PKGV changed from 2.1 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/taglib/taglib: FILELIST: removed "/usr/lib/libtag.so.2.1.0", added "/usr/lib/libtag.so.2.1.1"

--===============6661545699625743645==--

