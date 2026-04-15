Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 234A4F428D3
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:51 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19806.1776261867822313060
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=FNadiUWS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Gfn58SpP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019d91756003-9c7e190e-e81a-4bff-9c45-e1805cd12ebd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261882;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QdyvvaQkEb8GfkoR2hli4ZdG3Vf3AcBSQDy/4L4HBus=;
	b=FNadiUWSJy9b5mwvywaNgYVNxc25X7Jb20IKKpr3FbYFU1l1Wvn9BLOJrCw2xCUJ
	JW2EMRfpfoTpZ84Jh1PTKNmAQK+Y3M7/ffvdmdqlkM639HmXTciT1fCBDBn4xdSXDpE
	Yg9WNBOf5E1N10u0HUq1+XVylvM5qt11fLitVxMg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261882;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QdyvvaQkEb8GfkoR2hli4ZdG3Vf3AcBSQDy/4L4HBus=;
	b=Gfn58SpPV9knADb7GfMr9kHZuZbjblNWxlpeLbaRx9cChE4BfltO+aqidKtg4tTz
	+iv9g1rvci3pi0+4d0bk6EAhV0EFOus3tsTHEOSnPztQMtOf3gjXnD6E3zmIhFTZRy7
	gjHamvNxQ/nYzjilyxIz80zYR7mwllD6Ig7aT6BA=
Content-Type: multipart/mixed; boundary="===============1833632119607402732=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygobject: upgrading to 3.56.2 SUCCEEDED
Message-ID: <0101019d91756003-9c7e190e-e81a-4bff-9c45-e1805cd12ebd-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235243

--===============1833632119607402732==
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
From 4a362991d1beca6ee04aad0b4264f4a3e7029905 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 08:46:35 +0000
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


--===============1833632119607402732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: FILELIST: directory renamed /usr/lib/python3.14/site-packages/PyGObject-3.56.1.dist-info -> /usr/lib/python3.14/site-packages/PyGObject-3.56.2.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.14/site-packages/PyGObject-3.56.1.dist-info moved to /usr/lib/python3.14/site-packages/PyGObject-3.56.2.dist-info
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was removed

--===============1833632119607402732==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pygobject-upgrade-3.56.1-3.56.2.patch"

RnJvbSA0YTM2Mjk5MWQxYmVjYTZlZTA0YWFkMGI0MjY0ZjRhM2U3MDI5OTA1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDg6NDY6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Z29iamVjdDogdXBncmFkZSAzLjU2LjEgLT4gMy41Ni4yCgotLS0KIC4uLntweXRo
b24zLXB5Z29iamVjdF8zLjU2LjEuYmIgPT4gcHl0aG9uMy1weWdvYmplY3RfMy41Ni4yLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHlnb2JqZWN0XzMuNTYu
MS5iYiA9PiBweXRob24zLXB5Z29iamVjdF8zLjU2LjIuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z29iamVjdF8zLjU2LjEuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlnb2JqZWN0XzMuNTYuMi5i
YgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlnb2JqZWN0XzMuNTYuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z29iamVjdF8zLjU2LjIuYmIKaW5kZXggYzE3ZGYx
YTlkMS4uMjRhNThhZGVlNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXB5Z29iamVjdF8zLjU2LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXB5Z29iamVjdF8zLjU2LjIuYmIKQEAgLTE5LDcgKzE5LDcgQEAgREVQ
RU5EUyArPSAicHl0aG9uMyBnbGliLTIuMCIKIEdOT01FX0NPTVBSRVNTX1RZUEUgPSAiZ3oiCiBH
Tk9NRUJOID0gInB5Z29iamVjdCIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiMmVj
MWNjOGM1NWM3ZmZlZWJiOTdlNThhOWJiYTdhYTFlNzQ2MTFmMTE3MzYyODA4NDY4NTQ0NjgwNGE4
ODgxYSIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImI4MTYwOTg5Njk1NDQwODFkZTll
ZWNlZGI5NGFkNmFjNTljNzdlNGQ1NzFmZTcwNTFmMThiZWJjZWMwNzQzMTMiCiAKIFMgPSAiJHtV
TlBBQ0tESVJ9LyR7R05PTUVCTn0tJHtQVn0iCiAKLS0gCjIuNDcuMQoK

--===============1833632119607402732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pygobject: SRC_URI changed from "https://download.gnome.org/sources//pygobject/3.56/pygobject-3.56.1.tar.gz;name=archive" to "https://download.gnome.org/sources//pygobject/3.56/pygobject-3.56.2.tar.gz;name=archive"
packages/x86-64-v3-poky-linux/python3-pygobject: PV changed from "3.56.1" to "3.56.2"
packages/x86-64-v3-poky-linux/python3-pygobject: PKGV changed from 3.56.1 [default] to 3.56.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PV changed from "3.56.1" to "3.56.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGSIZE changed from 1493592 to 1499808 (+0%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGV changed from 3.56.1 [default] to 3.56.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PV changed from "3.56.1" to "3.56.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PKGV changed from 3.56.1 [default] to 3.56.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-doc: PV changed from "3.56.1" to "3.56.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-doc: PKGV changed from 3.56.1 [default] to 3.56.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-locale: PV changed from "3.56.1" to "3.56.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-locale: PKGV changed from 3.56.1 [default] to 3.56.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: FILELIST: directory renamed /usr/src/debug/python3-pygobject/3.56.1/gi -> /usr/src/debug/python3-pygobject/3.56.2/gi
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PV changed from "3.56.1" to "3.56.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PKGSIZE changed from 872743 to 873724 (+0%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PKGV changed from 3.56.1 [default] to 3.56.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-staticdev: PV changed from "3.56.1" to "3.56.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-staticdev: PKGV changed from 3.56.1 [default] to 3.56.2 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: FILELIST: directory renamed /usr/lib/python3.14/site-packages/PyGObject-3.56.1.dist-info -> /usr/lib/python3.14/site-packages/PyGObject-3.56.2.dist-info
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PV changed from "3.56.1" to "3.56.2"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PKGV changed from 3.56.1 [default] to 3.56.2 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.14/site-packages/PyGObject-3.56.1.dist-info moved to /usr/lib/python3.14/site-packages/PyGObject-3.56.2.dist-info
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was removed

--===============1833632119607402732==--

