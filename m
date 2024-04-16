Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 430E4C32717
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:13 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.13421.1713248037012121393
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NBE1ie65;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=0kvyBiwM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018ee58a657b-5b75f0d1-fcde-45e9-b709-972e04b09d34-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248036;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=z9Pudc8gTXpAO2m9J4O0g9oSgXjLVMB30G1IRBosKHY=;
	b=NBE1ie65A7nse7HyMQaFdW0jllmXil8M1KwYt/rru4N6X0KWM4EIrPV1aCYtQlYb
	1O8A00uFWaZjOYKfpUIcB+/zgZTCKnpWI9Hn0pKH3lITmjFrArYsh++GC95bUFXKOa8
	9LdrtLjjS5Up1uc/0A9vlslUTyPM9GVjbVFT2p9o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248036;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=z9Pudc8gTXpAO2m9J4O0g9oSgXjLVMB30G1IRBosKHY=;
	b=0kvyBiwMlG2doZIXH+oJAJcjfl0XF3PvFH4DIN1AtQM2gbbch5tx7SRvdvKk1yEi
	wF5fcG/pSah+nVoGvqCIGYLvJlGQ2HL9pEiC+AwTUW2CKrRovQuQI3tGnDqa6dYs3VQ
	yx/m2w1LNwzDxI61dy+npqYaynX/r36INqRt+3A4=
Content-Type: multipart/mixed; boundary="===============5586114346871440444=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] u-boot-tools: upgrading to 2024.04 SUCCEEDED
Message-ID: <0101018ee58a657b-5b75f0d1-fcde-45e9-b709-972e04b09d34-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:56 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198250

--===============5586114346871440444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *u-boot-tools* to *2024.04* has Succeeded.

Next steps:
    - apply the patch: git am 0001-u-boot-tools-upgrade-2024.01-2024.04.patch
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
From 674c44795f1da0b13313ab119eabd46a0557d787 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 17:09:53 +0000
Subject: [PATCH] u-boot-tools: upgrade 2024.01 -> 2024.04

