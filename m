Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42832C44501
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 06:34:30 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39123.1782887654334215667
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 23:34:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=jRXhg6BS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ANPlpZ1w;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019f1c62a0a9-30cf85ac-7fcb-4802-86ef-d7f6902be95c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782887653;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=83CSARjsrdWn8wtfObzFzt3HjNNAtX0egSOFDbf/L1s=;
	b=jRXhg6BSlAxnXwuOZ6Jg1hAYu/9ykxEZ+zdwZxBL6CDoeDYiG4QivyBRcTxa64AS
	jQRDPZEzaaoKNwpeWMQtueYDtM1KblhGmwn+0Ub29G0f2fniSFQtEyq5LTglUVtmacA
	0xz73R0e2ZRya1tznVnymGXl+LBjuKeH5yaeAmSE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782887653;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=83CSARjsrdWn8wtfObzFzt3HjNNAtX0egSOFDbf/L1s=;
	b=ANPlpZ1wOlqthPQwEkRXQ4rTKg3lYlHMpHAumLlhWr8SoA2t3zXJ5R5VaevDfZbV
	aUJJ9KkXXf+YvkegQ3nWcO58V2XE+CUa4gLkt+dWl2/N6ptmtfq3cMy14m4y+EoEGm/
	A2eNueftY9VWBmgJq+ZiYJ6fkHM8br/uIxYR3FXU=
Content-Type: multipart/mixed; boundary="===============7395931805098867052=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] enchant2: upgrading to 2.8.17 SUCCEEDED
Message-ID: <0101019f1c62a0a9-30cf85ac-7fcb-4802-86ef-d7f6902be95c-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jul 2026 06:34:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 06:34:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239940

--===============7395931805098867052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *enchant2* to *2.8.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-enchant2-upgrade-2.8.16-2.8.17.patch
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
From 86868357b2e2af75c5b1cd8720e9497ac568c213 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jul 2026 06:30:41 +0000
Subject: [PATCH] enchant2: upgrade 2.8.16 -> 2.8.17

