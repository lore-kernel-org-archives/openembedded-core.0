Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E880C5475B
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:17 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.36973.1709330716189149029
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=J2UYE73L;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=I6pZL3+j;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018dfc0cd343-72392a47-1562-40a8-ad7e-f768f6ae7874-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330715;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=H3yHRPyUHHWUn768ccOwbznK/aW7BdlmQ1AWDiL2Xr0=;
	b=J2UYE73LNRRydqETQFzh+mUzqQwBzoV7zHWpwrkZmGqubgWGWz+6PuOd5olxu+q1
	tR+paqvMWaHMO0M5oXvFM3Zu9pjYAVwOO4uGUDPzC49onpszK2t/wat/mfKxV+BTp85
	rpkatQSu9LLTVyYuw19BkLZwGMpV7B6FwGQAim7I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330715;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=H3yHRPyUHHWUn768ccOwbznK/aW7BdlmQ1AWDiL2Xr0=;
	b=I6pZL3+jRousFdqkOrNXMK4Qn37sA0TqA4VovtUmimW5bV/v3wy0tCAsNx8XUE7p
	v/bflYws0MwV+nurU4j6g/BBR/NMuv6QKqa4pjoUlsfViMPTEltFzw6GkG2ZmXisQ7I
	v/HpW3X3jagxXtFETP5yR6WiA1WEO0wpYUcDOex4=
Content-Type: multipart/mixed; boundary="===============8843697313883847150=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 255.4 SUCCEEDED
Message-ID: <0101018dfc0cd343-72392a47-1562-40a8-ad7e-f768f6ae7874-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196467

--===============8843697313883847150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *255.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-systemd-boot-upgrade-255.1-255.4.patch
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
From a025f1de2436897807232235d7f38a0b7a6f34ab Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Mar 2024 11:15:54 +0000
Subject: [PATCH] systemd-boot: upgrade 255.1 -> 255.4

---
 .../systemd/{systemd-boot_255.1.bb => systemd-boot_255.4.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_255.1.bb => systemd-boot_255.4.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_255.1.bb b/meta/recipes-core/systemd/systemd-boot_255.4.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_255.1.bb
rename to meta/recipes-core/systemd/systemd-boot_255.4.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 1417e0150f..a35db5091e 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "2018ccef6645ce00c784369a22dc4e98f6d7061d"
+SRCREV = "387a14a7b67b8b76adaed4175e14bb7e39b2f738"
 SRCBRANCH = "v255-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
 
-- 
2.42.0


--===============8843697313883847150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/systemd-boot: PV changed from "255.1" to "255.4"
packages/core2-64-poky-linux/systemd-boot: PKGV changed from 255.1 [default] to 255.4 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dbg: PV changed from "255.1" to "255.4"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dbg: PKGV changed from 255.1 [default] to 255.4 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dev: PV changed from "255.1" to "255.4"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dev: PKGV changed from 255.1 [default] to 255.4 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-doc: PV changed from "255.1" to "255.4"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-doc: PKGV changed from 255.1 [default] to 255.4 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-locale: PV changed from "255.1" to "255.4"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-locale: PKGV changed from 255.1 [default] to 255.4 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-src: PV changed from "255.1" to "255.4"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-src: PKGV changed from 255.1 [default] to 255.4 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-staticdev: PV changed from "255.1" to "255.4"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-staticdev: PKGV changed from 255.1 [default] to 255.4 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot: PV changed from "255.1" to "255.4"
packages/core2-64-poky-linux/systemd-boot/systemd-boot: PKGV changed from 255.1 [default] to 255.4 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot: PKGSIZE changed from 107520 to 104448 (-3%)

--===============8843697313883847150==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemd-boot-upgrade-255.1-255.4.patch"

RnJvbSBhMDI1ZjFkZTI0MzY4OTc4MDcyMzIyMzVkN2YzOGEwYjdhNmYzNGFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAxMToxNTo1NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN5
c3RlbWQtYm9vdDogdXBncmFkZSAyNTUuMSAtPiAyNTUuNAoKLS0tCiAuLi4vc3lzdGVtZC97c3lz
dGVtZC1ib290XzI1NS4xLmJiID0+IHN5c3RlbWQtYm9vdF8yNTUuNC5iYn0gICAgfCAwCiBtZXRh
L3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC97c3lzdGVtZC1ib290XzI1NS4xLmJi
ID0+IHN5c3RlbWQtYm9vdF8yNTUuNC5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjU1LjEuYmIgYi9tZXRhL3JlY2lwZXMtY29y
ZS9zeXN0ZW1kL3N5c3RlbWQtYm9vdF8yNTUuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjU1LjEuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI1NS40LmJi
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jIGIvbWV0
YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYwppbmRleCAxNDE3ZTAxNTBmLi5hMzVk
YjUwOTFlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC5pbmMKQEAgLTE1LDcgKzE1
LDcgQEAgTElDRU5TRTpsaWJzeXN0ZW1kID0gIkxHUEwtMi4xLW9yLWxhdGVyIgogTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5HUEwyO21kNT03NTE0MTkyNjBhYTk1NDQ5OWY3YWJh
YWJhYTg4MmJiZSBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFLkxHUEwyLjE7
bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIgogCi1TUkNSRVYgPSAiMjAxOGNj
ZWY2NjQ1Y2UwMGM3ODQzNjlhMjJkYzRlOThmNmQ3MDYxZCIKK1NSQ1JFViA9ICIzODdhMTRhN2I2
N2I4Yjc2YWRhZWQ0MTc1ZTE0YmI3ZTM5YjJmNzM4IgogU1JDQlJBTkNIID0gInYyNTUtc3RhYmxl
IgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC1zdGFibGUuZ2l0
O3Byb3RvY29sPWh0dHBzO2JyYW5jaD0ke1NSQ0JSQU5DSH0iCiAKLS0gCjIuNDIuMAoK

--===============8843697313883847150==--

