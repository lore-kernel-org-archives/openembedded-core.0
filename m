Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F08C3A59E
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:12 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.2286.1651434544370418589
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Qam7/r8I;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010180812b5a68-f4f00565-bac9-4d23-ac40-76e40e354b50-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434543;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zTMLWov7ABOVvxgWRgxPAO9FP18pLFlSFxF96AahHeY=;
	b=Qam7/r8Ii+ntt51UkosoBzZjHHj3bCROv6Q6UWg+RndAkndx4b3uT2Xu0jqtVt3K
	Rb23C80ar/7RYg7iI2uU05WUgzI9b68qqw096refmGPHlnRUBGiJFNsYXTBoBt0nbiI
	DFNfdMEe8jnwZMC8Cl8MuJSVAohL0vedUV7ICe74=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434543;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zTMLWov7ABOVvxgWRgxPAO9FP18pLFlSFxF96AahHeY=;
	b=IXrro+RFFjnGbgsjgUhRJjHojII4u4aG3g7NkrYyXtj28ovXtZBkJNHejunrKZIv
	Y+zdey/dHuFLx8sNFSQVPBm8NNAwmZqR50vuBssf4B615AcAmxuGFRhKwYlBqf/q5p9
	6tQqpJ3HaVg3iCkfwn83QxCteX4IeZm6fAChG3p8=
Content-Type: multipart/mixed; boundary="===============4881863443947926779=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.3.211.0 SUCCEEDED
Message-ID: 
 <01010180812b5a68-f4f00565-bac9-4d23-ac40-76e40e354b50-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:03 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165140

--===============4881863443947926779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-headers* to *1.3.211.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-headers-upgrade-1.3.204.1-1.3.211.0.patch
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
--===============4881863443947926779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/vulkan-headers (sysroot):
  /usr/include/vulkan/vulkan_format_traits.hpp was added
  /usr/share/vulkan/registry/video.xml was added
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vulkan/vulkan_format_traits.hpp"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: FILELIST: added "/usr/share/vulkan/registry/video.xml"

--===============4881863443947926779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vulkan-headers: PV changed from "1.3.204.1" to "1.3.211.0"
packages/core2-32-poky-linux/vulkan-headers: PKGV changed from 1.3.204.1 [default] to 1.3.211.0 [default]
Changes to packages/core2-32-poky-linux/vulkan-headers (sysroot):
  /usr/include/vulkan/vulkan_format_traits.hpp was added
  /usr/share/vulkan/registry/video.xml was added
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dbg: PV changed from "1.3.204.1" to "1.3.211.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dbg: PKGV changed from 1.3.204.1 [default] to 1.3.211.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.3.204.1" to "1.3.211.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.3.204.1 [default] to 1.3.211.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 10477251 to 10878424 (+4%)
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vulkan/vulkan_format_traits.hpp"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.3.204.1" to "1.3.211.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.3.204.1 [default] to 1.3.211.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.3.204.1" to "1.3.211.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.3.204.1 [default] to 1.3.211.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.3.204.1" to "1.3.211.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.3.204.1 [default] to 1.3.211.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.3.204.1" to "1.3.211.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.3.204.1 [default] to 1.3.211.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.3.204.1" to "1.3.211.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.3.204.1 [default] to 1.3.211.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 6133167 to 6410246 (+5%)
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: FILELIST: added "/usr/share/vulkan/registry/video.xml"

--===============4881863443947926779==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.3.204.1-1.3.211.0.patch"

From 5c6cde6e5f9d17363249eb9ba4e35ebd81a0bc19 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 15:18:27 +0000
Subject: [PATCH] vulkan-headers: upgrade 1.3.204.1 -> 1.3.211.0

---
 ...{vulkan-headers_1.3.204.1.bb => vulkan-headers_1.3.211.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.204.1.bb => vulkan-headers_1.3.211.0.bb} (93%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb
index 7397f40fb4..c74eb4cf5b 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "1dace16d8044758d32736eb59802d171970e9448"
+SRCREV = "76f00ef6cbb1886eb1162d1fa39bee8b51e22ee8"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============4881863443947926779==--

