Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F0D6C3DA46
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:43 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.42225.1717263219264008729
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=FP+7csmq;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=UMUbJpPq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018fd4dd3a1f-964b2422-0b85-41a8-969e-8bde72126e19-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YJ1CXerPlaC5F5yKseu3XfliPJZVnKHa0//YgZhZXN4=;
	b=FP+7csmqPwzaqXQccrinZD1cGYqcOlj6Q28IS/wjXll6aq8GE/sRpDhS8CRZ0VxK
	OiLRec5eby4mOq0W82Q1avNxmgjwZvUH/zWYpiNeQOrOXMgyzJtUiSEykWM5bAfK1mZ
	L30ZADFa1gv2AJclRgmTrDMmzsqBXlHGVepXWYvI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YJ1CXerPlaC5F5yKseu3XfliPJZVnKHa0//YgZhZXN4=;
	b=UMUbJpPq74MdtQ1+YaKsi+faKL41mCWh/tFcr+QGHbwbkbgIsBiW1NSc7jwz0NUV
	hQNuFPrRQWd9oROMgnSmRb3SkFogQDlzFNVEvIbM7PFaUPEJfRMJJ4FNkVlkE0yfBSy
	NhXOoFXXZOx7JItGIW+i1UtmDzZ5Dr8jGRIPcYzM=
Content-Type: multipart/mixed; boundary="===============8264083423786939237=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] enchant2: upgrading to 2.8.0 SUCCEEDED
Message-ID: <0101018fd4dd3a1f-964b2422-0b85-41a8-969e-8bde72126e19-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200189

--===============8264083423786939237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *enchant2* to *2.8.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-enchant2-upgrade-2.7.3-2.8.0.patch
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
From 7db99844f5b6e921b804411e4991a1b3c31d5dd5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jun 2024 16:49:01 +0000
Subject: [PATCH] enchant2: upgrade 2.7.3 -> 2.8.0

