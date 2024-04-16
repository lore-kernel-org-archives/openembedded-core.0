Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEED0C27C4E
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:09 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.13434.1713248038760375095
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HzC+BkFc;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ecmc9YRe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018ee58a707c-a7ed3cf7-345c-4116-ae61-4d6895e91204-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248039;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=twXjUnAJU/Cp8EMwBzLILtgJ71GXt/AUrZXYmHGxbhg=;
	b=HzC+BkFcQnZhROZBqe8XGIgBbx/h/rgOrs9zPJ40HutXoVFIHZMk+d1hL7DdMj6H
	tjpN3oTVMcuvw6vAbRj9SM6URpAjJJrJte/yS3DdwLvr391PtKguCbtSQljUVAenk40
	ETdsodZxDAlX6uRGIbs2nJW+SwOGb115MZ0l4ffY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248039;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=twXjUnAJU/Cp8EMwBzLILtgJ71GXt/AUrZXYmHGxbhg=;
	b=ecmc9YReq5lv9oY7YwyjRzc1pypcGPsg2B5c4AR+42bRkCa/pq7I7hnJthds4jpJ
	wVtipF4ENreABGzKSawqSu/LdJ3zQfTz8753DXWqmphndPfmREJSWZtrfwGCoqjJjNe
	sQDkfNXoK1GwxIvG6WhvLpaAEs4/z7nOBp7fuhoc=
Content-Type: multipart/mixed; boundary="===============1236159395732450226=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyparsing: upgrading to 3.1.2 SUCCEEDED
Message-ID: <0101018ee58a707c-a7ed3cf7-345c-4116-ae61-4d6895e91204-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198298

--===============1236159395732450226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pyparsing* to *3.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyparsing-upgrade-3.1.1-3.1.2.patch
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
From c4b5db790749bf636a8e75854f806fcc5778b196 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 19:46:26 +0000
Subject: [PATCH] python3-pyparsing: upgrade 3.1.1 -> 3.1.2

---
 .../{python3-pyparsing_3.1.1.bb => python3-pyparsing_3.1.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.1.1.bb => python3-pyparsing_3.1.2.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.1.1.bb b/meta/recipes-devtools/python/python3-pyparsing_3.1.2.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pyparsing_3.1.1.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.1.2.bb
index 6f34091c86..64210ade53 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.1.2.bb
@@ -10,7 +10,7 @@ BUGTRACKER = "https://github.com/pyparsing/pyparsing/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[sha256sum] = "ede28a1a32462f5a9705e07aea48001a08f7cf81a021585011deba701581a0db"
+SRC_URI[sha256sum] = "a1bac0ce561155ecc3ed78ca94d3c9378656ad4c94c1270de543f621420f94ad"
 
 UPSTREAM_CHECK_REGEX = "pyparsing-(?P<pver>.*)\.tar"
 
-- 
2.42.0


--===============1236159395732450226==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyparsing-upgrade-3.1.1-3.1.2.patch"

RnJvbSBjNGI1ZGI3OTA3NDliZjYzNmE4ZTc1ODU0ZjgwNmZjYzU3NzhiMTk2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTk6NDY6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5cGFyc2luZzogdXBncmFkZSAzLjEuMSAtPiAzLjEuMgoKLS0tCiAuLi4ve3B5dGhv
bjMtcHlwYXJzaW5nXzMuMS4xLmJiID0+IHB5dGhvbjMtcHlwYXJzaW5nXzMuMS4yLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5cGFyc2luZ18zLjEuMS5i
YiA9PiBweXRob24zLXB5cGFyc2luZ18zLjEuMi5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlwYXJzaW5nXzMuMS4xLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5cGFyc2luZ18zLjEuMi5iYgpzaW1p
bGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHlwYXJzaW5nXzMuMS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcHlwYXJzaW5nXzMuMS4yLmJiCmluZGV4IDZmMzQwOTFjODYuLjY0
MjEwYWRlNTMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1weXBhcnNpbmdfMy4xLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXB5cGFyc2luZ18zLjEuMi5iYgpAQCAtMTAsNyArMTAsNyBAQCBCVUdUUkFDS0VSID0g
Imh0dHBzOi8vZ2l0aHViLmNvbS9weXBhcnNpbmcvcHlwYXJzaW5nL2lzc3VlcyIKIExJQ0VOU0Ug
PSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NjU3YTU2NjIz
Mzg4ODUxM2UxZjA3YmExM2UyZjQ3ZjEiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlZGUyOGEx
YTMyNDYyZjVhOTcwNWUwN2FlYTQ4MDAxYTA4ZjdjZjgxYTAyMTU4NTAxMWRlYmE3MDE1ODFhMGRi
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImExYmFjMGNlNTYxMTU1ZWNjM2VkNzhjYTk0ZDNjOTM3
ODY1NmFkNGM5NGMxMjcwZGU1NDNmNjIxNDIwZjk0YWQiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VY
ID0gInB5cGFyc2luZy0oP1A8cHZlcj4uKilcLnRhciIKIAotLSAKMi40Mi4wCgo=

--===============1236159395732450226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pyparsing (sysroot):
  /usr/lib/python3.12/site-packages/pyparsing-3.1.1.dist-info moved to /usr/lib/python3.12/site-packages/pyparsing-3.1.2.dist-info

--===============1236159395732450226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pyparsing: PV changed from "3.1.1" to "3.1.2"
packages/core2-64-poky-linux/python3-pyparsing: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyparsing/pyparsing-3.1.1.tar.gz;downloadfilename=pyparsing-3.1.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyparsing/pyparsing-3.1.2.tar.gz;downloadfilename=pyparsing-3.1.2.tar.gz"
packages/core2-64-poky-linux/python3-pyparsing: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-dbg: PV changed from "3.1.1" to "3.1.2"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-dbg: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-dev: PV changed from "3.1.1" to "3.1.2"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-dev: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-doc: PV changed from "3.1.1" to "3.1.2"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-doc: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-locale: PV changed from "3.1.1" to "3.1.2"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-locale: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-src: PV changed from "3.1.1" to "3.1.2"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-src: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-staticdev: PV changed from "3.1.1" to "3.1.2"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-staticdev: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing: PV changed from "3.1.1" to "3.1.2"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing: PKGSIZE changed from 861140 to 853325 (-1%)
Changes to packages/core2-64-poky-linux/python3-pyparsing (sysroot):
  /usr/lib/python3.12/site-packages/pyparsing-3.1.1.dist-info moved to /usr/lib/python3.12/site-packages/pyparsing-3.1.2.dist-info

--===============1236159395732450226==--

