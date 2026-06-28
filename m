Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CEBC43638
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 05:32:31 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67986.1782624740808816870
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2026 22:32:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=oj31xAYJ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=32aEvuZl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019f0cb6eb9c-8b671d01-a634-48cb-a7e7-9793daa89860-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782624742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=r5i+P2lldIJ7htpfX6NnTSZ+HmQ0G4+x37agHTNVj1Y=;
	b=oj31xAYJcuZongXzQArfJXFrOwhkS6U/Gw3vtOTE4xr1oRu4wu+xbQ+YxuyHGqw6
	6ys1UFaDWgEDkhlR6/bz41rCBjPscxxmvOLxT/IlZIe9aGlMV1z1GvIHO3TmQH5hQi8
	uipumkjj3QmKZbkiSWibi4DgkjQOmRQLAMrYFMBU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782624742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=r5i+P2lldIJ7htpfX6NnTSZ+HmQ0G4+x37agHTNVj1Y=;
	b=32aEvuZl6gULbGFZqKqwax2osewFXsA8WslK6cacfHi4krWpOxeZBFpylz2zLhHE
	OqvnicuDzYnJhq7DMsC52FHkfiV2GYRtggR1fzsVtWo/S1byAlFhTkZmcGTZVn3Z6c4
	+0LSoEklKVu9eGGtRYefwq1uAGNXoo+DP4y7a/ck=
Content-Type: multipart/mixed; boundary="===============6497997981259108725=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] at-spi2-core: upgrading to 2.60.5 SUCCEEDED
Message-ID: <0101019f0cb6eb9c-8b671d01-a634-48cb-a7e7-9793daa89860-000000@us-west-2.amazonses.com>
Date: Sun, 28 Jun 2026 05:32:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.28-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2026 05:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239705

--===============6497997981259108725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *at-spi2-core* to *2.60.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-at-spi2-core-upgrade-2.60.4-2.60.5.patch
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
From 8fb3afedbe3fcde8dbe99416a6fb3bc3ef6675bf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 28 Jun 2026 05:29:43 +0000
Subject: [PATCH] at-spi2-core: upgrade 2.60.4 -> 2.60.5

