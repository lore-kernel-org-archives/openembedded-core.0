Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F8BC44506
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 05:42:17 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2332.1783489333217413836
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 22:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=rej6m1Ow;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IErMGrHK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019f403f83e7-18515eb5-3d14-472b-98ed-2c6b7ce8f991-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783489332;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Pu3GoDNqweg7hDJnTQoc+axgG7wCwTHpKoslqJfAuO0=;
	b=rej6m1OwkdW28NFBAegeBFhlo6LG898E/Rqdv8ZU/01GmrRcaOYw9p9FWcaVIlCU
	gr/R2T/XQh9UXyvSOK5GTLo/9l//JC1QHiF+OBuHC0wRhr2YsjBUaeZiNMWcXc5DXXO
	iM2y7ETy1fGdfxuZeUyPo38wUCkB4CCKKPYsZntw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783489332;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Pu3GoDNqweg7hDJnTQoc+axgG7wCwTHpKoslqJfAuO0=;
	b=IErMGrHKES/OuGFQLogAmnA7G9kpNre+4ZRQ5wj4+9qWt73RGSyuujR7cx2wDiER
	PyCOncHZgWpUuYLPQQedj9muBDhdpWVxalZIBOpb1PkFTctY96295C6fMH6KwbygFTY
	aThv/z7FB1r9lEhjfmQwCHz2yRCu4T1A/qNZmWzY=
Content-Type: multipart/mixed; boundary="===============0993081830938586015=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] enchant2: upgrading to 2.8.19 SUCCEEDED
Message-ID: <0101019f403f83e7-18515eb5-3d14-472b-98ed-2c6b7ce8f991-000000@us-west-2.amazonses.com>
Date: Wed, 8 Jul 2026 05:42:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.08-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 05:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240430

--===============0993081830938586015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *enchant2* to *2.8.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-enchant2-upgrade-2.8.18-2.8.19.patch
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
From 9219f559710129502dc091f2d4fe0be37ac674ec Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 8 Jul 2026 05:42:05 +0000
Subject: [PATCH] enchant2: upgrade 2.8.18 -> 2.8.19

