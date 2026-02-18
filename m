Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A665C531F4
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:42:01 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1410.1771440094592340505
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=uctHcDkA;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=LbbV6KIw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019c720f049d-80a54c02-68dd-42cd-9d2d-79794522e22e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440112;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=znKZ+9anZA/ugUK+QeNEEfuDpxWawernsAe6vRTCvj4=;
	b=uctHcDkA5d2StgdpCDf6G6Jl3LeBPU83nMufktb2BwQJ/Fxvi4s6x13wLIzKeIQE
	gV/Fr510JdBCQ3siwlDd+w2Tdo+1PseTF9wV2fxPSKOi5SIoBXztqei04vGEDH7q6Um
	NMRHi8i7BH9qRQNIfpVsgsUzThcdyNayVzbMIR/w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440112;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=znKZ+9anZA/ugUK+QeNEEfuDpxWawernsAe6vRTCvj4=;
	b=LbbV6KIw5oLifbKuI2Colz4aKvyJk0pXLOvdncsrmzeL/jZ79TITxOfcw/GnGrGO
	GYtYilThEizjeiHkcjIUJ7zRlvw9BZG55xCLQ8SJzA79jxHkfwxT6pWDyLycESMNStU
	9QxsB98EtceXHRl2b5pypatw4WwBmEz4FCAcJibw=
Content-Type: multipart/mixed; boundary="===============3925969314952336161=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libpng: upgrading to 1.6.55 SUCCEEDED
Message-ID: <0101019c720f049d-80a54c02-68dd-42cd-9d2d-79794522e22e-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231393

--===============3925969314952336161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libpng* to *1.6.55* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpng-upgrade-1.6.54-1.6.55.patch
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
From 6f4405da83259860b4f46ad2a7b8299c7fb72f4f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 16:15:05 +0000
Subject: [PATCH] libpng: upgrade 1.6.54 -> 1.6.55

