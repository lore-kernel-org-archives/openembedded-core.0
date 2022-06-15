Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 036A4CCA490
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:46 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web12.4406.1655298222132433239
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LEhUP2ri;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 0101018167766569-e2137a12-aec5-4882-90cf-c0731427dbeb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6zKIDm0NQqipeMnHFk52Phl6AU0gQiDMcuE3nmArTnI=;
	b=LEhUP2riTuhcI566C9voV1WtT3DGkJL0o7UEaYRMqe1/AFRF3IUxu+XrX6yGw4LY
	iOQFHVKSiUD1RR7W8GW9oSnIKDVhECHO36R2X2KYO1zPJMdcceU9jbLcGBkXE/xXRMr
	JTweg/u/MuNH+jARuEakQaLfgK2qxeYYNKJ5XFes=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6zKIDm0NQqipeMnHFk52Phl6AU0gQiDMcuE3nmArTnI=;
	b=dZeLLwpqe+B4v9ReVU8M8ow5xrFHEAtSf6NPVjaSEdL1Ht7G1WjoeJlZa/eYFHGK
	PgUlYNTXiR1JpphvsE1LkEEK/BTxuJzInhTHL0H83Vk+e/ygd9FDShgx+TY+DMvbWyj
	Szx2dQvb4Q/KaeE1masqgdJ72hCBOTLK+wHNelew=
Content-Type: multipart/mixed; boundary="===============8942935786361716182=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-headers: upgrading to 1.3.216.0 SUCCEEDED
Message-ID: 
 <0101018167766569-e2137a12-aec5-4882-90cf-c0731427dbeb-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:41 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166964

--===============8942935786361716182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *spirv-headers* to *1.3.216.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-headers-upgrade-1.3.211.0-1.3.216.0.patch
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
--===============8942935786361716182==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-spirv-headers-upgrade-1.3.211.0-1.3.216.0.patch"

From c3930264087ca93a721496f6fdac169d10ea5683 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 12:14:34 +0000
Subject: [PATCH] spirv-headers: upgrade 1.3.211.0 -> 1.3.216.0

---
 .../{spirv-headers_1.3.211.0.bb => spirv-headers_1.3.216.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.211.0.bb => spirv-headers_1.3.216.0.bb} (92%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.211.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb
similarity index 92%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.211.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb
index 910ba668af..94500a96ba 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.211.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
-SRCREV = "4995a2f2723c401eb0ea3e10c81298906bf1422b"
+SRCREV = "b2a156e1c0434bc8c99aaebba1c7be98be7ac580"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=master"
 PE = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.31.1


--===============8942935786361716182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/spirv-headers: PV changed from "1.3.211.0" to "1.3.216.0"
packages/core2-32-poky-linux/spirv-headers: PKGV changed from 1.3.211.0 [default] to 1.3.216.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dbg: PV changed from "1.3.211.0" to "1.3.216.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dbg: PKGV changed from 1.3.211.0 [default] to 1.3.216.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PV changed from "1.3.211.0" to "1.3.216.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PKGSIZE changed from 2640793 to 2719888 (+3%)
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: FILELIST: added "/usr/include/spirv/unified1/spirv.bf"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PKGV changed from 1.3.211.0 [default] to 1.3.216.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-doc: PV changed from "1.3.211.0" to "1.3.216.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-doc: PKGV changed from 1.3.211.0 [default] to 1.3.216.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-locale: PV changed from "1.3.211.0" to "1.3.216.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-locale: PKGV changed from 1.3.211.0 [default] to 1.3.216.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-src: PV changed from "1.3.211.0" to "1.3.216.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-src: PKGV changed from 1.3.211.0 [default] to 1.3.216.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-staticdev: PV changed from "1.3.211.0" to "1.3.216.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-staticdev: PKGV changed from 1.3.211.0 [default] to 1.3.216.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers: PV changed from "1.3.211.0" to "1.3.216.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers: PKGV changed from 1.3.211.0 [default] to 1.3.216.0 [default]
Changes to packages/core2-32-poky-linux/spirv-headers (sysroot):
  /usr/include/spirv/unified1/spirv.bf was added

--===============8942935786361716182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: FILELIST: added "/usr/include/spirv/unified1/spirv.bf"
Changes to packages/core2-32-poky-linux/spirv-headers (sysroot):
  /usr/include/spirv/unified1/spirv.bf was added

--===============8942935786361716182==--

