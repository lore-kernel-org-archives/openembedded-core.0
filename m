Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD536C43602
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 05:39:41 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.126872.1783229979371794247
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jul 2026 22:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MrMcxx5T;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=2tTVvSJ+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019f30ca17b2-7d68953c-99a0-4786-a4bf-ada4363ed3e6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783229978;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=A2Z54KWZRi4hZkoAFiZwJHZpSz7JDM52QsmAmaiHE4Y=;
	b=MrMcxx5Tf+Dqo4JmmVYR9C2WXEBNF5Y9eXC9rX/kIZSVG9XPKZQKoBOQ+TFhoMYX
	jKMHjxbhhd0Ea4mXlQevwq+QdtT5aHmWosKWbWd3OpRi6uvkunWzV45q+ClwJBADltB
	L7yrWeSYR4PKQtny6XSwgCCEl7JtxVxh9I50fYS0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783229978;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=A2Z54KWZRi4hZkoAFiZwJHZpSz7JDM52QsmAmaiHE4Y=;
	b=2tTVvSJ+MNmTorQGhFvODVEu6n149bD+DNdg64KN6S2vn5gG2Xjkg1VCaEGP9tUn
	fKBqD+duhNj4w/lHAobu7jwjLIGo1EB4vR1OqHsCcTvqokksHJWK5SN7W6kapxFPFll
	LAni6m/S69AjnozUzlyuq/ceM5Nv0/oWhut2DqRE=
Content-Type: multipart/mixed; boundary="===============1596639422938044653=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] enchant2: upgrading to 2.8.18 SUCCEEDED
Message-ID: <0101019f30ca17b2-7d68953c-99a0-4786-a4bf-ada4363ed3e6-000000@us-west-2.amazonses.com>
Date: Sun, 5 Jul 2026 05:39:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.05-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 05:39:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240139

--===============1596639422938044653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *enchant2* to *2.8.18* has Succeeded.

Next steps:
    - apply the patch: git am 0001-enchant2-upgrade-2.8.16-2.8.18.patch
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
From 60fad47c00788fda33fb8668d41d7b533f9e3172 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 5 Jul 2026 05:39:32 +0000
Subject: [PATCH] enchant2: upgrade 2.8.16 -> 2.8.18

