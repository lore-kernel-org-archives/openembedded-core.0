Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25048C47081
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:22 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web12.19015.1652634913640735762
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=EvJcGSlS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 01010180c8b7880e-251b878d-f538-428c-9bc3-3a4f29b11c1a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6ltWT5c0v2PwP/gJU/ciIe5fNMp6yxELrpFgNKTNdy4=;
	b=EvJcGSlSg6CfFL9Ovx+05O3eBva2A1TW8wgZ8XPg5rou3VYb/+M7t8HwfmGrvsP4
	D1VzEMH+lz1E4gwwpUYrjxchj0AvEnsJw3f8C5a6HWG+MJZu8G7sULddYTXZNfUzAYC
	IHXEGU+e5FjpSi03Ic+dV/ZAn6yycOQTJSo8ifc8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6ltWT5c0v2PwP/gJU/ciIe5fNMp6yxELrpFgNKTNdy4=;
	b=bvVb93FIVz1LscCjfImtQcqWwzwnZ2NoOlZ/z4u4UQs2NbYGgBB+Z/jpgyOUmOyo
	sgCj3CMyvMLSxmhrdYJkZ4HR5kYLVC4VEmeJnLeQmv9zPOwKuvs1mR9pmrMFWWg2t4K
	68H7ICjxxz5fuoHVn1AZBq6pCA9WKVfuD3/4x6So=
Content-Type: multipart/mixed; boundary="===============2091177661344930371=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangrc.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pbr: upgrading to 5.9.0 SUCCEEDED
Message-ID: 
 <01010180c8b7880e-251b878d-f538-428c-9bc3-3a4f29b11c1a-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:12 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165622

--===============2091177661344930371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pbr* to *5.9.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pbr-upgrade-5.8.1-5.9.0.patch
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
--===============2091177661344930371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pbr: PKGV changed from 5.8.1 [default] to 5.9.0 [default]
packages/core2-32-poky-linux/python3-pbr: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pbr/pbr-5.8.1.tar.gz file://0001-change-shebang-to-python3.patch" to "https://files.pythonhosted.org/packages/source/p/pbr/pbr-5.9.0.tar.gz file://0001-change-shebang-to-python3.patch"
packages/core2-32-poky-linux/python3-pbr: PV changed from "5.8.1" to "5.9.0"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-dbg: PKGV changed from 5.8.1 [default] to 5.9.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-dbg: PV changed from "5.8.1" to "5.9.0"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-dev: PKGV changed from 5.8.1 [default] to 5.9.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-dev: PV changed from "5.8.1" to "5.9.0"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-doc: PKGV changed from 5.8.1 [default] to 5.9.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-doc: PV changed from "5.8.1" to "5.9.0"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-locale: PKGV changed from 5.8.1 [default] to 5.9.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-locale: PV changed from "5.8.1" to "5.9.0"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-src: PKGV changed from 5.8.1 [default] to 5.9.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-src: PV changed from "5.8.1" to "5.9.0"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-staticdev: PKGV changed from 5.8.1 [default] to 5.9.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-staticdev: PV changed from "5.8.1" to "5.9.0"
packages/core2-32-poky-linux/python3-pbr/python3-pbr: PKGV changed from 5.8.1 [default] to 5.9.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr: PKGSIZE changed from 531467 to 531916 (+0%)
packages/core2-32-poky-linux/python3-pbr/python3-pbr: PV changed from "5.8.1" to "5.9.0"
Changes to packages/core2-32-poky-linux/python3-pbr (sysroot):
  /usr/lib/python3.10/site-packages/pbr-5.8.1.dist-info moved to /usr/lib/python3.10/site-packages/pbr-5.9.0.dist-info

--===============2091177661344930371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pbr (sysroot):
  /usr/lib/python3.10/site-packages/pbr-5.8.1.dist-info moved to /usr/lib/python3.10/site-packages/pbr-5.9.0.dist-info

--===============2091177661344930371==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-pbr-upgrade-5.8.1-5.9.0.patch"

From d3a096a4d298873763f9ed3776f475c301b44d73 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 09:03:24 +0000
Subject: [PATCH] python3-pbr: upgrade 5.8.1 -> 5.9.0

---
 .../python/{python3-pbr_5.8.1.bb => python3-pbr_5.9.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pbr_5.8.1.bb => python3-pbr_5.9.0.bb} (33%)

diff --git a/meta/recipes-devtools/python/python3-pbr_5.8.1.bb b/meta/recipes-devtools/python/python3-pbr_5.9.0.bb
similarity index 33%
rename from meta/recipes-devtools/python/python3-pbr_5.8.1.bb
rename to meta/recipes-devtools/python/python3-pbr_5.9.0.bb
index c8664018fa..c93b71dbd3 100644
--- a/meta/recipes-devtools/python/python3-pbr_5.8.1.bb
+++ b/meta/recipes-devtools/python/python3-pbr_5.9.0.bb
@@ -1,4 +1,4 @@
 inherit setuptools3
 require python-pbr.inc
 
-SRC_URI[sha256sum] = "66bc5a34912f408bb3925bf21231cb6f59206267b7f63f3503ef865c1a292e25"
+SRC_URI[sha256sum] = "e8dca2f4b43560edef58813969f52a56cef023146cbb8931626db80e6c1c4308"
-- 
2.31.1


--===============2091177661344930371==--

