Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DAFED5C0F9
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:51 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17394.1765872135549692799
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ax0Ery+n;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Fk2/XNqD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019b262ee439-17610740-ce6d-44e8-8129-58fea58642a2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872166;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=v6EsA2DAP10yxjSBf/R3W47vgHOmvgitfmynLg7PVl4=;
	b=ax0Ery+no/7zGUZYVW2jnBi57XmBUhcGerFTpXOi0jgizBm/CwnA5lEC9dBO4zMQ
	PixOjP/ceRIr7zSNkBpVcPYDtuqHDbc659cw/pbNu11z1BbHldL8Qx7Mf/VXU+2ljjz
	pb7xNYjyIMAt5aJILnhLA6TYYVbrEBvJUCC035zY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872166;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=v6EsA2DAP10yxjSBf/R3W47vgHOmvgitfmynLg7PVl4=;
	b=Fk2/XNqD4zT524kMFj5CO8qr5JwC5OrURVnCE3Dlwksi4ZTktTrSUI6uAIFYLh7+
	k8agS/iaaqc063nTFzQdexJLjIGypWPGUkxAaXuewpkKIIBpsKqBxkZRFjssmAFCykB
	pogxMK/qZZq5BzZaeWcoU5eyC/NQuZW9md8R6CAI=
Content-Type: multipart/mixed; boundary="===============2589349084804816612=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libpng: upgrading to 1.6.53 SUCCEEDED
Message-ID: <0101019b262ee439-17610740-ce6d-44e8-8129-58fea58642a2-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227897

--===============2589349084804816612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libpng* to *1.6.53* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpng-upgrade-1.6.51-1.6.53.patch
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
From 996f86bf91901ca311f59de1e832383b0845a16c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 06:20:10 +0000
Subject: [PATCH] libpng: upgrade 1.6.51 -> 1.6.53

