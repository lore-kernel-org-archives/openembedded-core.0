Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E5ECD98D2
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:36:03 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1556.1780328132416134511
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dFG8tueu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=yYJIkXxA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019e83d3c680-e6bdb7cf-fb54-40fa-a396-f332ec86c6a9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328154;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=S7VjKS2t8Gnj15I8Ke74AUGIZouM3IAlMpTZjB0xxrQ=;
	b=dFG8tueuXNt3T5DyKVHt1w+IGjBHLeY4NS6vPYwaYbpobXA/ElD/gTY0E2sHKt1r
	F/UjAolqqdG25UEWno/PeYsbvLWvK9bZT8oj8Lhz5/+ZKS5nZad7YhlleT6EkM3YAFX
	m5MJC66xS/JzDbYsrY96yuSYIHYq0BAj+CFvG9rI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328154;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=S7VjKS2t8Gnj15I8Ke74AUGIZouM3IAlMpTZjB0xxrQ=;
	b=yYJIkXxA+Gwto0NP7rzxZs3/LrnmmAJjLG16rOHhiF4lofWiWFZsYLGAN+oIul10
	rIB03Ik4KN+DNjAUc30aAZ26hd7y7/EGMc7oNE6eU5uTpSdWkLsEovHCTOWvBaSPhy6
	PB2l15U0XiJq8CGyjwqk4Cmi/iRcOyQO2RfSasH8=
Content-Type: multipart/mixed; boundary="===============6239903982244121481=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dos2unix: upgrading to 7.5.6 SUCCEEDED
Message-ID: <0101019e83d3c680-e6bdb7cf-fb54-40fa-a396-f332ec86c6a9-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237950

--===============6239903982244121481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dos2unix* to *7.5.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dos2unix-upgrade-7.5.5-7.5.6.patch
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
From 5d63337b747c034ac6d3fa770bf2c09d8ba841b1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 14:16:14 +0000
Subject: [PATCH] dos2unix: upgrade 7.5.5 -> 7.5.6

---
 .../dos2unix/{dos2unix_7.5.5.bb => dos2unix_7.5.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/dos2unix/{dos2unix_7.5.5.bb => dos2unix_7.5.6.bb} (95%)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.5.5.bb b/meta/recipes-support/dos2unix/dos2unix_7.5.6.bb
similarity index 95%
rename from meta/recipes-support/dos2unix/dos2unix_7.5.5.bb
rename to meta/recipes-support/dos2unix/dos2unix_7.5.6.bb
index aa078ed200..b6ecdc109e 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.5.5.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.5.6.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af1174fd3d1a254eec3a4a1d1da170a9"
 SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV = "54524999eece4e9ad0dab580c79b02855fc85028"
+SRCREV = "9c2ea173af3bc49324f8288d81c5a2bbfc0884d0"
 
 S = "${UNPACKDIR}/${BP}/dos2unix"
 
-- 
2.47.1


--===============6239903982244121481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: FILELIST: directory renamed /usr/share/doc/dos2unix-7.5.5 -> /usr/share/doc/dos2unix-7.5.6

--===============6239903982244121481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dbg: PKGV changed from 7.5.5 [default] to 7.5.6 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dbg: PV changed from "7.5.5" to "7.5.6"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dev: PKGV changed from 7.5.5 [default] to 7.5.6 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dev: PV changed from "7.5.5" to "7.5.6"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: PKGV changed from 7.5.5 [default] to 7.5.6 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: PKGSIZE changed from 208609 to 209374 (+0%)
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: FILELIST: directory renamed /usr/share/doc/dos2unix-7.5.5 -> /usr/share/doc/dos2unix-7.5.6
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: PV changed from "7.5.5" to "7.5.6"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-locale: PKGV changed from 7.5.5 [default] to 7.5.6 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-locale: PV changed from "7.5.5" to "7.5.6"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-src: PKGV changed from 7.5.5 [default] to 7.5.6 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-src: PKGSIZE changed from 201918 to 201906 (-0%)
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-src: FILELIST: directory renamed /usr/src/debug/dos2unix/7.5.5 -> /usr/src/debug/dos2unix/7.5.6
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-src: PV changed from "7.5.5" to "7.5.6"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-staticdev: PKGV changed from 7.5.5 [default] to 7.5.6 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-staticdev: PV changed from "7.5.5" to "7.5.6"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix: PKGV changed from 7.5.5 [default] to 7.5.6 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix: PV changed from "7.5.5" to "7.5.6"
packages/x86-64-v3-poky-linux/dos2unix: PKGV changed from 7.5.5 [default] to 7.5.6 [default]
packages/x86-64-v3-poky-linux/dos2unix: PV changed from "7.5.5" to "7.5.6"

--===============6239903982244121481==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dos2unix-upgrade-7.5.5-7.5.6.patch"

RnJvbSA1ZDYzMzM3Yjc0N2MwMzRhYzZkM2ZhNzcwYmYyYzA5ZDhiYTg0MWIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxNDoxNjoxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRv
czJ1bml4OiB1cGdyYWRlIDcuNS41IC0+IDcuNS42CgotLS0KIC4uLi9kb3MydW5peC97ZG9zMnVu
aXhfNy41LjUuYmIgPT4gZG9zMnVuaXhfNy41LjYuYmJ9ICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2RvczJ1bml4L3tkb3MydW5peF83LjUuNS5iYiA9PiBkb3MydW5peF83LjUu
Ni5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kb3MydW5peC9k
b3MydW5peF83LjUuNS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RvczJ1bml4L2RvczJ1bml4
XzcuNS42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1z
dXBwb3J0L2RvczJ1bml4L2RvczJ1bml4XzcuNS41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9kb3MydW5peC9kb3MydW5peF83LjUuNi5iYgppbmRleCBhYTA3OGVkMjAwLi5iNmVj
ZGMxMDllIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kb3MydW5peC9kb3MydW5p
eF83LjUuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kb3MydW5peC9kb3MydW5peF83
LjUuNi5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZ
SU5HLnR4dDttZDU9YWYxMTc0ZmQzZDFhMjU0ZWVjM2E0YTFkMWRhMTcwYTkiCiBTUkNfVVJJID0g
ImdpdDovL2dpdC5jb2RlLnNmLm5ldC9wL2RvczJ1bml4L2RvczJ1bml4O2JyYW5jaD1tYXN0ZXI7
cHJvdG9jb2w9aHR0cHMiCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICJkb3MydW5peC0o
P1A8cHZlcj4oXGQrKFwuXGQrKSspKSIKIAotU1JDUkVWID0gIjU0NTI0OTk5ZWVjZTRlOWFkMGRh
YjU4MGM3OWIwMjg1NWZjODUwMjgiCitTUkNSRVYgPSAiOWMyZWExNzNhZjNiYzQ5MzI0ZjgyODhk
ODFjNWEyYmJmYzA4ODRkMCIKIAogUyA9ICIke1VOUEFDS0RJUn0vJHtCUH0vZG9zMnVuaXgiCiAK
LS0gCjIuNDcuMQoK

--===============6239903982244121481==--