---
 .../enchant/{enchant2_2.7.3.bb => enchant2_2.8.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.7.3.bb => enchant2_2.8.0.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.7.3.bb b/meta/recipes-support/enchant/enchant2_2.8.0.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.7.3.bb
rename to meta/recipes-support/enchant/enchant2_2.8.0.bb
index d5073b6f31..5f6f6c86f2 100644
--- a/meta/recipes-support/enchant/enchant2_2.7.3.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.0.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "fe6ad4cbe8c71b9384ffdef962be52d4d2bd5ebfb6351435bb390543d4f78b1e"
+SRC_URI[sha256sum] = "c57add422237b8a7eed116a9a88d8be4f7b9281778fa36f03e1f2c051ecb0372"
 
 GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.44.0


--===============8264083423786939237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/enchant2/enchant2-dbg: PV changed from "2.7.3" to "2.8.0"
packages/core2-64-poky-linux/enchant2/enchant2-dbg: PKGV changed from 2.7.3 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/enchant2/enchant2-dbg: FILELIST: removed "/usr/lib/.debug/libenchant-2.so.2.7.3", added "/usr/lib/.debug/libenchant-2.so.2.8.0"
packages/core2-64-poky-linux/enchant2/enchant2-dbg: PKGSIZE changed from 326576 to 363128 (+11%)
packages/core2-64-poky-linux/enchant2/enchant2-dev: PV changed from "2.7.3" to "2.8.0"
packages/core2-64-poky-linux/enchant2/enchant2-dev: PKGV changed from 2.7.3 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/enchant2/enchant2-dev: PKGSIZE changed from 20827 to 20735 (-0%)
packages/core2-64-poky-linux/enchant2/enchant2-doc: PV changed from "2.7.3" to "2.8.0"
packages/core2-64-poky-linux/enchant2/enchant2-doc: PKGV changed from 2.7.3 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/enchant2/enchant2-doc: PKGSIZE changed from 22362 to 23346 (+4%)
packages/core2-64-poky-linux/enchant2/enchant2-locale: PV changed from "2.7.3" to "2.8.0"
packages/core2-64-poky-linux/enchant2/enchant2-locale: PKGV changed from 2.7.3 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/enchant2/enchant2-src: PV changed from "2.7.3" to "2.8.0"
packages/core2-64-poky-linux/enchant2/enchant2-src: PKGV changed from 2.7.3 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/enchant2/enchant2-src: FILELIST: directory renamed /usr/src/debug/enchant2/2.7.3/src -> /usr/src/debug/enchant2/2.8.0/src, directory renamed /usr/src/debug/enchant2/2.7.3/providers -> /usr/src/debug/enchant2/2.8.0/providers, removed "/usr/src/debug/enchant2/2.7.3/lib/util.c /usr/src/debug/enchant2/2.7.3/lib/util.vala /usr/src/debug/enchant2/2.7.3/lib/dict.vala /usr/src/debug/enchant2/2.7.3/lib/api.vala /usr/src/debug/enchant2/2.7.3/lib/pwl.vala /usr/src/debug/enchant2/2.7.3/lib/session.c /usr/src/debug/enchant2/2.7.3/lib/session.vala /usr/src/debug/enchant2/2.7.3/lib/broker.c /usr/src/debug/enchant2/2.7.3/lib/api.c /usr/src/debug/enchant2/2.7.3/lib/dict.c /usr/src/debug/enchant2/2.7.3/lib/broker.vala /usr/src/debug/enchant2/2.7.3/lib/provider.vala /usr/src/debug/enchant2/2.7.3/lib/enchant-provider.h /usr/src/debug/enchant2/2.7.3/lib/provider.c /usr/src/debug/enchant2/2.7.3/lib/enchant.h /usr/src/debug/enchant2/2.7.3/lib/gnu.vapi /usr/src/debug/enchant2/2.
 7.3/lib/pwl.c", added "/usr/src/debug/enchant2/2.8.0/lib/util.c /usr/src/debug/enchant2/2.8.0/lib/composite.c /usr/src/debug/enchant2/2.8.0/lib/api.vala /usr/src/debug/enchant2/2.8.0/lib/pwl.vala /usr/src/debug/enchant2/2.8.0/lib/session.vala /usr/src/debug/enchant2/2.8.0/lib/broker.vala /usr/src/debug/enchant2/2.8.0/lib/provider.c /usr/src/debug/enchant2/2.8.0/lib/gnu.vapi /usr/src/debug/enchant2/2.8.0/lib/session.c /usr/src/debug/enchant2/2.8.0/lib/composite.vala /usr/src/debug/enchant2/2.8.0/lib/broker.c /usr/src/debug/enchant2/2.8.0/lib/api.c /usr/src/debug/enchant2/2.8.0/lib/provider.vala /usr/src/debug/enchant2/2.8.0/lib/enchant.h /usr/src/debug/enchant2/2.8.0/lib/pwl.c /usr/src/debug/enchant2/2.8.0/lib/dict.vala /usr/src/debug/enchant2/2.8.0/lib/util.vala /usr/src/debug/enchant2/2.8.0/lib/dict.c /usr/src/debug/enchant2/2.8.0/lib/enchant-provider.h"
packages/core2-64-poky-linux/enchant2/enchant2-src: PKGSIZE changed from 352394 to 398047 (+13%)
packages/core2-64-poky-linux/enchant2/enchant2-staticdev: PV changed from "2.7.3" to "2.8.0"
packages/core2-64-poky-linux/enchant2/enchant2-staticdev: PKGV changed from 2.7.3 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/enchant2/enchant2: PV changed from "2.7.3" to "2.8.0"
packages/core2-64-poky-linux/enchant2/enchant2: PKGV changed from 2.7.3 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.7.3", added "/usr/lib/libenchant-2.so.2.8.0"
packages/core2-64-poky-linux/enchant2/enchant2: PKGSIZE changed from 119234 to 123330 (+3%)
packages/core2-64-poky-linux/enchant2: PV changed from "2.7.3" to "2.8.0"
packages/core2-64-poky-linux/enchant2: PKGV changed from 2.7.3 [default] to 2.8.0 [default]
packages/core2-64-poky-linux/enchant2: SRC_URI changed from "https://github.com/AbiWord/enchant/releases/download/v2.7.3/enchant-2.7.3.tar.gz" to "https://github.com/AbiWord/enchant/releases/download/v2.8.0/enchant-2.8.0.tar.gz"
Changes to packages/core2-64-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.7.3 to libenchant-2.so.2.8.0
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.7.3 to libenchant-2.so.2.8.0
  /usr/lib/libenchant-2.so.2.7.3 moved to /usr/lib/libenchant-2.so.2.8.0

--===============8264083423786939237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/enchant2/enchant2-dbg: PKGSIZE changed from 326576 to 363128 (+11%)
packages/core2-64-poky-linux/enchant2/enchant2-src: PKGSIZE changed from 352394 to 398047 (+13%)
packages/core2-64-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.7.3", added "/usr/lib/libenchant-2.so.2.8.0"
Changes to packages/core2-64-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.7.3 to libenchant-2.so.2.8.0
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.7.3 to libenchant-2.so.2.8.0
  /usr/lib/libenchant-2.so.2.7.3 moved to /usr/lib/libenchant-2.so.2.8.0

--===============8264083423786939237==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-enchant2-upgrade-2.7.3-2.8.0.patch"

RnJvbSA3ZGI5OTg0NGY1YjZlOTIxYjgwNDQxMWU0OTkxYTFiM2MzMWQ1ZGQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdW4gMjAyNCAxNjo0OTowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVu
Y2hhbnQyOiB1cGdyYWRlIDIuNy4zIC0+IDIuOC4wCgotLS0KIC4uLi9lbmNoYW50L3tlbmNoYW50
Ml8yLjcuMy5iYiA9PiBlbmNoYW50Ml8yLjguMC5iYn0gICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2VuY2hhbnQve2VuY2hhbnQyXzIuNy4zLmJiID0+IGVuY2hhbnQyXzIuOC4w
LmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2VuY2hhbnQvZW5j
aGFudDJfMi43LjMuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQyXzIu
OC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2VuY2hhbnQvZW5jaGFudDJfMi43LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2VuY2hhbnQvZW5jaGFudDJfMi44LjAuYmIKaW5kZXggZDUwNzNiNmYzMS4uNWY2ZjZjODZm
MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFudC9lbmNoYW50Ml8yLjcu
My5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuOC4wLmJi
CkBAIC0xMiw3ICsxMiw3IEBAIERFUEVORFMgPSAiZ2xpYi0yLjAgZ3JvZmYtbmF0aXZlIgogaW5o
ZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnIGdpdGh1Yi1yZWxlYXNlcwogCiBTUkNfVVJJID0gIiR7
R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQVn0vZW5jaGFudC0ke1BWfS50YXIuZ3oiCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZmU2YWQ0Y2JlOGM3MWI5Mzg0ZmZkZWY5NjJiZTUyZDRkMmJk
NWViZmI2MzUxNDM1YmIzOTA1NDNkNGY3OGIxZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjNTdh
ZGQ0MjIyMzdiOGE3ZWVkMTE2YTlhODhkOGJlNGY3YjkyODE3NzhmYTM2ZjAzZTFmMmMwNTFlY2Iw
MzcyIgogCiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL0FiaVdvcmQvZW5j
aGFudC9yZWxlYXNlcyIKIAotLSAKMi40NC4wCgo=

--===============8264083423786939237==--

