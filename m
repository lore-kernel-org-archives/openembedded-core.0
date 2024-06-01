Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E52BC27C5F
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:39 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.42230.1717263218016036248
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hxdauvSQ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=zxE/bkSN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018fd4dd327c-6060e771-458a-4fec-8706-4f68080af78f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263217;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mAqyN2Hi0RTVsk1tsn/nGXVtI7cBquOWccuiaRdWuck=;
	b=hxdauvSQFMH5xPAEecGd5eUcYqFlrBxHXO1rero2CnsVTJKwZ9/fLVf1hnSzxC4K
	kWcr7zEzDd9FIqkGfUP8ZUUYJBVJUQi6DO1DSxTKpNFqjeGh3f2gWJMiFpiTrK0NLQu
	Hq1D/foNOTkq8AhKVPi7WsGc6Wu3QjjqmryBFnLs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263217;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mAqyN2Hi0RTVsk1tsn/nGXVtI7cBquOWccuiaRdWuck=;
	b=zxE/bkSNIWH+Vf/KQKk/6sH4YXAPTy36iMhlfSPkpB/r7dx274r6nkX5DsCKT5MJ
	aSgMh2TaviBx63T5MUwvgR74WadDQbkCUKuXcUZ5LkIoHQj8kkiiolgS6c1FQNKg/TU
	rPTsTfizU01HfIQs+fuzUg9Wx+4Zrm25blbyEGVs=
Content-Type: multipart/mixed; boundary="===============2153946454936807763=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 255.7 SUCCEEDED
Message-ID: <0101018fd4dd327c-6060e771-458a-4fec-8706-4f68080af78f-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200124

--===============2153946454936807763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *255.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-systemd-boot-upgrade-255.6-255.7.patch
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
From 0aeffc5346d16070060a4c1743056c72020b11e9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jun 2024 08:14:51 +0000
Subject: [PATCH] systemd-boot: upgrade 255.6 -> 255.7

---
 .../systemd/{systemd-boot_255.6.bb => systemd-boot_255.7.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_255.6.bb => systemd-boot_255.7.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_255.6.bb b/meta/recipes-core/systemd/systemd-boot_255.7.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_255.6.bb
rename to meta/recipes-core/systemd/systemd-boot_255.7.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 8bda47dd38..4d413a3a47 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "5810c25792d4268282dd3892af1a253b690423c9"
+SRCREV = "e4817103d0f32a3492608f14da6628d5c9b83197"
 SRCBRANCH = "v255-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
 
-- 
2.44.0


--===============2153946454936807763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/systemd-boot: PV changed from "255.6" to "255.7"
packages/core2-64-poky-linux/systemd-boot: PKGV changed from 255.6 [default] to 255.7 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dbg: PV changed from "255.6" to "255.7"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dbg: PKGV changed from 255.6 [default] to 255.7 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dev: PV changed from "255.6" to "255.7"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dev: PKGV changed from 255.6 [default] to 255.7 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-doc: PV changed from "255.6" to "255.7"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-doc: PKGV changed from 255.6 [default] to 255.7 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-locale: PV changed from "255.6" to "255.7"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-locale: PKGV changed from 255.6 [default] to 255.7 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-src: PV changed from "255.6" to "255.7"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-src: PKGV changed from 255.6 [default] to 255.7 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-staticdev: PV changed from "255.6" to "255.7"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-staticdev: PKGV changed from 255.6 [default] to 255.7 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot: PV changed from "255.6" to "255.7"
packages/core2-64-poky-linux/systemd-boot/systemd-boot: PKGV changed from 255.6 [default] to 255.7 [default]

--===============2153946454936807763==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemd-boot-upgrade-255.6-255.7.patch"

RnJvbSAwYWVmZmM1MzQ2ZDE2MDcwMDYwYTRjMTc0MzA1NmM3MjAyMGIxMWU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdW4gMjAyNCAwODoxNDo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN5
c3RlbWQtYm9vdDogdXBncmFkZSAyNTUuNiAtPiAyNTUuNwoKLS0tCiAuLi4vc3lzdGVtZC97c3lz
dGVtZC1ib290XzI1NS42LmJiID0+IHN5c3RlbWQtYm9vdF8yNTUuNy5iYn0gICAgfCAwCiBtZXRh
L3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC97c3lzdGVtZC1ib290XzI1NS42LmJi
ID0+IHN5c3RlbWQtYm9vdF8yNTUuNy5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjU1LjYuYmIgYi9tZXRhL3JlY2lwZXMtY29y
ZS9zeXN0ZW1kL3N5c3RlbWQtYm9vdF8yNTUuNy5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjU1LjYuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI1NS43LmJi
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jIGIvbWV0
YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYwppbmRleCA4YmRhNDdkZDM4Li40ZDQx
M2EzYTQ3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC5pbmMKQEAgLTE1LDcgKzE1
LDcgQEAgTElDRU5TRTpsaWJzeXN0ZW1kID0gIkxHUEwtMi4xLW9yLWxhdGVyIgogTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5HUEwyO21kNT03NTE0MTkyNjBhYTk1NDQ5OWY3YWJh
YWJhYTg4MmJiZSBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFLkxHUEwyLjE7
bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIgogCi1TUkNSRVYgPSAiNTgxMGMy
NTc5MmQ0MjY4MjgyZGQzODkyYWYxYTI1M2I2OTA0MjNjOSIKK1NSQ1JFViA9ICJlNDgxNzEwM2Qw
ZjMyYTM0OTI2MDhmMTRkYTY2MjhkNWM5YjgzMTk3IgogU1JDQlJBTkNIID0gInYyNTUtc3RhYmxl
IgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC1zdGFibGUuZ2l0
O3Byb3RvY29sPWh0dHBzO2JyYW5jaD0ke1NSQ0JSQU5DSH0iCiAKLS0gCjIuNDQuMAoK

--===============2153946454936807763==--

