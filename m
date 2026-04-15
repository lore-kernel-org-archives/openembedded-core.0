Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC855F43838
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:56 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19830.1776261891667309223
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=MZZwM5Eu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BM6L+dFs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019d91758adb-e9af4da5-eacd-4917-b491-e63c4a93fcd3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261892;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aOtu+KGepXSoTl+H60BIWzjib/P9jx+zLNV4JmFi7q0=;
	b=MZZwM5EuR3cDpxw+tPhhwqZ6OTibkLx8W09+ajdxsNUbfQbv6jF4tlEisaO7RS7x
	MVQMCoJy1VccUnYshHbnBeyi+scwIUFve7P5bJQjCX7EK2MSIMCjNqOGtIAz60uJXvo
	NBrVwDJoozHCXcfuQ/saMbAWMv13h6zDN+Yxly/Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261892;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aOtu+KGepXSoTl+H60BIWzjib/P9jx+zLNV4JmFi7q0=;
	b=BM6L+dFsXi0ScovUnUoOMeXQrFsSnbi4+Sei7O2YMki7dpQJSna+kv3FJ6Bojutg
	wsBLct3WOO2wF4fCouZye94YzTNBzk6GsvMoUeBX7qNa+jgtSsT2vUgPG24silAJpfn
	E26FJMvIQKBlGA8yS8z/cS8FXEEAev2NhzBIYfYA=
Content-Type: multipart/mixed; boundary="===============8724092768125777213=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libpng: upgrading to 1.6.57 SUCCEEDED
Message-ID: <0101019d91758adb-e9af4da5-eacd-4917-b491-e63c4a93fcd3-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235291

--===============8724092768125777213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libpng* to *1.6.57* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpng-upgrade-1.6.56-1.6.57.patch
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
From c8a958810b52839db9131b010ed5db033300f8af Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 12:49:01 +0000
Subject: [PATCH] libpng: upgrade 1.6.56 -> 1.6.57