---
 .../atk/{at-spi2-core_2.60.4.bb => at-spi2-core_2.60.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.60.4.bb => at-spi2-core_2.60.5.bb} (94%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.60.4.bb b/meta/recipes-support/atk/at-spi2-core_2.60.5.bb
similarity index 94%
rename from meta/recipes-support/atk/at-spi2-core_2.60.4.bb
rename to meta/recipes-support/atk/at-spi2-core_2.60.5.bb
index 5068cb82fe..f6bff0bc32 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.60.4.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.60.5.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 CVE_PRODUCT += "at-spi2-atk"
 
-SRC_URI[archive.sha256sum] = "1a1f5ba9805917f41fc6aa6823dcf887a291d607a427e2d5afb6b5dfa65070c7"
+SRC_URI[archive.sha256sum] = "6059a77d507438ff6c8d6d06025f8f9f5774fa0f8eabe9c9b059b1cc41e1bbc0"
 
 DEPENDS = " \
 	dbus \
-- 
2.47.1


--===============6497997981259108725==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-at-spi2-core-upgrade-2.60.4-2.60.5.patch"

RnJvbSA4ZmIzYWZlZGJlM2ZjZGU4ZGJlOTk0MTZhNmZiM2JjM2VmNjY3NWJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMjggSnVuIDIwMjYgMDU6Mjk6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
dC1zcGkyLWNvcmU6IHVwZ3JhZGUgMi42MC40IC0+IDIuNjAuNQoKLS0tCiAuLi4vYXRrL3thdC1z
cGkyLWNvcmVfMi42MC40LmJiID0+IGF0LXNwaTItY29yZV8yLjYwLjUuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9hdGsve2F0LXNwaTItY29yZV8yLjYwLjQuYmIgPT4gYXQtc3Bp
Mi1jb3JlXzIuNjAuNS5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9hdGsvYXQtc3BpMi1jb3JlXzIuNjAuNC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9h
dC1zcGkyLWNvcmVfMi42MC41LmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9hdC1zcGkyLWNvcmVfMi42MC40LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9hdGsvYXQtc3BpMi1jb3JlXzIuNjAuNS5iYgppbmRleCA1MDY4
Y2I4MmZlLi5mNmJmZjBiYzMyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hdGsv
YXQtc3BpMi1jb3JlXzIuNjAuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hdGsvYXQt
c3BpMi1jb3JlXzIuNjAuNS5iYgpAQCAtOSw3ICs5LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMiCiAKIENW
RV9QUk9EVUNUICs9ICJhdC1zcGkyLWF0ayIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0g
PSAiMWExZjViYTk4MDU5MTdmNDFmYzZhYTY4MjNkY2Y4ODdhMjkxZDYwN2E0MjdlMmQ1YWZiNmI1
ZGZhNjUwNzBjNyIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjYwNTlhNzdkNTA3NDM4
ZmY2YzhkNmQwNjAyNWY4ZjlmNTc3NGZhMGY4ZWFiZTljOWIwNTliMWNjNDFlMWJiYzAiCiAKIERF
UEVORFMgPSAiIFwKIAlkYnVzIFwKLS0gCjIuNDcuMQoK

--===============6497997981259108725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dbg: PKGSIZE changed from 2480128 to 2479904 (-0%)
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dbg: FILELIST: removed "/usr/lib/.debug/libatk-1.0.so.0.26013.1", added "/usr/lib/.debug/libatk-1.0.so.0.26014.1"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dbg: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dbg: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dev: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dev: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-doc: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-doc: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ab: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ab: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-af: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-af: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-am: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-am: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-an: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-an: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ar: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ar: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-as: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-as: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ast: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ast: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-az: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-az: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-be+latin: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-be+latin: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-be: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-be: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bg: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bg: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bn-in: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bn-in: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bn: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bn: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bs: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bs: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ca+valencia: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ca+valencia: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ca: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ca: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ckb: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ckb: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-cs: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-cs: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-cy: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-cy: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-da: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-da: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-de: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-de: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-dz: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-dz: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-el: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-el: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-en+shaw: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-en+shaw: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-en-ca: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-en-ca: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-en-gb: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-en-gb: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-eo: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-eo: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-es: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-es: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-et: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-et: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-eu: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-eu: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fa: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fa: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fi: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fi: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fr: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fr: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fur: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fur: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ga: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ga: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-gd: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-gd: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-gl: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-gl: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-gu: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-gu: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-he: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-he: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hi: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hi: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hr: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hr: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hu: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hu: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hy: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hy: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-id: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-id: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-is: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-is: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-it: PKGSIZE changed from 10936 to 11406 (+4%)
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-it: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-it: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ja: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ja: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ka: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ka: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-kab: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-kab: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-kk: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-kk: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-km: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-km: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-kn: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-kn: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ko: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ko: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ku: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ku: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-li: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-li: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-lo: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-lo: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-lt: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-lt: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-lv: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-lv: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mai: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mai: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mk: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mk: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ml: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ml: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mn: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mn: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mr: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mr: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ms: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ms: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-nb: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-nb: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ne: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ne: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-nl: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-nl: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-nn: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-nn: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-oc: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-oc: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-or: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-or: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pa: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pa: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pl: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pl: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ps: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ps: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pt-br: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pt-br: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pt: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pt: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ro: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ro: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ru: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ru: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-rw: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-rw: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-si: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-si: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sk: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sk: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sl: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sl: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sq: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sq: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sr+ije: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sr+ije: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sr+latin: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sr+latin: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sr: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sr: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sv: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sv: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ta: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ta: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-te: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-te: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tg: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tg: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-th: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-th: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tk: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tk: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tr: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tr: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tt: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tt: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ug: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ug: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-uk: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-uk: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-uz+cyrillic: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-uz+cyrillic: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-uz: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-uz: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-vi: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-vi: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-wa: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-wa: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-xh: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-xh: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-yi: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-yi: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zh-cn: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zh-cn: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zh-hk: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zh-hk: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zh-tw: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zh-tw: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zu: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zu: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-src: PKGSIZE changed from 2129021 to 2129117 (+0%)
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-src: FILELIST: directory renamed /usr/src/debug/at-spi2-core/2.60.4/registryd -> /usr/src/debug/at-spi2-core/2.60.5/registryd, directory renamed /usr/src/debug/at-spi2-core/2.60.4/xml -> /usr/src/debug/at-spi2-core/2.60.5/xml, directory renamed /usr/src/debug/at-spi2-core/2.60.4/atk -> /usr/src/debug/at-spi2-core/2.60.5/atk, directory renamed /usr/src/debug/at-spi2-core/2.60.4/atk-adaptor -> /usr/src/debug/at-spi2-core/2.60.5/atk-adaptor, directory renamed /usr/src/debug/at-spi2-core/2.60.4/droute -> /usr/src/debug/at-spi2-core/2.60.5/droute, directory renamed /usr/src/debug/at-spi2-core/2.60.4/atspi -> /usr/src/debug/at-spi2-core/2.60.5/atspi, directory renamed /usr/src/debug/at-spi2-core/2.60.4/atk-adaptor/adaptors -> /usr/src/debug/at-spi2-core/2.60.5/atk-adaptor/adaptors, directory renamed /usr/src/debug/at-spi2-core/2.60.4/bus -> /usr/src/debug/at-spi2-core/2.60.5/bus, directory renamed /usr/src/debug/at-spi2-core/2.60.4/db
 ind -> /usr/src/debug/at-spi2-core/2.60.5/dbind, directory renamed /usr/src/debug/at-spi2-core/2.60.4/atk-adaptor/gtk-2.0 -> /usr/src/debug/at-spi2-core/2.60.5/atk-adaptor/gtk-2.0
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-src: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-src: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-staticdev: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-staticdev: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core: FILELIST: removed "/usr/lib/libatk-1.0.so.0.26013.1", added "/usr/lib/libatk-1.0.so.0.26014.1"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core: PV changed from "2.60.4" to "2.60.5"
packages/x86-64-v3-poky-linux/at-spi2-core: SRC_URI changed from "https://download.gnome.org/sources//at-spi2-core/2.60/at-spi2-core-2.60.4.tar.xz;name=archive" to "https://download.gnome.org/sources//at-spi2-core/2.60/at-spi2-core-2.60.5.tar.xz;name=archive"
packages/x86-64-v3-poky-linux/at-spi2-core: PKGV changed from 2.60.4 [default] to 2.60.5 [default]
packages/x86-64-v3-poky-linux/at-spi2-core: PV changed from "2.60.4" to "2.60.5"
Changes to packages/x86-64-v3-poky-linux/at-spi2-core (sysroot):
  /usr/lib/libatk-1.0.so.0 changed symlink target from libatk-1.0.so.0.26013.1 to libatk-1.0.so.0.26014.1
  /usr/lib/libatk-1.0.so.0.26013.1 moved to /usr/lib/libatk-1.0.so.0.26014.1

--===============6497997981259108725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core: FILELIST: removed "/usr/lib/libatk-1.0.so.0.26013.1", added "/usr/lib/libatk-1.0.so.0.26014.1"
Changes to packages/x86-64-v3-poky-linux/at-spi2-core (sysroot):
  /usr/lib/libatk-1.0.so.0 changed symlink target from libatk-1.0.so.0.26013.1 to libatk-1.0.so.0.26014.1
  /usr/lib/libatk-1.0.so.0.26013.1 moved to /usr/lib/libatk-1.0.so.0.26014.1

--===============6497997981259108725==--

