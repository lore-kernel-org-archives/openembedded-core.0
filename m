Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980D6CD98D3
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:36:03 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1555.1780328130323382964
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MzE7II74;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MUwDbx3Z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019e83d3c6ab-99de2290-00aa-4566-b74c-2133f831c100-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328154;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4LwssfkqkqLhKQ5AUbmBWW5p9IOEXNmOfrVsiZMDy7I=;
	b=MzE7II74xYbwDsUGTvk5SvqR5M3oKoKO6qqezUUXinNAizzeBsN56DozKNRP4PXM
	lWXCy8iV3EjKqORH3RTwksHs362UtqPm/ljAt6fhDLsdmaKLXxt0SqjEvUxwOpyAPjj
	K+BYcna38Ibr5aKpQhS28R2kH8HoDgGwpLFSsmp4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328154;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4LwssfkqkqLhKQ5AUbmBWW5p9IOEXNmOfrVsiZMDy7I=;
	b=MUwDbx3ZZvp43LxW2vBHqQYpdFyX9pYjGmeGS7Aa8H1T5nwKwohny+Wyj/4Aioia
	yQ82yPX0CgNBN7tJ3LS2js+C2vzVVk09mPJ5qER66uZIYct2eyADQDsMYWkRVb0fWmg
	cOCQ5Mhk3UQ5y0LFSRQxTRNYIk4Yn9vheKavTSvM=
Content-Type: multipart/mixed; boundary="===============6286629022670216992=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] enchant2: upgrading to 2.8.16 SUCCEEDED
Message-ID: <0101019e83d3c6ab-99de2290-00aa-4566-b74c-2133f831c100-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237951

--===============6286629022670216992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *enchant2* to *2.8.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-enchant2-upgrade-2.8.15-2.8.16.patch
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
From e04a08522751b35c9a2db4405abe23bf1062a102 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 14:21:34 +0000
Subject: [PATCH] enchant2: upgrade 2.8.15 -> 2.8.16

