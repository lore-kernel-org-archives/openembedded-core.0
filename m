Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFDBC47095
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:12 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web12.2224.1651434544735444576
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OzHQEw7m;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 01010180812b5ac3-cadc25a4-870a-4edb-a305-56c2dc0f46b0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434544;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AAavQf9ZMoG/Q8ILFIzWM1wsRQPRCh6AdUmmRilxgs0=;
	b=OzHQEw7mK4n5MjpnSuGrSIfik/NPYglsT3J8oG2eydKHSCuaGEYCQbZ6M1adPu+r
	b5RDHaiKOXLczs0Y5CQsD+POTz0Bim9Cv5SQYBc/QSEA6jGvkxG1UK0TcNq9i9ZL6RG
	H/99C3JXVTBTIaaJwNkWQirVE42avi1q28JOcEfw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434544;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AAavQf9ZMoG/Q8ILFIzWM1wsRQPRCh6AdUmmRilxgs0=;
	b=USD7Kp0eGDnv+l+B/yggZJjBW2d+Voyi/eDpRTfWSa/KojqzwxoBTe5WQZIUcgae
	ZSjO/8mGqXZsPSguz1D/4+N3Yrc52lBVOc7FWlGTlQKcHBJVf9iXke1JIeh8L+mJftC
	Gh6499qnIXUdn5FFpS/RAOlnHWd8FLnQeNQJMsfA=
Content-Type: multipart/mixed; boundary="===============3035728105864631046=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-headers: upgrading to 1.3.211.0 SUCCEEDED
Message-ID: 
 <01010180812b5ac3-cadc25a4-870a-4edb-a305-56c2dc0f46b0-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:04 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165150

--===============3035728105864631046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *spirv-headers* to *1.3.211.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-headers-upgrade-1.3.204.1-1.3.211.0.patch
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
--===============3035728105864631046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/spirv-headers: PV changed from "1.3.204.1" to "1.3.211.0"
packages/core2-32-poky-linux/spirv-headers: PKGV changed from 1.3.204.1 [default] to 1.3.211.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dbg: PV changed from "1.3.204.1" to "1.3.211.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dbg: PKGV changed from 1.3.204.1 [default] to 1.3.211.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PKGSIZE changed from 2622996 to 2640793 (+1%)
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PV changed from "1.3.204.1" to "1.3.211.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PKGV changed from 1.3.204.1 [default] to 1.3.211.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-doc: PV changed from "1.3.204.1" to "1.3.211.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-doc: PKGV changed from 1.3.204.1 [default] to 1.3.211.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-locale: PV changed from "1.3.204.1" to "1.3.211.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-locale: PKGV changed from 1.3.204.1 [default] to 1.3.211.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-src: PV changed from "1.3.204.1" to "1.3.211.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-src: PKGV changed from 1.3.204.1 [default] to 1.3.211.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-staticdev: PV changed from "1.3.204.1" to "1.3.211.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-staticdev: PKGV changed from 1.3.204.1 [default] to 1.3.211.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers: PV changed from "1.3.204.1" to "1.3.211.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers: PKGV changed from 1.3.204.1 [default] to 1.3.211.0 [default]

--===============3035728105864631046==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-spirv-headers-upgrade-1.3.204.1-1.3.211.0.patch"

From bb8f2d6570a4fdc083272fbbae8c99af992c6d49 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 15:14:11 +0000
Subject: [PATCH] spirv-headers: upgrade 1.3.204.1 -> 1.3.211.0

---
 .../{spirv-headers_1.3.204.1.bb => spirv-headers_1.3.211.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.204.1.bb => spirv-headers_1.3.211.0.bb} (92%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.204.1.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.211.0.bb
similarity index 92%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.204.1.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.211.0.bb
index 72416b441f..910ba668af 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.204.1.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.211.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
-SRCREV = "b42ba6d92faf6b4938e6f22ddd186dbdacc98d78"
+SRCREV = "4995a2f2723c401eb0ea3e10c81298906bf1422b"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=master"
 PE = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.27.0


--===============3035728105864631046==--

