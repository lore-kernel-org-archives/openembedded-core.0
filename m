Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78AFFCCA494
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:09 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web09.39739.1656687064021691961
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZqBpLhrI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 01010181ba3e7127-036197ac-6583-4a61-a1d6-9114cbbe7405-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687063;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nd370twPD3pfHe8hc+huXefBO/f59lFMQuc9n4+dljg=;
	b=ZqBpLhrIlemFgOtuvQGWQ2qmR4S0dDNzpvCjbcn2oFW3wbhIIfXJL46l+U9VXsIG
	zNEdKeOB2pHJeTeO7Dt4Dx+SLLa1ik5m0bDEj3e2yH/Bm+IjOWFLFSdyH/dihD1CWtX
	paqdQZ8fPNlYQeCtK0uSXvLtXbLQmnzkJwBEAF/I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687063;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nd370twPD3pfHe8hc+huXefBO/f59lFMQuc9n4+dljg=;
	b=hpPub/jleFQovIiDb+Rlmqf9ihIbqFRYMgYoIzH/T0vbe4yx76k13Mv9NA5jdFmL
	3gSedf9M3HU5IrmWDpF2uJgRDw3uc2UamwelklURjtXQo2oRM4jYh9dsOLo6F+h9ma9
	ai414VVbqomKRB9s41s4oVaCjdO+h5h5sEFcrnFA=
Content-Type: multipart/mixed; boundary="===============3623599250726593846=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.20.3 SUCCEEDED
Message-ID: 
 <01010181ba3e7127-036197ac-6583-4a61-a1d6-9114cbbe7405-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:03 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167510

--===============3623599250726593846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-libav* to *1.20.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.20.2-1.20.3.patch
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
--===============3623599250726593846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-libav: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.20.2.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.20.3.tar.xz"
packages/core2-32-poky-linux/gstreamer1.0-libav: PV changed from "1.20.2" to "1.20.3"

--===============3623599250726593846==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.20.2-1.20.3.patch"

From d419da45449943209f06119d19b73b0efec6a2d3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Jul 2022 11:23:30 +0000
Subject: [PATCH] gstreamer1.0-libav: upgrade 1.20.2 -> 1.20.3

---
 ...streamer1.0-libav_1.20.2.bb => gstreamer1.0-libav_1.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.20.2.bb => gstreamer1.0-libav_1.20.3.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.3.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.3.bb
index 4ef9755c07..e8da49af99 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b5c531dd8413bf771c79dab66b8e389f20b3991f745115133f0fa0b8e32809f9"
+SRC_URI[sha256sum] = "3fedd10560fcdfaa1b6462cbf79a38c4e7b57d7f390359393fc0cef6dbf27dfe"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.31.1


--===============3623599250726593846==--

