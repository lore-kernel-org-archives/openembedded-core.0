Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D019CD1288
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:11:14 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.44910.1711995072292828514
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=T8KildFX;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=fzRJlsVO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018e9adbabe5-7d145630-d4c0-4011-9cc3-327c02172dfc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711995071;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vI3tECMA3PhZ7nEnFSxXRnncnnsSOI4fM8QxXqls64M=;
	b=T8KildFXB9Yy2K0Be3oOGSaOPA2/9pGG5LGVQ52RbFS0coOGy7Va4B3dXF4iKYdY
	9RQ1ZcYskUi2+z4943PGBAIofdReLE5m8wRvcyhbJUNVkgwtIcHp3aajFFJNPiYEAez
	6OwW0p9ylzq0FDrr5eda/1ed+XBlyGFoOaFAHL3U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711995071;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vI3tECMA3PhZ7nEnFSxXRnncnnsSOI4fM8QxXqls64M=;
	b=fzRJlsVOhXFSDT1KBtqfBk28FX4FR/YXk8Y76wtCsXHoTXqFNPx3hd6TsNimqwJr
	gwpFgLptsO1l1cxkNM85Skgkn6uQ8FhaE8KCKkII4gcNsYmNh5t4nnxUTHFDb9FBkbd
	Fmx44sVp4PAR+rMjai+Q3iG1TxquCKQKojUWcYbw=
Content-Type: multipart/mixed; boundary="===============1523858007827112499=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] enchant2: upgrading to 2.6.8 SUCCEEDED
Message-ID: <0101018e9adbabe5-7d145630-d4c0-4011-9cc3-327c02172dfc-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:11:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197846

--===============1523858007827112499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *enchant2* to *2.6.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-enchant2-upgrade-2.6.7-2.6.8.patch
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
From 2b36f0add67ed93f2d04d97b531112902762b3cd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 16:54:28 +0000
Subject: [PATCH] enchant2: upgrade 2.6.7 -> 2.6.8

