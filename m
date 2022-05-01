Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78040C3A5A3
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:12 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web08.2324.1651434543048188996
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=xGzTKRxx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 01010180812b5b80-cde51a56-132c-458e-9fb8-5be02150bee4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434544;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Y7idroXtF9V1g0s3tgs8TjSDkQIz9GZZV7XOPiSBb74=;
	b=xGzTKRxx/fLsM3jgQ8JwZsdi9rQKfu2fkmydSqePgzO9kz3oTy0sHaTVZ6Tzhu8k
	3KIkhkQyfaMoR8phMthIg2C3LgF+a6LZx57R85oMNMmXTeANxOB+MuHiMHL+Y7wzs7b
	/cykoUWro4NdZkweXOF/hWBb0A/IeBR217o05Ndg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434544;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Y7idroXtF9V1g0s3tgs8TjSDkQIz9GZZV7XOPiSBb74=;
	b=UF1P2q/Do+b0yuFJFBblRX1RdpCWImP+uUj5XuaF/JOviHz3uHUE8pXjVOKsHA18
	EZNfF7ZMm8LyaeonL6tFCZ+mvX5yWaAfWoCNRody0lthndGfoafBDOjPWs7NguppOWg
	YufnDg5/mbOi7JHF4qnfrnzIBp3Qq3P2bg/B7/0E=
Content-Type: multipart/mixed; boundary="===============2137979776761821903=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ffmpeg: upgrading to 5.0.1 SUCCEEDED
Message-ID: 
 <01010180812b5b80-cde51a56-132c-458e-9fb8-5be02150bee4-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:04 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165144

--===============2137979776761821903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ffmpeg* to *5.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ffmpeg-upgrade-5.0-5.0.1.patch
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
--===============2137979776761821903==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-ffmpeg-upgrade-5.0-5.0.1.patch"

From 931db96f36d6a40818775e24b086aff8b6563d73 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 16:14:37 +0000
Subject: [PATCH] ffmpeg: upgrade 5.0 -> 5.0.1

---
 .../ffmpeg/{ffmpeg_5.0.bb => ffmpeg_5.0.1.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_5.0.bb => ffmpeg_5.0.1.bb} (98%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
similarity index 98%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 96eef5e0fe..dd14f8df6f 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -25,7 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
            "
-SRC_URI[sha256sum] = "51e919f7d205062c0fd4fae6243a84850391115104ccf1efc451733bc0ac7298"
+SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
-- 
2.27.0


--===============2137979776761821903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ffmpeg/ffmpeg-dbg: PV changed from "5.0" to "5.0.1"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dbg: PKGV changed from 5.0 [default] to 5.0.1 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dbg: PKGSIZE changed from 74957248 to 74946596 (-0%)
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dev: PV changed from "5.0" to "5.0.1"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dev: PKGV changed from 5.0 [default] to 5.0.1 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dev: PKGSIZE changed from 1095026 to 1095091 (+0%)
packages/core2-32-poky-linux/ffmpeg/ffmpeg-doc: PV changed from "5.0" to "5.0.1"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-doc: PKGV changed from 5.0 [default] to 5.0.1 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-doc: PKGSIZE changed from 4938822 to 4939218 (+0%)
packages/core2-32-poky-linux/ffmpeg/ffmpeg-locale: PV changed from "5.0" to "5.0.1"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-locale: PKGV changed from 5.0 [default] to 5.0.1 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-src: PV changed from "5.0" to "5.0.1"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-src: PKGV changed from 5.0 [default] to 5.0.1 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-src: PKGSIZE changed from 42992546 to 42994725 (+0%)
packages/core2-32-poky-linux/ffmpeg/ffmpeg-staticdev: PV changed from "5.0" to "5.0.1"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-staticdev: PKGV changed from 5.0 [default] to 5.0.1 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg: PV changed from "5.0" to "5.0.1"
packages/core2-32-poky-linux/ffmpeg/ffmpeg: PKGV changed from 5.0 [default] to 5.0.1 [default]
packages/core2-32-poky-linux/ffmpeg: PV changed from "5.0" to "5.0.1"
packages/core2-32-poky-linux/ffmpeg: PKGV changed from 5.0 [default] to 5.0.1 [default]
packages/core2-32-poky-linux/ffmpeg: SRC_URI changed from "https://www.ffmpeg.org/releases/ffmpeg-5.0.tar.xz file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch" to "https://www.ffmpeg.org/releases/ffmpeg-5.0.1.tar.xz file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch"
packages/core2-32-poky-linux/ffmpeg/libavcodec: PV changed from "5.0" to "5.0.1"
packages/core2-32-poky-linux/ffmpeg/libavcodec: PKGV changed from 5.0 [default] to 5.0.1 [default]
packages/core2-32-poky-linux/ffmpeg/libavdevice: PV changed from "5.0" to "5.0.1"
packages/core2-32-poky-linux/ffmpeg/libavdevice: PKGV changed from 5.0 [default] to 5.0.1 [default]
packages/core2-32-poky-linux/ffmpeg/libavfilter: PV changed from "5.0" to "5.0.1"
packages/core2-32-poky-linux/ffmpeg/libavfilter: PKGV changed from 5.0 [default] to 5.0.1 [default]
packages/core2-32-poky-linux/ffmpeg/libavformat: PV changed from "5.0" to "5.0.1"
packages/core2-32-poky-linux/ffmpeg/libavformat: PKGV changed from 5.0 [default] to 5.0.1 [default]
packages/core2-32-poky-linux/ffmpeg/libavutil: PV changed from "5.0" to "5.0.1"
packages/core2-32-poky-linux/ffmpeg/libavutil: PKGV changed from 5.0 [default] to 5.0.1 [default]
packages/core2-32-poky-linux/ffmpeg/libpostproc: PV changed from "5.0" to "5.0.1"
packages/core2-32-poky-linux/ffmpeg/libpostproc: PKGV changed from 5.0 [default] to 5.0.1 [default]
packages/core2-32-poky-linux/ffmpeg/libswresample: PV changed from "5.0" to "5.0.1"
packages/core2-32-poky-linux/ffmpeg/libswresample: PKGV changed from 5.0 [default] to 5.0.1 [default]
packages/core2-32-poky-linux/ffmpeg/libswscale: PV changed from "5.0" to "5.0.1"
packages/core2-32-poky-linux/ffmpeg/libswscale: PKGV changed from 5.0 [default] to 5.0.1 [default]

--===============2137979776761821903==--

