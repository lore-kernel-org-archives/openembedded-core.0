Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B0D9C25B07
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:16 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.8483.1698848703858376126
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WouobkP8;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PKNMdkwj;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.193, mailfrom: 0101018b8b45ff66-68d941f0-b2fd-4b18-b226-c91a40f9e86c-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848702;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=goSTQCcycOf2Vy9qM2XgAwDGJWBsh2XQ+QeU9skZlLw=;
	b=WouobkP8O93jxajsylyQhOQj/P7UGxwwMFxC6PDiLsRnO8620zJQZcSkHObaXnND
	uZQHuMIdl9F0OywgniJUAeJqY+Oz/wQLQps9EZwgJ6Dw08F8Zf3jgBe8CgxzQS9xSwZ
	rRlPNnM1DDBYXU/S1ZxjN6GU2m84cQaJRDwMYEx8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848702;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=goSTQCcycOf2Vy9qM2XgAwDGJWBsh2XQ+QeU9skZlLw=;
	b=PKNMdkwjXt8oRVL8rrSlPcry+plGxCvKh4a9PLGPe4U9E60OkvArawjvRrsf7dcq
	6r+8aJeRVgJt9VfAVOW67z77+Zxz4x9AJp+cPvnw5HbNyPBaiogGLubPcRbpdfkqyQk
	EsFLyJbe6N8poSiwE4BVUaq2KAq+gsQeCpr+iCVI=
Content-Type: multipart/mixed; boundary="===============2549472124826269803=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 254.5 SUCCEEDED
Message-ID: <0101018b8b45ff66-68d941f0-b2fd-4b18-b226-c91a40f9e86c-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189939

--===============2549472124826269803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *254.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-systemd-boot-upgrade-254.4-254.5.patch
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
From 433fdc44ae6b71579441dd910600eda20d3897d4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 06:17:34 +0000
Subject: [PATCH] systemd-boot: upgrade 254.4 -> 254.5

---
 .../systemd/{systemd-boot_254.4.bb => systemd-boot_254.5.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_254.4.bb => systemd-boot_254.5.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_254.4.bb b/meta/recipes-core/systemd/systemd-boot_254.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_254.4.bb
rename to meta/recipes-core/systemd/systemd-boot_254.5.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 3ba0b5ffc5..0efcf88922 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "2e7504449a51fb38db9cd2da391c6434f82def51"
+SRCREV = "ef6c2daf9947d23e2ba6d50c42e4a0d79fe8d32c"
 SRCBRANCH = "v254-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
 
-- 
2.39.2


--===============2549472124826269803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/systemd-boot: PV changed from "254.4" to "254.5"
packages/core2-64-poky-linux/systemd-boot: PKGV changed from 254.4 [default] to 254.5 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dbg: PV changed from "254.4" to "254.5"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dbg: PKGV changed from 254.4 [default] to 254.5 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dev: PV changed from "254.4" to "254.5"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dev: PKGV changed from 254.4 [default] to 254.5 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-doc: PV changed from "254.4" to "254.5"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-doc: PKGV changed from 254.4 [default] to 254.5 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-locale: PV changed from "254.4" to "254.5"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-locale: PKGV changed from 254.4 [default] to 254.5 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-src: PV changed from "254.4" to "254.5"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-src: PKGV changed from 254.4 [default] to 254.5 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-staticdev: PV changed from "254.4" to "254.5"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-staticdev: PKGV changed from 254.4 [default] to 254.5 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot: PV changed from "254.4" to "254.5"
packages/core2-64-poky-linux/systemd-boot/systemd-boot: PKGV changed from 254.4 [default] to 254.5 [default]

--===============2549472124826269803==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemd-boot-upgrade-254.4-254.5.patch"

RnJvbSA0MzNmZGM0NGFlNmI3MTU3OTQ0MWRkOTEwNjAwZWRhMjBkMzg5N2Q0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwNjoxNzozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN5
c3RlbWQtYm9vdDogdXBncmFkZSAyNTQuNCAtPiAyNTQuNQoKLS0tCiAuLi4vc3lzdGVtZC97c3lz
dGVtZC1ib290XzI1NC40LmJiID0+IHN5c3RlbWQtYm9vdF8yNTQuNS5iYn0gICAgfCAwCiBtZXRh
L3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC97c3lzdGVtZC1ib290XzI1NC40LmJi
ID0+IHN5c3RlbWQtYm9vdF8yNTQuNS5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjU0LjQuYmIgYi9tZXRhL3JlY2lwZXMtY29y
ZS9zeXN0ZW1kL3N5c3RlbWQtYm9vdF8yNTQuNS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjU0LjQuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI1NC41LmJi
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jIGIvbWV0
YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYwppbmRleCAzYmEwYjVmZmM1Li4wZWZj
Zjg4OTIyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC5pbmMKQEAgLTE0LDcgKzE0
LDcgQEAgTElDRU5TRSA9ICJHUEwtMi4wLW9ubHkgJiBMR1BMLTIuMS1vbmx5IgogTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5HUEwyO21kNT03NTE0MTkyNjBhYTk1NDQ5OWY3YWJh
YWJhYTg4MmJiZSBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFLkxHUEwyLjE7
bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIgogCi1TUkNSRVYgPSAiMmU3NTA0
NDQ5YTUxZmIzOGRiOWNkMmRhMzkxYzY0MzRmODJkZWY1MSIKK1NSQ1JFViA9ICJlZjZjMmRhZjk5
NDdkMjNlMmJhNmQ1MGM0MmU0YTBkNzlmZThkMzJjIgogU1JDQlJBTkNIID0gInYyNTQtc3RhYmxl
IgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC1zdGFibGUuZ2l0
O3Byb3RvY29sPWh0dHBzO2JyYW5jaD0ke1NSQ0JSQU5DSH0iCiAKLS0gCjIuMzkuMgoK

--===============2549472124826269803==--