---
 .../enchant/{enchant2_2.8.16.bb => enchant2_2.8.17.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.8.16.bb => enchant2_2.8.17.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.8.16.bb b/meta/recipes-support/enchant/enchant2_2.8.17.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.8.16.bb
rename to meta/recipes-support/enchant/enchant2_2.8.17.bb
index e2c6eed602..4ba6552963 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.16.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.17.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "d73162b5eff401a6397e1215e2b103bcef83f921c396c7f6b1394d2450d124e2"
+SRC_URI[sha256sum] = "ee40256e271d0bc1f212ecbc8b8d3da9066b33c9ca987d266759665eb0ca694d"
 
 GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 
-- 
2.47.1


--===============7395931805098867052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: FILELIST: removed "/usr/lib/.debug/libenchant-2.so.2.8.16", added "/usr/lib/.debug/libenchant-2.so.2.8.17"
packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: PKGV changed from 2.8.16 [default] to 2.8.17 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: PKGSIZE changed from 483528 to 483680 (+0%)
packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: PV changed from "2.8.16" to "2.8.17"
packages/x86-64-v3-poky-linux/enchant2/enchant2-dev: PKGV changed from 2.8.16 [default] to 2.8.17 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-dev: PV changed from "2.8.16" to "2.8.17"
packages/x86-64-v3-poky-linux/enchant2/enchant2-doc: PKGV changed from 2.8.16 [default] to 2.8.17 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-doc: PV changed from "2.8.16" to "2.8.17"
packages/x86-64-v3-poky-linux/enchant2/enchant2-locale: PKGV changed from 2.8.16 [default] to 2.8.17 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-locale: PV changed from "2.8.16" to "2.8.17"
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: FILELIST: directory renamed /usr/src/debug/enchant2/2.8.16/lib -> /usr/src/debug/enchant2/2.8.17/lib, directory renamed /usr/src/debug/enchant2/2.8.16/providers -> /usr/src/debug/enchant2/2.8.17/providers, directory renamed /usr/src/debug/enchant2/2.8.16/src -> /usr/src/debug/enchant2/2.8.17/src
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: PKGV changed from 2.8.16 [default] to 2.8.17 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: PKGSIZE changed from 506080 to 506253 (+0%)
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: PV changed from "2.8.16" to "2.8.17"
packages/x86-64-v3-poky-linux/enchant2/enchant2-staticdev: PKGV changed from 2.8.16 [default] to 2.8.17 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-staticdev: PV changed from "2.8.16" to "2.8.17"
packages/x86-64-v3-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.8.16", added "/usr/lib/libenchant-2.so.2.8.17"
packages/x86-64-v3-poky-linux/enchant2/enchant2: PKGV changed from 2.8.16 [default] to 2.8.17 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2: PV changed from "2.8.16" to "2.8.17"
packages/x86-64-v3-poky-linux/enchant2: SRC_URI changed from "https://github.com/rrthomas/enchant/releases/download/v2.8.16/enchant-2.8.16.tar.gz" to "https://github.com/rrthomas/enchant/releases/download/v2.8.17/enchant-2.8.17.tar.gz"
packages/x86-64-v3-poky-linux/enchant2: PKGV changed from 2.8.16 [default] to 2.8.17 [default]
packages/x86-64-v3-poky-linux/enchant2: PV changed from "2.8.16" to "2.8.17"
Changes to packages/x86-64-v3-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.8.16 to libenchant-2.so.2.8.17
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.8.16 to libenchant-2.so.2.8.17
  /usr/lib/libenchant-2.so.2.8.16 moved to /usr/lib/libenchant-2.so.2.8.17

--===============7395931805098867052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.8.16", added "/usr/lib/libenchant-2.so.2.8.17"
Changes to packages/x86-64-v3-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.8.16 to libenchant-2.so.2.8.17
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.8.16 to libenchant-2.so.2.8.17
  /usr/lib/libenchant-2.so.2.8.16 moved to /usr/lib/libenchant-2.so.2.8.17

--===============7395931805098867052==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-enchant2-upgrade-2.8.16-2.8.17.patch"

RnJvbSA4Njg2ODM1N2IyZTJhZjc1YzViMWNkODcyMGU5NDk3YWM1NjhjMjEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKdWwgMjAyNiAwNjozMDo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVu
Y2hhbnQyOiB1cGdyYWRlIDIuOC4xNiAtPiAyLjguMTcKCi0tLQogLi4uL2VuY2hhbnQve2VuY2hh
bnQyXzIuOC4xNi5iYiA9PiBlbmNoYW50Ml8yLjguMTcuYmJ9ICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZW5jaGFudC97ZW5jaGFudDJfMi44LjE2LmJiID0+IGVuY2hhbnQyXzIu
OC4xNy5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50
L2VuY2hhbnQyXzIuOC4xNi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2VuY2hhbnQvZW5jaGFu
dDJfMi44LjE3LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L2VuY2hhbnQvZW5jaGFudDJfMi44LjE2LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuOC4xNy5iYgppbmRleCBlMmM2ZWVkNjAyLi40
YmE2NTUyOTYzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hh
bnQyXzIuOC4xNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQy
XzIuOC4xNy5iYgpAQCAtMTIsNyArMTIsNyBAQCBERVBFTkRTID0gImdsaWItMi4wIGdyb2ZmLW5h
dGl2ZSIKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBnaXRodWItcmVsZWFzZXMKIAogU1JD
X1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9L2VuY2hhbnQtJHtQVn0u
dGFyLmd6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ3MzE2MmI1ZWZmNDAxYTYzOTdlMTIxNWUy
YjEwM2JjZWY4M2Y5MjFjMzk2YzdmNmIxMzk0ZDI0NTBkMTI0ZTIiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZWU0MDI1NmUyNzFkMGJjMWYyMTJlY2JjOGI4ZDNkYTkwNjZiMzNjOWNhOTg3ZDI2Njc1
OTY2NWViMGNhNjk0ZCIKIAogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9y
cnRob21hcy9lbmNoYW50L3JlbGVhc2VzIgogCi0tIAoyLjQ3LjEKCg==

--===============7395931805098867052==--

