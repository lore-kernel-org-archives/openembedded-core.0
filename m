Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BAE10FCAD4
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:06 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14658.1775054165136336163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=yaxqgHx3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DaEpNZpg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019d4979120f-51069dc8-a8a1-4b51-8058-f154c21c5afa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054164;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Q52u3KI7mBgrLuYCt/aTP621XRqOPoQXR3l/J4T9Ch4=;
	b=yaxqgHx3/CsuVkJ9x6XNZiNZgRSoUyh88B6Bjqd6v1MV+Qmqxxav5bSD8cTWSG0i
	KSBDrQ9TrOgI0sqmeg42y6a2ww3MDWCkpZ+eT06H9AFB79R5tThWsTVMF3+rPWufIGx
	Dv0tW4ogDk7dQBDbtHTilvSq3u3DtwECTGQ09bF4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054164;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Q52u3KI7mBgrLuYCt/aTP621XRqOPoQXR3l/J4T9Ch4=;
	b=DaEpNZpgpnyDI7kr8QYSLJvKXviBgVzHYEMkdna1N+/qZ37qZqFHPl0RE2nseEyr
	60FVZe1wSL5UF8Wr/DQZxPE8bctcfyfF+CYDwmZDmxk65fIXpoCrkwY2V0VcOoAohmp
	DNZc78VJ8aZVnLpALmOsfZ/NKDVro6Edl1h+TOTY=
Content-Type: multipart/mixed; boundary="===============1331481478891268892=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygobject: upgrading to 3.56.2 SUCCEEDED
Message-ID: <0101019d4979120f-51069dc8-a8a1-4b51-8058-f154c21c5afa-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234387

--===============1331481478891268892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pygobject* to *3.56.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pygobject-upgrade-3.56.1-3.56.2.patch
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
From 791fd178f8a89dca7ba646ec47766d1ce961f48f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 10:20:27 +0000
Subject: [PATCH] python3-pygobject: upgrade 3.56.1 -> 3.56.2

---
 ...{python3-pygobject_3.56.1.bb => python3-pygobject_3.56.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.56.1.bb => python3-pygobject_3.56.2.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb b/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pygobject_3.56.1.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.56.2.bb
index c17df1a9d1..24a58adee6 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb
@@ -19,7 +19,7 @@ DEPENDS += "python3 glib-2.0"
 GNOME_COMPRESS_TYPE = "gz"
 GNOMEBN = "pygobject"
 
-SRC_URI[archive.sha256sum] = "2ec1cc8c55c7ffeebb97e58a9bba7aa1e74611f1173628084685446804a8881a"
+SRC_URI[archive.sha256sum] = "b816098969544081de9eecedb94ad6ac59c77e4d571fe7051f18bebcec074313"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.47.1


--===============1331481478891268892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: FILELIST: directory renamed /usr/lib/python3.14/site-packages/PyGObject-3.56.1.dist-info -> /usr/lib/python3.14/site-packages/PyGObject-3.56.2.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.14/site-packages/PyGObject-3.56.1.dist-info moved to /usr/lib/python3.14/site-packages/PyGObject-3.56.2.dist-info

--===============1331481478891268892==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pygobject-upgrade-3.56.1-3.56.2.patch"

RnJvbSA3OTFmZDE3OGY4YTg5ZGNhN2JhNjQ2ZWM0Nzc2NmQxY2U5NjFmNDhmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxMDoyMDoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlnb2JqZWN0OiB1cGdyYWRlIDMuNTYuMSAtPiAzLjU2LjIKCi0tLQogLi4ue3B5dGhv
bjMtcHlnb2JqZWN0XzMuNTYuMS5iYiA9PiBweXRob24zLXB5Z29iamVjdF8zLjU2LjIuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weWdvYmplY3RfMy41Ni4x
LmJiID0+IHB5dGhvbjMtcHlnb2JqZWN0XzMuNTYuMi5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlnb2JqZWN0XzMuNTYuMS5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWdvYmplY3RfMy41Ni4yLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1weWdvYmplY3RfMy41Ni4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlnb2JqZWN0XzMuNTYuMi5iYgppbmRleCBjMTdkZjFh
OWQxLi4yNGE1OGFkZWU2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHlnb2JqZWN0XzMuNTYuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlnb2JqZWN0XzMuNTYuMi5iYgpAQCAtMTksNyArMTksNyBAQCBERVBF
TkRTICs9ICJweXRob24zIGdsaWItMi4wIgogR05PTUVfQ09NUFJFU1NfVFlQRSA9ICJneiIKIEdO
T01FQk4gPSAicHlnb2JqZWN0IgogCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICIyZWMx
Y2M4YzU1YzdmZmVlYmI5N2U1OGE5YmJhN2FhMWU3NDYxMWYxMTczNjI4MDg0Njg1NDQ2ODA0YTg4
ODFhIgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiYjgxNjA5ODk2OTU0NDA4MWRlOWVl
Y2VkYjk0YWQ2YWM1OWM3N2U0ZDU3MWZlNzA1MWYxOGJlYmNlYzA3NDMxMyIKIAogUyA9ICIke1VO
UEFDS0RJUn0vJHtHTk9NRUJOfS0ke1BWfSIKIAotLSAKMi40Ny4xCgo=

--===============1331481478891268892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pygobject: SRC_URI changed from "https://download.gnome.org/sources//pygobject/3.56/pygobject-3.56.1.tar.gz;name=archive" to "https://download.gnome.org/sources//pygobject/3.56/pygobject-3.56.2.tar.gz;name=archive"
packages/x86-64-v3-poky-linux/python3-pygobject: PKGV changed from 3.56.1 [default] to 3.56.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject: PV changed from "3.56.1" to "3.56.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGV changed from 3.56.1 [default] to 3.56.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGSIZE changed from 1493512 to 1499728 (+0%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PV changed from "3.56.1" to "3.56.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PKGV changed from 3.56.1 [default] to 3.56.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PV changed from "3.56.1" to "3.56.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-doc: PKGV changed from 3.56.1 [default] to 3.56.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-doc: PV changed from "3.56.1" to "3.56.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-locale: PKGV changed from 3.56.1 [default] to 3.56.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-locale: PV changed from "3.56.1" to "3.56.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PKGV changed from 3.56.1 [default] to 3.56.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: FILELIST: directory renamed /usr/src/debug/python3-pygobject/3.56.1/gi -> /usr/src/debug/python3-pygobject/3.56.2/gi
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PKGSIZE changed from 872743 to 873724 (+0%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PV changed from "3.56.1" to "3.56.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-staticdev: PKGV changed from 3.56.1 [default] to 3.56.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-staticdev: PV changed from "3.56.1" to "3.56.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PKGV changed from 3.56.1 [default] to 3.56.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: FILELIST: directory renamed /usr/lib/python3.14/site-packages/PyGObject-3.56.1.dist-info -> /usr/lib/python3.14/site-packages/PyGObject-3.56.2.dist-info
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PV changed from "3.56.1" to "3.56.2"
Changes to packages/x86-64-v3-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.14/site-packages/PyGObject-3.56.1.dist-info moved to /usr/lib/python3.14/site-packages/PyGObject-3.56.2.dist-info

--===============1331481478891268892==--

