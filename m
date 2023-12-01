Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA55C25B60
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:15:00 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.22315.1701436491260472944
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OiXgt0Lx;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mN7v4OBL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018c25848246-3720e64a-c284-4a63-8581-707911814b49-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436490;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JU/H+qBEmWaw0gDE2Of8QTnwwrEi8iKVWYVjfz46ZKk=;
	b=OiXgt0Lxg7i/39LstZSGIUMSLoZrip0g/6AK/OJHotSH/6H8NOWyNuZzYxMnRzC9
	1l9uozu5zlKeyYDcpwOxAiAPyH+TfGM9ZL+uq/WN1RENU7mBQuJZmxLikmEx7VfloR9
	vU6Zk3MKRo7eZk23YzngTOocpiaFXUUWxMsOM0TI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436490;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JU/H+qBEmWaw0gDE2Of8QTnwwrEi8iKVWYVjfz46ZKk=;
	b=mN7v4OBLYeNmKCr9Sdsungya3j0mxWpYrGeFY/muIcFTtmnki2HZhf1D+h5CrpEK
	ttI7llnkEyZNNY4srvDseLvu/6Ml4ze35r9NGq/55VhCfyTVv6cwKl/sv4PY6KbtcxK
	faJGziTBUj4jiYgXgVixHtneY4PdS7gNpbBXAtNY=
Content-Type: multipart/mixed; boundary="===============4340663935840652288=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 254.7 SUCCEEDED
Message-ID: <0101018c25848246-3720e64a-c284-4a63-8581-707911814b49-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:15:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191581

--===============4340663935840652288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *254.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-systemd-boot-upgrade-254.4-254.7.patch
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
From 8d393a69f5cd8b5c06327c8778b5243b074e8ad7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Dec 2023 06:26:59 +0000
Subject: [PATCH] systemd-boot: upgrade 254.4 -> 254.7

---
 .../systemd/{systemd-boot_254.4.bb => systemd-boot_254.7.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_254.4.bb => systemd-boot_254.7.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_254.4.bb b/meta/recipes-core/systemd/systemd-boot_254.7.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_254.4.bb
rename to meta/recipes-core/systemd/systemd-boot_254.7.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index ccc3236457..f79d14a2e8 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "2e7504449a51fb38db9cd2da391c6434f82def51"
+SRCREV = "be8b196ed026164f29943d8a1d04dc2d2ae3942a"
 SRCBRANCH = "v254-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
 
-- 
2.39.2


--===============4340663935840652288==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemd-boot-upgrade-254.4-254.7.patch"

RnJvbSA4ZDM5M2E2OWY1Y2Q4YjVjMDYzMjdjODc3OGI1MjQzYjA3NGU4YWQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBEZWMgMjAyMyAwNjoyNjo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN5
c3RlbWQtYm9vdDogdXBncmFkZSAyNTQuNCAtPiAyNTQuNwoKLS0tCiAuLi4vc3lzdGVtZC97c3lz
dGVtZC1ib290XzI1NC40LmJiID0+IHN5c3RlbWQtYm9vdF8yNTQuNy5iYn0gICAgfCAwCiBtZXRh
L3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC97c3lzdGVtZC1ib290XzI1NC40LmJi
ID0+IHN5c3RlbWQtYm9vdF8yNTQuNy5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjU0LjQuYmIgYi9tZXRhL3JlY2lwZXMtY29y
ZS9zeXN0ZW1kL3N5c3RlbWQtYm9vdF8yNTQuNy5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjU0LjQuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI1NC43LmJi
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jIGIvbWV0
YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYwppbmRleCBjY2MzMjM2NDU3Li5mNzlk
MTRhMmU4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC5pbmMKQEAgLTE1LDcgKzE1
LDcgQEAgTElDRU5TRTpsaWJzeXN0ZW1kID0gIkxHUEwtMi4xLW9yLWxhdGVyIgogTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5HUEwyO21kNT03NTE0MTkyNjBhYTk1NDQ5OWY3YWJh
YWJhYTg4MmJiZSBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFLkxHUEwyLjE7
bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIgogCi1TUkNSRVYgPSAiMmU3NTA0
NDQ5YTUxZmIzOGRiOWNkMmRhMzkxYzY0MzRmODJkZWY1MSIKK1NSQ1JFViA9ICJiZThiMTk2ZWQw
MjYxNjRmMjk5NDNkOGExZDA0ZGMyZDJhZTM5NDJhIgogU1JDQlJBTkNIID0gInYyNTQtc3RhYmxl
IgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC1zdGFibGUuZ2l0
O3Byb3RvY29sPWh0dHBzO2JyYW5jaD0ke1NSQ0JSQU5DSH0iCiAKLS0gCjIuMzkuMgoK

--===============4340663935840652288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/systemd-boot: PV changed from "254.4" to "254.7"
packages/core2-64-poky-linux/systemd-boot: PKGV changed from 254.4 [default] to 254.7 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dbg: PV changed from "254.4" to "254.7"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dbg: PKGV changed from 254.4 [default] to 254.7 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dev: PV changed from "254.4" to "254.7"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-dev: PKGV changed from 254.4 [default] to 254.7 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-doc: PV changed from "254.4" to "254.7"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-doc: PKGV changed from 254.4 [default] to 254.7 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-locale: PV changed from "254.4" to "254.7"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-locale: PKGV changed from 254.4 [default] to 254.7 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-src: PV changed from "254.4" to "254.7"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-src: PKGV changed from 254.4 [default] to 254.7 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot-staticdev: PV changed from "254.4" to "254.7"
packages/core2-64-poky-linux/systemd-boot/systemd-boot-staticdev: PKGV changed from 254.4 [default] to 254.7 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot: PV changed from "254.4" to "254.7"
packages/core2-64-poky-linux/systemd-boot/systemd-boot: PKGV changed from 254.4 [default] to 254.7 [default]
packages/core2-64-poky-linux/systemd-boot/systemd-boot: PKGSIZE changed from 97792 to 98304 (+1%)

--===============4340663935840652288==--