---
 .../enchant/{enchant2_2.8.16.bb => enchant2_2.8.18.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.8.16.bb => enchant2_2.8.18.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.8.16.bb b/meta/recipes-support/enchant/enchant2_2.8.18.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.8.16.bb
rename to meta/recipes-support/enchant/enchant2_2.8.18.bb
index e2c6eed602..ff9422a49b 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.16.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.18.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "d73162b5eff401a6397e1215e2b103bcef83f921c396c7f6b1394d2450d124e2"
+SRC_URI[sha256sum] = "883a16f0898c7b1af38046d8bce5c658156698498541e9344c60e317e8d48f2a"
 
 GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 
-- 
2.47.1


--===============1596639422938044653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: PV changed from "2.8.16" to "2.8.18"
packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: PKGV changed from 2.8.16 [default] to 2.8.18 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: FILELIST: removed "/usr/lib/.debug/libenchant-2.so.2.8.16", added "/usr/lib/.debug/libenchant-2.so.2.8.18"
packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: PKGSIZE changed from 483528 to 474544 (-2%)
packages/x86-64-v3-poky-linux/enchant2/enchant2-dev: PV changed from "2.8.16" to "2.8.18"
packages/x86-64-v3-poky-linux/enchant2/enchant2-dev: PKGV changed from 2.8.16 [default] to 2.8.18 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-doc: PV changed from "2.8.16" to "2.8.18"
packages/x86-64-v3-poky-linux/enchant2/enchant2-doc: PKGV changed from 2.8.16 [default] to 2.8.18 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-doc: PKGSIZE changed from 23339 to 23419 (+0%)
packages/x86-64-v3-poky-linux/enchant2/enchant2-locale: PV changed from "2.8.16" to "2.8.18"
packages/x86-64-v3-poky-linux/enchant2/enchant2-locale: PKGV changed from 2.8.16 [default] to 2.8.18 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: PV changed from "2.8.16" to "2.8.18"
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: PKGV changed from 2.8.16 [default] to 2.8.18 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: FILELIST: directory renamed /usr/src/debug/enchant2/2.8.16/lib -> /usr/src/debug/enchant2/2.8.18/lib, directory renamed /usr/src/debug/enchant2/2.8.16/providers -> /usr/src/debug/enchant2/2.8.18/providers, directory renamed /usr/src/debug/enchant2/2.8.16/src -> /usr/src/debug/enchant2/2.8.18/src
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: PKGSIZE changed from 506080 to 500375 (-1%)
packages/x86-64-v3-poky-linux/enchant2/enchant2-staticdev: PV changed from "2.8.16" to "2.8.18"
packages/x86-64-v3-poky-linux/enchant2/enchant2-staticdev: PKGV changed from 2.8.16 [default] to 2.8.18 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2: PV changed from "2.8.16" to "2.8.18"
packages/x86-64-v3-poky-linux/enchant2/enchant2: PKGV changed from 2.8.16 [default] to 2.8.18 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.8.16", added "/usr/lib/libenchant-2.so.2.8.18"
packages/x86-64-v3-poky-linux/enchant2: PV changed from "2.8.16" to "2.8.18"
packages/x86-64-v3-poky-linux/enchant2: PKGV changed from 2.8.16 [default] to 2.8.18 [default]
packages/x86-64-v3-poky-linux/enchant2: SRC_URI changed from "https://github.com/rrthomas/enchant/releases/download/v2.8.16/enchant-2.8.16.tar.gz" to "https://github.com/rrthomas/enchant/releases/download/v2.8.18/enchant-2.8.18.tar.gz"
Changes to packages/x86-64-v3-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.8.16 to libenchant-2.so.2.8.18
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.8.16 to libenchant-2.so.2.8.18
  /usr/lib/libenchant-2.so.2.8.16 moved to /usr/lib/libenchant-2.so.2.8.18

--===============1596639422938044653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.8.16", added "/usr/lib/libenchant-2.so.2.8.18"
Changes to packages/x86-64-v3-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.8.16 to libenchant-2.so.2.8.18
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.8.16 to libenchant-2.so.2.8.18
  /usr/lib/libenchant-2.so.2.8.16 moved to /usr/lib/libenchant-2.so.2.8.18

--===============1596639422938044653==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-enchant2-upgrade-2.8.16-2.8.18.patch"

RnJvbSA2MGZhZDQ3YzAwNzg4ZmRhMzNmYjg2NjhkNDFkN2I1MzNmOWUzMTcyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgNSBKdWwgMjAyNiAwNTozOTozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVu
Y2hhbnQyOiB1cGdyYWRlIDIuOC4xNiAtPiAyLjguMTgKCi0tLQogLi4uL2VuY2hhbnQve2VuY2hh
bnQyXzIuOC4xNi5iYiA9PiBlbmNoYW50Ml8yLjguMTguYmJ9ICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZW5jaGFudC97ZW5jaGFudDJfMi44LjE2LmJiID0+IGVuY2hhbnQyXzIu
OC4xOC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50
L2VuY2hhbnQyXzIuOC4xNi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2VuY2hhbnQvZW5jaGFu
dDJfMi44LjE4LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L2VuY2hhbnQvZW5jaGFudDJfMi44LjE2LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuOC4xOC5iYgppbmRleCBlMmM2ZWVkNjAyLi5m
Zjk0MjJhNDliIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hh
bnQyXzIuOC4xNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQy
XzIuOC4xOC5iYgpAQCAtMTIsNyArMTIsNyBAQCBERVBFTkRTID0gImdsaWItMi4wIGdyb2ZmLW5h
dGl2ZSIKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBnaXRodWItcmVsZWFzZXMKIAogU1JD
X1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9L2VuY2hhbnQtJHtQVn0u
dGFyLmd6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ3MzE2MmI1ZWZmNDAxYTYzOTdlMTIxNWUy
YjEwM2JjZWY4M2Y5MjFjMzk2YzdmNmIxMzk0ZDI0NTBkMTI0ZTIiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiODgzYTE2ZjA4OThjN2IxYWYzODA0NmQ4YmNlNWM2NTgxNTY2OTg0OTg1NDFlOTM0NGM2
MGUzMTdlOGQ0OGYyYSIKIAogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9y
cnRob21hcy9lbmNoYW50L3JlbGVhc2VzIgogCi0tIAoyLjQ3LjEKCg==

--===============1596639422938044653==--

