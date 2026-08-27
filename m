Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63046C61DCB
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 05:18:35 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29849.1787807910325665012
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 22:18:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Q9hm0PJ0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZAwYCp2R;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a041a7c5c1-4e010235-8725-4af1-aa0d-8505b3c91805-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787807909;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iqFblBs6mLWAReQSpr7IYy9dP1Ed6hxSfF2IFG0UPqo=;
	b=Q9hm0PJ0nwdBh17Zu3astG3gBKaG4WmCdEeFZI8G0b9mph/aJJs1DRinU21Jmdh4
	YbAwJI0zqb0Izx63M+Xvs2rJ1eu8xpbVTR1ZElVDjHEn5aZH36Lu3XN7pcdLqkgFSdJ
	MYQ+OrSI+Y6uFsB2IJHS6MHnZCjB3s6AZZd5UKZo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787807909;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iqFblBs6mLWAReQSpr7IYy9dP1Ed6hxSfF2IFG0UPqo=;
	b=ZAwYCp2Rj/P8+p2P2lrsv47DOtYXjEVpCZWuPmdyXwtmVs9mTNLiJibARf2vbjL9
	yZOrPYdIgCl+olldOi65ATEhvrmxu3++hJwVaaa6QY6N3maMZUA9jUSnRupo9Ht3tAF
	FN8jRZQHTdesGNT3zD/K5lx+OqQTmEfhWXuvw/H8=
Content-Type: multipart/mixed; boundary="===============1423673912071624408=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-websockets: upgrading to 17.1 SUCCEEDED
Message-ID: <010101a041a7c5c1-4e010235-8725-4af1-aa0d-8505b3c91805-000000@us-west-2.amazonses.com>
Date: Thu, 27 Aug 2026 05:18:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.27-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 05:18:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244448

--===============1423673912071624408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-websockets* to *17.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-websockets-upgrade-17.0.1-17.1.patch
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
From 70d3256c4d76916a9a1d02312d2ef3b3a7a97944 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 27 Aug 2026 05:12:52 +0000
Subject: [PATCH] python3-websockets: upgrade 17.0.1 -> 17.1

