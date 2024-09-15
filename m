Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98F7EEEC02
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:21 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.115386.1726410840165594155
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=SVHbx8zT;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=zhOsn6gN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010191f61ad9aa-eea5646f-6590-471b-bf07-07d3ce4f3095-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410840;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BMSqYkt5QHbAwIbbySXIjt2rBr6v4fCKG/XHJwfZOMk=;
	b=SVHbx8zTx7FiHijYMALY9BM0z3cQ2YM+wodyKXYLTKb2T605E41g3oO+urVZuouK
	woNncndKqlWMUp/dCbQChtWMMy8cdVpyoVPztCpwEl06Nl+d7Zw3qVs0Rdu2zBbGDGy
	kvEqCQ1zgraM+enT5X7Ceh7W3Y0gHZmuqDBxNIAs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410840;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BMSqYkt5QHbAwIbbySXIjt2rBr6v4fCKG/XHJwfZOMk=;
	b=zhOsn6gNeRFv8Wf7BIZxm5Iq0JLgI3h64I5HI+0REBVJpjOm8nBd/3KHxpPAOy3i
	nUAvOeoo8CHR3mN0rrd9cmo2Ik3tg2ssZkgfX7INrBa0Gm5suQI4Y8U41WiYKb54lxA
	E42lBfjhgcA7L59FTtLwxqwRGfXHZM4dO22UwJCY=
Content-Type: multipart/mixed; boundary="===============3716020188953684349=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-zipp: upgrading to 3.20.2 SUCCEEDED
Message-ID: <01010191f61ad9aa-eea5646f-6590-471b-bf07-07d3ce4f3095-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204527

--===============3716020188953684349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-zipp* to *3.20.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-zipp-upgrade-3.20.1-3.20.2.patch
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
From 9adb174f28f661093d35699312cacae82cfde45c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 09:25:45 +0000
Subject: [PATCH] python3-zipp: upgrade 3.20.1 -> 3.20.2

---
 .../python/{python3-zipp_3.20.1.bb => python3-zipp_3.20.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.20.1.bb => python3-zipp_3.20.2.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.20.1.bb b/meta/recipes-devtools/python/python3-zipp_3.20.2.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-zipp_3.20.1.bb
rename to meta/recipes-devtools/python/python3-zipp_3.20.2.bb
index 960a0d69f4..4ab3464471 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.20.1.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.20.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
 
-SRC_URI[sha256sum] = "c22b14cc4763c5a5b04134207736c107db42e9d3ef2d9779d465f5f1bcba572b"
+SRC_URI[sha256sum] = "bc9eb26f4506fda01b81bcde0ca78103b6e62f991b381fec825435c836edbc29"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.44.0


--===============3716020188953684349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.12/site-packages/zipp-3.20.1.dist-info moved to /usr/lib/python3.12/site-packages/zipp-3.20.2.dist-info

--===============3716020188953684349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-zipp: PV changed from "3.20.1" to "3.20.2"
packages/core2-64-poky-linux/python3-zipp: PKGV changed from 3.20.1 [default] to 3.20.2 [default]
packages/core2-64-poky-linux/python3-zipp: SRC_URI changed from "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.20.1.tar.gz;downloadfilename=zipp-3.20.1.tar.gz" to "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.20.2.tar.gz;downloadfilename=zipp-3.20.2.tar.gz"
packages/core2-64-poky-linux/python3-zipp/python3-zipp-dbg: PV changed from "3.20.1" to "3.20.2"
packages/core2-64-poky-linux/python3-zipp/python3-zipp-dbg: PKGV changed from 3.20.1 [default] to 3.20.2 [default]
packages/core2-64-poky-linux/python3-zipp/python3-zipp-dev: PV changed from "3.20.1" to "3.20.2"
packages/core2-64-poky-linux/python3-zipp/python3-zipp-dev: PKGV changed from 3.20.1 [default] to 3.20.2 [default]
packages/core2-64-poky-linux/python3-zipp/python3-zipp-doc: PV changed from "3.20.1" to "3.20.2"
packages/core2-64-poky-linux/python3-zipp/python3-zipp-doc: PKGV changed from 3.20.1 [default] to 3.20.2 [default]
packages/core2-64-poky-linux/python3-zipp/python3-zipp-locale: PV changed from "3.20.1" to "3.20.2"
packages/core2-64-poky-linux/python3-zipp/python3-zipp-locale: PKGV changed from 3.20.1 [default] to 3.20.2 [default]
packages/core2-64-poky-linux/python3-zipp/python3-zipp-src: PV changed from "3.20.1" to "3.20.2"
packages/core2-64-poky-linux/python3-zipp/python3-zipp-src: PKGV changed from 3.20.1 [default] to 3.20.2 [default]
packages/core2-64-poky-linux/python3-zipp/python3-zipp-staticdev: PV changed from "3.20.1" to "3.20.2"
packages/core2-64-poky-linux/python3-zipp/python3-zipp-staticdev: PKGV changed from 3.20.1 [default] to 3.20.2 [default]
packages/core2-64-poky-linux/python3-zipp/python3-zipp: PV changed from "3.20.1" to "3.20.2"
packages/core2-64-poky-linux/python3-zipp/python3-zipp: PKGSIZE changed from 48399 to 49657 (+3%)
packages/core2-64-poky-linux/python3-zipp/python3-zipp: PKGV changed from 3.20.1 [default] to 3.20.2 [default]
Changes to packages/core2-64-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.12/site-packages/zipp-3.20.1.dist-info moved to /usr/lib/python3.12/site-packages/zipp-3.20.2.dist-info

--===============3716020188953684349==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-zipp-upgrade-3.20.1-3.20.2.patch"

RnJvbSA5YWRiMTc0ZjI4ZjY2MTA5M2QzNTY5OTMxMmNhY2FlODJjZmRlNDVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMDk6MjU6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXppcHA6IHVwZ3JhZGUgMy4yMC4xIC0+IDMuMjAuMgoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXppcHBfMy4yMC4xLmJiID0+IHB5dGhvbjMtemlwcF8zLjIwLjIuYmJ9ICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXppcHBfMy4yMC4xLmJiID0+IHB5
dGhvbjMtemlwcF8zLjIwLjIuYmJ9ICg4MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXppcHBfMy4yMC4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXppcHBfMy4yMC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggODIlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy16aXBwXzMuMjAu
MS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXppcHBf
My4yMC4yLmJiCmluZGV4IDk2MGEwZDY5ZjQuLjRhYjM0NjQ0NzEgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy16aXBwXzMuMjAuMS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtemlwcF8zLjIwLjIuYmIKQEAgLTMsNyAr
Myw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9qYXJhY28vemlwcCIKIExJQ0VO
U0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MTQxNjQz
ZTExYzQ4ODk4MTUwZGFhODM4MDJkYmM2NWYiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjMjJi
MTRjYzQ3NjNjNWE1YjA0MTM0MjA3NzM2YzEwN2RiNDJlOWQzZWYyZDk3NzlkNDY1ZjVmMWJjYmE1
NzJiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImJjOWViMjZmNDUwNmZkYTAxYjgxYmNkZTBjYTc4
MTAzYjZlNjJmOTkxYjM4MWZlYzgyNTQzNWM4MzZlZGJjMjkiCiAKIERFUEVORFMgKz0gInB5dGhv
bjMtc2V0dXB0b29scy1zY20tbmF0aXZlIgogCi0tIAoyLjQ0LjAKCg==

--===============3716020188953684349==--

