Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972AAC3271C
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:24 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.1094.1714579215229476032
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ADJBoakG;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=iuiU6XaD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018f34e29042-5da0c7b0-9448-4ad8-8e29-5cf63da7910a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579214;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CggQgk8qIKiOUdXVoc7UNKnTSmkSZILEg7VvktOZ5bA=;
	b=ADJBoakGqZnvWCGLD6b5Ec4+2RUtTVI4ZyGloZB4KlfyQr+tc6VtKdDry7XXxK96
	WuAV6VoqrrMrFtbn8BvHiCNFAhcLhzN0ktHWwAhUFIeF3oJ0IltdxbgkJQx/I8LPlbv
	rqI1c1gPEC1VkbGpV4F9mfWc8nzdYOPO+vJI4dyI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579214;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CggQgk8qIKiOUdXVoc7UNKnTSmkSZILEg7VvktOZ5bA=;
	b=iuiU6XaDA5INJGKyKAwXbEt7wpGvKbao79DNe1+VcsdbEzbOvgdkd3vPXEphufVU
	3nrVZIARZ+fxcc2+DbdDOz7ZdSOT2JpgP89l0ZIwW603Fz2awkZJiCExFycb1hYaJ0N
	T6E7I0KWoyJaijkOQl7GX92JLPTWk+HC5tZkkKEI=
Content-Type: multipart/mixed; boundary="===============8742358816348680135=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 255.5 SUCCEEDED
Message-ID: <0101018f34e29042-5da0c7b0-9448-4ad8-8e29-5cf63da7910a-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198795

--===============8742358816348680135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *255.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-systemd-boot-upgrade-255.4-255.5.patch
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
From dec9e80d80067b91ecb4c3c91dfd0296941a0997 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 05:36:39 +0000
Subject: [PATCH] systemd-boot: upgrade 255.4 -> 255.5

---
 .../systemd/{systemd-boot_255.4.bb => systemd-boot_255.5.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_255.4.bb => systemd-boot_255.5.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_255.4.bb b/meta/recipes-core/systemd/systemd-boot_255.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_255.4.bb
rename to meta/recipes-core/systemd/systemd-boot_255.5.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index a35db5091e..47c3078cc7 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "387a14a7b67b8b76adaed4175e14bb7e39b2f738"
+SRCREV = "8f4dab049074d31c31af2bb9eb76f9f4f08e3711"
 SRCBRANCH = "v255-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
 
-- 
2.44.0


--===============8742358816348680135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/systemd-boot: PKGV changed from 255.4 [default] to 255.5 [default]
packages/core2-64-poky-linux/systemd-boot: PV changed from "255.4" to "255.5"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dbg: PKGV changed from 255.4 [default] to 255.5 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dbg: PV changed from "255.4" to "255.5"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dev: PKGV changed from 255.4 [default] to 255.5 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dev: PV changed from "255.4" to "255.5"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-doc: PKGV changed from 255.4 [default] to 255.5 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-doc: PV changed from "255.4" to "255.5"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-locale: PKGV changed from 255.4 [default] to 255.5 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-locale: PV changed from "255.4" to "255.5"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-src: PKGV changed from 255.4 [default] to 255.5 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-src: PV changed from "255.4" to "255.5"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-staticdev: PKGV changed from 255.4 [default] to 255.5 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-staticdev: PV changed from "255.4" to "255.5"
packages/core2-64-poky-linux/systemd-boot/systemd-boot: PKGV changed from 255.4 [default] to 255.5 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot: PV changed from "255.4" to "255.5"

--===============8742358816348680135==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemd-boot-upgrade-255.4-255.5.patch"

RnJvbSBkZWM5ZTgwZDgwMDY3YjkxZWNiNGMzYzkxZGZkMDI5Njk0MWEwOTk3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAwNTozNjozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN5
c3RlbWQtYm9vdDogdXBncmFkZSAyNTUuNCAtPiAyNTUuNQoKLS0tCiAuLi4vc3lzdGVtZC97c3lz
dGVtZC1ib290XzI1NS40LmJiID0+IHN5c3RlbWQtYm9vdF8yNTUuNS5iYn0gICAgfCAwCiBtZXRh
L3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC97c3lzdGVtZC1ib290XzI1NS40LmJi
ID0+IHN5c3RlbWQtYm9vdF8yNTUuNS5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjU1LjQuYmIgYi9tZXRhL3JlY2lwZXMtY29y
ZS9zeXN0ZW1kL3N5c3RlbWQtYm9vdF8yNTUuNS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjU1LjQuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI1NS41LmJi
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jIGIvbWV0
YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYwppbmRleCBhMzVkYjUwOTFlLi40N2Mz
MDc4Y2M3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC5pbmMKQEAgLTE1LDcgKzE1
LDcgQEAgTElDRU5TRTpsaWJzeXN0ZW1kID0gIkxHUEwtMi4xLW9yLWxhdGVyIgogTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5HUEwyO21kNT03NTE0MTkyNjBhYTk1NDQ5OWY3YWJh
YWJhYTg4MmJiZSBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFLkxHUEwyLjE7
bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIgogCi1TUkNSRVYgPSAiMzg3YTE0
YTdiNjdiOGI3NmFkYWVkNDE3NWUxNGJiN2UzOWIyZjczOCIKK1NSQ1JFViA9ICI4ZjRkYWIwNDkw
NzRkMzFjMzFhZjJiYjllYjc2ZjlmNGYwOGUzNzExIgogU1JDQlJBTkNIID0gInYyNTUtc3RhYmxl
IgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC1zdGFibGUuZ2l0
O3Byb3RvY29sPWh0dHBzO2JyYW5jaD0ke1NSQ0JSQU5DSH0iCiAKLS0gCjIuNDQuMAoK

--===============8742358816348680135==--

