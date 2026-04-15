Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8DEF4382F
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:56 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19813.1776261873951630950
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BNd9ofBX;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=KgNKQ2G5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019d91758e65-ae7c9410-9338-4be0-948a-4cc4b95c1dfa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261893;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uhcrgRp7F0puv2Tz0y4daVwnLu1NU+QH63xn7AEi4mA=;
	b=BNd9ofBXIV2mJMtlrZclHZzlPdPF01J6NzFs9gE9+MPVKi/s9vooRLrTzRp6pRfX
	ot5LJocTjD08qybvog58lLJJBXgX7py3kPk/adMxwTM7iSCjlGj0BqYob+nXY9/V6zL
	k4kB1joPJUbqiQ0bYqhy9yKUQ2OWtWYM+BliN+TE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261893;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uhcrgRp7F0puv2Tz0y4daVwnLu1NU+QH63xn7AEi4mA=;
	b=KgNKQ2G53XSQNnvhfN8zMDKUwDszPKu+g9Pv1QAO8plUhV65U56MkzdRmcT9Z1Vx
	tYhe5uY5N4U+APCHDfXKIskoNTTQJT9Tu6lzNiotNt6kWDZF8jNVdx432cfIdXr27fk
	f0XZbbPATkgtzrHauhYkTCAUm2qSGwjbW9HYUnXo=
Content-Type: multipart/mixed; boundary="===============0264248377162716750=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dos2unix: upgrading to 7.5.5 SUCCEEDED
Message-ID: <0101019d91758e65-ae7c9410-9338-4be0-948a-4cc4b95c1dfa-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235296

--===============0264248377162716750==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dos2unix* to *7.5.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dos2unix-upgrade-7.5.4-7.5.5.patch
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
From 70648ae17875d524d618b34e6e2d2624b8eabd2a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 13:02:36 +0000
Subject: [PATCH] dos2unix: upgrade 7.5.4 -> 7.5.5

---
 .../dos2unix/{dos2unix_7.5.4.bb => dos2unix_7.5.5.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/dos2unix/{dos2unix_7.5.4.bb => dos2unix_7.5.5.bb} (95%)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.5.4.bb b/meta/recipes-support/dos2unix/dos2unix_7.5.5.bb
similarity index 95%
rename from meta/recipes-support/dos2unix/dos2unix_7.5.4.bb
rename to meta/recipes-support/dos2unix/dos2unix_7.5.5.bb
index 87d51574cc..aa078ed200 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.5.4.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.5.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af1174fd3d1a254eec3a4a1d1da170a9"
 SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV = "dd37537e5fe03ac123aca9a9c944ef87fb998dcd"
+SRCREV = "54524999eece4e9ad0dab580c79b02855fc85028"
 
 S = "${UNPACKDIR}/${BP}/dos2unix"
 
-- 
2.47.1


--===============0264248377162716750==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: FILELIST: directory renamed /usr/share/doc/dos2unix-7.5.4 -> /usr/share/doc/dos2unix-7.5.5

--===============0264248377162716750==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dos2unix-upgrade-7.5.4-7.5.5.patch"

RnJvbSA3MDY0OGFlMTc4NzVkNTI0ZDYxOGIzNGU2ZTJkMjYyNGI4ZWFiZDJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMTM6MDI6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
b3MydW5peDogdXBncmFkZSA3LjUuNCAtPiA3LjUuNQoKLS0tCiAuLi4vZG9zMnVuaXgve2RvczJ1
bml4XzcuNS40LmJiID0+IGRvczJ1bml4XzcuNS41LmJifSAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kb3MydW5peC97ZG9zMnVuaXhfNy41LjQuYmIgPT4gZG9zMnVuaXhfNy41
LjUuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZG9zMnVuaXgv
ZG9zMnVuaXhfNy41LjQuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kb3MydW5peC9kb3MydW5p
eF83LjUuNS5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9kb3MydW5peC9kb3MydW5peF83LjUuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvZG9zMnVuaXgvZG9zMnVuaXhfNy41LjUuYmIKaW5kZXggODdkNTE1NzRjYy4uYWEw
NzhlZDIwMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZG9zMnVuaXgvZG9zMnVu
aXhfNy41LjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZG9zMnVuaXgvZG9zMnVuaXhf
Ny41LjUuYmIKQEAgLTExLDcgKzExLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09Q
WUlORy50eHQ7bWQ1PWFmMTE3NGZkM2QxYTI1NGVlYzNhNGExZDFkYTE3MGE5IgogU1JDX1VSSSA9
ICJnaXQ6Ly9naXQuY29kZS5zZi5uZXQvcC9kb3MydW5peC9kb3MydW5peDticmFuY2g9bWFzdGVy
O3Byb3RvY29sPWh0dHBzIgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiZG9zMnVuaXgt
KD9QPHB2ZXI+KFxkKyhcLlxkKykrKSkiCiAKLVNSQ1JFViA9ICJkZDM3NTM3ZTVmZTAzYWMxMjNh
Y2E5YTljOTQ0ZWY4N2ZiOTk4ZGNkIgorU1JDUkVWID0gIjU0NTI0OTk5ZWVjZTRlOWFkMGRhYjU4
MGM3OWIwMjg1NWZjODUwMjgiCiAKIFMgPSAiJHtVTlBBQ0tESVJ9LyR7QlB9L2RvczJ1bml4Igog
Ci0tIAoyLjQ3LjEKCg==

--===============0264248377162716750==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dbg: PKGV changed from 7.5.4 [default] to 7.5.5 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dbg: PV changed from "7.5.4" to "7.5.5"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dbg: PKGSIZE changed from 273592 to 275776 (+1%)
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dev: PKGV changed from 7.5.4 [default] to 7.5.5 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dev: PV changed from "7.5.4" to "7.5.5"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: PKGV changed from 7.5.4 [default] to 7.5.5 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: FILELIST: directory renamed /usr/share/doc/dos2unix-7.5.4 -> /usr/share/doc/dos2unix-7.5.5
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: PV changed from "7.5.4" to "7.5.5"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: PKGSIZE changed from 206698 to 208609 (+1%)
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-locale: PKGV changed from 7.5.4 [default] to 7.5.5 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-locale: PV changed from "7.5.4" to "7.5.5"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-src: PKGV changed from 7.5.4 [default] to 7.5.5 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-src: FILELIST: directory renamed /usr/src/debug/dos2unix/7.5.4 -> /usr/src/debug/dos2unix/7.5.5
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-src: PV changed from "7.5.4" to "7.5.5"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-src: PKGSIZE changed from 202072 to 201918 (-0%)
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-staticdev: PKGV changed from 7.5.4 [default] to 7.5.5 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-staticdev: PV changed from "7.5.4" to "7.5.5"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix: PKGV changed from 7.5.4 [default] to 7.5.5 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix: PV changed from "7.5.4" to "7.5.5"
packages/x86-64-v3-poky-linux/dos2unix: PKGV changed from 7.5.4 [default] to 7.5.5 [default]
packages/x86-64-v3-poky-linux/dos2unix: PV changed from "7.5.4" to "7.5.5"

--===============0264248377162716750==--

