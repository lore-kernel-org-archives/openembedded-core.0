Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B9DC05027
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:12 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.8487.1698848704281599911
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=L+wGWJP5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MfLVioBE;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.33, mailfrom: 0101018b8b460e96-c2b9c796-da7a-459c-9bb9-a811a8fbaf8a-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GeSWNhQjQtMWzK/AGU+DDiYMHPlvaduWGRG2yyEpZkU=;
	b=L+wGWJP5xImiybYDaCbzMo2i+mufTCdfiTzKm2ZQvxb0pTNAJsAA9GkyPwARhhcm
	Vlu0wC/25167TN05+4etN6iSzfY4bJ/1UAwp+Plx/a3ef1XOiIU7mEEH8IyljdkZUTG
	scenegroIVNigGdIVqzAmUftAaOrnPdEH05TaAAY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GeSWNhQjQtMWzK/AGU+DDiYMHPlvaduWGRG2yyEpZkU=;
	b=MfLVioBENNUP5fjAmbkwmIUQrEkXPhO0R1mm9LoNZps/vquVFENavlKqGgOYhnJg
	O5L2FhU+fIQ2jiT5FzNJgUV8NRaTqQSlQix28YAFfrZY6zBAR6lcM6TGYYWlC7/cdDk
	Nn6I0Nvd5ylEmL1Bb5ztI7Kp7YCKekU8Yc0jAOGs=
Content-Type: multipart/mixed; boundary="===============2991841786162814292=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] enchant2: upgrading to 2.6.2 SUCCEEDED
Message-ID: <0101018b8b460e96-c2b9c796-da7a-459c-9bb9-a811a8fbaf8a-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190022

--===============2991841786162814292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *enchant2* to *2.6.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-enchant2-upgrade-2.6.1-2.6.2.patch
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
From 9a4170230288912dd69d14ced369e5d01eb27ee7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 14:05:34 +0000
Subject: [PATCH] enchant2: upgrade 2.6.1 -> 2.6.2

---
 .../enchant/{enchant2_2.6.1.bb => enchant2_2.6.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.6.1.bb => enchant2_2.6.2.bb} (92%)

diff --git a/meta/recipes-support/enchant/enchant2_2.6.1.bb b/meta/recipes-support/enchant/enchant2_2.6.2.bb
similarity index 92%
rename from meta/recipes-support/enchant/enchant2_2.6.1.bb
rename to meta/recipes-support/enchant/enchant2_2.6.2.bb
index a3510a8705..38d3245d20 100644
--- a/meta/recipes-support/enchant/enchant2_2.6.1.bb
+++ b/meta/recipes-support/enchant/enchant2_2.6.2.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "f24e12469137ae1d03140bb9032a47a5947c36f4d1e2f12b929061005eb15279"
+SRC_URI[sha256sum] = "6686a728e56e760f8dee09a22f0fb53b46ee9dbe7d64cf9e5bb35a658bff7e1d"
 
 GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.39.2


--===============2991841786162814292==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-enchant2-upgrade-2.6.1-2.6.2.patch"

