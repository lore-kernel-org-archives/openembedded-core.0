Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D1DCD343D
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:57 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15709.1777645532662829268
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=wmNjLPhW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CE3PLiZt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019de3ee5ced-153d5c22-ac77-4aec-a6b6-b46d4d96604f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Wsv+6lHDSRB3jrkn64TmJ357Jc+7QGqfMX2tdJoJ28s=;
	b=wmNjLPhWtNs/LxnkFEwrTE0B/JQx5gb1ZroEn3uZEHOD5zXIAZADn0u51cgZio3g
	4vvG7Rl0NPgRwtzqm7NkEZQtUEK2LroSNr2sJ8hz4E/SU1Xa2hTGiVYvVLuYSYNy77E
	VCbm1vCxxtugpLO+y56S4wI5obnW3EufRDSzvHeU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Wsv+6lHDSRB3jrkn64TmJ357Jc+7QGqfMX2tdJoJ28s=;
	b=CE3PLiZtxOr7kgvB3K8Z22KCdeJ0vilydeTlBZiQfNMKu5xWBwyCjNG+8O95d/AO
	adbKRGjk53SYLDWSKYXFTN9+aItnZTNh10velQvHaX9/qRcQRlfpCxuxIo/jd6PSKhA
	l3UkEB6ziT/nQ4QzGvGzXrRqNmMPRAo73oRa4SX4=
Content-Type: multipart/mixed; boundary="===============3236475624481606434=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygobject: upgrading to 3.56.2 SUCCEEDED
Message-ID: <0101019de3ee5ced-153d5c22-ac77-4aec-a6b6-b46d4d96604f-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236244

--===============3236475624481606434==
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
From 2d2a8e2db0cb660c056ed7b481b29d8bc8901b70 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 09:07:11 +0000
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


--===============3236475624481606434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: FILELIST: directory renamed /usr/lib/python3.14/site-packages/PyGObject-3.56.1.dist-info -> /usr/lib/python3.14/site-packages/PyGObject-3.56.2.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.14/site-packages/PyGObject-3.56.1.dist-info moved to /usr/lib/python3.14/site-packages/PyGObject-3.56.2.dist-info

--===============3236475624481606434==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pygobject-upgrade-3.56.1-3.56.2.patch"

RnJvbSAyZDJhOGUyZGIwY2I2NjBjMDU2ZWQ3YjQ4MWIyOWQ4YmM4OTAxYjcwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwOTowNzoxMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
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

--===============3236475624481606434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pygobject: PKGV changed from 3.56.1 [default] to 3.56.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject: PV changed from "3.56.1" to "3.56.2"
packages/x86-64-v3-poky-linux/python3-pygobject: SRC_URI changed from "https://download.gnome.org/sources//pygobject/3.56/pygobject-3.56.1.tar.gz;name=archive" to "https://download.gnome.org/sources//pygobject/3.56/pygobject-3.56.2.tar.gz;name=archive"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGV changed from 3.56.1 [default] to 3.56.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGSIZE changed from 1493592 to 1499808 (+0%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PV changed from "3.56.1" to "3.56.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PKGV changed from 3.56.1 [default] to 3.56.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PV changed from "3.56.1" to "3.56.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-doc: PKGV changed from 3.56.1 [default] to 3.56.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-doc: PV changed from "3.56.1" to "3.56.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-locale: PKGV changed from 3.56.1 [default] to 3.56.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-locale: PV changed from "3.56.1" to "3.56.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PKGV changed from 3.56.1 [default] to 3.56.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PKGSIZE changed from 872743 to 873724 (+0%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: FILELIST: directory renamed /usr/src/debug/python3-pygobject/3.56.1/gi -> /usr/src/debug/python3-pygobject/3.56.2/gi
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PV changed from "3.56.1" to "3.56.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-staticdev: PKGV changed from 3.56.1 [default] to 3.56.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-staticdev: PV changed from "3.56.1" to "3.56.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PKGV changed from 3.56.1 [default] to 3.56.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: FILELIST: directory renamed /usr/lib/python3.14/site-packages/PyGObject-3.56.1.dist-info -> /usr/lib/python3.14/site-packages/PyGObject-3.56.2.dist-info
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PV changed from "3.56.1" to "3.56.2"
Changes to packages/x86-64-v3-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.14/site-packages/PyGObject-3.56.1.dist-info moved to /usr/lib/python3.14/site-packages/PyGObject-3.56.2.dist-info

--===============3236475624481606434==--