---
 .../libpng/{libpng_1.6.54.bb => libpng_1.6.55.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.54.bb => libpng_1.6.55.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.54.bb b/meta/recipes-multimedia/libpng/libpng_1.6.55.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.54.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.55.bb
index b017be513b..c6e95e0723 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.54.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.55.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "01c9d8a303c941ec2c511c14312a3b1d36cedb41e2f5168ccdaa85d53b887805"
+SRC_URI[sha256sum] = "d925722864837ad5ae2a82070d4b2e0603dc72af44bd457c3962298258b8e82d"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.47.1


--===============3925969314952336161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libpng/libpng: FILELIST: removed "/usr/lib/libpng16.so.16.54.0", added "/usr/lib/libpng16.so.16.55.0"
Changes to packages/x86-64-v3-poky-linux/libpng (sysroot):
  /usr/lib/libpng16.so.16 changed symlink target from libpng16.so.16.54.0 to libpng16.so.16.55.0
  /usr/lib/libpng16.so changed symlink target from libpng16.so.16.54.0 to libpng16.so.16.55.0
  /usr/lib/libpng16.so.16.54.0 moved to /usr/lib/libpng16.so.16.55.0

--===============3925969314952336161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libpng: PV changed from "1.6.54" to "1.6.55"
packages/x86-64-v3-poky-linux/libpng: SRC_URI changed from "https://downloads.sourceforge.net/libpng/libpng16/libpng-1.6.54.tar.xz file://run-ptest" to "https://downloads.sourceforge.net/libpng/libpng16/libpng-1.6.55.tar.xz file://run-ptest"
packages/x86-64-v3-poky-linux/libpng: PKGV changed from 1.6.54 [default] to 1.6.55 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: PV changed from "1.6.54" to "1.6.55"
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: PKGV changed from 1.6.54 [default] to 1.6.55 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: FILELIST: removed "/usr/lib/.debug/libpng16.so.16.54.0", added "/usr/lib/.debug/libpng16.so.16.55.0"
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: PKGSIZE changed from 1558976 to 1559072 (+0%)
packages/x86-64-v3-poky-linux/libpng/libpng-dev: PV changed from "1.6.54" to "1.6.55"
packages/x86-64-v3-poky-linux/libpng/libpng-dev: PKGV changed from 1.6.54 [default] to 1.6.55 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-dev: PKGSIZE changed from 179838 to 179839 (+0%)
packages/x86-64-v3-poky-linux/libpng/libpng-doc: PV changed from "1.6.54" to "1.6.55"
packages/x86-64-v3-poky-linux/libpng/libpng-doc: PKGV changed from 1.6.54 [default] to 1.6.55 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-doc: PKGSIZE changed from 268148 to 268149 (+0%)
packages/x86-64-v3-poky-linux/libpng/libpng-locale: PV changed from "1.6.54" to "1.6.55"
packages/x86-64-v3-poky-linux/libpng/libpng-locale: PKGV changed from 1.6.54 [default] to 1.6.55 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: PV changed from "1.6.54" to "1.6.55"
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: PKGV changed from 1.6.54 [default] to 1.6.55 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: PKGSIZE changed from 2510325 to 2510360 (+0%)
packages/x86-64-v3-poky-linux/libpng/libpng-src: PV changed from "1.6.54" to "1.6.55"
packages/x86-64-v3-poky-linux/libpng/libpng-src: PKGV changed from 1.6.54 [default] to 1.6.55 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-src: FILELIST: directory renamed /usr/src/debug/libpng/1.6.54 -> /usr/src/debug/libpng/1.6.55, directory renamed /usr/src/debug/libpng/1.6.54/contrib/libtests -> /usr/src/debug/libpng/1.6.55/contrib/libtests, directory renamed /usr/src/debug/libpng/1.6.54/contrib/tools -> /usr/src/debug/libpng/1.6.55/contrib/tools
packages/x86-64-v3-poky-linux/libpng/libpng-src: PKGSIZE changed from 2143148 to 2143183 (+0%)
packages/x86-64-v3-poky-linux/libpng/libpng-staticdev: PV changed from "1.6.54" to "1.6.55"
packages/x86-64-v3-poky-linux/libpng/libpng-staticdev: PKGV changed from 1.6.54 [default] to 1.6.55 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-tools: PV changed from "1.6.54" to "1.6.55"
packages/x86-64-v3-poky-linux/libpng/libpng-tools: PKGV changed from 1.6.54 [default] to 1.6.55 [default]
packages/x86-64-v3-poky-linux/libpng/libpng: PV changed from "1.6.54" to "1.6.55"
packages/x86-64-v3-poky-linux/libpng/libpng: PKGV changed from 1.6.54 [default] to 1.6.55 [default]
packages/x86-64-v3-poky-linux/libpng/libpng: FILELIST: removed "/usr/lib/libpng16.so.16.54.0", added "/usr/lib/libpng16.so.16.55.0"
Changes to packages/x86-64-v3-poky-linux/libpng (sysroot):
  /usr/lib/libpng16.so.16 changed symlink target from libpng16.so.16.54.0 to libpng16.so.16.55.0
  /usr/lib/libpng16.so changed symlink target from libpng16.so.16.54.0 to libpng16.so.16.55.0
  /usr/lib/libpng16.so.16.54.0 moved to /usr/lib/libpng16.so.16.55.0

--===============3925969314952336161==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpng-upgrade-1.6.54-1.6.55.patch"

RnJvbSA2ZjQ0MDVkYTgzMjU5ODYwYjRmNDZhZDJhN2I4Mjk5YzdmYjcyZjRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTY6MTU6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwbmc6IHVwZ3JhZGUgMS42LjU0IC0+IDEuNi41NQoKLS0tCiAuLi4vbGlicG5nL3tsaWJwbmdf
MS42LjU0LmJiID0+IGxpYnBuZ18xLjYuNTUuYmJ9ICAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9saWJwbmcve2xpYnBuZ18xLjYuNTQuYmIgPT4gbGlicG5nXzEuNi41
NS5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJwbmcv
bGlicG5nXzEuNi41NC5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy9saWJwbmdf
MS42LjU1LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2xpYnBuZy9saWJwbmdfMS42LjU0LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9saWJwbmcvbGlicG5nXzEuNi41NS5iYgppbmRleCBiMDE3YmU1MTNiLi5jNmU5
NWUwNzIzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJwbmcvbGlicG5n
XzEuNi41NC5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJwbmcvbGlicG5nXzEu
Ni41NS5iYgpAQCAtMTQsNyArMTQsNyBAQCBTUkNfVVJJID0gIiR7U09VUkNFRk9SR0VfTUlSUk9S
fS8ke0JQTn0vJHtCUE59JHtMSUJWfS8ke0JQfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8v
cnVuLXB0ZXN0IFwKICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjAxYzlkOGEzMDNjOTQxZWMy
YzUxMWMxNDMxMmEzYjFkMzZjZWRiNDFlMmY1MTY4Y2NkYWE4NWQ1M2I4ODc4MDUiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiZDkyNTcyMjg2NDgzN2FkNWFlMmE4MjA3MGQ0YjJlMDYwM2RjNzJhZjQ0
YmQ0NTdjMzk2MjI5ODI1OGI4ZTgyZCIKIAogTUlSUk9SUyArPSAiJHtTT1VSQ0VGT1JHRV9NSVJS
T1J9L3Byb2plY3QvJHtCUE59LyR7QlBOfSR7TElCVn0vICR7U09VUkNFRk9SR0VfTUlSUk9SfS9w
cm9qZWN0LyR7QlBOfS8ke0JQTn0ke0xJQlZ9L29sZGVyLXJlbGVhc2VzLyIKIAotLSAKMi40Ny4x
Cgo=

--===============3925969314952336161==--

