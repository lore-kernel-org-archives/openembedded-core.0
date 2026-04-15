Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FEDAF428FF
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:54 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19729.1776261867843336968
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kQge56HV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=p5NwbbYK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019d917579ce-5091de92-f72f-435e-b7bb-b1339735e767-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261888;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=U/c53KR2vT9OCLBZYRUDz4eHYxuy7BET8o4KPX3xWaI=;
	b=kQge56HVtbVkeOO9bdJw1Lh5LHdUZqYUXy7dJC9hOJSNhE8SeYCRQiEX5vE21VIB
	xK6oYMwZaHBuDl11RD1jSCUatgdSjw0dMOB4D1tHBO0hiMXr1XS+9lBpbs0zI3D/5RH
	3tajuxDCyYDEEsErQvCERAUq/NZcH0ChqOczbF5w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261888;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=U/c53KR2vT9OCLBZYRUDz4eHYxuy7BET8o4KPX3xWaI=;
	b=p5NwbbYK+3e6CcBk/SvpFj1vjIvYQH1kcowmWmS5Cws/G4QhqxNbuW92HxAmYS7O
	UzXFO9E+14tTDbtlqXco7fN2/4Us+LbXhazqe1UDZgK+UcmUTDlst5mBqoOnAhdIK0X
	ys8Hv6Iaap5hPkno4AySNVqh3aVrULxRNqawFFfQ=
Content-Type: multipart/mixed; boundary="===============0930434413643725316=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk4: upgrading to 4.22.2 SUCCEEDED
Message-ID: <0101019d917579ce-5091de92-f72f-435e-b7bb-b1339735e767-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235271

--===============0930434413643725316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gtk4* to *4.22.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gtk4-upgrade-4.22.1-4.22.2.patch
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
From a09ef6ace74fc7ee83cadac746ed39acf5ee04e1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 11:45:19 +0000
Subject: [PATCH] gtk4: upgrade 4.22.1 -> 4.22.2

