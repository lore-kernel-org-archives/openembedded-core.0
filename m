Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48616.1795412254652526416
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:37:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JgHsnScp;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mvqBEeTB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a206e8dc5e-adf92b77-5f55-4f2f-90a6-61585e1a04aa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795412254;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8LDrVTIX2+sWB/qdv70g2vpQbdgoOFM6lvgIB5C4qeg=;
	b=JgHsnScpTisMEx6KnZH6iesbmdJ+DAgWzKWC+IkXG1DU/GPA5OwN48RhyJ+dRmOS
	IMoaDVRCySHj28LU+QTOuCVWZsa5sxYIG1HxyO9mP+UG5vFD/eSWeq1WvCLq88bfRAe
	p1qBmwopjeaBCRa571lHt7rltRFBWrr+SGenQ2sI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795412254;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8LDrVTIX2+sWB/qdv70g2vpQbdgoOFM6lvgIB5C4qeg=;
	b=mvqBEeTBNJZwZDWFZKKpzI6OQR+l9c2H4+eUCxv6/7wn+O8r2mXFx8jJxDITcdoF
	56dWP/hgfBKRZUzs2Mgnn7GY9DpvO4mVzE1TJpDoRSHGG+3t+0T0BkgH/8B+h+gkEiP
	h5pqlcG8dJPKWWoVDaBr9Ru+w/mNgPw0q4kDK6qo=
Content-Type: multipart/mixed; boundary="===============3911559546782008001=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk4: upgrading to 4.24.2 SUCCEEDED
Message-ID: <010101a206e8dc5e-adf92b77-5f55-4f2f-90a6-61585e1a04aa-000000@us-west-2.amazonses.com>
Date: Mon, 23 Nov 2026 05:37:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.23-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 05:37:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250887

--===============3911559546782008001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gtk4* to *4.24.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gtk4-upgrade-4.24.1-4.24.2.patch
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
From 0ed02940401ac305025bf8bf02bcb423174e0b5e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 23 Nov 2026 05:33:54 +0000
Subject: [PATCH] gtk4: upgrade 4.24.1 -> 4.24.2

