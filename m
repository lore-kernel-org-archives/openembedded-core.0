Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1275BCD8C91
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:46 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1573.1780328140791667222
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dQiTBhLe;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TUzPGTRW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019e83d38de2-2850fd76-4c69-4c77-b8c0-96156555eb63-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328140;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BlYLkGTAIgnmYP6WQ2PelVqIZ0yFqSzJ2qaVPEDuxMc=;
	b=dQiTBhLexvhGJZ1Ub6NkKBumt2Ic1g3g9AoCLNBDZg6aKPbr1h9oE+lfPHciEIbe
	sXiql/TnYDMS8slaQN/RU7zJmQgEeWp9OadSlP5TshfwbIWokt5t0WjDzjkBy++70uS
	sj5fVVONzJfswA0gfhtDSRmIkt6az+qPLEiNz63U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328140;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BlYLkGTAIgnmYP6WQ2PelVqIZ0yFqSzJ2qaVPEDuxMc=;
	b=TUzPGTRWC7OmVvPbACA8eXX5Du35N8NcuuEA7us1YDzv9wcnIldLYT3aLGkN2QWn
	6unl2jVsfAkaRboEOlQKa2pGYcBYooKu3SgiNWCAG9EqTLEXYEAdsTds5ZnnkvoCu9J
	6Up77EARCy4hOM7nPWBUzc2FoSDOglZ6kZKn86qU=
Content-Type: multipart/mixed; boundary="===============1147805391366926961=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygobject: upgrading to 3.56.3 SUCCEEDED
Message-ID: <0101019e83d38de2-2850fd76-4c69-4c77-b8c0-96156555eb63-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237888

--===============1147805391366926961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pygobject* to *3.56.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pygobject-upgrade-3.56.2-3.56.3.patch
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
From 4af97a5e825d1b51f47e9be0885ab1f5bdaad05f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 09:19:39 +0000
Subject: [PATCH] python3-pygobject: upgrade 3.56.2 -> 3.56.3

---
 ...{python3-pygobject_3.56.2.bb => python3-pygobject_3.56.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.56.2.bb => python3-pygobject_3.56.3.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb b/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pygobject_3.56.2.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.56.3.bb
index 24a58adee6..e246a2d451 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb
@@ -19,7 +19,7 @@ DEPENDS += "python3 glib-2.0"
 GNOME_COMPRESS_TYPE = "gz"
 GNOMEBN = "pygobject"
 
-SRC_URI[archive.sha256sum] = "b816098969544081de9eecedb94ad6ac59c77e4d571fe7051f18bebcec074313"
+SRC_URI[archive.sha256sum] = "12760e4a0e3d04b6eb95e06f7a27e362c826d567ea613373a92c003b6c70d2d6"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.47.1


--===============1147805391366926961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: FILELIST: directory renamed /usr/lib/python3.14/site-packages/PyGObject-3.56.2.dist-info -> /usr/lib/python3.14/site-packages/PyGObject-3.56.3.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.14/site-packages/PyGObject-3.56.2.dist-info moved to /usr/lib/python3.14/site-packages/PyGObject-3.56.3.dist-info

--===============1147805391366926961==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pygobject-upgrade-3.56.2-3.56.3.patch"

RnJvbSA0YWY5N2E1ZTgyNWQxYjUxZjQ3ZTliZTA4ODVhYjFmNWJkYWFkMDVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwOToxOTozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlnb2JqZWN0OiB1cGdyYWRlIDMuNTYuMiAtPiAzLjU2LjMKCi0tLQogLi4ue3B5dGhv
bjMtcHlnb2JqZWN0XzMuNTYuMi5iYiA9PiBweXRob24zLXB5Z29iamVjdF8zLjU2LjMuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weWdvYmplY3RfMy41Ni4y
LmJiID0+IHB5dGhvbjMtcHlnb2JqZWN0XzMuNTYuMy5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlnb2JqZWN0XzMuNTYuMi5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWdvYmplY3RfMy41Ni4zLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1weWdvYmplY3RfMy41Ni4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlnb2JqZWN0XzMuNTYuMy5iYgppbmRleCAyNGE1OGFk
ZWU2Li5lMjQ2YTJkNDUxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHlnb2JqZWN0XzMuNTYuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlnb2JqZWN0XzMuNTYuMy5iYgpAQCAtMTksNyArMTksNyBAQCBERVBF
TkRTICs9ICJweXRob24zIGdsaWItMi4wIgogR05PTUVfQ09NUFJFU1NfVFlQRSA9ICJneiIKIEdO
T01FQk4gPSAicHlnb2JqZWN0IgogCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJiODE2
MDk4OTY5NTQ0MDgxZGU5ZWVjZWRiOTRhZDZhYzU5Yzc3ZTRkNTcxZmU3MDUxZjE4YmViY2VjMDc0
MzEzIgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiMTI3NjBlNGEwZTNkMDRiNmViOTVl
MDZmN2EyN2UzNjJjODI2ZDU2N2VhNjEzMzczYTkyYzAwM2I2YzcwZDJkNiIKIAogUyA9ICIke1VO
UEFDS0RJUn0vJHtHTk9NRUJOfS0ke1BWfSIKIAotLSAKMi40Ny4xCgo=

--===============1147805391366926961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pygobject: PV changed from "3.56.2" to "3.56.3"
packages/x86-64-v3-poky-linux/python3-pygobject: SRC_URI changed from "https://download.gnome.org/sources//pygobject/3.56/pygobject-3.56.2.tar.gz;name=archive" to "https://download.gnome.org/sources//pygobject/3.56/pygobject-3.56.3.tar.gz;name=archive"
packages/x86-64-v3-poky-linux/python3-pygobject: PKGV changed from 3.56.2 [default] to 3.56.3 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PV changed from "3.56.2" to "3.56.3"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGV changed from 3.56.2 [default] to 3.56.3 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGSIZE changed from 1537904 to 1542352 (+0%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PV changed from "3.56.2" to "3.56.3"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PKGV changed from 3.56.2 [default] to 3.56.3 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-doc: PV changed from "3.56.2" to "3.56.3"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-doc: PKGV changed from 3.56.2 [default] to 3.56.3 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-locale: PV changed from "3.56.2" to "3.56.3"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-locale: PKGV changed from 3.56.2 [default] to 3.56.3 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PV changed from "3.56.2" to "3.56.3"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PKGV changed from 3.56.2 [default] to 3.56.3 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: FILELIST: directory renamed /usr/src/debug/python3-pygobject/3.56.2/gi -> /usr/src/debug/python3-pygobject/3.56.3/gi
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PKGSIZE changed from 873724 to 876209 (+0%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-staticdev: PV changed from "3.56.2" to "3.56.3"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-staticdev: PKGV changed from 3.56.2 [default] to 3.56.3 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PV changed from "3.56.2" to "3.56.3"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PKGV changed from 3.56.2 [default] to 3.56.3 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: FILELIST: directory renamed /usr/lib/python3.14/site-packages/PyGObject-3.56.2.dist-info -> /usr/lib/python3.14/site-packages/PyGObject-3.56.3.dist-info
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PKGSIZE changed from 1149651 to 1149683 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.14/site-packages/PyGObject-3.56.2.dist-info moved to /usr/lib/python3.14/site-packages/PyGObject-3.56.3.dist-info

--===============1147805391366926961==--

