Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B02C678DA
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:56 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.27762.1748786121366811216
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=FDItGVA5;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=k9aj+4GT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101972bc70389-14f9b2c6-3639-4ea8-826b-ce334aefb908-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786152;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5WEHpGt4Y2VyCHfOk3UXYvciBnmVvwz/vDRf8K1GZ3U=;
	b=FDItGVA509u6VJ/KD1AGfwQNoslqtnRIrhjJmKEmRvdH/nbQxp08RsY07vtXEM5n
	3jEhUKbhH2YYYzopA35l6hnRQ/W7D3eCUcWgJhJr2DlBamMtFUG/YoUw4XaSF2qS25g
	aviTepeRI5wu5SJC5bYSZ6b1n+3n5gd0gzWqSg9Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786152;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5WEHpGt4Y2VyCHfOk3UXYvciBnmVvwz/vDRf8K1GZ3U=;
	b=k9aj+4GTOJ01Kv2kn7HAgvIw9j5DvlXGlQ1+gMj5c2v0YuE2gSd2r6KlAPe3JXn6
	xr2VdZHRsg2KPplTQXbux/GgKtwuyDT3CpKDr5QVKSFqt3XVB86mydpgo43aboiEzqG
	N0MnFTHWVG6eqkD/wQHRTfYLqpjhxslCjjuwKVOw=
Content-Type: multipart/mixed; boundary="===============4621403851463767773=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] enchant2: upgrading to 2.8.6 SUCCEEDED
Message-ID: <010101972bc70389-14f9b2c6-3639-4ea8-826b-ce334aefb908-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217664

--===============4621403851463767773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *enchant2* to *2.8.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-enchant2-upgrade-2.8.4-2.8.6.patch
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
From 51802e4035ad143eba87a9632dc4e2eb4919207a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 13:35:41 +0000
Subject: [PATCH] enchant2: upgrade 2.8.4 -> 2.8.6