Changes in 4.24.2, 22-11-2026
-----------------------------
---
 meta/recipes-gnome/gtk+/{gtk4_4.24.1.bb => gtk4_4.24.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.24.1.bb => gtk4_4.24.2.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.24.1.bb b/meta/recipes-gnome/gtk+/gtk4_4.24.2.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.24.1.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.24.2.bb
index 5a18c4bdf9..17e1633b4f 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.24.1.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.24.2.bb
@@ -33,7 +33,7 @@ LIC_FILES_CHKSUM = " \
     file://tests/testgtk.c;endline=25;md5=49d06770681b8322466b52ed19d29fb2 \
 "
 
-SRC_URI[archive.sha256sum] = "e98abe720e16129c8c0f50761dee0a2e9ae2478055e31018f6cf977fcf6513e9"
+SRC_URI[archive.sha256sum] = "05561abc25d1b1400136bf79ab68830cb4b053d1922ae97e551b3f19755bf3cb"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.47.1


--===============3911559546782008001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az: PKGSIZE changed from 7348 to 31229 (+325%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nb: PKGSIZE changed from 94634 to 118160 (+25%)
packages/x86-64-v3-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.2400.1", added "/usr/lib/libgtk-4.so.1.2400.2"
Changes to packages/x86-64-v3-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.2400.1 to libgtk-4.so.1.2400.2
  /usr/lib/libgtk-4.so.1.2400.1 moved to /usr/lib/libgtk-4.so.1.2400.2

--===============3911559546782008001==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk4-upgrade-4.24.1-4.24.2.patch"

RnJvbSAwZWQwMjk0MDQwMWFjMzA1MDI1YmY4YmYwMmJjYjQyMzE3NGUwYjVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMjMgTm92IDIwMjYgMDU6MzM6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
dGs0OiB1cGdyYWRlIDQuMjQuMSAtPiA0LjI0LjIKCkNoYW5nZXMgaW4gNC4yNC4yLCAyMi0xMS0y
MDI2Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCi0tLQogbWV0YS9yZWNpcGVzLWdub21l
L2d0aysve2d0azRfNC4yNC4xLmJiID0+IGd0azRfNC4yNC4yLmJifSB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1nbm9tZS9ndGsrL3tndGs0XzQuMjQuMS5iYiA9PiBndGs0XzQuMjQuMi5iYn0gKDk4JSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjQuMS5iYiBiL21ldGEv
cmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yNC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yNC4xLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjQuMi5iYgppbmRleCA1YTE4YzRiZGY5
Li4xN2UxNjMzYjRmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQu
MjQuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjQuMi5iYgpAQCAt
MzMsNyArMzMsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gIiBcCiAgICAgZmlsZTovL3Rlc3RzL3Rl
c3RndGsuYztlbmRsaW5lPTI1O21kNT00OWQwNjc3MDY4MWI4MzIyNDY2YjUyZWQxOWQyOWZiMiBc
CiAiCiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImU5OGFiZTcyMGUxNjEyOWM4YzBm
NTA3NjFkZWUwYTJlOWFlMjQ3ODA1NWUzMTAxOGY2Y2Y5NzdmY2Y2NTEzZTkiCitTUkNfVVJJW2Fy
Y2hpdmUuc2hhMjU2c3VtXSA9ICIwNTU2MWFiYzI1ZDFiMTQwMDEzNmJmNzlhYjY4ODMwY2I0YjA1
M2QxOTIyYWU5N2U1NTFiM2YxOTc1NWJmM2NiIgogCiBTID0gIiR7VU5QQUNLRElSfS8ke0dOT01F
Qk59LSR7UFZ9IgogCi0tIAoyLjQ3LjEKCg==

--===============3911559546782008001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="gtk4-changelog.txt"

Changes in 4.24.2, 22-11-2026
-----------------------------

--===============3911559546782008001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: FILELIST: removed "/usr/lib/.debug/libgtk-4.so.1.2400.1", added "/usr/lib/.debug/libgtk-4.so.1.2400.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: PKGSIZE changed from 93436680 to 93461008 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-dev: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-dev: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-doc: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-doc: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ab: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ab: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-af: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-af: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-am: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-am: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-an: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-an: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ang: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ang: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ar: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ar: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-as: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-as: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ast: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ast: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az-ir: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az-ir: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az: PKGSIZE changed from 7348 to 31229 (+325%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be+latin: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be+latin: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be: PKGSIZE changed from 141138 to 151760 (+8%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bg: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bg: PKGSIZE changed from 158205 to 158207 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bg: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn-in: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn-in: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-br: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-br: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bs: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bs: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca+valencia: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca+valencia: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca: PKGSIZE changed from 126627 to 126628 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-crh: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-crh: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cs: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cs: PKGSIZE changed from 125361 to 125353 (-0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cs: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cy: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cy: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-da: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-da: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-de: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-de: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-dz: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-dz: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-el: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-el: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en+shaw: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en+shaw: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-ca: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-ca: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-gb: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-gb: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eo: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eo: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-es: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-es: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-et: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-et: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eu: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eu: PKGSIZE changed from 125387 to 125391 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eu: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fa: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fa: PKGSIZE changed from 144556 to 144557 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fa: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fi: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fi: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fr: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fr: PKGSIZE changed from 129091 to 129135 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fr: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fur: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fur: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ga: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ga: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gd: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gd: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gl: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gl: PKGSIZE changed from 126093 to 126094 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gl: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gu: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gu: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-he: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-he: PKGSIZE changed from 133716 to 133722 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-he: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hi: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hi: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hr: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hr: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hu: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hu: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hy: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hy: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ia: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ia: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-id: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-id: PKGSIZE changed from 117517 to 120229 (+2%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-id: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ie: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ie: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-io: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-io: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-is: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-is: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-it: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-it: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ja: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ja: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ka: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ka: PKGSIZE changed from 183282 to 183283 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ka: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kab: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kab: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kk: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kk: PKGSIZE changed from 149839 to 149841 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kk: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-km: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-km: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kn: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kn: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ko: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ko: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ku: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ku: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ky: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ky: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lg: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lg: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-li: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-li: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lt: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lt: PKGSIZE changed from 124242 to 124243 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lt: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lv: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lv: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mai: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mai: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mi: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mi: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mjw: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mjw: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mk: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mk: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ml: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ml: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mn: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mn: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mr: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mr: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ms: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ms: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-my: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-my: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nb: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nb: PKGSIZE changed from 94634 to 118160 (+25%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nb: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nds: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nds: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ne: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ne: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nl: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nl: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nn: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nn: PKGSIZE changed from 120006 to 120009 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nn: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nso: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nso: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-oc: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-oc: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-or: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-or: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pa: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pa: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pl: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pl: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ps: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ps: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt-br: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt-br: PKGSIZE changed from 125689 to 125668 (-0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt-br: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt: PKGSIZE changed from 124541 to 125873 (+1%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ro: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ro: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ru: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ru: PKGSIZE changed from 154577 to 154578 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ru: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-rw: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-rw: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-si: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-si: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sk: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sk: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sl: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sl: PKGSIZE changed from 123721 to 123722 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sl: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sq: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sq: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+ije: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+ije: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+latin: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+latin: PKGSIZE changed from 115522 to 123708 (+7%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+latin: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr: PKGSIZE changed from 151594 to 151570 (-0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sv: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sv: PKGSIZE changed from 121586 to 121639 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sv: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ta: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ta: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-te: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-te: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tg: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tg: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-th: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-th: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tr: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tr: PKGSIZE changed from 123087 to 123088 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tr: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tt: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tt: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ug: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ug: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uk: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uk: PKGSIZE changed from 152893 to 152894 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uk: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ur: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ur: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-vi: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-vi: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-wa: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-wa: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-xh: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-xh: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-yi: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-yi: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-cn: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-cn: PKGSIZE changed from 116509 to 116510 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-cn: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-hk: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-hk: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-tw: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-tw: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: FILELIST: directory renamed /usr/src/debug/gtk4/4.24.1/gdk/wayland -> /usr/src/debug/gtk4/4.24.2/gdk/wayland, directory renamed /usr/src/debug/gtk4/4.24.1/gsk/gpu -> /usr/src/debug/gtk4/4.24.2/gsk/gpu, directory renamed /usr/src/debug/gtk4/4.24.1/gtk -> /usr/src/debug/gtk4/4.24.2/gtk, directory renamed /usr/src/debug/gtk4/4.24.1/gtk/a11y/atspi -> /usr/src/debug/gtk4/4.24.2/gtk/a11y/atspi, directory renamed /usr/src/debug/gtk4/4.24.1/gtk/svg -> /usr/src/debug/gtk4/4.24.2/gtk/svg, directory renamed /usr/src/debug/gtk4/4.24.1/gtk/roaring -> /usr/src/debug/gtk4/4.24.2/gtk/roaring, directory renamed /usr/src/debug/gtk4/4.24.1/gtk/svg/libgtk_svg.a.p -> /usr/src/debug/gtk4/4.24.2/gtk/svg/libgtk_svg.a.p, directory renamed /usr/src/debug/gtk4/4.24.1/gtk/timsort -> /usr/src/debug/gtk4/4.24.2/gtk/timsort, directory renamed /usr/src/debug/gtk4/4.24.1/gtk/print/backends -> /usr/src/debug/gtk4/4.24.2/gtk/print/backends, directory renamed /usr/src/debug/
 gtk4/4.24.1/tools -> /usr/src/debug/gtk4/4.24.2/tools, directory renamed /usr/src/debug/gtk4/4.24.1/gdk/loaders -> /usr/src/debug/gtk4/4.24.2/gdk/loaders, directory renamed /usr/src/debug/gtk4/4.24.1/gdk/deprecated -> /usr/src/debug/gtk4/4.24.2/gdk/deprecated, directory renamed /usr/src/debug/gtk4/4.24.1/gtk/deprecated -> /usr/src/debug/gtk4/4.24.2/gtk/deprecated, directory renamed /usr/src/debug/gtk4/4.24.1/gsk/gl -> /usr/src/debug/gtk4/4.24.2/gsk/gl, directory renamed /usr/src/debug/gtk4/4.24.1/gsk -> /usr/src/debug/gtk4/4.24.2/gsk, directory renamed /usr/src/debug/gtk4/4.24.1/gtk/css -> /usr/src/debug/gtk4/4.24.2/gtk/css, directory renamed /usr/src/debug/gtk4/4.24.1/gtk/media -> /usr/src/debug/gtk4/4.24.2/gtk/media, directory renamed /usr/src/debug/gtk4/4.24.1/gdk/x11 -> /usr/src/debug/gtk4/4.24.2/gdk/x11, directory renamed /usr/src/debug/gtk4/4.24.1/gtk/a11y -> /usr/src/debug/gtk4/4.24.2/gtk/a11y, directory renamed /usr/src/debug/gtk4/4.24.1/testsuite/reftests -> /usr/src/debug/
 gtk4/4.24.2/testsuite/reftests, directory renamed /usr/src/debug/gtk4/4.24.1/gtk/print -> /usr/src/debug/gtk4/4.24.2/gtk/print, directory renamed /usr/src/debug/gtk4/4.24.1/gsk/gpu/shaders -> /usr/src/debug/gtk4/4.24.2/gsk/gpu/shaders, directory renamed /usr/src/debug/gtk4/4.24.1/gdk -> /usr/src/debug/gtk4/4.24.2/gdk, directory renamed /usr/src/debug/gtk4/4.24.1/gtk/inspector -> /usr/src/debug/gtk4/4.24.2/gtk/inspector
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: PKGSIZE changed from 58403524 to 58413317 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-staticdev: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4-staticdev: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.2400.1", added "/usr/lib/libgtk-4.so.1.2400.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4/gtk4: PKGSIZE changed from 34615979 to 34620075 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4: PV changed from "4.24.1" to "4.24.2"
packages/x86-64-v3-poky-linux/gtk4: PKGV changed from 4.24.1 [default] to 4.24.2 [default]
packages/x86-64-v3-poky-linux/gtk4: SRC_URI changed from "https://download.gnome.org/sources//gtk/4.24/gtk-4.24.1.tar.xz;name=archive" to "https://download.gnome.org/sources//gtk/4.24/gtk-4.24.2.tar.xz;name=archive"
Changes to packages/x86-64-v3-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.2400.1 to libgtk-4.so.1.2400.2
  /usr/lib/libgtk-4.so.1.2400.1 moved to /usr/lib/libgtk-4.so.1.2400.2

--===============3911559546782008001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 963 .bb files complete (0 cached, 963 parsed). 2014 targets, 66 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-cd9f473fda8d7c05f70668ba6376c241ffbb5daf"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:cd9f473fda8d7c05f70668ba6376c241ffbb5daf"
meta-yocto-bsp       
meta-poky            = "master:6ee74fbbe3a36dabb7f8f85ee10691eaf8aa3252"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1146 Local 1114 Mirrors 0 Missed 32 Current 575 (97% match, 98% complete)
done.
Removing 8 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 620 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_51.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 629 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 647 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 648 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 658 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 706 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 716 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 718 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 719 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 738 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 745 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 748 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 752 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 755 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx_setscene)
NOTE: Running setscene task 757 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_create_spdx_setscene)
NOTE: Running setscene task 758 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe adwaita-icon-theme-51.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk4-4.24.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe tiff-4.7.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_package_qa_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libusb1-1.0.30-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 759 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb:do_create_spdx_setscene)
NOTE: recipe adwaita-icon-theme-51.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 760 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_51.0.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 762 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.88.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 764 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gtk4-4.24.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 765 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_create_spdx_setscene)
NOTE: recipe sbc-2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 766 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 767 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libusb1-1.0.30-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 769 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_create_spdx_setscene)
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 770 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 771 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 773 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe adwaita-icon-theme-51.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.88-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 777 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: recipe tiff-4.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tiff-4.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 778 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 779 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 780 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 781 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_create_spdx_setscene)
NOTE: recipe adwaita-icon-theme-51.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.88-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 782 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 783 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 784 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.29.bb:do_packagedata_setscene)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 785 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.30-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 786 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.88.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 787 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx_setscene)
NOTE: recipe gtk+3-3.24.52-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 788 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.100.0.bb:do_create_spdx_setscene)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 789 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb:do_packagedata_setscene)
NOTE: recipe tiff-4.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 790 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.62.1.bb:do_create_spdx_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 791 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 792 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.30-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 793 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_create_spdx_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.88-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.100.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 794 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 795 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 797 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.62.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 798 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb:do_populate_sysroot_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 799 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.44.bb:do_create_spdx_setscene)
NOTE: Running setscene task 800 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 803 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 804 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.88.bb:do_packagedata_setscene)
NOTE: recipe desktop-file-utils-0.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.100.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 805 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 806 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_packagedata_setscene)
NOTE: recipe tiff-4.7.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 808 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.62.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 809 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.88-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.30-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 810 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_spdx_setscene)
NOTE: recipe bluez5-5.88-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.7.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 813 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 814 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 815 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 816 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 817 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.30-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 818 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_create_spdx_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 819 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.7.bb:do_create_spdx_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 821 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-packaging-26.3-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.88-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 822 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.3.0.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 824 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe curl-8.23.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.58.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 826 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 828 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 829 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 830 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_populate_sysroot_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 831 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_packagedata_setscene)
NOTE: recipe libical-4.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 832 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 833 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.23.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe eudev-3.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.58.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 834 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 836 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 837 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-4.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 838 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_create_spdx_setscene)
NOTE: recipe libgudev-238-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 839 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 840 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb:do_create_recipe_spdx_setscene)
NOTE: recipe eudev-3.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 841 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.88.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 842 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_create_recipe_spdx_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 843 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe sbc-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 844 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 846 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe coreutils-9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 847 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libusb1-1.0.30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tzdata-2026f-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 849 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: Running setscene task 850 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 851 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb:do_create_spdx_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 853 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 854 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.17.bb:do_create_spdx_setscene)
NOTE: recipe bluez5-5.88-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 855 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_create_spdx_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 857 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-15.0.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 860 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 861 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_create_spdx_setscene)
NOTE: recipe bluez5-5.88-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe fribidi-1.0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe tzdata-2026f-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 863 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 864 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_create_recipe_spdx_setscene)
NOTE: recipe mesa-2_26.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.16.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 867 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 868 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_create_spdx_setscene)
NOTE: recipe libcxx-23.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe librsvg-2.63.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 869 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.7.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-15.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 870 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 872 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_create_spdx_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe fribidi-1.0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 873 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.1.bb:do_create_spdx_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe mesa-2_26.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 879 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.16.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 880 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.363.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 881 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcxx-23.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 882 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 883 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe librsvg-2.63.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 884 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.3.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxtst-1_1.2.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-4.0.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 885 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_create_spdx_setscene)
NOTE: recipe flac-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.48-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 886 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_create_spdx_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 889 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 890 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_spdx_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 891 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.6.bb:do_create_spdx_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 892 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe eudev-3.3.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 894 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-4.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 895 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_create_spdx_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 896 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 897 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.3.bb:do_create_spdx_setscene)
NOTE: recipe libical-4.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 898 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 900 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 901 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe pango-1.58.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 902 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe eudev-3.3.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 903 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 906 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 907 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.19-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 908 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 912 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_packagedata_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.58.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-4.0.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 913 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 914 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.3.0.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libical-4.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.30-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 919 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 920 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 921 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 922 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe kmod-34.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 923 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.62.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 924 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_create_spdx_setscene)
NOTE: recipe libical-4.0.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 925 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 926 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.30-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 928 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.100.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 929 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_create_spdx_setscene)
NOTE: Running setscene task 930 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.17.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.26.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 931 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb:do_create_recipe_spdx_setscene)
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 932 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: recipe compiler-rt-23.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.62.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 933 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.100.0.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.100.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libdrm-2.4.134-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.17-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 934 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 936 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_create_recipe_spdx_setscene)
NOTE: recipe wayland-1.26.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 939 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 940 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 941 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.62.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe compiler-rt-23.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 942 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 943 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 944 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.44.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libstd-rs-1.100.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.100.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.17-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 949 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.88.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 950 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.134-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 953 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 954 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.100.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 955 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.19-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.48-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 956 of 1721 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.44.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-79.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe orc-0.4.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.44-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe clang-cross-arm-git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.100.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 957 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe bluez5-5.88-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 959 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libstd-rs-1.100.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 960 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 961 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.48-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 962 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.44-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe orc-native-0.4.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-79.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 963 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 964 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 965 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb:do_create_spdx_setscene)
NOTE: recipe clang-cross-arm-git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 966 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.88-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 967 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 968 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe harfbuzz-15.0.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 970 of 1721 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe gtk+3-3.24.52-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 971 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe tiff-4.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 973 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_create_spdx_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 977 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcxx-23.1.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe harfbuzz-15.0.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 979 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 980 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.50.bb:do_create_spdx_setscene)
NOTE: recipe orc-native-0.4.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 981 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_spdx_setscene)
NOTE: recipe tiff-4.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 984 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 985 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_create_recipe_spdx_setscene)
NOTE: recipe kmod-34.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 986 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 987 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 988 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libcxx-23.1.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 989 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe wayland-protocols-1.50-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iso-codes-4.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 990 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 991 of 1721 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cargo-c/cargo-c_0.10.26+cargo-0.100.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-34.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 994 of 1721 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 995 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-34.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 996 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.50-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 998 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 999 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe cairo-1.18.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1000 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 1002 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shadow-4.20.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1004 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1007 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe readline-8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libcxx-native-23.1.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1008 of 1721 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.44.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1009 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe kmod-34.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1010 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.20.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1012 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1013 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcxx-native-23.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1014 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1015 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libstd-rs-1.100.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1016 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_packagedata_setscene)
NOTE: recipe cargo-c-native-0.10.26+cargo-0.100.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-native-0.4.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe dbus-1.16.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1017 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1018 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_create_spdx_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1020 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb:do_recipe_qa_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe librsvg-2.63.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe orc-native-0.4.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1021 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 1022 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1023 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_create_spdx_setscene)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1024 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1028 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.44-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1029 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1030 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.63.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1032 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1033 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1034 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.15.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe compiler-rt-23.1.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1038 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1039 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.3.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1041 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1043 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1044 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe compiler-rt-23.1.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1045 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.15.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe orc-0.4.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1046 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1048 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe iso-codes-4.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1050 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1051 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb:do_create_spdx_setscene)
NOTE: recipe kmod-34.3-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-79.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fontconfig-2.18.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1052 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1053 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1056 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe pango-1.58.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1058 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-79.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1059 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1061 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.18.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-34.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1062 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1063 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libcxx-23.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1064 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1065 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1066 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1069 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1070 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1071 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_packagedata_setscene)
NOTE: recipe pango-1.58.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.58.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1072 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libcxx-23.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_26.2.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1076 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libcxx-23.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1077 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.15.0.bb:do_create_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1079 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1083 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe cargo-c-native-0.10.26+cargo-0.100.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1087 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libx11-1_1.8.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_26.2.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1088 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1090 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.58.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1091 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1092 of 1721 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1094 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_recipe_spdx_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1095 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.44.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1096 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1097 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1098 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.62.1.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1099 of 1721 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-2.42.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1100 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1101 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1102 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vala-native-0.56.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.44-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1103 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1104 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1105 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.62.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcxx-23.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1108 of 1721 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-4.20.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcxx-native-23.1.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1109 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1110 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe orc-0.4.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1111 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1112 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1113 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.62.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcxx-native-23.1.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1114 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.7.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.20.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1115 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1116 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe compiler-rt-23.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1118 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.100.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1121 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1122 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.15.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe compiler-rt-native-23.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-native-0.56.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1123 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_create_spdx_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1124 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1125 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.62.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-4.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1126 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.134-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe compiler-rt-native-23.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxi-1_1.8.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libstd-rs-1.100.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1130 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe freetype-2.15.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe librsvg-2.63.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1131 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe compiler-rt-23.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1133 of 1721 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/cargo_1.100.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1137 of 1721 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libical-4.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1138 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xkeyboard-config-2.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.100.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1142 of 1721 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.134-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1145 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe librsvg-2.63.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1146 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_package_setscene)
NOTE: recipe freetype-2.15.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe clang-cross-arm-git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.62.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-34.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.62.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cargo-native-1.100.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vala-native-0.56.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe clang-cross-arm-git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe kmod-34.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1147 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1149 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1150 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1151 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.363.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1152 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1153 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1154 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1156 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1157 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 1160 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1163 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1165 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.59.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1168 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_spdx_setscene)
NOTE: recipe vala-native-0.56.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1169 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.15.2.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcxx-23.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_packagedata_setscene: Started
NOTE: recipe compiler-rt-23.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.59-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcxx-23.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.15.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1170 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe cargo-native-1.100.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1171 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1173 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1174 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1175 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1176 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1177 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1178 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1179 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1180 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_create_spdx_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpng-1.6.59-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1181 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1183 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb:do_packagedata_setscene)
NOTE: recipe compiler-rt-23.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1184 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-3.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1185 of 1721 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cargo-c/cargo-c_0.10.26+cargo-0.100.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-15.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe wayland-1.26.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1187 of 1721 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1188 of 1721 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/rust_1.100.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1189 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1190 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1192 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1193 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1194 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1195 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1196 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1198 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.59.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1199 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe wayland-1.26.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1200 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1201 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: recipe harfbuzz-15.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1202 of 1721 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ca-certificates-native-20260816-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.59-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe rust-native-1.100.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_26.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe cargo-c-native-0.10.26+cargo-0.100.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_package_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1203 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1204 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1205 of 1721 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgit2/libgit2_1.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe compiler-rt-native-23.1.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpng-1.6.59-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1206 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1207 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_create_spdx_setscene)
NOTE: recipe cargo-c-native-0.10.26+cargo-0.100.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1208 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1210 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1213 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1214 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.17.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1215 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_create_recipe_spdx_setscene)
NOTE: recipe fribidi-1.0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ca-certificates-native-20260816-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1218 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1219 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe compiler-rt-native-23.1.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1220 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_create_spdx_setscene)
NOTE: recipe mesa-2_26.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1221 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgit2-native-1.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe cairo-1.18.6-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_26.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.49-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1222 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.1.bb:do_create_spdx_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1223 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe openssl-4.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1224 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_create_spdx_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1225 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1226 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1227 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1228 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1229 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1230 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgit2-native-1.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.49-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1231 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 1233 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1235 of 1721 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/cargo_1.100.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1236 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-15.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_26.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1237 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_spdx_setscene)
NOTE: recipe zlib-1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1238 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1240 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.15.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1241 of 1721 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libssh2/libssh2_1.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1242 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cargo-native-1.100.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1243 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1245 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpam-1.7.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1246 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1247 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1250 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1251 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_create_spdx_setscene)
NOTE: recipe cargo-native-1.100.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1253 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1255 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xorgproto-2026.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-15.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1256 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.49-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libssh2-native-1.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.15.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1259 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.4.bb:do_packagedata_setscene)
NOTE: recipe pango-1.58.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1263 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.62.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe icu-79.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2026.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1264 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1265 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1266 of 1721 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgit2/libgit2_1.9.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe pango-1.58.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.15.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1267 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.49-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1269 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1270 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dbus-1.16.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1271 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libssh2-native-1.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.62.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1273 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.363.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1275 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libunistring-1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1276 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.134-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1277 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: recipe icu-79.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgit2-native-1.9.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe compiler-rt-23.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1278 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.62.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1279 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1280 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe dbus-1.16.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1281 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.363.0.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.134-r0: task do_packagedata_setscene: Started
NOTE: recipe libgit2-native-1.9.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe compiler-rt-23.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1282 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1284 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1286 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.134-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1287 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1288 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe openssl-4.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1290 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1292 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1293 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1294 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.134-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1295 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xkeyboard-config-2.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1296 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1297 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1298 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.13-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1303 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1304 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.18.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1305 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1306 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1308 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1311 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.13-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe harfbuzz-15.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1312 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.50.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1314 of 1721 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe icu-79.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1315 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1318 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-15.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1320 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1321 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.17.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.50-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1324 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1326 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1327 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-native-20260816-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1328 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.10.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1330 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1332 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: recipe rust-native-1.100.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.8.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1333 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe fribidi-1.0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ca-certificates-native-20260816-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1334 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.50-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1335 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe fontconfig-2.18.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1336 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe fribidi-1.0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1337 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe libxi-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-79.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1338 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.8.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1340 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1341 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1342 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1345 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1350 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1351 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.363.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1352 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1353 of 1721 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libssh2/libssh2_1.11.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.14-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1357 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.26.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1358 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.26.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1359 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.4.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1360 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1361 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1365 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.14-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1366 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1367 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe libssh2-native-1.11.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1368 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1369 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.26.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1371 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.15.0.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.26.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1373 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1375 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_packagedata_setscene)
NOTE: recipe libssh2-native-1.11.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1377 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1378 of 1721 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/rust_1.100.0.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_26.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.134-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1379 of 1721 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patchelf/patchelf_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1380 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1381 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1383 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.134-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.20.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_26.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1384 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1385 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1386 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1388 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1389 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_recipe_spdx_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe rust-native-1.100.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe patchelf-native-0.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.16.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1391 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1392 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe rust-native-1.100.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1395 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1397 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1399 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1403 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1405 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1407 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1408 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1409 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe patchelf-native-0.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1413 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1414 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1415 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/shadow/4.20.3/temp/log.do_packagedata_setscene.2779038
NOTE: recipe dbus-1.16.4-r0: task do_recipe_qa_setscene: Started
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1416 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1418 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1419 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1420 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1423 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1426 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1427 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1428 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1432 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_create_spdx_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1433 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-79.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1435 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1436 of 1721 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patchelf/patchelf_git.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.26.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1437 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_package_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1438 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1440 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.20.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1443 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1444 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-79.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1446 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.26.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1448 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1449 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_package_setscene: Started
NOTE: recipe patchelf-native-0.19.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1450 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1452 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1453 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1454 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1455 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.13-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1457 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe patchelf-native-0.19.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1459 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1460 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2026.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1463 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2026.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1464 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1467 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1468 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1469 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1470 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1471 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1472 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.2.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1473 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1475 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1476 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libx11-1_1.8.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1478 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1479 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1480 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1482 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1483 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1484 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1487 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1488 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1489 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1490 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1492 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1493 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1494 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1495 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1497 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1498 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1044 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1499 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1500 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1501 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1502 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1507 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1092 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 1134 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_fetch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1509 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1511 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2026.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1513 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1515 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1516 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running task 1194 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2026.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2026.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1320 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe librsvg-2.63.4-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe xorgproto-2026.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1519 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1506 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_write_config)
NOTE: Running task 1513 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1520 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.59.bb:do_packagedata_setscene)
NOTE: Running setscene task 1521 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1522 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1523 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.59.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1524 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1525 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1526 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2026.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.59-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.59-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_package_setscene: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2026.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe librsvg-2.63.4-r0: task do_write_config: Started
NOTE: Running setscene task 1527 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1528 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1530 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_recipe_qa_setscene)
NOTE: Running task 1720 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe librsvg-2.63.4-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: Running setscene task 1531 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.59-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.59-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1535 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running setscene task 1537 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.59.bb:do_recipe_qa_setscene)
NOTE: Running task 1883 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe shadow-4.20.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1959 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb:do_fetch)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.59-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1539 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1541 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1542 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1543 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_package_setscene)
NOTE: recipe libpng-1.6.59-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_fetch: Started
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2118 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.2.bb:do_recipe_qa)
NOTE: Running task 2171 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb:do_write_config)
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_package_setscene: Started
NOTE: Running task 2224 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb:do_unpack)
NOTE: recipe gtk4-4.24.2-r0: task do_recipe_qa: Started
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_write_config: Started
NOTE: Running setscene task 1546 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running task 2323 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.2.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_write_config: Succeeded
NOTE: Running task 2445 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.2.bb:do_create_recipe_spdx)
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.24.2-r0: task do_write_config: Started
NOTE: recipe gtk4-4.24.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2456 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.2.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk4-4.24.2-r0: task do_write_config: Succeeded
NOTE: Running task 2462 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.24.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe gtk4-4.24.2-r0: task do_fetch: Started
NOTE: recipe gtk4-4.24.2-r0: task do_fetch: Succeeded
NOTE: Running task 2463 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.2.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.24.2-r0: task do_unpack: Started
NOTE: recipe gtk4-4.24.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_unpack: Succeeded
NOTE: Running task 2464 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to f0aa88e3c9fe4568c522cd7c8c986e1f301d8f6a83227a8313f97a5121401199
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_patch: Succeeded
NOTE: recipe librsvg-2.63.4-r0: task do_fetch: Succeeded
NOTE: Running task 2466 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_unpack)
NOTE: recipe librsvg-2.63.4-r0: task do_unpack: Started
NOTE: recipe gtk4-4.24.2-r0: task do_unpack: Succeeded
NOTE: Running task 2467 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.2.bb:do_patch)
NOTE: recipe gtk4-4.24.2-r0: task do_patch: Started
NOTE: recipe gtk4-4.24.2-r0: task do_patch: Succeeded
NOTE: Running task 2468 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk4-4.24.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.24.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1547 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1548 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1549 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1550 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1551 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1561 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.15.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1564 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.15.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1566 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1568 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1569 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1570 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1571 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_packagedata_setscene)
NOTE: Running setscene task 1572 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.49-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.49-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1574 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.15.2.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1576 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1579 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1581 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.49-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.49-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1584 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.49-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1586 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1587 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1588 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1589 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1590 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1591 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1592 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 1593 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.42.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1596 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1597 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1599 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1600 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1601 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.49-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1602 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1604 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1605 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1606 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1607 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1608 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1611 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1612 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1615 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1616 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe openssl-4.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1617 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1620 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1624 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1626 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1628 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1631 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1632 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1635 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-4.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1638 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1640 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1644 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1646 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1647 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1649 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1652 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1654 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1655 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1658 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1659 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1662 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1663 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1665 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1668 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-4.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1670 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1672 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_packagedata_setscene)
NOTE: recipe expat-2.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1674 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1676 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 2749 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1680 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1682 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1683 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1685 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1687 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1688 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1689 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1691 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1692 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1696 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1697 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1699 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1701 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1702 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1707 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1711 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1713 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1721 of 1721 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3385 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3683 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_packagedata)
NOTE: Running task 3954 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_package_write_ipk)
NOTE: Running task 3955 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_package_write_deb)
NOTE: Running task 3956 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_package_write_rpm)
NOTE: recipe shadow-4.20.3-r0: task do_packagedata: Started
NOTE: Running task 3957 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_package_qa)
NOTE: recipe librsvg-2.63.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_package_write_ipk: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_package_write_deb: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_package_qa: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 3958 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe shadow-4.20.3-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.63.4-r0: task do_unpack: Succeeded
NOTE: Running task 3960 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_patch)
NOTE: recipe librsvg-2.63.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7e86448afe1b3e8fcf2e9f542240cb9b328cc75e1ab3c65f36609a2d1377b4f7
NOTE: Setscene tasks completed
NOTE: Running task 3973 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: Running task 3982 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_package_write_ipk)
NOTE: Running task 3983 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_package_write_deb)
NOTE: Running task 3984 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_package_write_rpm)
NOTE: Running task 3985 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_package_qa)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_package_write_ipk: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_package_write_deb: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_package_qa: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.63.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe librsvg-2.63.4-r0: task do_patch: Succeeded
NOTE: Running task 3992 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_rust_create_wrappers)
NOTE: Running task 3993 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_rust_gen_targets)
NOTE: recipe librsvg-2.63.4-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.63.4-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.63.4-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe librsvg-2.63.4-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3994 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_configure)
NOTE: recipe librsvg-2.63.4-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_package_write_ipk unihash changed to 08696fd5d82f8715de82e43348887d95209eecc2dfd19d3fb63cdc9ad271958c
NOTE: recipe shared-mime-info-2.5.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_package_qa unihash changed to 37a7ece6909bee7bb8f1723a398dc3bc72a3cc3c69cf1ad93f6f3405c7eed8b1
NOTE: recipe shared-mime-info-2.5.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_package_write_deb unihash changed to 72eef2d5ac8399d6f03af5e0fc33345d39bf8f90dafea1de21c5daac38cdc2d1
NOTE: recipe shared-mime-info-2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_package_write_rpm unihash changed to 63d00a33272b2d09a861925a960383e1ebf86be493e8a76500110c97b0ed2170
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_package_qa unihash changed to 053ef204ff3762bd84d5f284fc473d007fdf4fc9ca7c6ed5a9724e2fa2d27ea2
NOTE: recipe librsvg-2.63.4-r0: task do_configure: Succeeded
NOTE: Running task 3995 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_configure_ptest_base)
NOTE: recipe librsvg-2.63.4-r0: task do_configure_ptest_base: Started
NOTE: recipe librsvg-2.63.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3996 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_compile)
NOTE: recipe librsvg-2.63.4-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_package_write_deb: Succeeded
NOTE: recipe librsvg-2.63.4-r0: task do_compile: Succeeded
NOTE: Running task 3997 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_compile_ptest_cargo)
NOTE: recipe librsvg-2.63.4-r0: task do_compile_ptest_cargo: Started
NOTE: recipe librsvg-2.63.4-r0: task do_compile_ptest_cargo: Succeeded
NOTE: Running task 3998 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_compile_ptest_base)
NOTE: recipe librsvg-2.63.4-r0: task do_compile_ptest_base: Started
NOTE: recipe librsvg-2.63.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3999 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_install)
NOTE: recipe librsvg-2.63.4-r0: task do_install: Started
NOTE: recipe librsvg-2.63.4-r0: task do_install: Succeeded
NOTE: Running task 4000 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_install_ptest_base)
NOTE: recipe librsvg-2.63.4-r0: task do_install_ptest_base: Started
NOTE: recipe librsvg-2.63.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4001 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_populate_sysroot)
NOTE: Running task 4002 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_install_ptest_cargo)
NOTE: recipe librsvg-2.63.4-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.63.4-r0: task do_install_ptest_cargo: Started
NOTE: recipe librsvg-2.63.4-r0: task do_install_ptest_cargo: Succeeded
NOTE: Running task 4003 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_package)
NOTE: recipe librsvg-2.63.4-r0: task do_package: Started
NOTE: recipe librsvg-2.63.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4004 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4005 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_configure: Started
NOTE: recipe librsvg-2.63.4-r0: task do_package: Succeeded
NOTE: Running task 4006 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_packagedata)
NOTE: recipe librsvg-2.63.4-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.63.4-r0: task do_packagedata: Succeeded
NOTE: Running task 4007 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_create_spdx)
NOTE: recipe librsvg-2.63.4-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_configure: Succeeded
NOTE: Running task 4008 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_compile: Started
NOTE: recipe librsvg-2.63.4-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_compile: Succeeded
NOTE: Running task 4009 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_install: Succeeded
NOTE: Running task 4010 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb:do_package)
NOTE: Running task 4011 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4012 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.24.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.24.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4013 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.2.bb:do_configure)
NOTE: recipe gtk4-4.24.2-r0: task do_configure: Started
NOTE: recipe gtk4-4.24.2-r0: task do_configure: Succeeded
NOTE: Running task 4014 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.2.bb:do_compile)
NOTE: recipe gtk4-4.24.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_package: Succeeded
NOTE: Running task 4015 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_packagedata: Succeeded
NOTE: Running task 4016 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk4-4.24.2-r0: task do_compile: Succeeded
NOTE: Running task 4017 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.2.bb:do_install)
NOTE: recipe gtk4-4.24.2-r0: task do_install: Started
NOTE: recipe gtk4-4.24.2-r0: task do_install: Succeeded
NOTE: Running task 4018 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.2.bb:do_package)
NOTE: Running task 4019 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.2.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.24.2-r0: task do_package: Started
NOTE: recipe gtk4-4.24.2-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.24.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.24.2-r0: task do_package: Succeeded
NOTE: Running task 4020 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.2.bb:do_packagedata)
NOTE: recipe gtk4-4.24.2-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.24.2-r0: task do_packagedata: Succeeded
NOTE: Running task 4021 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.2.bb:do_create_spdx)
NOTE: Running task 4022 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.2.bb:do_package_write_ipk)
NOTE: Running task 4023 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.2.bb:do_package_write_deb)
NOTE: Running task 4024 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.2.bb:do_package_write_rpm)
NOTE: Running task 4025 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.2.bb:do_package_qa)
NOTE: recipe gtk4-4.24.2-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.24.2-r0: task do_package_write_ipk: Started
NOTE: recipe gtk4-4.24.2-r0: task do_package_write_deb: Started
NOTE: recipe gtk4-4.24.2-r0: task do_package_write_rpm: Started
NOTE: recipe gtk4-4.24.2-r0: task do_package_qa: Started
NOTE: recipe gtk4-4.24.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 4026 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.2.bb:do_create_package_spdx)
NOTE: recipe gtk4-4.24.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gtk4-4.24.2-r0: task do_create_package_spdx: Started
NOTE: recipe gtk4-4.24.2-r0: task do_package_qa: Succeeded
NOTE: recipe gtk4-4.24.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk4-4.24.2-r0: task do_create_package_spdx: Succeeded
NOTE: recipe gtk4-4.24.2-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 4027 of 4027 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.2.bb:do_build)
NOTE: Tasks Summary: Attempted 4027 tasks of which 3955 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 47 ERROR messages, returning a non-zero exit code.
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-src went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-dbg went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-base went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-staticdev went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-dev went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-doc went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-bs went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-ca went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-cs went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-da went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-de went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-dz went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-el went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-es went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-eu went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-fi went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-fr went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-gl went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-he went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-hu went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-id went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-it went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-ja went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-ka went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-kk went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-km went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-ko went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-nb went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-ne went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-nl went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-nn went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-pl went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-pt went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-pt-br went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-ro went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-ru went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-sk went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-sq went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-sv went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-tl went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-tr went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-uk went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-vi went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-zh-cn went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow-locale-zh-tw went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package shadow went backwards which would break package feeds (from 0:4.20.4-r0 to 0:4.20.3-r0) [version-going-backwards]
ERROR: shadow-4.20.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3911559546782008001==--