---
 .../enchant/{enchant2_2.8.18.bb => enchant2_2.8.19.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.8.18.bb => enchant2_2.8.19.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.8.18.bb b/meta/recipes-support/enchant/enchant2_2.8.19.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.8.18.bb
rename to meta/recipes-support/enchant/enchant2_2.8.19.bb
index ff9422a49b..51616ba878 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.18.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.19.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "883a16f0898c7b1af38046d8bce5c658156698498541e9344c60e317e8d48f2a"
+SRC_URI[sha256sum] = "8e7f6cb0c3b79be3146eb3ab93650484adbc59dae5f2c1958fde557080ba678c"
 
 GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 
-- 
2.47.1


--===============0993081830938586015==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-enchant2-upgrade-2.8.18-2.8.19.patch"

RnJvbSA5MjE5ZjU1OTcxMDEyOTUwMmRjMDkxZjJkNGZlMGJlMzdhYzY3NGVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgOCBKdWwgMjAyNiAwNTo0MjowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVu
Y2hhbnQyOiB1cGdyYWRlIDIuOC4xOCAtPiAyLjguMTkKCi0tLQogLi4uL2VuY2hhbnQve2VuY2hh
bnQyXzIuOC4xOC5iYiA9PiBlbmNoYW50Ml8yLjguMTkuYmJ9ICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZW5jaGFudC97ZW5jaGFudDJfMi44LjE4LmJiID0+IGVuY2hhbnQyXzIu
OC4xOS5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50
L2VuY2hhbnQyXzIuOC4xOC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2VuY2hhbnQvZW5jaGFu
dDJfMi44LjE5LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L2VuY2hhbnQvZW5jaGFudDJfMi44LjE4LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuOC4xOS5iYgppbmRleCBmZjk0MjJhNDliLi41
MTYxNmJhODc4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hh
bnQyXzIuOC4xOC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQy
XzIuOC4xOS5iYgpAQCAtMTIsNyArMTIsNyBAQCBERVBFTkRTID0gImdsaWItMi4wIGdyb2ZmLW5h
dGl2ZSIKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBnaXRodWItcmVsZWFzZXMKIAogU1JD
X1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9L2VuY2hhbnQtJHtQVn0u
dGFyLmd6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjg4M2ExNmYwODk4YzdiMWFmMzgwNDZkOGJj
ZTVjNjU4MTU2Njk4NDk4NTQxZTkzNDRjNjBlMzE3ZThkNDhmMmEiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiOGU3ZjZjYjBjM2I3OWJlMzE0NmViM2FiOTM2NTA0ODRhZGJjNTlkYWU1ZjJjMTk1OGZk
ZTU1NzA4MGJhNjc4YyIKIAogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9y
cnRob21hcy9lbmNoYW50L3JlbGVhc2VzIgogCi0tIAoyLjQ3LjEKCg==

--===============0993081830938586015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.8.18", added "/usr/lib/libenchant-2.so.2.8.19"
Changes to packages/x86-64-v3-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.8.18 to libenchant-2.so.2.8.19
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.8.18 to libenchant-2.so.2.8.19
  /usr/lib/libenchant-2.so.2.8.18 moved to /usr/lib/libenchant-2.so.2.8.19

--===============0993081830938586015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: PKGSIZE changed from 474544 to 474360 (-0%)
packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: PKGV changed from 2.8.18 [default] to 2.8.19 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: FILELIST: removed "/usr/lib/.debug/libenchant-2.so.2.8.18", added "/usr/lib/.debug/libenchant-2.so.2.8.19"
packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: PV changed from "2.8.18" to "2.8.19"
packages/x86-64-v3-poky-linux/enchant2/enchant2-dev: PKGV changed from 2.8.18 [default] to 2.8.19 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-dev: PV changed from "2.8.18" to "2.8.19"
packages/x86-64-v3-poky-linux/enchant2/enchant2-doc: PKGV changed from 2.8.18 [default] to 2.8.19 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-doc: PV changed from "2.8.18" to "2.8.19"
packages/x86-64-v3-poky-linux/enchant2/enchant2-locale: PKGV changed from 2.8.18 [default] to 2.8.19 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-locale: PV changed from "2.8.18" to "2.8.19"
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: PKGV changed from 2.8.18 [default] to 2.8.19 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: FILELIST: directory renamed /usr/src/debug/enchant2/2.8.18/providers -> /usr/src/debug/enchant2/2.8.19/providers, directory renamed /usr/src/debug/enchant2/2.8.18/src -> /usr/src/debug/enchant2/2.8.19/src, directory renamed /usr/src/debug/enchant2/2.8.18/lib -> /usr/src/debug/enchant2/2.8.19/lib
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: PV changed from "2.8.18" to "2.8.19"
packages/x86-64-v3-poky-linux/enchant2/enchant2-staticdev: PKGV changed from 2.8.18 [default] to 2.8.19 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-staticdev: PV changed from "2.8.18" to "2.8.19"
packages/x86-64-v3-poky-linux/enchant2/enchant2: PKGV changed from 2.8.18 [default] to 2.8.19 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.8.18", added "/usr/lib/libenchant-2.so.2.8.19"
packages/x86-64-v3-poky-linux/enchant2/enchant2: PV changed from "2.8.18" to "2.8.19"
packages/x86-64-v3-poky-linux/enchant2: SRC_URI changed from "https://github.com/rrthomas/enchant/releases/download/v2.8.18/enchant-2.8.18.tar.gz" to "https://github.com/rrthomas/enchant/releases/download/v2.8.19/enchant-2.8.19.tar.gz"
packages/x86-64-v3-poky-linux/enchant2: PKGV changed from 2.8.18 [default] to 2.8.19 [default]
packages/x86-64-v3-poky-linux/enchant2: PV changed from "2.8.18" to "2.8.19"
Changes to packages/x86-64-v3-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.8.18 to libenchant-2.so.2.8.19
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.8.18 to libenchant-2.so.2.8.19
  /usr/lib/libenchant-2.so.2.8.18 moved to /usr/lib/libenchant-2.so.2.8.19

--===============0993081830938586015==--