---
 .../enchant/{enchant2_2.8.4.bb => enchant2_2.8.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.8.4.bb => enchant2_2.8.6.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.8.4.bb b/meta/recipes-support/enchant/enchant2_2.8.6.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.8.4.bb
rename to meta/recipes-support/enchant/enchant2_2.8.6.bb
index a5479a0e7d..66de313d9d 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.4.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.6.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "e28f98208df5f99320d6a05cd49f83420bf71e69052debe3b343c9bb15c833ed"
+SRC_URI[sha256sum] = "c4cd0889d8aff8248fc3913de5a83907013962f0e1895030a3836468cd40af5b"
 
 GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 
-- 
2.47.1


--===============4621403851463767773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/enchant2/enchant2-dbg: PV changed from "2.8.4" to "2.8.6"
packages/core2-64-poky-linux/enchant2/enchant2-dbg: PKGSIZE changed from 450232 to 449976 (-0%)
packages/core2-64-poky-linux/enchant2/enchant2-dbg: FILELIST: removed "/usr/lib/.debug/libenchant-2.so.2.8.4", added "/usr/lib/.debug/libenchant-2.so.2.8.6"
packages/core2-64-poky-linux/enchant2/enchant2-dbg: PKGV changed from 2.8.4 [default] to 2.8.6 [default]
packages/core2-64-poky-linux/enchant2/enchant2-dev: PV changed from "2.8.4" to "2.8.6"
packages/core2-64-poky-linux/enchant2/enchant2-dev: PKGSIZE changed from 20735 to 20635 (-0%)
packages/core2-64-poky-linux/enchant2/enchant2-dev: PKGV changed from 2.8.4 [default] to 2.8.6 [default]
packages/core2-64-poky-linux/enchant2/enchant2-doc: PV changed from "2.8.4" to "2.8.6"
packages/core2-64-poky-linux/enchant2/enchant2-doc: PKGV changed from 2.8.4 [default] to 2.8.6 [default]
packages/core2-64-poky-linux/enchant2/enchant2-locale: PV changed from "2.8.4" to "2.8.6"
packages/core2-64-poky-linux/enchant2/enchant2-locale: PKGV changed from 2.8.4 [default] to 2.8.6 [default]
packages/core2-64-poky-linux/enchant2/enchant2-src: PV changed from "2.8.4" to "2.8.6"
packages/core2-64-poky-linux/enchant2/enchant2-src: PKGSIZE changed from 469057 to 469190 (+0%)
packages/core2-64-poky-linux/enchant2/enchant2-src: PKGV changed from 2.8.4 [default] to 2.8.6 [default]
packages/core2-64-poky-linux/enchant2/enchant2-staticdev: PV changed from "2.8.4" to "2.8.6"
packages/core2-64-poky-linux/enchant2/enchant2-staticdev: PKGV changed from 2.8.4 [default] to 2.8.6 [default]
packages/core2-64-poky-linux/enchant2/enchant2: PV changed from "2.8.4" to "2.8.6"
packages/core2-64-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.8.4", added "/usr/lib/libenchant-2.so.2.8.6"
packages/core2-64-poky-linux/enchant2/enchant2: PKGV changed from 2.8.4 [default] to 2.8.6 [default]
packages/core2-64-poky-linux/enchant2: PV changed from "2.8.4" to "2.8.6"
packages/core2-64-poky-linux/enchant2: SRC_URI changed from "https://github.com/rrthomas/enchant/releases/download/v2.8.4/enchant-2.8.4.tar.gz" to "https://github.com/rrthomas/enchant/releases/download/v2.8.6/enchant-2.8.6.tar.gz"
packages/core2-64-poky-linux/enchant2: PKGV changed from 2.8.4 [default] to 2.8.6 [default]
Changes to packages/core2-64-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.8.4 to libenchant-2.so.2.8.6
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.8.4 to libenchant-2.so.2.8.6
  /usr/lib/libenchant-2.so.2.8.4 moved to /usr/lib/libenchant-2.so.2.8.6

--===============4621403851463767773==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-enchant2-upgrade-2.8.4-2.8.6.patch"

RnJvbSA1MTgwMmU0MDM1YWQxNDNlYmE4N2E5NjMyZGM0ZTJlYjQ5MTkyMDdhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAxMzozNTo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVu
Y2hhbnQyOiB1cGdyYWRlIDIuOC40IC0+IDIuOC42CgotLS0KIC4uLi9lbmNoYW50L3tlbmNoYW50
Ml8yLjguNC5iYiA9PiBlbmNoYW50Ml8yLjguNi5iYn0gICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2VuY2hhbnQve2VuY2hhbnQyXzIuOC40LmJiID0+IGVuY2hhbnQyXzIuOC42
LmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2VuY2hhbnQvZW5j
aGFudDJfMi44LjQuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQyXzIu
OC42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2VuY2hhbnQvZW5jaGFudDJfMi44LjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2VuY2hhbnQvZW5jaGFudDJfMi44LjYuYmIKaW5kZXggYTU0NzlhMGU3ZC4uNjZkZTMxM2Q5
ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFudC9lbmNoYW50Ml8yLjgu
NC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuOC42LmJi
CkBAIC0xMiw3ICsxMiw3IEBAIERFUEVORFMgPSAiZ2xpYi0yLjAgZ3JvZmYtbmF0aXZlIgogaW5o
ZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnIGdpdGh1Yi1yZWxlYXNlcwogCiBTUkNfVVJJID0gIiR7
R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQVn0vZW5jaGFudC0ke1BWfS50YXIuZ3oiCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZTI4Zjk4MjA4ZGY1Zjk5MzIwZDZhMDVjZDQ5ZjgzNDIwYmY3
MWU2OTA1MmRlYmUzYjM0M2M5YmIxNWM4MzNlZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjNGNk
MDg4OWQ4YWZmODI0OGZjMzkxM2RlNWE4MzkwNzAxMzk2MmYwZTE4OTUwMzBhMzgzNjQ2OGNkNDBh
ZjViIgogCiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL3JydGhvbWFzL2Vu
Y2hhbnQvcmVsZWFzZXMiCiAKLS0gCjIuNDcuMQoK

--===============4621403851463767773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.8.4", added "/usr/lib/libenchant-2.so.2.8.6"
Changes to packages/core2-64-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.8.4 to libenchant-2.so.2.8.6
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.8.4 to libenchant-2.so.2.8.6
  /usr/lib/libenchant-2.so.2.8.4 moved to /usr/lib/libenchant-2.so.2.8.6

--===============4621403851463767773==--

