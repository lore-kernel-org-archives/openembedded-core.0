Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3860CD98DE
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:48 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50419.1781195502254383217
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GYGNwBQ7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=m3Bgc0aX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019eb7868510-a412a4c5-078b-4d55-87e1-df1a5a4cafd5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195507;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SJEU52uev1X+tgoJpxCohq/M7p8PMfUaKrVxNUJETDI=;
	b=GYGNwBQ7q3a6zS1D/+gqOJ7AWgZWMdgEXn1zjObflBDrj5MsP7aawRchNwjxLnh2
	5GMhmIAPWsbNjE8QccD6vKH5OWFSWXbICL7edXLtp5/WFogeKJqRFC4B1EOjDpJuySC
	2qcYApKRu8MYpQL+Hhs8xmrgd3VNRD1V5kaL5d98=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195507;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SJEU52uev1X+tgoJpxCohq/M7p8PMfUaKrVxNUJETDI=;
	b=m3Bgc0aXg+6N5UQKF4U3MlvJBHX4Ozh7slC/e3rvSxJKBlptpY9TPPPGn62DJkX3
	8tmagvlOAbH8m5pMZdqAFGh8X6PcbOI61x1HOHBzPcs7L4LBuwC1BqRmZvZHRTuBVV9
	8u5e66fYxdWJ0564R+8Wsl8D8a+gYdiDOMOfB0BU=
Content-Type: multipart/mixed; boundary="===============2401070683553541072=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygobject: upgrading to 3.56.3 SUCCEEDED
Message-ID: <0101019eb7868510-a412a4c5-078b-4d55-87e1-df1a5a4cafd5-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238498

--===============2401070683553541072==
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
From 06ef2a729b2dbfed0bd1bf25fece32b737fea318 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 10:06:40 +0000
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


--===============2401070683553541072==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pygobject-upgrade-3.56.2-3.56.3.patch"

RnJvbSAwNmVmMmE3MjliMmRiZmVkMGJkMWJmMjVmZWNlMzJiNzM3ZmVhMzE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTA6MDY6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Z29iamVjdDogdXBncmFkZSAzLjU2LjIgLT4gMy41Ni4zCgotLS0KIC4uLntweXRo
b24zLXB5Z29iamVjdF8zLjU2LjIuYmIgPT4gcHl0aG9uMy1weWdvYmplY3RfMy41Ni4zLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHlnb2JqZWN0XzMuNTYu
Mi5iYiA9PiBweXRob24zLXB5Z29iamVjdF8zLjU2LjMuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z29iamVjdF8zLjU2LjIuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlnb2JqZWN0XzMuNTYuMy5i
YgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlnb2JqZWN0XzMuNTYuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z29iamVjdF8zLjU2LjMuYmIKaW5kZXggMjRhNThh
ZGVlNi4uZTI0NmEyZDQ1MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXB5Z29iamVjdF8zLjU2LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXB5Z29iamVjdF8zLjU2LjMuYmIKQEAgLTE5LDcgKzE5LDcgQEAgREVQ
RU5EUyArPSAicHl0aG9uMyBnbGliLTIuMCIKIEdOT01FX0NPTVBSRVNTX1RZUEUgPSAiZ3oiCiBH
Tk9NRUJOID0gInB5Z29iamVjdCIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiYjgx
NjA5ODk2OTU0NDA4MWRlOWVlY2VkYjk0YWQ2YWM1OWM3N2U0ZDU3MWZlNzA1MWYxOGJlYmNlYzA3
NDMxMyIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjEyNzYwZTRhMGUzZDA0YjZlYjk1
ZTA2ZjdhMjdlMzYyYzgyNmQ1NjdlYTYxMzM3M2E5MmMwMDNiNmM3MGQyZDYiCiAKIFMgPSAiJHtV
TlBBQ0tESVJ9LyR7R05PTUVCTn0tJHtQVn0iCiAKLS0gCjIuNDcuMQoK

--===============2401070683553541072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pygobject: PKGV changed from 3.56.2 [default] to 3.56.3 [default]
packages/x86-64-v3-poky-linux/python3-pygobject: PV changed from "3.56.2" to "3.56.3"
packages/x86-64-v3-poky-linux/python3-pygobject: SRC_URI changed from "https://download.gnome.org/sources//pygobject/3.56/pygobject-3.56.2.tar.gz;name=archive" to "https://download.gnome.org/sources//pygobject/3.56/pygobject-3.56.3.tar.gz;name=archive"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGV changed from 3.56.2 [default] to 3.56.3 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGSIZE changed from 1537904 to 1542352 (+0%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PV changed from "3.56.2" to "3.56.3"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PKGV changed from 3.56.2 [default] to 3.56.3 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PV changed from "3.56.2" to "3.56.3"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-doc: PKGV changed from 3.56.2 [default] to 3.56.3 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-doc: PV changed from "3.56.2" to "3.56.3"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-locale: PKGV changed from 3.56.2 [default] to 3.56.3 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-locale: PV changed from "3.56.2" to "3.56.3"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PKGV changed from 3.56.2 [default] to 3.56.3 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PKGSIZE changed from 873724 to 876209 (+0%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PV changed from "3.56.2" to "3.56.3"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: FILELIST: directory renamed /usr/src/debug/python3-pygobject/3.56.2/gi -> /usr/src/debug/python3-pygobject/3.56.3/gi
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-staticdev: PKGV changed from 3.56.2 [default] to 3.56.3 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-staticdev: PV changed from "3.56.2" to "3.56.3"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PKGV changed from 3.56.2 [default] to 3.56.3 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PKGSIZE changed from 1149651 to 1149683 (+0%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PV changed from "3.56.2" to "3.56.3"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: FILELIST: directory renamed /usr/lib/python3.14/site-packages/PyGObject-3.56.2.dist-info -> /usr/lib/python3.14/site-packages/PyGObject-3.56.3.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.14/site-packages/PyGObject-3.56.2.dist-info moved to /usr/lib/python3.14/site-packages/PyGObject-3.56.3.dist-info

--===============2401070683553541072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: FILELIST: directory renamed /usr/lib/python3.14/site-packages/PyGObject-3.56.2.dist-info -> /usr/lib/python3.14/site-packages/PyGObject-3.56.3.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.14/site-packages/PyGObject-3.56.2.dist-info moved to /usr/lib/python3.14/site-packages/PyGObject-3.56.3.dist-info

--===============2401070683553541072==--

