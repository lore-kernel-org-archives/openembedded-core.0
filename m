Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84162EEE24B
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:38:00 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.103061.1767267479534280539
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:37:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jLDp8wqU;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=nsyAcWRD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019b7959acca-078b2d2c-4d62-4a5d-b075-aaeff415ba78-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267478;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dM6gtYNoH5oK6tJUeCZyHk3XdlHj7Dmbf+DVjEGluZo=;
	b=jLDp8wqUWNzJuFZUla6+SDI057ggr/eRGI+FkBzSwzL8wRWzqLt+8YBG3bBn5jNP
	mLOJAaDJXxhbY+etz4/Xldo1Q9kx+cXtV8vVVhJToe3cOITIyVzemaUyyCVgGI2weuC
	j3QltHYY86oBidUGKphNetm2me1g3UTTNMUno/gE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267478;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dM6gtYNoH5oK6tJUeCZyHk3XdlHj7Dmbf+DVjEGluZo=;
	b=nsyAcWRD3NvLof8+nqF+9rzQ5unMQPG7qoHxaKTRO34M5N9OeuLiEyjXOHqsbcNN
	w2x8CGwh9DJlrtthRNkK71bnr6SEtbFRik7SdIJCdPT1k8TPnyXPlpBsbERD6NXjEyv
	wH1jFdkRrWVr+TFz91Dieh1iF8zcD4deISw9rIGQ=
Content-Type: multipart/mixed; boundary="===============3531086069590494199=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] harfbuzz: upgrading to 12.3.0 SUCCEEDED
Message-ID: <0101019b7959acca-078b2d2c-4d62-4a5d-b075-aaeff415ba78-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:37:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228795

--===============3531086069590494199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *harfbuzz* to *12.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-12.2.0-12.3.0.patch
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
From 92824f74fde01f04a2ce3757db0dc07632eff512 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 10:06:02 +0000
Subject: [PATCH] harfbuzz: upgrade 12.2.0 -> 12.3.0

