Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDBBC54EF5
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:40 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.20155.1708018344261720170
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GczWdNQO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gHBbbKKR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018dadd39e1b-3cf972c3-d6aa-4763-ac09-6c004ca3a96b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ovzPCLrxKr6bsZ1HkpS9eCMc66YCsyibU/ypwbKdup4=;
	b=GczWdNQONkJhtEcpgSa7NtwflwkMSk0DRSuYHCAgBubUmyh8sFxOsJgydP1tHi3n
	ygV/ArZlsVETWIrM0vpdXR6XU4jVPkaA4v+BncW1ApMrf/e25fUa/eriC2deOfCIkcA
	hwHo+WaLtlJH5oinwr1w27aj0Tbwsk8VN5gqKcbM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ovzPCLrxKr6bsZ1HkpS9eCMc66YCsyibU/ypwbKdup4=;
	b=gHBbbKKRHMJqRbI4LSUGoTaTXNFWsA5oNkawW/TtsIQeMV/ERfxbVJHl0uW0ynr2
	vPte0yV2OEIYeOFpk9H1k7SF4IvqfuRBe1aIEDPnVgaDefibcIb2nZCs+1SqQVj6/Ie
	9CHBS1vKdlX8AEPR5AM/AnHY3aZA7+Vd9FoTPl8g=
Content-Type: multipart/mixed; boundary="===============7861181849659025117=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 255.3 SUCCEEDED
Message-ID: <0101018dadd39e1b-3cf972c3-d6aa-4763-ac09-6c004ca3a96b-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195563

--===============7861181849659025117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *255.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-systemd-boot-upgrade-255.1-255.3.patch
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
From 286646e8969fb7064a6900c3467d2a865256aadc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 06:24:24 +0000
Subject: [PATCH] systemd-boot: upgrade 255.1 -> 255.3

---
 .../systemd/{systemd-boot_255.1.bb => systemd-boot_255.3.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_255.1.bb => systemd-boot_255.3.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_255.1.bb b/meta/recipes-core/systemd/systemd-boot_255.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_255.1.bb
rename to meta/recipes-core/systemd/systemd-boot_255.3.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 1417e0150f..fc320c89b4 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "2018ccef6645ce00c784369a22dc4e98f6d7061d"
+SRCREV = "27fc7a03218464ae9b3395120574b4c06e4c8322"
 SRCBRANCH = "v255-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
 
-- 
2.42.0


--===============7861181849659025117==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemd-boot-upgrade-255.1-255.3.patch"

RnJvbSAyODY2NDZlODk2OWZiNzA2NGE2OTAwYzM0NjdkMmE4NjUyNTZhYWRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMDY6MjQ6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXN0ZW1kLWJvb3Q6IHVwZ3JhZGUgMjU1LjEgLT4gMjU1LjMKCi0tLQogLi4uL3N5c3RlbWQve3N5
c3RlbWQtYm9vdF8yNTUuMS5iYiA9PiBzeXN0ZW1kLWJvb3RfMjU1LjMuYmJ9ICAgIHwgMAogbWV0
YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQve3N5c3RlbWQtYm9vdF8yNTUuMS5i
YiA9PiBzeXN0ZW1kLWJvb3RfMjU1LjMuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI1NS4xLmJiIGIvbWV0YS9yZWNpcGVzLWNv
cmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjU1LjMuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI1NS4xLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQtYm9vdF8yNTUuMy5i
YgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYyBiL21l
dGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC5pbmMKaW5kZXggMTQxN2UwMTUwZi4uZmMz
MjBjODliNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmlu
YworKysgYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jCkBAIC0xNSw3ICsx
NSw3IEBAIExJQ0VOU0U6bGlic3lzdGVtZCA9ICJMR1BMLTIuMS1vci1sYXRlciIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UuR1BMMjttZDU9NzUxNDE5MjYwYWE5NTQ0OTlmN2Fi
YWFiYWE4ODJiYmUgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRS5MR1BMMi4x
O21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyIKIAotU1JDUkVWID0gIjIwMThj
Y2VmNjY0NWNlMDBjNzg0MzY5YTIyZGM0ZTk4ZjZkNzA2MWQiCitTUkNSRVYgPSAiMjdmYzdhMDMy
MTg0NjRhZTliMzM5NTEyMDU3NGI0YzA2ZTRjODMyMiIKIFNSQ0JSQU5DSCA9ICJ2MjU1LXN0YWJs
ZSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQtc3RhYmxlLmdp
dDtwcm90b2NvbD1odHRwczticmFuY2g9JHtTUkNCUkFOQ0h9IgogCi0tIAoyLjQyLjAKCg==

--===============7861181849659025117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/systemd-boot: PV changed from "255.1" to "255.3"
packages/core2-64-poky-linux/systemd-boot: PKGV changed from 255.1 [default] to 255.3 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dbg: PV changed from "255.1" to "255.3"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dbg: PKGV changed from 255.1 [default] to 255.3 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dev: PV changed from "255.1" to "255.3"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dev: PKGV changed from 255.1 [default] to 255.3 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-doc: PV changed from "255.1" to "255.3"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-doc: PKGV changed from 255.1 [default] to 255.3 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-locale: PV changed from "255.1" to "255.3"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-locale: PKGV changed from 255.1 [default] to 255.3 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-src: PV changed from "255.1" to "255.3"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-src: PKGV changed from 255.1 [default] to 255.3 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-staticdev: PV changed from "255.1" to "255.3"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-staticdev: PKGV changed from 255.1 [default] to 255.3 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot: PV changed from "255.1" to "255.3"
packages/core2-64-poky-linux/systemd-boot/systemd-boot: PKGV changed from 255.1 [default] to 255.3 [default]

--===============7861181849659025117==--