---
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../u-boot/{u-boot-tools_2024.01.bb => u-boot-tools_2024.04.bb} | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2024.01.bb => u-boot-tools_2024.04.bb} (98%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 1f17bd7d0a..ca5357392a 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e"
+SRCREV = "25049ad560826f7dc1c4740883b0016014a59789"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2024.04.bb
similarity index 98%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2024.04.bb
index 7eaf721ca8..ef386f76e6 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2024.04.bb
@@ -1,2 +1,3 @@
 require u-boot-common.inc
 require u-boot-tools.inc
+
-- 
2.42.0


--===============5586114346871440444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/u-boot-tools: PKGV changed from 2024.01 [default] to 2024.04 [default]
packages/core2-64-poky-linux/u-boot-tools: PV changed from "2024.01" to "2024.04"
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-dbg: PKGSIZE changed from 3760760 to 3789552 (+1%)
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-dbg: PKGV changed from 2024.01 [default] to 2024.04 [default]
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-dbg: PV changed from "2024.01" to "2024.04"
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-dev: PKGV changed from 2024.01 [default] to 2024.04 [default]
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-dev: PV changed from "2024.01" to "2024.04"
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-doc: PKGV changed from 2024.01 [default] to 2024.04 [default]
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-doc: PV changed from "2024.01" to "2024.04"
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-locale: PKGV changed from 2024.01 [default] to 2024.04 [default]
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-locale: PV changed from "2024.01" to "2024.04"
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-mkeficapsule: PKGV changed from 2024.01 [default] to 2024.04 [default]
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-mkeficapsule: PV changed from "2024.01" to "2024.04"
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-mkenvimage: PKGV changed from 2024.01 [default] to 2024.04 [default]
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-mkenvimage: PV changed from "2024.01" to "2024.04"
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-mkimage: PKGV changed from 2024.01 [default] to 2024.04 [default]
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-mkimage: PV changed from "2024.01" to "2024.04"
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-src: PKGSIZE changed from 1417341 to 1433963 (+1%)
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-src: PKGV changed from 2024.01 [default] to 2024.04 [default]
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-src: PV changed from "2024.01" to "2024.04"
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-staticdev: PKGV changed from 2024.01 [default] to 2024.04 [default]
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools-staticdev: PV changed from "2024.01" to "2024.04"
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools: PKGV changed from 2024.01 [default] to 2024.04 [default]
packages/core2-64-poky-linux/u-boot-tools/u-boot-tools: PV changed from "2024.01" to "2024.04"

--===============5586114346871440444==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-u-boot-tools-upgrade-2024.01-2024.04.patch"

RnJvbSA2NzRjNDQ3OTVmMWRhMGIxMzMxM2FiMTE5ZWFiZDQ2YTA1NTdkNzg3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTc6MDk6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
LWJvb3QtdG9vbHM6IHVwZ3JhZGUgMjAyNC4wMSAtPiAyMDI0LjA0CgotLS0KIG1ldGEvcmVjaXBl
cy1ic3AvdS1ib290L3UtYm9vdC1jb21tb24uaW5jICAgICAgICAgICAgICAgICAgICAgICB8IDIg
Ky0KIC4uLi91LWJvb3Qve3UtYm9vdC10b29sc18yMDI0LjAxLmJiID0+IHUtYm9vdC10b29sc18y
MDI0LjA0LmJifSB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC97dS1ib290LXRvb2xzXzIw
MjQuMDEuYmIgPT4gdS1ib290LXRvb2xzXzIwMjQuMDQuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290LWNvbW1vbi5pbmMgYi9tZXRhL3JlY2lwZXMt
YnNwL3UtYm9vdC91LWJvb3QtY29tbW9uLmluYwppbmRleCAxZjE3YmQ3ZDBhLi5jYTUzNTczOTJh
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJvb3QtY29tbW9uLmluYwor
KysgYi9tZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJvb3QtY29tbW9uLmluYwpAQCAtMTIsNyAr
MTIsNyBAQCBQRSA9ICIxIgogCiAjIFdlIHVzZSB0aGUgcmV2aXNpb24gaW4gb3JkZXIgdG8gYXZv
aWQgaGF2aW5nIHRvIGZldGNoIGl0IGZyb20gdGhlCiAjIHJlcG8gZHVyaW5nIHBhcnNlCi1TUkNS
RVYgPSAiODY2Y2E5NzJkNmMzY2FiZWFmNmRiYWM0MzFlOGUwOGJiMzBiM2M4ZSIKK1NSQ1JFViA9
ICIyNTA0OWFkNTYwODI2ZjdkYzFjNDc0MDg4M2IwMDE2MDE0YTU5Nzg5IgogCiBTUkNfVVJJID0g
ImdpdDovL3NvdXJjZS5kZW54LmRlL3UtYm9vdC91LWJvb3QuZ2l0O3Byb3RvY29sPWh0dHBzO2Jy
YW5jaD1tYXN0ZXIiCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ic3AvdS1ib290L3UtYm9v
dC10b29sc18yMDI0LjAxLmJiIGIvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290LXRvb2xz
XzIwMjQuMDQuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWJzcC91LWJvb3QvdS1ib290LXRvb2xzXzIwMjQuMDEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1ic3AvdS1ib290L3UtYm9vdC10b29sc18yMDI0LjA0LmJiCmluZGV4IDdlYWY3MjFjYTguLmVm
Mzg2Zjc2ZTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ic3AvdS1ib290L3UtYm9vdC10b29s
c18yMDI0LjAxLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ic3AvdS1ib290L3UtYm9vdC10b29sc18y
MDI0LjA0LmJiCkBAIC0xLDIgKzEsMyBAQAogcmVxdWlyZSB1LWJvb3QtY29tbW9uLmluYwogcmVx
dWlyZSB1LWJvb3QtdG9vbHMuaW5jCisKLS0gCjIuNDIuMAoK

--===============5586114346871440444==--

