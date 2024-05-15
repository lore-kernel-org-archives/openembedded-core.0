Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F412C27C44
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:19 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.1238.1715794337452462740
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=erTWbg1j;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=M6mXBoR3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018f7d4fdbf3-fc9f40cc-9fb4-4dec-bfa3-921ef03974c3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794336;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fOxtBAv2SUlZKhmBFc1rBefC6qQxRPWZLcbsV8YJbp4=;
	b=erTWbg1j7bhO18uCDc8waT8dDFobOHwFrLphVWMp/VwyjfOIUR72B86NOLfODUrG
	ixPtFyaG2uZIMKRn9BeR8dwqFLOgiscImpwVdTJoYrpev5BtDP7AeJDcpSxZ4q/4IKN
	LU1MfOC6EO7tqNx1KT0x4HZYmSnAOEJ0e9TsfEKg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794336;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fOxtBAv2SUlZKhmBFc1rBefC6qQxRPWZLcbsV8YJbp4=;
	b=M6mXBoR3pBvWOZcDuX79xMFbuWHVGqymHnfhOMIxXypcPmiLGTd66ded60u5EsWJ
	xIKf+1N+sI97/TkCm0VkMC8Bh/26n7vvCLgxgk/XuqHb+3icI2Q7YehNPq5bKKpTv/5
	o4uQzodv6PYs5lQ0HxxuK4z2SnCvaQKKg7oTEC0U=
Content-Type: multipart/mixed; boundary="===============7938808094249730805=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 255.6 SUCCEEDED
Message-ID: <0101018f7d4fdbf3-fc9f40cc-9fb4-4dec-bfa3-921ef03974c3-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199306

--===============7938808094249730805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *255.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-systemd-boot-upgrade-255.4-255.6.patch
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
From 7a780d3ce677553a3e4777d7d26762a5c48b52ff Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 07:55:08 +0000
Subject: [PATCH] systemd-boot: upgrade 255.4 -> 255.6

---
 .../systemd/{systemd-boot_255.4.bb => systemd-boot_255.6.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_255.4.bb => systemd-boot_255.6.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_255.4.bb b/meta/recipes-core/systemd/systemd-boot_255.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_255.4.bb
rename to meta/recipes-core/systemd/systemd-boot_255.6.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index a35db5091e..8bda47dd38 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "387a14a7b67b8b76adaed4175e14bb7e39b2f738"
+SRCREV = "5810c25792d4268282dd3892af1a253b690423c9"
 SRCBRANCH = "v255-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
 
-- 
2.44.0


--===============7938808094249730805==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemd-boot-upgrade-255.4-255.6.patch"

RnJvbSA3YTc4MGQzY2U2Nzc1NTNhM2U0Nzc3ZDdkMjY3NjJhNWM0OGI1MmZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMDc6NTU6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXN0ZW1kLWJvb3Q6IHVwZ3JhZGUgMjU1LjQgLT4gMjU1LjYKCi0tLQogLi4uL3N5c3RlbWQve3N5
c3RlbWQtYm9vdF8yNTUuNC5iYiA9PiBzeXN0ZW1kLWJvb3RfMjU1LjYuYmJ9ICAgIHwgMAogbWV0
YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQve3N5c3RlbWQtYm9vdF8yNTUuNC5i
YiA9PiBzeXN0ZW1kLWJvb3RfMjU1LjYuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI1NS40LmJiIGIvbWV0YS9yZWNpcGVzLWNv
cmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjU1LjYuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI1NS40LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQtYm9vdF8yNTUuNi5i
YgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYyBiL21l
dGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC5pbmMKaW5kZXggYTM1ZGI1MDkxZS4uOGJk
YTQ3ZGQzOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmlu
YworKysgYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jCkBAIC0xNSw3ICsx
NSw3IEBAIExJQ0VOU0U6bGlic3lzdGVtZCA9ICJMR1BMLTIuMS1vci1sYXRlciIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UuR1BMMjttZDU9NzUxNDE5MjYwYWE5NTQ0OTlmN2Fi
YWFiYWE4ODJiYmUgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRS5MR1BMMi4x
O21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyIKIAotU1JDUkVWID0gIjM4N2Ex
NGE3YjY3YjhiNzZhZGFlZDQxNzVlMTRiYjdlMzliMmY3MzgiCitTUkNSRVYgPSAiNTgxMGMyNTc5
MmQ0MjY4MjgyZGQzODkyYWYxYTI1M2I2OTA0MjNjOSIKIFNSQ0JSQU5DSCA9ICJ2MjU1LXN0YWJs
ZSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQtc3RhYmxlLmdp
dDtwcm90b2NvbD1odHRwczticmFuY2g9JHtTUkNCUkFOQ0h9IgogCi0tIAoyLjQ0LjAKCg==

--===============7938808094249730805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/systemd-boot: PV changed from "255.4" to "255.6"
packages/core2-64-poky-linux/systemd-boot: PKGV changed from 255.4 [default] to 255.6 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dbg: PV changed from "255.4" to "255.6"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dbg: PKGV changed from 255.4 [default] to 255.6 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dev: PV changed from "255.4" to "255.6"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dev: PKGV changed from 255.4 [default] to 255.6 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-doc: PV changed from "255.4" to "255.6"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-doc: PKGV changed from 255.4 [default] to 255.6 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-locale: PV changed from "255.4" to "255.6"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-locale: PKGV changed from 255.4 [default] to 255.6 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-src: PV changed from "255.4" to "255.6"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-src: PKGV changed from 255.4 [default] to 255.6 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-staticdev: PV changed from "255.4" to "255.6"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-staticdev: PKGV changed from 255.4 [default] to 255.6 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot: PV changed from "255.4" to "255.6"
packages/core2-64-poky-linux/systemd-boot/systemd-boot: PKGV changed from 255.4 [default] to 255.6 [default]

--===============7938808094249730805==--