---
 .../libpng/{libpng_1.6.56.bb => libpng_1.6.57.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.56.bb => libpng_1.6.57.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.56.bb b/meta/recipes-multimedia/libpng/libpng_1.6.57.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.56.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.57.bb
index 7ede0a6c8b..e63607f2b3 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.56.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.57.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "f7d8bf1601b7804f583a254ab343a6549ca6cf27d255c302c47af2d9d36a6f18"
+SRC_URI[sha256sum] = "d10c20d7171569804cae8dfc13ba6dcd0662c41ed39d43d4d429314aafb10a80"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.47.1


--===============8724092768125777213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libpng/libpng-ptest: FILELIST: added "/usr/lib/libpng/ptest/src/pnggetset /usr/lib/libpng/ptest/src/tests/pnggetset"
packages/x86-64-v3-poky-linux/libpng/libpng: FILELIST: removed "/usr/lib/libpng16.so.16.56.0", added "/usr/lib/libpng16.so.16.57.0"
Changes to packages/x86-64-v3-poky-linux/libpng (sysroot):
  /usr/lib/libpng16.so.16 changed symlink target from libpng16.so.16.56.0 to libpng16.so.16.57.0
  /usr/lib/libpng16.so changed symlink target from libpng16.so.16.56.0 to libpng16.so.16.57.0
  /usr/lib/libpng16.so.16.56.0 moved to /usr/lib/libpng16.so.16.57.0

--===============8724092768125777213==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpng-upgrade-1.6.56-1.6.57.patch"

RnJvbSBjOGE5NTg4MTBiNTI4MzlkYjkxMzFiMDEwZWQ1ZGIwMzMzMDBmOGFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMTI6NDk6MDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwbmc6IHVwZ3JhZGUgMS42LjU2IC0+IDEuNi41NwoKLS0tCiAuLi4vbGlicG5nL3tsaWJwbmdf
MS42LjU2LmJiID0+IGxpYnBuZ18xLjYuNTcuYmJ9ICAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9saWJwbmcve2xpYnBuZ18xLjYuNTYuYmIgPT4gbGlicG5nXzEuNi41
Ny5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJwbmcv
bGlicG5nXzEuNi41Ni5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy9saWJwbmdf
MS42LjU3LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2xpYnBuZy9saWJwbmdfMS42LjU2LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9saWJwbmcvbGlicG5nXzEuNi41Ny5iYgppbmRleCA3ZWRlMGE2YzhiLi5lNjM2
MDdmMmIzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJwbmcvbGlicG5n
XzEuNi41Ni5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJwbmcvbGlicG5nXzEu
Ni41Ny5iYgpAQCAtMTQsNyArMTQsNyBAQCBTUkNfVVJJID0gIiR7U09VUkNFRk9SR0VfTUlSUk9S
fS8ke0JQTn0vJHtCUE59JHtMSUJWfS8ke0JQfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8v
cnVuLXB0ZXN0IFwKICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImY3ZDhiZjE2MDFiNzgwNGY1
ODNhMjU0YWIzNDNhNjU0OWNhNmNmMjdkMjU1YzMwMmM0N2FmMmQ5ZDM2YTZmMTgiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiZDEwYzIwZDcxNzE1Njk4MDRjYWU4ZGZjMTNiYTZkY2QwNjYyYzQxZWQz
OWQ0M2Q0ZDQyOTMxNGFhZmIxMGE4MCIKIAogTUlSUk9SUyArPSAiJHtTT1VSQ0VGT1JHRV9NSVJS
T1J9L3Byb2plY3QvJHtCUE59LyR7QlBOfSR7TElCVn0vICR7U09VUkNFRk9SR0VfTUlSUk9SfS9w
cm9qZWN0LyR7QlBOfS8ke0JQTn0ke0xJQlZ9L29sZGVyLXJlbGVhc2VzLyIKIAotLSAKMi40Ny4x
Cgo=

--===============8724092768125777213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libpng: PV changed from "1.6.56" to "1.6.57"
packages/x86-64-v3-poky-linux/libpng: PKGV changed from 1.6.56 [default] to 1.6.57 [default]
packages/x86-64-v3-poky-linux/libpng: SRC_URI changed from "https://downloads.sourceforge.net/libpng/libpng16/libpng-1.6.56.tar.xz file://run-ptest" to "https://downloads.sourceforge.net/libpng/libpng16/libpng-1.6.57.tar.xz file://run-ptest"
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: PV changed from "1.6.56" to "1.6.57"
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: FILELIST: removed "/usr/lib/.debug/libpng16.so.16.56.0", added "/usr/lib/.debug/libpng16.so.16.57.0 /usr/lib/libpng/ptest/src/.debug/pnggetset"
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: PKGV changed from 1.6.56 [default] to 1.6.57 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: PKGSIZE changed from 1606008 to 1646064 (+2%)
packages/x86-64-v3-poky-linux/libpng/libpng-dev: PV changed from "1.6.56" to "1.6.57"
packages/x86-64-v3-poky-linux/libpng/libpng-dev: PKGV changed from 1.6.56 [default] to 1.6.57 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-doc: PV changed from "1.6.56" to "1.6.57"
packages/x86-64-v3-poky-linux/libpng/libpng-doc: PKGV changed from 1.6.56 [default] to 1.6.57 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-doc: PKGSIZE changed from 268133 to 268130 (-0%)
packages/x86-64-v3-poky-linux/libpng/libpng-locale: PV changed from "1.6.56" to "1.6.57"
packages/x86-64-v3-poky-linux/libpng/libpng-locale: PKGV changed from 1.6.56 [default] to 1.6.57 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: PV changed from "1.6.56" to "1.6.57"
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: FILELIST: added "/usr/lib/libpng/ptest/src/pnggetset /usr/lib/libpng/ptest/src/tests/pnggetset"
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: PKGV changed from 1.6.56 [default] to 1.6.57 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: PKGSIZE changed from 2516635 to 2539993 (+1%)
packages/x86-64-v3-poky-linux/libpng/libpng-src: PV changed from "1.6.56" to "1.6.57"
packages/x86-64-v3-poky-linux/libpng/libpng-src: FILELIST: directory renamed /usr/src/debug/libpng/1.6.56/contrib/tools -> /usr/src/debug/libpng/1.6.57/contrib/tools, directory renamed /usr/src/debug/libpng/1.6.56 -> /usr/src/debug/libpng/1.6.57, removed "/usr/src/debug/libpng/1.6.56/contrib/libtests/pngvalid.c /usr/src/debug/libpng/1.6.56/contrib/libtests/pngimage.c /usr/src/debug/libpng/1.6.56/contrib/libtests/pngstest.c /usr/src/debug/libpng/1.6.56/contrib/libtests/pngstest-errors.h /usr/src/debug/libpng/1.6.56/contrib/libtests/pngunknown.c /usr/src/debug/libpng/1.6.56/contrib/libtests/timepng.c", added "/usr/src/debug/libpng/1.6.57/contrib/libtests/pngvalid.c /usr/src/debug/libpng/1.6.57/contrib/libtests/pngstest.c /usr/src/debug/libpng/1.6.57/contrib/libtests/pngimage.c /usr/src/debug/libpng/1.6.57/contrib/libtests/pngstest-errors.h /usr/src/debug/libpng/1.6.57/contrib/libtests/pnggetset.c /usr/src/debug/libpng/1.6.57/contrib/libtests/pngunknown.c /usr/src/debug/libpng/1.6.57/co
 ntrib/libtests/timepng.c"
packages/x86-64-v3-poky-linux/libpng/libpng-src: PKGV changed from 1.6.56 [default] to 1.6.57 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-src: PKGSIZE changed from 2145398 to 2165910 (+1%)
packages/x86-64-v3-poky-linux/libpng/libpng-staticdev: PV changed from "1.6.56" to "1.6.57"
packages/x86-64-v3-poky-linux/libpng/libpng-staticdev: PKGV changed from 1.6.56 [default] to 1.6.57 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-tools: PV changed from "1.6.56" to "1.6.57"
packages/x86-64-v3-poky-linux/libpng/libpng-tools: PKGV changed from 1.6.56 [default] to 1.6.57 [default]
packages/x86-64-v3-poky-linux/libpng/libpng: PV changed from "1.6.56" to "1.6.57"
packages/x86-64-v3-poky-linux/libpng/libpng: FILELIST: removed "/usr/lib/libpng16.so.16.56.0", added "/usr/lib/libpng16.so.16.57.0"
packages/x86-64-v3-poky-linux/libpng/libpng: PKGV changed from 1.6.56 [default] to 1.6.57 [default]
Changes to packages/x86-64-v3-poky-linux/libpng (sysroot):
  /usr/lib/libpng16.so.16 changed symlink target from libpng16.so.16.56.0 to libpng16.so.16.57.0
  /usr/lib/libpng16.so changed symlink target from libpng16.so.16.56.0 to libpng16.so.16.57.0
  /usr/lib/libpng16.so.16.56.0 moved to /usr/lib/libpng16.so.16.57.0

--===============8724092768125777213==--

