Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FE5C54F44
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:10 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.14618.1700059029856409595
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=K664g0RE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=N8ayX+GU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018bd36a1d0a-4d96a095-39a7-426d-9b7b-4d028e4139c6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1/UWtW6r85oxNBtBZztuMKbXOpcNkniJV75ZlB39xEo=;
	b=K664g0REmYuhiqPx6tkWJLyU4LVRw5KaauB16IZ2HzfpSUiSdXQeAQzhvuZP12Lc
	TPdHpPU6A7wnI9jENcBfJjYPf8llTDStZIICG0MVff16s4Bq3IKf56BrHm/AFFDKT56
	/UhsKPteXcsC8MRQbtegWuuV0ZUsOy3M31RF6Ow4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1/UWtW6r85oxNBtBZztuMKbXOpcNkniJV75ZlB39xEo=;
	b=N8ayX+GUE7+BLmxY/qBFc32NZmJvw5KLtLJmfy+YCeYO9EzhYBjp1Y/I9EjL3Jen
	Lmrp/P+e0dY8z+ykZQFQ+kG7slO4yi2AR817qf829RJC6QD7gl2Bd0oN+LJy6HXBg6B
	UC/A3E/wLnqmIbjMvPKzrYF6BC5bfAHEhAqZHsrk=
Content-Type: multipart/mixed; boundary="===============2622263579475013584=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 254.6 SUCCEEDED
Message-ID: <0101018bd36a1d0a-4d96a095-39a7-426d-9b7b-4d028e4139c6-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190617

--===============2622263579475013584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *254.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-systemd-boot-upgrade-254.4-254.6.patch
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
From 71a3906c1f42453fed45b95c037d0065c383ea8e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 05:32:39 +0000
Subject: [PATCH] systemd-boot: upgrade 254.4 -> 254.6

---
 .../systemd/{systemd-boot_254.4.bb => systemd-boot_254.6.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_254.4.bb => systemd-boot_254.6.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_254.4.bb b/meta/recipes-core/systemd/systemd-boot_254.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_254.4.bb
rename to meta/recipes-core/systemd/systemd-boot_254.6.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index ccc3236457..e19ecd1d68 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "2e7504449a51fb38db9cd2da391c6434f82def51"
+SRCREV = "1b5bbbf7b48b36f5c6b6fec75093eb0f3f87aac2"
 SRCBRANCH = "v254-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
 
-- 
2.39.2


--===============2622263579475013584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/systemd-boot: PV changed from "254.4" to "254.6"
packages/core2-64-poky-linux/systemd-boot: PKGV changed from 254.4 [default] to 254.6 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dbg: PV changed from "254.4" to "254.6"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dbg: PKGV changed from 254.4 [default] to 254.6 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dev: PV changed from "254.4" to "254.6"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dev: PKGV changed from 254.4 [default] to 254.6 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-doc: PV changed from "254.4" to "254.6"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-doc: PKGV changed from 254.4 [default] to 254.6 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-locale: PV changed from "254.4" to "254.6"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-locale: PKGV changed from 254.4 [default] to 254.6 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-src: PV changed from "254.4" to "254.6"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-src: PKGV changed from 254.4 [default] to 254.6 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-staticdev: PV changed from "254.4" to "254.6"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-staticdev: PKGV changed from 254.4 [default] to 254.6 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot: PV changed from "254.4" to "254.6"
packages/core2-64-poky-linux/systemd-boot/systemd-boot: PKGSIZE changed from 97792 to 98304 (+1%)
packages/core2-64-poky-linux/systemd-boot/systemd-boot: PKGV changed from 254.4 [default] to 254.6 [default]

--===============2622263579475013584==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemd-boot-upgrade-254.4-254.6.patch"

RnJvbSA3MWEzOTA2YzFmNDI0NTNmZWQ0NWI5NWMwMzdkMDA2NWMzODNlYThlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMDU6MzI6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXN0ZW1kLWJvb3Q6IHVwZ3JhZGUgMjU0LjQgLT4gMjU0LjYKCi0tLQogLi4uL3N5c3RlbWQve3N5
c3RlbWQtYm9vdF8yNTQuNC5iYiA9PiBzeXN0ZW1kLWJvb3RfMjU0LjYuYmJ9ICAgIHwgMAogbWV0
YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQve3N5c3RlbWQtYm9vdF8yNTQuNC5i
YiA9PiBzeXN0ZW1kLWJvb3RfMjU0LjYuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI1NC40LmJiIGIvbWV0YS9yZWNpcGVzLWNv
cmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjU0LjYuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI1NC40LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQtYm9vdF8yNTQuNi5i
YgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYyBiL21l
dGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC5pbmMKaW5kZXggY2NjMzIzNjQ1Ny4uZTE5
ZWNkMWQ2OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmlu
YworKysgYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jCkBAIC0xNSw3ICsx
NSw3IEBAIExJQ0VOU0U6bGlic3lzdGVtZCA9ICJMR1BMLTIuMS1vci1sYXRlciIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UuR1BMMjttZDU9NzUxNDE5MjYwYWE5NTQ0OTlmN2Fi
YWFiYWE4ODJiYmUgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRS5MR1BMMi4x
O21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyIKIAotU1JDUkVWID0gIjJlNzUw
NDQ0OWE1MWZiMzhkYjljZDJkYTM5MWM2NDM0ZjgyZGVmNTEiCitTUkNSRVYgPSAiMWI1YmJiZjdi
NDhiMzZmNWM2YjZmZWM3NTA5M2ViMGYzZjg3YWFjMiIKIFNSQ0JSQU5DSCA9ICJ2MjU0LXN0YWJs
ZSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQtc3RhYmxlLmdp
dDtwcm90b2NvbD1odHRwczticmFuY2g9JHtTUkNCUkFOQ0h9IgogCi0tIAoyLjM5LjIKCg==

--===============2622263579475013584==--

