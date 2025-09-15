Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B95CAC5AC
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:48 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.30920.1757937278974749706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=0Qkz7Urr;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=H6ArH5DW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101994d3a2deb-e81f4b2d-f15f-41be-a886-bf24d7df1ebe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937282;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AYGcapvLfQg+qy5LrXZK72kr14lMQgrFaKLDcKJMFEA=;
	b=0Qkz7UrrPeDgQfAm0SyU++Q/TMuQYcaZjGM3cScdm39c3XVqBsNBf+xGHAmt1VUI
	wkiIllvw5RdXkAP5atMZxSIR8fx/CLBcF157w+RqrGe/R7nLKJQ1H99K1ds2SZt6MQS
	c6M3LpIv9PCZkqPXtIAY5GaVDX/Nv/rrSgTodZHY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937282;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AYGcapvLfQg+qy5LrXZK72kr14lMQgrFaKLDcKJMFEA=;
	b=H6ArH5DW6CPxlpmK/YZVIbzk1VcyLutVVC+Q/ly1K6OlIjmq6nC/lEISYQWeHHgj
	kDxqZ7Cn9AUKqlpfsSEV2JcXo2G9gGohvl2SLNf87jvNQjDmdYVfh8VV07R/RlYWOPB
	DJEhsZZywI9pk6IrM+diObQewrd2JLBabUadvXoU=
Content-Type: multipart/mixed; boundary="===============6705557686362380306=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyparsing: upgrading to 3.2.4 SUCCEEDED
Message-ID: <010101994d3a2deb-e81f4b2d-f15f-41be-a886-bf24d7df1ebe-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223430

--===============6705557686362380306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyparsing* to *3.2.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyparsing-upgrade-3.2.3-3.2.4.patch
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
From 1b76f45a99c7e8bb6b60e4e49e68dc3f06c96d38 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 08:25:21 +0000
Subject: [PATCH] python3-pyparsing: upgrade 3.2.3 -> 3.2.4

---
 .../{python3-pyparsing_3.2.3.bb => python3-pyparsing_3.2.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.2.3.bb => python3-pyparsing_3.2.4.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.2.3.bb b/meta/recipes-devtools/python/python3-pyparsing_3.2.4.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pyparsing_3.2.3.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.2.4.bb
index 459b01fd94..46556e6fb8 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.2.3.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.2.4.bb
@@ -10,7 +10,7 @@ BUGTRACKER = "https://github.com/pyparsing/pyparsing/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[sha256sum] = "b9c13f1ab8b3b542f72e28f634bad4de758ab3ce4546e4301970ad6fa77c38be"
+SRC_URI[sha256sum] = "fff89494f45559d0f2ce46613b419f632bbb6afbdaed49696d322bcf98a58e99"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============6705557686362380306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pyparsing: PV changed from "3.2.3" to "3.2.4"
packages/x86-64-v3-poky-linux/python3-pyparsing: PKGV changed from 3.2.3 [default] to 3.2.4 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyparsing/pyparsing-3.2.3.tar.gz;downloadfilename=pyparsing-3.2.3.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyparsing/pyparsing-3.2.4.tar.gz;downloadfilename=pyparsing-3.2.4.tar.gz"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-dbg: PV changed from "3.2.3" to "3.2.4"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-dbg: PKGV changed from 3.2.3 [default] to 3.2.4 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-dev: PV changed from "3.2.3" to "3.2.4"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-dev: PKGV changed from 3.2.3 [default] to 3.2.4 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-doc: PV changed from "3.2.3" to "3.2.4"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-doc: PKGV changed from 3.2.3 [default] to 3.2.4 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-locale: PV changed from "3.2.3" to "3.2.4"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-locale: PKGV changed from 3.2.3 [default] to 3.2.4 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-src: PV changed from "3.2.3" to "3.2.4"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-src: PKGV changed from 3.2.3 [default] to 3.2.4 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-staticdev: PV changed from "3.2.3" to "3.2.4"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-staticdev: PKGV changed from 3.2.3 [default] to 3.2.4 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing: PV changed from "3.2.3" to "3.2.4"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing: PKGV changed from 3.2.3 [default] to 3.2.4 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing: PKGSIZE changed from 903032 to 929097 (+3%)
Changes to packages/x86-64-v3-poky-linux/python3-pyparsing (sysroot):
  /usr/lib/python3.13/site-packages/pyparsing-3.2.3.dist-info moved to /usr/lib/python3.13/site-packages/pyparsing-3.2.4.dist-info

--===============6705557686362380306==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyparsing-upgrade-3.2.3-3.2.4.patch"

RnJvbSAxYjc2ZjQ1YTk5YzdlOGJiNmI2MGU0ZTQ5ZTY4ZGMzZjA2Yzk2ZDM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMDg6MjU6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5cGFyc2luZzogdXBncmFkZSAzLjIuMyAtPiAzLjIuNAoKLS0tCiAuLi4ve3B5dGhv
bjMtcHlwYXJzaW5nXzMuMi4zLmJiID0+IHB5dGhvbjMtcHlwYXJzaW5nXzMuMi40LmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5cGFyc2luZ18zLjIuMy5i
YiA9PiBweXRob24zLXB5cGFyc2luZ18zLjIuNC5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlwYXJzaW5nXzMuMi4zLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5cGFyc2luZ18zLjIuNC5iYgpzaW1p
bGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHlwYXJzaW5nXzMuMi4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcHlwYXJzaW5nXzMuMi40LmJiCmluZGV4IDQ1OWIwMWZkOTQuLjQ2
NTU2ZTZmYjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1weXBhcnNpbmdfMy4yLjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXB5cGFyc2luZ18zLjIuNC5iYgpAQCAtMTAsNyArMTAsNyBAQCBCVUdUUkFDS0VSID0g
Imh0dHBzOi8vZ2l0aHViLmNvbS9weXBhcnNpbmcvcHlwYXJzaW5nL2lzc3VlcyIKIExJQ0VOU0Ug
PSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NjU3YTU2NjIz
Mzg4ODUxM2UxZjA3YmExM2UyZjQ3ZjEiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiOWMxM2Yx
YWI4YjNiNTQyZjcyZTI4ZjYzNGJhZDRkZTc1OGFiM2NlNDU0NmU0MzAxOTcwYWQ2ZmE3N2MzOGJl
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImZmZjg5NDk0ZjQ1NTU5ZDBmMmNlNDY2MTNiNDE5ZjYz
MmJiYjZhZmJkYWVkNDk2OTZkMzIyYmNmOThhNThlOTkiCiAKIGluaGVyaXQgcHlwaSBweXRob25f
ZmxpdF9jb3JlCiAKLS0gCjIuNDcuMQoK

--===============6705557686362380306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-pyparsing (sysroot):
  /usr/lib/python3.13/site-packages/pyparsing-3.2.3.dist-info moved to /usr/lib/python3.13/site-packages/pyparsing-3.2.4.dist-info

--===============6705557686362380306==--