---
 ...{python3-websockets_17.0.1.bb => python3-websockets_17.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_17.0.1.bb => python3-websockets_17.1.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-websockets_17.0.1.bb b/meta/recipes-devtools/python/python3-websockets_17.1.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-websockets_17.0.1.bb
rename to meta/recipes-devtools/python/python3-websockets_17.1.bb
index 6733cfd0f9..b5ee3ec661 100644
--- a/meta/recipes-devtools/python/python3-websockets_17.0.1.bb
+++ b/meta/recipes-devtools/python/python3-websockets_17.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "5baa9bc0dfbae8c507e51c8cf1b6d4628086f7a87bbd3a9952bd5f035451f1cc"
+SRC_URI[sha256sum] = "acfea4c20bf54384883ea33b1240fc1db4f52e190823a4e2b334bc3e8bfca96a"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.1


--===============1423673912071624408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: FILELIST: directory renamed /usr/lib/python3.14/site-packages/websockets-17.0.1.dist-info -> /usr/lib/python3.14/site-packages/websockets-17.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/websockets-17.0.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/websockets-17.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.14/site-packages/websockets-17.1.dist-info was added
  /usr/lib/python3.14/site-packages/websockets-17.1.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/websockets-17.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/websockets-17.1.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/websockets-17.1.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/websockets-17.1.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/websockets-17.1.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/websockets-17.0.1.dist-info was removed
  /usr/lib/python3.14/site-packages/websockets-17.0.1.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/websockets-17.0.1.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/websockets-17.0.1.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/websockets-17.0.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/websockets-17.0.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/websockets-17.0.1.dist-info/WHEEL was removed

--===============1423673912071624408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-websockets: PV changed from "17.0.1" to "17.1"
packages/x86-64-v3-poky-linux/python3-websockets: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/websockets/websockets-17.0.1.tar.gz;downloadfilename=websockets-17.0.1.tar.gz" to "https://files.pythonhosted.org/packages/source/w/websockets/websockets-17.1.tar.gz;downloadfilename=websockets-17.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-websockets: PKGV changed from 17.0.1 [default] to 17.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dbg: PV changed from "17.0.1" to "17.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dbg: PKGV changed from 17.0.1 [default] to 17.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dev: PV changed from "17.0.1" to "17.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dev: PKGV changed from 17.0.1 [default] to 17.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-doc: PV changed from "17.0.1" to "17.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-doc: PKGV changed from 17.0.1 [default] to 17.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-locale: PV changed from "17.0.1" to "17.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-locale: PKGV changed from 17.0.1 [default] to 17.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: PV changed from "17.0.1" to "17.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: FILELIST: directory renamed /usr/src/debug/python3-websockets/17.0.1/src/websockets -> /usr/src/debug/python3-websockets/17.1/src/websockets
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: PKGV changed from 17.0.1 [default] to 17.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-staticdev: PV changed from "17.0.1" to "17.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-staticdev: PKGV changed from 17.0.1 [default] to 17.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PV changed from "17.0.1" to "17.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: FILELIST: directory renamed /usr/lib/python3.14/site-packages/websockets-17.0.1.dist-info -> /usr/lib/python3.14/site-packages/websockets-17.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/websockets-17.0.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/websockets-17.1.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PKGV changed from 17.0.1 [default] to 17.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PKGSIZE changed from 1668349 to 1711167 (+3%)
Changes to packages/x86-64-v3-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.14/site-packages/websockets-17.1.dist-info was added
  /usr/lib/python3.14/site-packages/websockets-17.1.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/websockets-17.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/websockets-17.1.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/websockets-17.1.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/websockets-17.1.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/websockets-17.1.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/websockets-17.0.1.dist-info was removed
  /usr/lib/python3.14/site-packages/websockets-17.0.1.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/websockets-17.0.1.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/websockets-17.0.1.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/websockets-17.0.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/websockets-17.0.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/websockets-17.0.1.dist-info/WHEEL was removed

--===============1423673912071624408==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-websockets-upgrade-17.0.1-17.1.patch"

RnJvbSA3MGQzMjU2YzRkNzY5MTZhOWExZDAyMzEyZDJlZjNiM2E3YTk3OTQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjcgQXVnIDIwMjYgMDU6MTI6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdlYnNvY2tldHM6IHVwZ3JhZGUgMTcuMC4xIC0+IDE3LjEKCi0tLQogLi4ue3B5dGhv
bjMtd2Vic29ja2V0c18xNy4wLjEuYmIgPT4gcHl0aG9uMy13ZWJzb2NrZXRzXzE3LjEuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13ZWJzb2NrZXRzXzE3LjAu
MS5iYiA9PiBweXRob24zLXdlYnNvY2tldHNfMTcuMS5iYn0gKDc5JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2Vic29ja2V0c18xNy4wLjEuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2Vic29ja2V0c18xNy4xLmJi
CnNpbWlsYXJpdHkgaW5kZXggNzklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy13ZWJzb2NrZXRzXzE3LjAuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdlYnNvY2tldHNfMTcuMS5iYgppbmRleCA2NzMzY2Zk
MGY5Li5iNWVlM2VjNjYxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtd2Vic29ja2V0c18xNy4wLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXdlYnNvY2tldHNfMTcuMS5iYgpAQCAtNiw3ICs2LDcgQEAgTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NTE5MjRhNmFmNDQ5NWI4Y2ZhZWUxYjFk
YTg2OWI2ZjQiCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1YmFhOWJjMGRmYmFlOGM1MDdlNTFjOGNmMWI2ZDQ2Mjgw
ODZmN2E4N2JiZDNhOTk1MmJkNWYwMzU0NTFmMWNjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImFj
ZmVhNGMyMGJmNTQzODQ4ODNlYTMzYjEyNDBmYzFkYjRmNTJlMTkwODIzYTRlMmIzMzRiYzNlOGJm
Y2E5NmEiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKIAotLSAKMi40Ny4x
Cgo=

--===============1423673912071624408==--

