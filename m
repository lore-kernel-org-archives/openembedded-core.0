Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D6DBE7718B
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:50 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.33353.1734254988111165025
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=eheMtdi/;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=vqg1qQrk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010193c9a70896-78445c96-7d44-4139-afb0-d6fe1125978b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254987;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5ssHKkuTsg2CoQ+9+Lt5gxkrJiK3nVoT5IphQ/i6YwI=;
	b=eheMtdi//vN9PS36W0ZhULRhf3AosgO9O9djsU/ic3dbYO7UE/1cEZQqsmNTct4a
	srT1KT0Gl07yZRm/bVm9InxqIbl0mTOWKq9N7Qr+odcBf0UPwKjOiNDIeDuTEzsa4HH
	9nlnPRRTMnUofX9FKLHy5izE7dPWSISv0UbQkGZA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254987;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5ssHKkuTsg2CoQ+9+Lt5gxkrJiK3nVoT5IphQ/i6YwI=;
	b=vqg1qQrkStjm9ZbxXilGNqW/rd617SAxm70NQZcwq3FPAdoHldBmgxRWJmodMT3b
	0av7rwar4L4j/GdHzl9LF2LqP+vE6KODKT+/JhLWCil6KQnJeKJCyIUnKROZ5TSon05
	gF1WRG+uJjyqLv7FMwCqj3BFZBzE3C55OgvYfCnQ=
Content-Type: multipart/mixed; boundary="===============2912222251944958488=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libxcvt: upgrading to 0.1.3 SUCCEEDED
Message-ID: <01010193c9a70896-78445c96-7d44-4139-afb0-d6fe1125978b-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208731

--===============2912222251944958488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxcvt* to *0.1.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxcvt-upgrade-0.1.2-0.1.3.patch
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
From b16ca6b12733043d99ac3920f273fe13c32d178c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Dec 2024 08:35:38 +0000
Subject: [PATCH] libxcvt: upgrade 0.1.2 -> 0.1.3