---
 meta/recipes-gnome/gtk+/{gtk4_4.22.1.bb => gtk4_4.22.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.22.1.bb => gtk4_4.22.2.bb} (97%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb b/meta/recipes-gnome/gtk+/gtk4_4.22.2.bb
similarity index 97%
rename from meta/recipes-gnome/gtk+/gtk4_4.22.1.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.22.2.bb
index bbe595c376..f2cef8d13a 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.22.2.bb
@@ -33,7 +33,7 @@ LIC_FILES_CHKSUM = " \
     file://tests/testgtk.c;endline=25;md5=49d06770681b8322466b52ed19d29fb2 \
 "
 
-SRC_URI[archive.sha256sum] = "cd7b5a9c41127da6fb321c5a842ad73c62e6996f9ce3f1960ca509f6559d55fc"
+SRC_URI[archive.sha256sum] = "b1c987370a0c30780cde351bdbee02eef816728f1c1c2ec7c8093281c0709ee8"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.47.1


--===============0930434413643725316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.2200.1", added "/usr/lib/libgtk-4.so.1.2200.2"
Changes to packages/x86-64-v3-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.2200.1 to libgtk-4.so.1.2200.2
  /usr/lib/libgtk-4.so.1.2200.1 moved to /usr/lib/libgtk-4.so.1.2200.2

--===============0930434413643725316==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk4-upgrade-4.22.1-4.22.2.patch"

RnJvbSBhMDllZjZhY2U3NGZjN2VlODNjYWRhYzc0NmVkMzlhY2Y1ZWUwNGUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMTE6NDU6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
dGs0OiB1cGdyYWRlIDQuMjIuMSAtPiA0LjIyLjIKCi0tLQogbWV0YS9yZWNpcGVzLWdub21lL2d0
aysve2d0azRfNC4yMi4xLmJiID0+IGd0azRfNC4yMi4yLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1n
bm9tZS9ndGsrL3tndGs0XzQuMjIuMS5iYiA9PiBndGs0XzQuMjIuMi5iYn0gKDk3JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjIuMS5iYiBiL21ldGEvcmVj
aXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMi4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMi4xLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjIuMi5iYgppbmRleCBiYmU1OTVjMzc2Li5m
MmNlZjhkMTNhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjIu
MS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjIuMi5iYgpAQCAtMzMs
NyArMzMsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gIiBcCiAgICAgZmlsZTovL3Rlc3RzL3Rlc3Rn
dGsuYztlbmRsaW5lPTI1O21kNT00OWQwNjc3MDY4MWI4MzIyNDY2YjUyZWQxOWQyOWZiMiBcCiAi
CiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImNkN2I1YTljNDExMjdkYTZmYjMyMWM1
YTg0MmFkNzNjNjJlNjk5NmY5Y2UzZjE5NjBjYTUwOWY2NTU5ZDU1ZmMiCitTUkNfVVJJW2FyY2hp
dmUuc2hhMjU2c3VtXSA9ICJiMWM5ODczNzBhMGMzMDc4MGNkZTM1MWJkYmVlMDJlZWY4MTY3Mjhm
MWMxYzJlYzdjODA5MzI4MWMwNzA5ZWU4IgogCiBTID0gIiR7VU5QQUNLRElSfS8ke0dOT01FQk59
LSR7UFZ9IgogCi0tIAoyLjQ3LjEKCg==

--===============0930434413643725316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: PKGSIZE changed from 85026728 to 85035248 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: FILELIST: removed "/usr/lib/.debug/libgtk-4.so.1.2200.1", added "/usr/lib/.debug/libgtk-4.so.1.2200.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-dev: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-dev: PKGSIZE changed from 24950341 to 24950519 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-dev: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-doc: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-doc: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ab: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ab: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-af: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-af: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-am: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-am: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-an: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-an: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ang: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ang: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ar: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ar: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-as: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-as: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ast: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ast: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az-ir: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az-ir: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be+latin: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be+latin: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bg: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bg: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn-in: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn-in: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-br: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-br: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bs: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bs: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca+valencia: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca+valencia: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca: PKGSIZE changed from 124998 to 125405 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-crh: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-crh: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cs: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cs: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cy: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cy: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-da: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-da: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-de: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-de: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-dz: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-dz: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-el: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-el: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en+shaw: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en+shaw: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-ca: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-ca: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-gb: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-gb: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eo: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eo: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-es: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-es: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-et: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-et: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eu: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eu: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fa: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fa: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fi: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fi: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fr: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fr: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fur: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fur: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ga: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ga: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gd: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gd: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gl: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gl: PKGSIZE changed from 124201 to 124805 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gl: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gu: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gu: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-he: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-he: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hi: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hi: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hr: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hr: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hu: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hu: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hy: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hy: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ia: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ia: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-id: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-id: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ie: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ie: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-io: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-io: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-is: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-is: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-it: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-it: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ja: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ja: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ka: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ka: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kab: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kab: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kk: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kk: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-km: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-km: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kn: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kn: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ko: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ko: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ku: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ku: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ky: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ky: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lg: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lg: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-li: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-li: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lt: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lt: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lv: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lv: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mai: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mai: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mi: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mi: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mjw: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mjw: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mk: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mk: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ml: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ml: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mn: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mn: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mr: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mr: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ms: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ms: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-my: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-my: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nb: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nb: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nds: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nds: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ne: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ne: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nl: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nl: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nn: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nn: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nso: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nso: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-oc: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-oc: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-or: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-or: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pa: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pa: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pl: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pl: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ps: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ps: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt-br: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt-br: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ro: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ro: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ru: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ru: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-rw: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-rw: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-si: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-si: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sk: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sk: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sl: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sl: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sq: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sq: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+ije: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+ije: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+latin: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+latin: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr: PKGSIZE changed from 148314 to 150117 (+1%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sv: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sv: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ta: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ta: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-te: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-te: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tg: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tg: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-th: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-th: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tr: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tr: PKGSIZE changed from 121813 to 121812 (-0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tr: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tt: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tt: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ug: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ug: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uk: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uk: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ur: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ur: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-vi: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-vi: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-wa: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-wa: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-xh: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-xh: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-yi: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-yi: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-cn: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-cn: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-hk: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-hk: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-tw: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-tw: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: PKGSIZE changed from 52203996 to 52202789 (-0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: FILELIST: directory renamed /usr/src/debug/gtk4/4.22.1/testsuite/reftests -> /usr/src/debug/gtk4/4.22.2/testsuite/reftests, directory renamed /usr/src/debug/gtk4/4.22.1/tools -> /usr/src/debug/gtk4/4.22.2/tools, directory renamed /usr/src/debug/gtk4/4.22.1/gdk/x11 -> /usr/src/debug/gtk4/4.22.2/gdk/x11, directory renamed /usr/src/debug/gtk4/4.22.1/gtk -> /usr/src/debug/gtk4/4.22.2/gtk, directory renamed /usr/src/debug/gtk4/4.22.1/gtk/media -> /usr/src/debug/gtk4/4.22.2/gtk/media, directory renamed /usr/src/debug/gtk4/4.22.1/gtk/css -> /usr/src/debug/gtk4/4.22.2/gtk/css, directory renamed /usr/src/debug/gtk4/4.22.1/gdk/loaders -> /usr/src/debug/gtk4/4.22.2/gdk/loaders, directory renamed /usr/src/debug/gtk4/4.22.1/gsk/gl -> /usr/src/debug/gtk4/4.22.2/gsk/gl, directory renamed /usr/src/debug/gtk4/4.22.1/gsk/gpu/shaders -> /usr/src/debug/gtk4/4.22.2/gsk/gpu/shaders, directory renamed /usr/src/debug/gtk4/4.22.1/gdk -> /usr/src/debug/gtk4/4.22.2/
 gdk, directory renamed /usr/src/debug/gtk4/4.22.1/gtk/timsort -> /usr/src/debug/gtk4/4.22.2/gtk/timsort, directory renamed /usr/src/debug/gtk4/4.22.1/gsk/gpu -> /usr/src/debug/gtk4/4.22.2/gsk/gpu, directory renamed /usr/src/debug/gtk4/4.22.1/gdk/wayland -> /usr/src/debug/gtk4/4.22.2/gdk/wayland, directory renamed /usr/src/debug/gtk4/4.22.1/gtk/inspector -> /usr/src/debug/gtk4/4.22.2/gtk/inspector, directory renamed /usr/src/debug/gtk4/4.22.1/gdk/deprecated -> /usr/src/debug/gtk4/4.22.2/gdk/deprecated, directory renamed /usr/src/debug/gtk4/4.22.1/gtk/deprecated -> /usr/src/debug/gtk4/4.22.2/gtk/deprecated, directory renamed /usr/src/debug/gtk4/4.22.1/gtk/a11y/atspi -> /usr/src/debug/gtk4/4.22.2/gtk/a11y/atspi, directory renamed /usr/src/debug/gtk4/4.22.1/gsk -> /usr/src/debug/gtk4/4.22.2/gsk, directory renamed /usr/src/debug/gtk4/4.22.1/gtk/a11y -> /usr/src/debug/gtk4/4.22.2/gtk/a11y, directory renamed /usr/src/debug/gtk4/4.22.1/gtk/print/backends -> /usr/src/debug/gtk4/4.22.2/gtk/pr
 int/backends, directory renamed /usr/src/debug/gtk4/4.22.1/gtk/roaring -> /usr/src/debug/gtk4/4.22.2/gtk/roaring, directory renamed /usr/src/debug/gtk4/4.22.1/gtk/print -> /usr/src/debug/gtk4/4.22.2/gtk/print
packages/x86-64-v3-poky-linux/gtk4/gtk4-staticdev: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-staticdev: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4: PV changed from "4.22.1" to "4.22.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.2200.1", added "/usr/lib/libgtk-4.so.1.2200.2"
packages/x86-64-v3-poky-linux/gtk4: SRC_URI changed from "https://download.gnome.org/sources//gtk/4.22/gtk-4.22.1.tar.xz;name=archive" to "https://download.gnome.org/sources//gtk/4.22/gtk-4.22.2.tar.xz;name=archive"
packages/x86-64-v3-poky-linux/gtk4: PKGV changed from 4.22.1 [default] to 4.22.2 [default]
packages/x86-64-v3-poky-linux/gtk4: PV changed from "4.22.1" to "4.22.2"
Changes to packages/x86-64-v3-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.2200.1 to libgtk-4.so.1.2200.2
  /usr/lib/libgtk-4.so.1.2200.1 moved to /usr/lib/libgtk-4.so.1.2200.2

--===============0930434413643725316==--