---
 .../libpng/{libpng_1.6.51.bb => libpng_1.6.53.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.51.bb => libpng_1.6.53.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.51.bb b/meta/recipes-multimedia/libpng/libpng_1.6.53.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.51.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.53.bb
index e499f61ff4..956cd243b1 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.51.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.53.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "a050a892d3b4a7bb010c3a95c7301e49656d72a64f1fc709a90b8aded192bed2"
+SRC_URI[sha256sum] = "1d3fb8ccc2932d04aa3663e22ef5ef490244370f4e568d7850165068778d98d4"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.47.1


--===============2589349084804816612==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpng-upgrade-1.6.51-1.6.53.patch"

RnJvbSA5OTZmODZiZjkxOTAxY2EzMTFmNTlkZTFlODMyMzgzYjA4NDVhMTZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDY6MjA6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwbmc6IHVwZ3JhZGUgMS42LjUxIC0+IDEuNi41MwoKLS0tCiAuLi4vbGlicG5nL3tsaWJwbmdf
MS42LjUxLmJiID0+IGxpYnBuZ18xLjYuNTMuYmJ9ICAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9saWJwbmcve2xpYnBuZ18xLjYuNTEuYmIgPT4gbGlicG5nXzEuNi41
My5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJwbmcv
bGlicG5nXzEuNi41MS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy9saWJwbmdf
MS42LjUzLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2xpYnBuZy9saWJwbmdfMS42LjUxLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9saWJwbmcvbGlicG5nXzEuNi41My5iYgppbmRleCBlNDk5ZjYxZmY0Li45NTZj
ZDI0M2IxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJwbmcvbGlicG5n
XzEuNi41MS5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJwbmcvbGlicG5nXzEu
Ni41My5iYgpAQCAtMTQsNyArMTQsNyBAQCBTUkNfVVJJID0gIiR7U09VUkNFRk9SR0VfTUlSUk9S
fS8ke0JQTn0vJHtCUE59JHtMSUJWfS8ke0JQfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8v
cnVuLXB0ZXN0IFwKICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImEwNTBhODkyZDNiNGE3YmIw
MTBjM2E5NWM3MzAxZTQ5NjU2ZDcyYTY0ZjFmYzcwOWE5MGI4YWRlZDE5MmJlZDIiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMWQzZmI4Y2NjMjkzMmQwNGFhMzY2M2UyMmVmNWVmNDkwMjQ0MzcwZjRl
NTY4ZDc4NTAxNjUwNjg3NzhkOThkNCIKIAogTUlSUk9SUyArPSAiJHtTT1VSQ0VGT1JHRV9NSVJS
T1J9L3Byb2plY3QvJHtCUE59LyR7QlBOfSR7TElCVn0vICR7U09VUkNFRk9SR0VfTUlSUk9SfS9w
cm9qZWN0LyR7QlBOfS8ke0JQTn0ke0xJQlZ9L29sZGVyLXJlbGVhc2VzLyIKIAotLSAKMi40Ny4x
Cgo=

--===============2589349084804816612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libpng/libpng: FILELIST: removed "/usr/lib/libpng16.so.16.51.0", added "/usr/lib/libpng16.so.16.53.0"
Changes to packages/x86-64-v3-poky-linux/libpng (sysroot):
  /usr/lib/libpng16.so.16 changed symlink target from libpng16.so.16.51.0 to libpng16.so.16.53.0
  /usr/lib/libpng16.so changed symlink target from libpng16.so.16.51.0 to libpng16.so.16.53.0
  /usr/lib/libpng16.so.16.51.0 moved to /usr/lib/libpng16.so.16.53.0

--===============2589349084804816612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libpng: PV changed from "1.6.51" to "1.6.53"
packages/x86-64-v3-poky-linux/libpng: PKGV changed from 1.6.51 [default] to 1.6.53 [default]
packages/x86-64-v3-poky-linux/libpng: SRC_URI changed from "https://downloads.sourceforge.net/libpng/libpng16/libpng-1.6.51.tar.xz file://run-ptest" to "https://downloads.sourceforge.net/libpng/libpng16/libpng-1.6.53.tar.xz file://run-ptest"
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: PV changed from "1.6.51" to "1.6.53"
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: FILELIST: removed "/usr/lib/.debug/libpng16.so.16.51.0", added "/usr/lib/.debug/libpng16.so.16.53.0"
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: PKGSIZE changed from 1442128 to 1442528 (+0%)
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: PKGV changed from 1.6.51 [default] to 1.6.53 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-dev: PV changed from "1.6.51" to "1.6.53"
packages/x86-64-v3-poky-linux/libpng/libpng-dev: PKGV changed from 1.6.51 [default] to 1.6.53 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-doc: PV changed from "1.6.51" to "1.6.53"
packages/x86-64-v3-poky-linux/libpng/libpng-doc: PKGSIZE changed from 268152 to 268149 (-0%)
packages/x86-64-v3-poky-linux/libpng/libpng-doc: PKGV changed from 1.6.51 [default] to 1.6.53 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-locale: PV changed from "1.6.51" to "1.6.53"
packages/x86-64-v3-poky-linux/libpng/libpng-locale: PKGV changed from 1.6.51 [default] to 1.6.53 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: PV changed from "1.6.51" to "1.6.53"
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: PKGSIZE changed from 2445841 to 2447245 (+0%)
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: PKGV changed from 1.6.51 [default] to 1.6.53 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-src: PV changed from "1.6.51" to "1.6.53"
packages/x86-64-v3-poky-linux/libpng/libpng-src: FILELIST: directory renamed /usr/src/debug/libpng/1.6.51 -> /usr/src/debug/libpng/1.6.53, directory renamed /usr/src/debug/libpng/1.6.51/contrib/libtests -> /usr/src/debug/libpng/1.6.53/contrib/libtests, directory renamed /usr/src/debug/libpng/1.6.51/contrib/tools -> /usr/src/debug/libpng/1.6.53/contrib/tools
packages/x86-64-v3-poky-linux/libpng/libpng-src: PKGSIZE changed from 2049213 to 2050617 (+0%)
packages/x86-64-v3-poky-linux/libpng/libpng-src: PKGV changed from 1.6.51 [default] to 1.6.53 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-staticdev: PV changed from "1.6.51" to "1.6.53"
packages/x86-64-v3-poky-linux/libpng/libpng-staticdev: PKGV changed from 1.6.51 [default] to 1.6.53 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-tools: PV changed from "1.6.51" to "1.6.53"
packages/x86-64-v3-poky-linux/libpng/libpng-tools: PKGV changed from 1.6.51 [default] to 1.6.53 [default]
packages/x86-64-v3-poky-linux/libpng/libpng: PV changed from "1.6.51" to "1.6.53"
packages/x86-64-v3-poky-linux/libpng/libpng: FILELIST: removed "/usr/lib/libpng16.so.16.51.0", added "/usr/lib/libpng16.so.16.53.0"
packages/x86-64-v3-poky-linux/libpng/libpng: PKGV changed from 1.6.51 [default] to 1.6.53 [default]
Changes to packages/x86-64-v3-poky-linux/libpng (sysroot):
  /usr/lib/libpng16.so.16 changed symlink target from libpng16.so.16.51.0 to libpng16.so.16.53.0
  /usr/lib/libpng16.so changed symlink target from libpng16.so.16.51.0 to libpng16.so.16.53.0
  /usr/lib/libpng16.so.16.51.0 moved to /usr/lib/libpng16.so.16.53.0

--===============2589349084804816612==--