---
 .../enchant/{enchant2_2.8.15.bb => enchant2_2.8.16.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.8.15.bb => enchant2_2.8.16.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.8.15.bb b/meta/recipes-support/enchant/enchant2_2.8.16.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.8.15.bb
rename to meta/recipes-support/enchant/enchant2_2.8.16.bb
index bc1c5f7a67..e2c6eed602 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.15.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.16.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "d3fd9e4170bfb5110b0bda577fe764a38fb606b3c25d2f0c3840234521ff1252"
+SRC_URI[sha256sum] = "d73162b5eff401a6397e1215e2b103bcef83f921c396c7f6b1394d2450d124e2"
 
 GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 
-- 
2.47.1


--===============6286629022670216992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.8.15", added "/usr/lib/libenchant-2.so.2.8.16"
Changes to packages/x86-64-v3-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.8.15 to libenchant-2.so.2.8.16
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.8.15 to libenchant-2.so.2.8.16
  /usr/lib/libenchant-2.so.2.8.15 moved to /usr/lib/libenchant-2.so.2.8.16

--===============6286629022670216992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: PV changed from "2.8.15" to "2.8.16"
packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: FILELIST: removed "/usr/lib/.debug/libenchant-2.so.2.8.15", added "/usr/lib/.debug/libenchant-2.so.2.8.16"
packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: PKGSIZE changed from 483608 to 483528 (-0%)
packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: PKGV changed from 2.8.15 [default] to 2.8.16 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-dev: PV changed from "2.8.15" to "2.8.16"
packages/x86-64-v3-poky-linux/enchant2/enchant2-dev: PKGV changed from 2.8.15 [default] to 2.8.16 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-doc: PV changed from "2.8.15" to "2.8.16"
packages/x86-64-v3-poky-linux/enchant2/enchant2-doc: PKGV changed from 2.8.15 [default] to 2.8.16 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-locale: PV changed from "2.8.15" to "2.8.16"
packages/x86-64-v3-poky-linux/enchant2/enchant2-locale: PKGV changed from 2.8.15 [default] to 2.8.16 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: PV changed from "2.8.15" to "2.8.16"
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: FILELIST: directory renamed /usr/src/debug/enchant2/2.8.15/lib -> /usr/src/debug/enchant2/2.8.16/lib, directory renamed /usr/src/debug/enchant2/2.8.15/providers -> /usr/src/debug/enchant2/2.8.16/providers, directory renamed /usr/src/debug/enchant2/2.8.15/src -> /usr/src/debug/enchant2/2.8.16/src
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: PKGSIZE changed from 506074 to 506080 (+0%)
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: PKGV changed from 2.8.15 [default] to 2.8.16 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-staticdev: PV changed from "2.8.15" to "2.8.16"
packages/x86-64-v3-poky-linux/enchant2/enchant2-staticdev: PKGV changed from 2.8.15 [default] to 2.8.16 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2: PV changed from "2.8.15" to "2.8.16"
packages/x86-64-v3-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.8.15", added "/usr/lib/libenchant-2.so.2.8.16"
packages/x86-64-v3-poky-linux/enchant2/enchant2: PKGV changed from 2.8.15 [default] to 2.8.16 [default]
packages/x86-64-v3-poky-linux/enchant2: PV changed from "2.8.15" to "2.8.16"
packages/x86-64-v3-poky-linux/enchant2: PKGV changed from 2.8.15 [default] to 2.8.16 [default]
packages/x86-64-v3-poky-linux/enchant2: SRC_URI changed from "https://github.com/rrthomas/enchant/releases/download/v2.8.15/enchant-2.8.15.tar.gz" to "https://github.com/rrthomas/enchant/releases/download/v2.8.16/enchant-2.8.16.tar.gz"
Changes to packages/x86-64-v3-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.8.15 to libenchant-2.so.2.8.16
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.8.15 to libenchant-2.so.2.8.16
  /usr/lib/libenchant-2.so.2.8.15 moved to /usr/lib/libenchant-2.so.2.8.16

--===============6286629022670216992==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-enchant2-upgrade-2.8.15-2.8.16.patch"

RnJvbSBlMDRhMDg1MjI3NTFiMzVjOWEyZGI0NDA1YWJlMjNiZjEwNjJhMTAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxNDoyMTozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVu
Y2hhbnQyOiB1cGdyYWRlIDIuOC4xNSAtPiAyLjguMTYKCi0tLQogLi4uL2VuY2hhbnQve2VuY2hh
bnQyXzIuOC4xNS5iYiA9PiBlbmNoYW50Ml8yLjguMTYuYmJ9ICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZW5jaGFudC97ZW5jaGFudDJfMi44LjE1LmJiID0+IGVuY2hhbnQyXzIu
OC4xNi5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50
L2VuY2hhbnQyXzIuOC4xNS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2VuY2hhbnQvZW5jaGFu
dDJfMi44LjE2LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L2VuY2hhbnQvZW5jaGFudDJfMi44LjE1LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuOC4xNi5iYgppbmRleCBiYzFjNWY3YTY3Li5l
MmM2ZWVkNjAyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hh
bnQyXzIuOC4xNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQy
XzIuOC4xNi5iYgpAQCAtMTIsNyArMTIsNyBAQCBERVBFTkRTID0gImdsaWItMi4wIGdyb2ZmLW5h
dGl2ZSIKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBnaXRodWItcmVsZWFzZXMKIAogU1JD
X1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9L2VuY2hhbnQtJHtQVn0u
dGFyLmd6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImQzZmQ5ZTQxNzBiZmI1MTEwYjBiZGE1Nzdm
ZTc2NGEzOGZiNjA2YjNjMjVkMmYwYzM4NDAyMzQ1MjFmZjEyNTIiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZDczMTYyYjVlZmY0MDFhNjM5N2UxMjE1ZTJiMTAzYmNlZjgzZjkyMWMzOTZjN2Y2YjEz
OTRkMjQ1MGQxMjRlMiIKIAogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9y
cnRob21hcy9lbmNoYW50L3JlbGVhc2VzIgogCi0tIAoyLjQ3LjEKCg==

--===============6286629022670216992==--

