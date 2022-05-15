Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E05CC38A2B
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:22 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web09.19049.1652634914268937106
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QveMtl69;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 01010180c8b7869e-26376066-ff80-40d3-88d4-03a43387d3ad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9+8DgL2zpGJFDbemApTmA/PpMgmhnZGVj227vF2v/Lg=;
	b=QveMtl69CcNklaJ54gDi08dyaSJwM4js6+lomdIvylFMXcPBKMxOcp7iPymv4XJ3
	OVHXEufnegeMoiqaSeS6BdGACrEvhlMgt9/Hp+ldZTltAFGIrvrFywcqtvVs3rEdfOH
	X3y51CKAsoiXvTTVCXuzk/5B6nOoxzjIV+QolpNc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9+8DgL2zpGJFDbemApTmA/PpMgmhnZGVj227vF2v/Lg=;
	b=RJ/CStBSLw7y6ui6+RPsgsT30j8Yw8rpFQQxsMqv4KqnMn1gGzw7EEmuOX/vxH3d
	TzXp4Jkrz8M4BlWE8vQ7byacHZOFPfsTWRPkM4rgJHWbBZ5deahSXRSwOkxiFZsygFU
	qyuAa1rbUyJFlrauWNlwpCHE14wIOKyGdrYQgdh4=
Content-Type: multipart/mixed; boundary="===============2660267083857391450=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography-vectors: upgrading to 37.0.2 SUCCEEDED
Message-ID: 
 <01010180c8b7869e-26376066-ff80-40d3-88d4-03a43387d3ad-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:12 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165635

--===============2660267083857391450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cryptography-vectors* to *37.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cryptography-vectors-upgrade-37.0.1-37.0.2.patch
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
--===============2660267083857391450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cryptography-vectors: PKGV changed from 37.0.1 [default] to 37.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors: PV changed from "37.0.1" to "37.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-37.0.1.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-37.0.2.tar.gz"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 37.0.1 [default] to 37.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "37.0.1" to "37.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 37.0.1 [default] to 37.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "37.0.1" to "37.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 37.0.1 [default] to 37.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "37.0.1" to "37.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 37.0.1 [default] to 37.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "37.0.1" to "37.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 37.0.1 [default] to 37.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "37.0.1" to "37.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 37.0.1 [default] to 37.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "37.0.1" to "37.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 37.0.1 [default] to 37.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "37.0.1" to "37.0.2"
Changes to packages/core2-32-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.10/site-packages/cryptography_vectors-37.0.1.dist-info moved to /usr/lib/python3.10/site-packages/cryptography_vectors-37.0.2.dist-info

--===============2660267083857391450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.10/site-packages/cryptography_vectors-37.0.1.dist-info moved to /usr/lib/python3.10/site-packages/cryptography_vectors-37.0.2.dist-info

--===============2660267083857391450==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-cryptography-vectors-upgrade-37.0.1-37.0.2.patch"

From 185e30325c61cd2c53f3cadb76b020646e640c48 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 08:29:38 +0000
Subject: [PATCH] python3-cryptography-vectors: upgrade 37.0.1 -> 37.0.2

---
 ...vectors_37.0.1.bb => python3-cryptography-vectors_37.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_37.0.1.bb => python3-cryptography-vectors_37.0.2.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb
index 98740ba95f..3dbdc8ce3e 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "66c9a714232be730fe822bd7e4e9da6231ff9e537ee4feb0f092c06b8ea4d94a"
+SRC_URI[sha256sum] = "7c65d3de51756f418142df605417ec2c6e961c364f70cc8a103030889d5a3219"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.31.1


--===============2660267083857391450==--