---
 .../xorg-lib/{libxcvt_0.1.2.bb => libxcvt_0.1.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxcvt_0.1.2.bb => libxcvt_0.1.3.bb} (91%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb
similarity index 91%
rename from meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb
rename to meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb
index e62fabdf58..91537b0f4b 100644
--- a/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=129947a06984d6faa6f9a9788fa2a03f"
 SECTION = "x11/libs"
 
 SRC_URI = "git://gitlab.freedesktop.org/xorg/lib/libxcvt.git;protocol=https;branch=master"
-SRCREV = "d9ca87eea9eecddaccc3a77227bcb3acf84e89df"
+SRCREV = "dd8631c61465cc0de5e476c7a98e56528d62b163"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.1


--===============2912222251944958488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxcvt: PKGV changed from 0.1.2 [default] to 0.1.3 [default]
packages/core2-64-poky-linux/libxcvt: PV changed from "0.1.2" to "0.1.3"
packages/core2-64-poky-linux/libxcvt/libxcvt-dbg: FILELIST: removed "/usr/lib/.debug/libxcvt.so.0.1.2", added "/usr/lib/.debug/libxcvt.so.0.1.3"
packages/core2-64-poky-linux/libxcvt/libxcvt-dbg: PV changed from "0.1.2" to "0.1.3"
packages/core2-64-poky-linux/libxcvt/libxcvt-dbg: PKGSIZE changed from 33920 to 33872 (-0%)
packages/core2-64-poky-linux/libxcvt/libxcvt-dbg: PKGV changed from 0.1.2 [default] to 0.1.3 [default]
packages/core2-64-poky-linux/libxcvt/libxcvt-dev: PV changed from "0.1.2" to "0.1.3"
packages/core2-64-poky-linux/libxcvt/libxcvt-dev: PKGV changed from 0.1.2 [default] to 0.1.3 [default]
packages/core2-64-poky-linux/libxcvt/libxcvt-doc: PV changed from "0.1.2" to "0.1.3"
packages/core2-64-poky-linux/libxcvt/libxcvt-doc: PKGV changed from 0.1.2 [default] to 0.1.3 [default]
packages/core2-64-poky-linux/libxcvt/libxcvt-locale: PV changed from "0.1.2" to "0.1.3"
packages/core2-64-poky-linux/libxcvt/libxcvt-locale: PKGV changed from 0.1.2 [default] to 0.1.3 [default]
packages/core2-64-poky-linux/libxcvt/libxcvt-src: PV changed from "0.1.2" to "0.1.3"
packages/core2-64-poky-linux/libxcvt/libxcvt-src: PKGSIZE changed from 23378 to 23371 (-0%)
packages/core2-64-poky-linux/libxcvt/libxcvt-src: PKGV changed from 0.1.2 [default] to 0.1.3 [default]
packages/core2-64-poky-linux/libxcvt/libxcvt-staticdev: PV changed from "0.1.2" to "0.1.3"
packages/core2-64-poky-linux/libxcvt/libxcvt-staticdev: PKGV changed from 0.1.2 [default] to 0.1.3 [default]
packages/core2-64-poky-linux/libxcvt/libxcvt: FILELIST: removed "/usr/lib/libxcvt.so.0.1.2", added "/usr/lib/libxcvt.so.0.1.3"
packages/core2-64-poky-linux/libxcvt/libxcvt: PV changed from "0.1.2" to "0.1.3"
packages/core2-64-poky-linux/libxcvt/libxcvt: PKGV changed from 0.1.2 [default] to 0.1.3 [default]
Changes to packages/core2-64-poky-linux/libxcvt (sysroot):
  /usr/lib/libxcvt.so.0 changed symlink target from libxcvt.so.0.1.2 to libxcvt.so.0.1.3
  /usr/lib/libxcvt.so.0.1.2 moved to /usr/lib/libxcvt.so.0.1.3

--===============2912222251944958488==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxcvt-upgrade-0.1.2-0.1.3.patch"

RnJvbSBiMTZjYTZiMTI3MzMwNDNkOTlhYzM5MjBmMjczZmUxM2MzMmQxNzhjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgRGVjIDIwMjQgMDg6MzU6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4Y3Z0OiB1cGdyYWRlIDAuMS4yIC0+IDAuMS4zCgotLS0KIC4uLi94b3JnLWxpYi97bGlieGN2
dF8wLjEuMi5iYiA9PiBsaWJ4Y3Z0XzAuMS4zLmJifSAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLWxpYi97bGlieGN2dF8wLjEuMi5iYiA9PiBsaWJ4Y3Z0XzAuMS4z
LmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9s
aWJ4Y3Z0XzAuMS4yLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhjdnRf
MC4xLjMuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3hvcmctbGliL2xpYnhjdnRfMC4xLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1n
cmFwaGljcy94b3JnLWxpYi9saWJ4Y3Z0XzAuMS4zLmJiCmluZGV4IGU2MmZhYmRmNTguLjkxNTM3
YjBmNGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4Y3Z0
XzAuMS4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4Y3Z0XzAu
MS4zLmJiCkBAIC03LDcgKzcsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5H
O21kNT0xMjk5NDdhMDY5ODRkNmZhYTZmOWE5Nzg4ZmEyYTAzZiIKIFNFQ1RJT04gPSAieDExL2xp
YnMiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy94b3JnL2xpYi9s
aWJ4Y3Z0LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIgotU1JDUkVWID0gImQ5Y2E4
N2VlYTllZWNkZGFjY2MzYTc3MjI3YmNiM2FjZjg0ZTg5ZGYiCitTUkNSRVYgPSAiZGQ4NjMxYzYx
NDY1Y2MwZGU1ZTQ3NmM3YTk4ZTU2NTI4ZDYyYjE2MyIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIK
IAotLSAKMi40NC4xCgo=

--===============2912222251944958488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libxcvt/libxcvt: FILELIST: removed "/usr/lib/libxcvt.so.0.1.2", added "/usr/lib/libxcvt.so.0.1.3"
Changes to packages/core2-64-poky-linux/libxcvt (sysroot):
  /usr/lib/libxcvt.so.0 changed symlink target from libxcvt.so.0.1.2 to libxcvt.so.0.1.3
  /usr/lib/libxcvt.so.0.1.2 moved to /usr/lib/libxcvt.so.0.1.3

--===============2912222251944958488==--

