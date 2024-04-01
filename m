Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD738CD12A0
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:11:14 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.2303.1711995071857633795
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=N63KHZcZ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=egZToHaP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018e9adbab40-c7963c89-13d4-49f7-8e3e-f4c5df89ced5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711995071;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cGQK5xZ1VH0ar4t+UnY8PP+RY7j1kMElCqqLjV8SQyE=;
	b=N63KHZcZ3RKkWMP4KyzhTiMBRU04dRJkgMXwm4nTZkghul3bawB+moU9sffusz2U
	/zso5MnzMU7DmZDQZvurPUOGRes8OtumLM8pSELVsBSsxHoTJURUOtOKZhIHRDCTPHR
	8gy2QzFJBw/Pwj8bFRdjb7QJ6u6c3uBkTmKe07Y8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711995071;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cGQK5xZ1VH0ar4t+UnY8PP+RY7j1kMElCqqLjV8SQyE=;
	b=egZToHaPWcfNqWjR7ovGEt7WIflD6Nww94hZBysEOESVHR8ogkjk/O4LOwrmpJGQ
	9ZjL8NujiFQ6qB9xH4vVrW/I2KLvic2eiuoRg5+kbiDcVlj2W5UvCLXc12R6lMJ7Kae
	mk1GpKV5ggvOrq23GpFuec3d5iDREflIllerKfDM=
Content-Type: multipart/mixed; boundary="===============5055215650862263678=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] debianutils: upgrading to 5.17 SUCCEEDED
Message-ID: <0101018e9adbab40-c7963c89-13d4-49f7-8e3e-f4c5df89ced5-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:11:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197837

--===============5055215650862263678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *debianutils* to *5.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-debianutils-upgrade-5.16-5.17.patch
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
From d5888b2cfe976d066ef5adb09ee0c6ac5e004c60 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 16:47:16 +0000
Subject: [PATCH] debianutils: upgrade 5.16 -> 5.17

---
 .../debianutils/{debianutils_5.16.bb => debianutils_5.17.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.16.bb => debianutils_5.17.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.16.bb b/meta/recipes-support/debianutils/debianutils_5.17.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.16.bb
rename to meta/recipes-support/debianutils/debianutils_5.17.bb
index ec629d8b73..c5f25bae40 100644
--- a/meta/recipes-support/debianutils/debianutils_5.16.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.17.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
            "
 
-SRCREV = "9e0facf19b17b6d090a5dcc8cacb0c16e5ad9f72"
+SRCREV = "baf12e98a02883d1b76081e32f2185ee3497570b"
 
 inherit autotools update-alternatives
 
-- 
2.42.0


--===============5055215650862263678==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-debianutils-upgrade-5.16-5.17.patch"

RnJvbSBkNTg4OGIyY2ZlOTc2ZDA2NmVmNWFkYjA5ZWUwYzZhYzVlMDA0YzYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxNjo0NzoxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRl
YmlhbnV0aWxzOiB1cGdyYWRlIDUuMTYgLT4gNS4xNwoKLS0tCiAuLi4vZGViaWFudXRpbHMve2Rl
YmlhbnV0aWxzXzUuMTYuYmIgPT4gZGViaWFudXRpbHNfNS4xNy5iYn0gICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy97ZGViaWFudXRpbHNfNS4xNi5iYiA9PiBkZWJpYW51
dGlsc181LjE3LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Rl
YmlhbnV0aWxzL2RlYmlhbnV0aWxzXzUuMTYuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kZWJp
YW51dGlscy9kZWJpYW51dGlsc181LjE3LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2RlYmlhbnV0aWxzL2RlYmlhbnV0aWxzXzUuMTYuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2RlYmlhbnV0aWxzL2RlYmlhbnV0aWxzXzUu
MTcuYmIKaW5kZXggZWM2MjlkOGI3My4uYzVmMjViYWU0MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGViaWFudXRpbHMvZGViaWFudXRpbHNfNS4xNi5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy9kZWJpYW51dGlsc181LjE3LmJiCkBAIC0xMSw3ICsx
MSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL2RlYmlhbi9jb3B5cmlnaHQ7bWQ1PTRi
NjY3ZjMwNDExZDIxYmM4ZmQ3ZGI4NWQ1MDJhOGU5CiBTUkNfVVJJID0gImdpdDovL3NhbHNhLmRl
Ymlhbi5vcmcvZGViaWFuL2RlYmlhbnV0aWxzLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFz
dGVyIFwKICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAiOWUwZmFjZjE5YjE3YjZkMDkwYTVkY2M4
Y2FjYjBjMTZlNWFkOWY3MiIKK1NSQ1JFViA9ICJiYWYxMmU5OGEwMjg4M2QxYjc2MDgxZTMyZjIx
ODVlZTM0OTc1NzBiIgogCiBpbmhlcml0IGF1dG90b29scyB1cGRhdGUtYWx0ZXJuYXRpdmVzCiAK
LS0gCjIuNDIuMAoK

--===============5055215650862263678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/debianutils/debianutils-dbg: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-64-poky-linux/debianutils/debianutils-dbg: PV changed from "5.16" to "5.17"
packages/core2-64-poky-linux/debianutils/debianutils-dev: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-64-poky-linux/debianutils/debianutils-dev: PV changed from "5.16" to "5.17"
packages/core2-64-poky-linux/debianutils/debianutils-doc: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-64-poky-linux/debianutils/debianutils-doc: PV changed from "5.16" to "5.17"
packages/core2-64-poky-linux/debianutils/debianutils-locale: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-64-poky-linux/debianutils/debianutils-locale: PV changed from "5.16" to "5.17"
packages/core2-64-poky-linux/debianutils/debianutils-run-parts: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-64-poky-linux/debianutils/debianutils-run-parts: PV changed from "5.16" to "5.17"
packages/core2-64-poky-linux/debianutils/debianutils-src: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-64-poky-linux/debianutils/debianutils-src: PV changed from "5.16" to "5.17"
packages/core2-64-poky-linux/debianutils/debianutils-src: PKGSIZE changed from 30109 to 30127 (+0%)
packages/core2-64-poky-linux/debianutils/debianutils-staticdev: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-64-poky-linux/debianutils/debianutils-staticdev: PV changed from "5.16" to "5.17"
packages/core2-64-poky-linux/debianutils/debianutils: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-64-poky-linux/debianutils/debianutils: PV changed from "5.16" to "5.17"
packages/core2-64-poky-linux/debianutils: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-64-poky-linux/debianutils: PV changed from "5.16" to "5.17"

--===============5055215650862263678==--

