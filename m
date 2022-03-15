Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BACA8C3527E
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:56 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web08.10656.1647349735862899924
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=niZGo1W+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 0101017f8db21ea3-b62b1472-72f1-40dc-93a0-d28c76c8dc09-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1647349735;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yTp0ElMB2ZeePCY72r4/XXOcNspLReNCOriGjkBGY+k=;
	b=niZGo1W+v6C5LWOEe0aP2Bsl9DDvy9s3utebtJrqmypi6cPpG5zDS36LNlGyniRJ
	+fp6j68SiXToR0saNKNwiiKEQqjUl2A8kU5VOmeP7/LfEPMKHLhNV103reVtj/gg00b
	RBK7tIxLjkVbJSqJbtm5Zm035mCq3e7bTWYtrSVM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1647349735;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yTp0ElMB2ZeePCY72r4/XXOcNspLReNCOriGjkBGY+k=;
	b=VkrKzGgryw1Lkt67pAOpr9fPOfFdOEuGmhs56hztHXpaiu0UNQIrct5wvCrW5Rkw
	Pm100vcGk32nCgOkXkCLxD8u9bl3k/t8cbB1z/lGEPPlndzXb+Q7VX7gbjCALE8QJ96
	yaD3HRGEngUfdqXMAjqVH7QypIx55g9u75zHdQRY=
Content-Type: multipart/mixed; boundary="===============0562300399631176219=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.20.1 SUCCEEDED
Message-ID: 
 <0101017f8db21ea3-b62b1472-72f1-40dc-93a0-d28c76c8dc09-000000@us-west-2.amazonses.com>
Date: Tue, 15 Mar 2022 13:08:55 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:08:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163268

--===============0562300399631176219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-libav* to *1.20.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.20.0-1.20.1.patch
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
--===============0562300399631176219==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.20.0-1.20.1.patch"

From f64d5ddf7b792fbde599fc1f5c98b56b146262fd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Mar 2022 11:10:18 +0000
Subject: [PATCH] gstreamer1.0-libav: upgrade 1.20.0 -> 1.20.1

---
 ...streamer1.0-libav_1.20.0.bb => gstreamer1.0-libav_1.20.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.20.0.bb => gstreamer1.0-libav_1.20.1.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.1.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.1.bb
index 575e608d65..16a298ab14 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "5eee5ed8d5082a31b500448e41535c722ee30cd5f8224f32982bbaba2eedef17"
+SRC_URI[sha256sum] = "91a71fb633b75e1bd52e22a457845cb0ba563a2972ba5954ec88448f443a9fc7"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.27.0


--===============0562300399631176219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gstreamer1.0-libav: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.20.0.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.20.1.tar.xz"

--===============0562300399631176219==--