---
 .../enchant/{enchant2_2.6.7.bb => enchant2_2.6.8.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.6.7.bb => enchant2_2.6.8.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.6.7.bb b/meta/recipes-support/enchant/enchant2_2.6.8.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.6.7.bb
rename to meta/recipes-support/enchant/enchant2_2.6.8.bb
index b31bdc422b..e2bbe2eabf 100644
--- a/meta/recipes-support/enchant/enchant2_2.6.7.bb
+++ b/meta/recipes-support/enchant/enchant2_2.6.8.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "a1c2e5b59acca000bbfb24810af4a1165733d407f2154786588e076c8cd57bfc"
+SRC_URI[sha256sum] = "f565923062c77f3d58846f0558d21e6d07ca4a488c58812dfdefb35202fac7ae"
 
 GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.42.0


--===============1523858007827112499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.6.7", added "/usr/lib/libenchant-2.so.2.6.8"
Changes to packages/core2-64-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.6.7 to libenchant-2.so.2.6.8
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.6.7 to libenchant-2.so.2.6.8
  /usr/lib/libenchant-2.so.2.6.7 moved to /usr/lib/libenchant-2.so.2.6.8

--===============1523858007827112499==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-enchant2-upgrade-2.6.7-2.6.8.patch"

RnJvbSAyYjM2ZjBhZGQ2N2VkOTNmMmQwNGQ5N2I1MzExMTI5MDI3NjJiM2NkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxNjo1NDoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVu
Y2hhbnQyOiB1cGdyYWRlIDIuNi43IC0+IDIuNi44CgotLS0KIC4uLi9lbmNoYW50L3tlbmNoYW50
Ml8yLjYuNy5iYiA9PiBlbmNoYW50Ml8yLjYuOC5iYn0gICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2VuY2hhbnQve2VuY2hhbnQyXzIuNi43LmJiID0+IGVuY2hhbnQyXzIuNi44
LmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2VuY2hhbnQvZW5j
aGFudDJfMi42LjcuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQyXzIu
Ni44LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2VuY2hhbnQvZW5jaGFudDJfMi42LjcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2VuY2hhbnQvZW5jaGFudDJfMi42LjguYmIKaW5kZXggYjMxYmRjNDIyYi4uZTJiYmUyZWFi
ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFudC9lbmNoYW50Ml8yLjYu
Ny5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuNi44LmJi
CkBAIC0xMiw3ICsxMiw3IEBAIERFUEVORFMgPSAiZ2xpYi0yLjAgZ3JvZmYtbmF0aXZlIgogaW5o
ZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnIGdpdGh1Yi1yZWxlYXNlcwogCiBTUkNfVVJJID0gIiR7
R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQVn0vZW5jaGFudC0ke1BWfS50YXIuZ3oiCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYTFjMmU1YjU5YWNjYTAwMGJiZmIyNDgxMGFmNGExMTY1NzMz
ZDQwN2YyMTU0Nzg2NTg4ZTA3NmM4Y2Q1N2JmYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmNTY1
OTIzMDYyYzc3ZjNkNTg4NDZmMDU1OGQyMWU2ZDA3Y2E0YTQ4OGM1ODgxMmRmZGVmYjM1MjAyZmFj
N2FlIgogCiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL0FiaVdvcmQvZW5j
aGFudC9yZWxlYXNlcyIKIAotLSAKMi40Mi4wCgo=

--===============1523858007827112499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/enchant2/enchant2-dbg: PV changed from "2.6.7" to "2.6.8"
packages/core2-64-poky-linux/enchant2/enchant2-dbg: PKGV changed from 2.6.7 [default] to 2.6.8 [default]
packages/core2-64-poky-linux/enchant2/enchant2-dbg: FILELIST: removed "/usr/lib/.debug/libenchant-2.so.2.6.7", added "/usr/lib/.debug/libenchant-2.so.2.6.8"
packages/core2-64-poky-linux/enchant2/enchant2-dev: PV changed from "2.6.7" to "2.6.8"
packages/core2-64-poky-linux/enchant2/enchant2-dev: PKGV changed from 2.6.7 [default] to 2.6.8 [default]
packages/core2-64-poky-linux/enchant2/enchant2-doc: PKGSIZE changed from 22056 to 22192 (+1%)
packages/core2-64-poky-linux/enchant2/enchant2-doc: PV changed from "2.6.7" to "2.6.8"
packages/core2-64-poky-linux/enchant2/enchant2-doc: PKGV changed from 2.6.7 [default] to 2.6.8 [default]
packages/core2-64-poky-linux/enchant2/enchant2-locale: PV changed from "2.6.7" to "2.6.8"
packages/core2-64-poky-linux/enchant2/enchant2-locale: PKGV changed from 2.6.7 [default] to 2.6.8 [default]
packages/core2-64-poky-linux/enchant2/enchant2-src: PKGSIZE changed from 168424 to 168421 (-0%)
packages/core2-64-poky-linux/enchant2/enchant2-src: PV changed from "2.6.7" to "2.6.8"
packages/core2-64-poky-linux/enchant2/enchant2-src: PKGV changed from 2.6.7 [default] to 2.6.8 [default]
packages/core2-64-poky-linux/enchant2/enchant2-staticdev: PV changed from "2.6.7" to "2.6.8"
packages/core2-64-poky-linux/enchant2/enchant2-staticdev: PKGV changed from 2.6.7 [default] to 2.6.8 [default]
packages/core2-64-poky-linux/enchant2/enchant2: PV changed from "2.6.7" to "2.6.8"
packages/core2-64-poky-linux/enchant2/enchant2: PKGV changed from 2.6.7 [default] to 2.6.8 [default]
packages/core2-64-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.6.7", added "/usr/lib/libenchant-2.so.2.6.8"
packages/core2-64-poky-linux/enchant2: SRC_URI changed from "https://github.com/AbiWord/enchant/releases/download/v2.6.7/enchant-2.6.7.tar.gz" to "https://github.com/AbiWord/enchant/releases/download/v2.6.8/enchant-2.6.8.tar.gz"
packages/core2-64-poky-linux/enchant2: PV changed from "2.6.7" to "2.6.8"
packages/core2-64-poky-linux/enchant2: PKGV changed from 2.6.7 [default] to 2.6.8 [default]
Changes to packages/core2-64-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.6.7 to libenchant-2.so.2.6.8
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.6.7 to libenchant-2.so.2.6.8
  /usr/lib/libenchant-2.so.2.6.7 moved to /usr/lib/libenchant-2.so.2.6.8

--===============1523858007827112499==--