RnJvbSA5YTQxNzAyMzAyODg5MTJkZDY5ZDE0Y2VkMzY5ZTVkMDFlYjI3ZWU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxNDowNTozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVu
Y2hhbnQyOiB1cGdyYWRlIDIuNi4xIC0+IDIuNi4yCgotLS0KIC4uLi9lbmNoYW50L3tlbmNoYW50
Ml8yLjYuMS5iYiA9PiBlbmNoYW50Ml8yLjYuMi5iYn0gICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2VuY2hhbnQve2VuY2hhbnQyXzIuNi4xLmJiID0+IGVuY2hhbnQyXzIuNi4y
LmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2VuY2hhbnQvZW5j
aGFudDJfMi42LjEuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQyXzIu
Ni4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2VuY2hhbnQvZW5jaGFudDJfMi42LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2VuY2hhbnQvZW5jaGFudDJfMi42LjIuYmIKaW5kZXggYTM1MTBhODcwNS4uMzhkMzI0NWQy
MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFudC9lbmNoYW50Ml8yLjYu
MS5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuNi4yLmJi
CkBAIC0xMiw3ICsxMiw3IEBAIERFUEVORFMgPSAiZ2xpYi0yLjAgZ3JvZmYtbmF0aXZlIgogaW5o
ZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnIGdpdGh1Yi1yZWxlYXNlcwogCiBTUkNfVVJJID0gIiR7
R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQVn0vZW5jaGFudC0ke1BWfS50YXIuZ3oiCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZjI0ZTEyNDY5MTM3YWUxZDAzMTQwYmI5MDMyYTQ3YTU5NDdj
MzZmNGQxZTJmMTJiOTI5MDYxMDA1ZWIxNTI3OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2Njg2
YTcyOGU1NmU3NjBmOGRlZTA5YTIyZjBmYjUzYjQ2ZWU5ZGJlN2Q2NGNmOWU1YmIzNWE2NThiZmY3
ZTFkIgogCiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL0FiaVdvcmQvZW5j
aGFudC9yZWxlYXNlcyIKIAotLSAKMi4zOS4yCgo=

--===============2991841786162814292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/enchant2/enchant2-dbg: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-64-poky-linux/enchant2/enchant2-dbg: PV changed from "2.6.1" to "2.6.2"
packages/core2-64-poky-linux/enchant2/enchant2-dbg: FILELIST: removed "/usr/lib/.debug/libenchant-2.so.2.6.1", added "/usr/lib/.debug/libenchant-2.so.2.6.2"
packages/core2-64-poky-linux/enchant2/enchant2-dev: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-64-poky-linux/enchant2/enchant2-dev: PV changed from "2.6.1" to "2.6.2"
packages/core2-64-poky-linux/enchant2/enchant2-doc: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-64-poky-linux/enchant2/enchant2-doc: PV changed from "2.6.1" to "2.6.2"
packages/core2-64-poky-linux/enchant2/enchant2-doc: PKGSIZE changed from 21054 to 21756 (+3%)
packages/core2-64-poky-linux/enchant2/enchant2-locale: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-64-poky-linux/enchant2/enchant2-locale: PV changed from "2.6.1" to "2.6.2"
packages/core2-64-poky-linux/enchant2/enchant2-src: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-64-poky-linux/enchant2/enchant2-src: PV changed from "2.6.1" to "2.6.2"
packages/core2-64-poky-linux/enchant2/enchant2-staticdev: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-64-poky-linux/enchant2/enchant2-staticdev: PV changed from "2.6.1" to "2.6.2"
packages/core2-64-poky-linux/enchant2/enchant2: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-64-poky-linux/enchant2/enchant2: PV changed from "2.6.1" to "2.6.2"
packages/core2-64-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.6.1", added "/usr/lib/libenchant-2.so.2.6.2"
packages/core2-64-poky-linux/enchant2: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-64-poky-linux/enchant2: PV changed from "2.6.1" to "2.6.2"
packages/core2-64-poky-linux/enchant2: SRC_URI changed from "https://github.com/AbiWord/enchant/releases/download/v2.6.1/enchant-2.6.1.tar.gz" to "https://github.com/AbiWord/enchant/releases/download/v2.6.2/enchant-2.6.2.tar.gz"
Changes to packages/core2-64-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.6.1 to libenchant-2.so.2.6.2
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.6.1 to libenchant-2.so.2.6.2
  /usr/lib/libenchant-2.so.2.6.1 moved to /usr/lib/libenchant-2.so.2.6.2

--===============2991841786162814292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.6.1", added "/usr/lib/libenchant-2.so.2.6.2"
Changes to packages/core2-64-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.6.1 to libenchant-2.so.2.6.2
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.6.1 to libenchant-2.so.2.6.2
  /usr/lib/libenchant-2.so.2.6.1 moved to /usr/lib/libenchant-2.so.2.6.2

--===============2991841786162814292==--