---
 .../harfbuzz/{harfbuzz_12.2.0.bb => harfbuzz_12.3.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_12.2.0.bb => harfbuzz_12.3.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_12.3.0.bb
index ef2f6aa4f9..d2e63f5529 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ecb603aa426a8b24665718667bda64a84c1504db7454ee4cadbd362eea64e545"
+SRC_URI[sha256sum] = "8660ebd3c27d9407fc8433b5d172bafba5f0317cb0bb4339f28e5370c93d42b7"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.47.1


--===============3531086069590494199==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-12.2.0-12.3.0.patch"

RnJvbSA5MjgyNGY3NGZkZTAxZjA0YTJjZTM3NTdkYjBkYzA3NjMyZWZmNTEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAxMDowNjowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGhh
cmZidXp6OiB1cGdyYWRlIDEyLjIuMCAtPiAxMi4zLjAKCi0tLQogLi4uL2hhcmZidXp6L3toYXJm
YnV6el8xMi4yLjAuYmIgPT4gaGFyZmJ1enpfMTIuMy4wLmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L3toYXJmYnV6el8xMi4yLjAuYmIgPT4gaGFyZmJ1enpf
MTIuMy4wLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJm
YnV6ei9oYXJmYnV6el8xMi4yLjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enov
aGFyZmJ1enpfMTIuMy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8xMi4yLjAuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8xMi4zLjAuYmIKaW5kZXggZWYy
ZjZhYTRmOS4uZDJlNjNmNTUyOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hh
cmZidXp6L2hhcmZidXp6XzEyLjIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFy
ZmJ1enovaGFyZmJ1enpfMTIuMy4wLmJiCkBAIC05LDcgKzksNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT1iOTg0MjliOGU4ZTNjMmE2N2NmZWYwMWU5OWU0ODkzZCBc
CiAgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0v
ZG93bmxvYWQvJHtQVn0vJHtCUE59LSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICJlY2I2MDNhYTQyNmE4YjI0NjY1NzE4NjY3YmRhNjRhODRjMTUwNGRiNzQ1NGVlNGNhZGJkMzYy
ZWVhNjRlNTQ1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjg2NjBlYmQzYzI3ZDk0MDdmYzg0MzNi
NWQxNzJiYWZiYTVmMDMxN2NiMGJiNDMzOWYyOGU1MzcwYzkzZDQyYjciCiAKIERFUEVORFMgKz0g
ImdsaWItMi4wLW5hdGl2ZSIKIAotLSAKMi40Ny4xCgo=

--===============3531086069590494199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 12.2.0 [default] to 12.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "12.2.0" to "12.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 12.2.0 [default] to 12.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 83377016 to 83020256 (-0%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz-cairo.so.0.61220.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61220.0 /usr/lib/.debug/libharfbuzz.so.0.61220.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61220.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61220.0", added "/usr/lib/.debug/libharfbuzz.so.0.61230.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61230.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61230.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61230.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61230.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "12.2.0" to "12.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 12.2.0 [default] to 12.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PKGSIZE changed from 1809164 to 1809161 (-0%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "12.2.0" to "12.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 12.2.0 [default] to 12.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "12.2.0" to "12.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu-dev: PKGV changed from 12.2.0 [default] to 12.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu-dev: PV changed from "12.2.0" to "12.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 12.2.0 [default] to 12.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61220.0", added "/usr/lib/libharfbuzz-icu.so.0.61230.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "12.2.0" to "12.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 12.2.0 [default] to 12.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "12.2.0" to "12.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 12.2.0 [default] to 12.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 5171276 to 5175889 (+0%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: FILELIST: directory renamed /usr/src/debug/harfbuzz/12.2.0/src/OT/Color/COLR -> /usr/src/debug/harfbuzz/12.3.0/src/OT/Color/COLR, directory renamed /usr/src/debug/harfbuzz/12.2.0/src/OT/Layout/Common -> /usr/src/debug/harfbuzz/12.3.0/src/OT/Layout/Common, directory renamed /usr/src/debug/harfbuzz/12.2.0/src/OT/Layout/GSUB -> /usr/src/debug/harfbuzz/12.3.0/src/OT/Layout/GSUB, directory renamed /usr/src/debug/harfbuzz/12.2.0/src/OT/name -> /usr/src/debug/harfbuzz/12.3.0/src/OT/name, directory renamed /usr/src/debug/harfbuzz/12.2.0/src/OT/Layout/GDEF -> /usr/src/debug/harfbuzz/12.3.0/src/OT/Layout/GDEF, directory renamed /usr/src/debug/harfbuzz/12.2.0/src -> /usr/src/debug/harfbuzz/12.3.0/src, directory renamed /usr/src/debug/harfbuzz/12.2.0/src/OT/Color/svg -> /usr/src/debug/harfbuzz/12.3.0/src/OT/Color/svg, directory renamed /usr/src/debug/harfbuzz/12.2.0/src/OT/Color/sbix -> /usr/src/debug/harfbuzz/12.3.0/src/OT/Color/sbix, directo
 ry renamed /usr/src/debug/harfbuzz/12.2.0/src/OT/Color/CPAL -> /usr/src/debug/harfbuzz/12.3.0/src/OT/Color/CPAL, directory renamed /usr/src/debug/harfbuzz/12.2.0/src/OT/Layout/GPOS -> /usr/src/debug/harfbuzz/12.3.0/src/OT/Layout/GPOS, directory renamed /usr/src/debug/harfbuzz/12.2.0/util -> /usr/src/debug/harfbuzz/12.3.0/util, directory renamed /usr/src/debug/harfbuzz/12.2.0/src/OT/Var/VARC -> /usr/src/debug/harfbuzz/12.3.0/src/OT/Var/VARC, directory renamed /usr/src/debug/harfbuzz/12.2.0/src/OT/Layout -> /usr/src/debug/harfbuzz/12.3.0/src/OT/Layout, directory renamed /usr/src/debug/harfbuzz/12.2.0/src/OT/Color/CBDT -> /usr/src/debug/harfbuzz/12.3.0/src/OT/Color/CBDT, directory renamed /usr/src/debug/harfbuzz/12.2.0/src/OT/glyf -> /usr/src/debug/harfbuzz/12.3.0/src/OT/glyf, directory renamed /usr/src/debug/harfbuzz/12.2.0/src/graph -> /usr/src/debug/harfbuzz/12.3.0/src/graph
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PV changed from "12.2.0" to "12.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 12.2.0 [default] to 12.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "12.2.0" to "12.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 12.2.0 [default] to 12.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGSIZE changed from 1042591 to 1030303 (-1%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61220.0", added "/usr/lib/libharfbuzz-subset.so.0.61230.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "12.2.0" to "12.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PKGV changed from 12.2.0 [default] to 12.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PKGSIZE changed from 1242462 to 1234270 (-1%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61220.0 /usr/lib/libharfbuzz-cairo.so.0.61220.0 /usr/lib/libharfbuzz.so.0.61220.0", added "/usr/lib/libharfbuzz-cairo.so.0.61230.0 /usr/lib/libharfbuzz-gobject.so.0.61230.0 /usr/lib/libharfbuzz.so.0.61230.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PV changed from "12.2.0" to "12.3.0"
packages/x86-64-v3-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases//download/12.2.0/harfbuzz-12.2.0.tar.xz" to "https://github.com/harfbuzz/harfbuzz/releases//download/12.3.0/harfbuzz-12.3.0.tar.xz"
packages/x86-64-v3-poky-linux/harfbuzz: PKGV changed from 12.2.0 [default] to 12.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz: PV changed from "12.2.0" to "12.3.0"
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61220.0 to libharfbuzz-cairo.so.0.61230.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61220.0 to libharfbuzz-gobject.so.0.61230.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61220.0 to libharfbuzz-icu.so.0.61230.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61220.0 to libharfbuzz.so.0.61230.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61220.0 to libharfbuzz-subset.so.0.61230.0
  /usr/lib/libharfbuzz-cairo.so.0.61220.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61230.0
  /usr/lib/libharfbuzz-gobject.so.0.61220.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61230.0
  /usr/lib/libharfbuzz-icu.so.0.61220.0 moved to /usr/lib/libharfbuzz-icu.so.0.61230.0
  /usr/lib/libharfbuzz.so.0.61220.0 moved to /usr/lib/libharfbuzz.so.0.61230.0
  /usr/lib/libharfbuzz-subset.so.0.61220.0 moved to /usr/lib/libharfbuzz-subset.so.0.61230.0

--===============3531086069590494199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61220.0", added "/usr/lib/libharfbuzz-icu.so.0.61230.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61220.0", added "/usr/lib/libharfbuzz-subset.so.0.61230.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.61220.0 /usr/lib/libharfbuzz-cairo.so.0.61220.0 /usr/lib/libharfbuzz-gobject.so.0.61220.0", added "/usr/lib/libharfbuzz.so.0.61230.0 /usr/lib/libharfbuzz-gobject.so.0.61230.0 /usr/lib/libharfbuzz-cairo.so.0.61230.0"
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61220.0 to libharfbuzz-cairo.so.0.61230.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61220.0 to libharfbuzz-gobject.so.0.61230.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61220.0 to libharfbuzz-icu.so.0.61230.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61220.0 to libharfbuzz.so.0.61230.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61220.0 to libharfbuzz-subset.so.0.61230.0
  /usr/lib/libharfbuzz-cairo.so.0.61220.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61230.0
  /usr/lib/libharfbuzz-gobject.so.0.61220.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61230.0
  /usr/lib/libharfbuzz-icu.so.0.61220.0 moved to /usr/lib/libharfbuzz-icu.so.0.61230.0
  /usr/lib/libharfbuzz.so.0.61220.0 moved to /usr/lib/libharfbuzz.so.0.61230.0
  /usr/lib/libharfbuzz-subset.so.0.61220.0 moved to /usr/lib/libharfbuzz-subset.so.0.61230.0

--===============3531086069590494199==--

