Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BCA8E78486
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:20 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.65035.1696183992499292816
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eDGnVC3I;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AxDg5PwV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018aec71be06-f5da9533-7437-41bc-90e2-77ccfdf442bf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mCwPzlrwp7bCuSdIiifk/9d6+qYtk0QFiqdKd0Ktk1w=;
	b=eDGnVC3IORqo3ezwX0A5C87+/UFpCWhLW62llk3ggLyN5Vkd56cgV5vgsOCRhuow
	0DhzhufH5Zm626As+vsUlvgnBJ/phV521XCCt5bgH+1YCRZVRG0N7+DpBvdhcz1V6Vx
	jd1/0a72TgyxjpoNdd3S4FC1FX8/o31MQ91iAUXY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mCwPzlrwp7bCuSdIiifk/9d6+qYtk0QFiqdKd0Ktk1w=;
	b=AxDg5PwV1jDUXFl3WH7TzjLMlB2vqFDTHZJ5lN1jcY7INyEnhWVjHixsJUu4pTfr
	wgRMZcRQ9CLKu9576vfYYmvL1RUZb9nMZsGGNFR0rbI0WeNYeWNf0ptMM0ze3tsot3W
	6pvtvmPiM9UJJiqzmhZIU4kcJGsuUdCWURVczAxk=
Content-Type: multipart/mixed; boundary="===============5167266588865514574=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-good: upgrading to 1.22.6 SUCCEEDED
Message-ID: <0101018aec71be06-f5da9533-7437-41bc-90e2-77ccfdf442bf-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188579

--===============5167266588865514574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-plugins-good* to *1.22.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-good-upgrade-1.22.5-1.22.6.patch
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
From 9d8912ea91703ee55767403c4fcdeb05c543f10b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 17:24:49 +0000
Subject: [PATCH] gstreamer1.0-plugins-good: upgrade 1.22.5 -> 1.22.6

---
 ...ugins-good_1.22.5.bb => gstreamer1.0-plugins-good_1.22.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.5.bb => gstreamer1.0-plugins-good_1.22.6.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb
index 93f0e76ee9..6b76ba957e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
 
-SRC_URI[sha256sum] = "b67b31313a54c6929b82969d41d3cfdf2f58db573fb5f491e6bba5d84aea0778"
+SRC_URI[sha256sum] = "b3b07fe3f1ce7fe93aa9be7217866044548f35c4a7792280eec7e108a32f9817"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.39.2


--===============5167266588865514574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PKGSIZE changed from 776020 to 780116 (+1%)
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGSIZE changed from 18534692 to 18536412 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGSIZE changed from 12954415 to 12956511 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.22.5.tar.xz file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.22.6.tar.xz file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good: PV changed from "1.22.5" to "1.22.6"

--===============5167266588865514574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1844 targets, 71 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-c3a9de01766c9fdf0e8d7d8b2d137acf09c7fdf0"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c3a9de01766c9fdf0e8d7d8b2d137acf09c7fdf0"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 153 Local 43 Mirrors 0 Missed 110 Current 995 (28% match, 90% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1006 of 1148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1013 of 1148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1142 of 1148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 1561 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/gstreamer1.0-plugins-base/1.22.5/temp/log.do_packagedata_setscene.2070547
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1146 of 1148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_package_setscene: Started
NOTE: Running task 2252 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_recipe_qa)
NOTE: Running task 2253 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_recipe_qa)
NOTE: Running task 2255 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_recipe_qa)
NOTE: Running task 2258 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_recipe_qa)
NOTE: Running task 2346 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_recipe_qa)
NOTE: Running task 2347 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_recipe_qa)
NOTE: Running task 2348 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_recipe_qa)
NOTE: Running task 2350 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_recipe_qa)
NOTE: Running task 2407 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_recipe_qa)
NOTE: Running task 2421 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_recipe_qa)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_recipe_qa: Started
NOTE: recipe ell-0.58-r0: task do_recipe_qa: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa: Started
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa: Started
NOTE: Running task 2457 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_recipe_qa)
NOTE: Running task 2506 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_recipe_qa)
NOTE: Running task 2539 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_recipe_qa)
NOTE: Running task 2540 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_recipe_qa)
NOTE: Running task 2541 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_recipe_qa)
NOTE: Running task 2542 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_recipe_qa)
NOTE: Running task 2552 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_write_config)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa: Started
NOTE: recipe libtool-2.4.7-r0: task do_recipe_qa: Started
NOTE: recipe ofono-2.1-r0: task do_recipe_qa: Started
NOTE: recipe avahi-0.8-r0: task do_recipe_qa: Started
NOTE: Running task 2628 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_recipe_qa)
NOTE: recipe nghttp2-1.56.0-r0: task do_recipe_qa: Started
NOTE: Running task 2659 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa: Started
NOTE: recipe ell-0.58-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2713 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2714 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe taglib-1.13.1-r0: task do_recipe_qa: Started
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_recipe_qa: Started
NOTE: Running task 2715 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_fetch)
NOTE: recipe lame-3.100-r0: task do_recipe_qa: Started
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa: Started
NOTE: Running task 2716 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 2717 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 2718 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_fetch)
NOTE: Running task 2732 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_write_config)
NOTE: recipe mpg123-1.31.3-r0: task do_recipe_qa: Started
NOTE: recipe libsoup-3.4.2-r0: task do_recipe_qa: Started
NOTE: recipe ofono-2.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Started
NOTE: Running task 2791 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_fetch)
NOTE: Running task 2792 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 2793 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_fetch)
NOTE: recipe avahi-0.8-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2794 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_recipe_qa: Started
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 2795 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_fetch)
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe ell-0.58-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: Running task 2796 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: recipe taglib-1.13.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_write_config: Started
NOTE: recipe ell-0.58-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2797 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_unpack)
NOTE: Running task 2798 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_fetch)
NOTE: Running task 2799 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_unpack)
NOTE: Running task 2800 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_recipe_qa: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe ofono-2.1-r0: task do_fetch: Started
NOTE: Running task 2801 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_fetch)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Started
NOTE: Running task 2802 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 2803 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2804 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_fetch)
NOTE: Running task 2805 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_fetch)
NOTE: Running task 2806 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 2807 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_fetch)
NOTE: recipe ofono-2.1-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_fetch: Succeeded
NOTE: Running task 2808 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_unpack)
NOTE: Running task 2809 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_unpack)
NOTE: Running task 2810 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2811 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 2812 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_write_config: Succeeded
NOTE: Running task 2813 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_fetch)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 2814 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: Running task 2815 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: recipe ell-0.58-r0: task do_unpack: Started
NOTE: recipe taglib-1.13.1-r0: task do_fetch: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_fetch: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: Running task 2816 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: Running task 2817 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: recipe taglib-1.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 2818 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2819 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_unpack)
NOTE: Running task 2820 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.56.0-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Started
NOTE: recipe speex-1.2.1-r0: task do_fetch: Started
NOTE: Running task 2821 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_unpack)
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Started
NOTE: recipe ofono-2.1-r0: task do_unpack: Started
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Succeeded
NOTE: Running task 2822 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Started
NOTE: recipe speex-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2823 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_unpack)
NOTE: Running task 2824 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_unpack)
NOTE: Running task 2825 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: Running task 2826 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_collect_spdx_deps)
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_fetch: Started
NOTE: Running task 2827 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_unpack)
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Succeeded
NOTE: Running task 2828 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_patch)
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_fetch: Succeeded
NOTE: Running task 2829 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_unpack)
NOTE: Running task 2830 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2831 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_unpack)
NOTE: Running task 2832 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2833 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_patch)
NOTE: Running task 2834 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: recipe ell-0.58-r0: task do_unpack: Succeeded
NOTE: Running task 2835 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_collect_spdx_deps)
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe taglib-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe taglib-1.13.1-r0: task do_unpack: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_unpack: Started
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Started
NOTE: Running task 2836 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_patch)
NOTE: recipe speex-1.2.1-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Started
NOTE: recipe taglib-1.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 2837 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2838 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_collect_spdx_deps)
NOTE: recipe libdaemon-0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_unpack: Started
NOTE: Running task 2839 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 4efe0923fdf84ab962f1d152997314acb2fb28e00680a8149c544bc5fdcd305a
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Started
NOTE: recipe ell-0.58-r0: task do_patch: Started
NOTE: recipe ofono-2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2861 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 2862 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_patch)
NOTE: Running task 2863 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 2869 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: Running task 2870 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: Running task 2871 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_collect_spdx_deps)
NOTE: recipe ell-0.58-r0: task do_patch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2872 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_deploy_source_date_epoch)
NOTE: Running task 2873 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_collect_spdx_deps)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_patch: Started
NOTE: recipe speex-1.2.1-r0: task do_patch: Started
NOTE: recipe taglib-1.13.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2874 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Succeeded
NOTE: Running task 2875 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_patch)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Succeeded
NOTE: Running task 2876 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe ell-0.58-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_unpack: Succeeded
NOTE: Running task 2877 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-2.1-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: Running task 2878 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_patch)
NOTE: Running task 2879 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_collect_spdx_deps)
NOTE: recipe ell-0.58-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-2.4.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_unpack: Succeeded
NOTE: Running task 2880 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: Running task 2881 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_collect_spdx_deps)
NOTE: recipe speex-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Started
NOTE: Running task 2882 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2883 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_patch)
NOTE: Running task 2884 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2885 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_collect_spdx_deps)
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Succeeded
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2886 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_patch)
NOTE: recipe nghttp2-1.56.0-r0: task do_patch: Started
NOTE: recipe taglib-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_package_setscene: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_patch: Succeeded
NOTE: Running task 2887 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_generate_toolchain_file)
NOTE: Running task 2888 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 1148 of 1148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_unpack: Succeeded
NOTE: Running task 2890 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_patch)
NOTE: recipe ofono-2.1-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_patch: Started
NOTE: Running task 2891 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Succeeded
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: Running task 2892 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: Running task 2893 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_collect_spdx_deps: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_patch: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Started
NOTE: Running task 2894 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.56.0-r0: task do_patch: Succeeded
NOTE: Running task 2895 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_generate_toolchain_file)
NOTE: Running task 2896 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_deploy_source_date_epoch)
NOTE: recipe ell-0.58-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe taglib-1.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Succeeded
NOTE: Running task 2897 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_configure)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2898 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_patch: Started
NOTE: recipe ofono-2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2899 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2900 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_configure)
NOTE: recipe taglib-1.13.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2901 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_generate_toolchain_file: Started
NOTE: Setscene tasks completed
NOTE: Running task 2912 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Started
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running task 2915 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.56.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Started
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_patch: Succeeded
NOTE: Running task 2916 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2917 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_configure)
NOTE: Running task 2918 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2919 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_populate_lic)
NOTE: Running task 2920 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata: Started
NOTE: Running task 2921 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2922 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe nghttp2-1.56.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: Running task 2923 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_configure)
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_populate_lic: Started
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2924 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_configure: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_configure: Started
NOTE: recipe ell-0.58-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2925 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_populate_lic: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5339aca9e47bec61a99da666aee686851063e3a76b9253d6a6c82553ae0f493a
NOTE: Setscene tasks completed
NOTE: Running task 2931 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe ell-0.58-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 2935 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2943 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_collect_spdx_deps)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2946 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe ell-0.58-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe ell-0.58-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2947 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_compile)
NOTE: recipe taglib-1.13.1-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_configure: Succeeded
NOTE: Running task 2948 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_compile: Succeeded
NOTE: Running task 2949 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_install: Succeeded
NOTE: Running task 2950 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2951 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_package: Succeeded
NOTE: Running task 2952 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_packagedata: Succeeded
NOTE: Running task 2953 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_create_spdx)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_create_spdx: Started
NOTE: recipe taglib-1.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2954 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_install)
NOTE: recipe taglib-1.13.1-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_create_spdx: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_install: Succeeded
NOTE: Running task 2955 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_package)
NOTE: Running task 2956 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_populate_sysroot)
NOTE: recipe taglib-1.13.1-r0: task do_package: Started
NOTE: recipe taglib-1.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_configure: Succeeded
NOTE: Running task 2957 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_compile)
NOTE: recipe nghttp2-1.56.0-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Succeeded
NOTE: Running task 2958 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_compile)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_compile: Started
NOTE: recipe taglib-1.13.1-r0: task do_package: Succeeded
NOTE: Running task 2959 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_packagedata)
NOTE: recipe taglib-1.13.1-r0: task do_packagedata: Started
NOTE: recipe taglib-1.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2960 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_create_spdx)
NOTE: recipe ell-0.58-r0: task do_configure: Succeeded
NOTE: Running task 2961 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_compile)
NOTE: recipe taglib-1.13.1-r0: task do_create_spdx: Started
NOTE: recipe ell-0.58-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_compile: Succeeded
NOTE: Running task 2962 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_install)
NOTE: recipe nghttp2-1.56.0-r0: task do_compile: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_install: Started
NOTE: Running task 2963 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_install)
NOTE: recipe nghttp2-1.56.0-r0: task do_install: Started
NOTE: recipe taglib-1.13.1-r0: task do_create_spdx: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_install: Succeeded
NOTE: Running task 2964 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_populate_sysroot)
NOTE: Running task 2965 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_package)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_install: Succeeded
NOTE: Running task 2966 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_populate_sysroot)
NOTE: Running task 2967 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_package)
NOTE: recipe nghttp2-1.56.0-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_package: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 2968 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe ell-0.58-r0: task do_compile: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: Running task 2969 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_install)
NOTE: Running task 2970 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_compile)
NOTE: recipe ell-0.58-r0: task do_install: Started
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_package: Succeeded
NOTE: Running task 2971 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 2972 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_compile)
NOTE: Running task 2973 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe nghttp2-1.56.0-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe libtool-2.4.7-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 2974 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_compile)
NOTE: Running task 2975 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe ell-0.58-r0: task do_install: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2976 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_populate_sysroot)
NOTE: Running task 2977 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_package)
NOTE: Running task 2978 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_create_spdx)
NOTE: recipe ell-0.58-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.58-r0: task do_package: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_create_spdx: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 2979 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 2980 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_package: Succeeded
NOTE: Running task 2981 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2982 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_create_spdx)
NOTE: recipe ell-0.58-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2983 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2984 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_create_spdx: Started
NOTE: recipe ofono-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_create_spdx: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2985 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_install)
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Started
NOTE: recipe ofono-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2986 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_configure)
NOTE: recipe ofono-2.1-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2987 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2988 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2989 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 2990 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2991 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2992 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_create_spdx)
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx: Started
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2993 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_configure)
NOTE: recipe speex-1.2.1-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 2994 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_collect_spdx_deps)
NOTE: recipe avahi-0.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe ell-0.58-r0: task do_package: Succeeded
NOTE: recipe avahi-0.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2995 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_packagedata)
NOTE: recipe ell-0.58-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: Running task 2996 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe ell-0.58-r0: task do_packagedata: Failed
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_compile: Succeeded
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Succeeded
NOTE: recipe ofono-2.1-r0: task do_configure: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_configure: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2996 tasks of which 2819 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_packagedata
Summary: There were 112 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-src went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-dbg went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-staticdev went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-dev went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-doc went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-locale went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/ell/0.58/temp/log.do_packagedata.2116688
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_packagedata) failed with exit code '1'

--===============5167266588865514574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1844 targets, 55 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-c3a9de01766c9fdf0e8d7d8b2d137acf09c7fdf0"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c3a9de01766c9fdf0e8d7d8b2d137acf09c7fdf0"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 153 Local 43 Mirrors 0 Missed 110 Current 995 (28% match, 90% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1006 of 1148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1013 of 1148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1142 of 1148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 1560 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gstreamer1.0-plugins-base/1.22.5/temp/log.do_packagedata_setscene.1954521
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1146 of 1148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_package_setscene: Started
NOTE: Running task 2252 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_recipe_qa)
NOTE: Running task 2253 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_recipe_qa)
NOTE: Running task 2255 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_recipe_qa)
NOTE: Running task 2258 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_recipe_qa)
NOTE: Running task 2346 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_recipe_qa)
NOTE: Running task 2347 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_recipe_qa)
NOTE: Running task 2348 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_recipe_qa)
NOTE: Running task 2350 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_recipe_qa)
NOTE: Running task 2408 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_recipe_qa)
NOTE: Running task 2421 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_recipe_qa)
NOTE: Running task 2462 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_recipe_qa)
NOTE: Running task 2506 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_recipe_qa)
NOTE: recipe ell-0.58-r0: task do_recipe_qa: Started
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_recipe_qa: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa: Started
NOTE: Running task 2538 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_recipe_qa)
NOTE: Running task 2539 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_recipe_qa)
NOTE: Running task 2541 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_recipe_qa)
NOTE: Running task 2542 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_recipe_qa)
NOTE: Running task 2555 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_write_config)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa: Started
NOTE: Running task 2628 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_recipe_qa)
NOTE: recipe libtool-2.4.7-r0: task do_recipe_qa: Started
NOTE: recipe ofono-2.1-r0: task do_recipe_qa: Started
NOTE: Running task 2659 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_write_config)
NOTE: recipe avahi-0.8-r0: task do_recipe_qa: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_recipe_qa: Started
NOTE: Running task 2726 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_write_config)
NOTE: recipe pulseaudio-16.1-r0: task do_recipe_qa: Started
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa: Started
NOTE: recipe taglib-1.13.1-r0: task do_recipe_qa: Started
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa: Started
NOTE: recipe lame-3.100-r0: task do_recipe_qa: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_recipe_qa: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_recipe_qa: Started
NOTE: Running task 2785 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: recipe ell-0.58-r0: task do_recipe_qa: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Started
NOTE: Running task 2786 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2787 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2788 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 2789 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_fetch)
NOTE: Running task 2790 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_fetch)
NOTE: recipe libtool-2.4.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe ofono-2.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_recipe_qa: Started
NOTE: Running task 2791 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_fetch)
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Started
NOTE: Running task 2792 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 2793 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_fetch)
NOTE: recipe avahi-0.8-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2794 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: recipe nghttp2-1.56.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2795 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_write_config: Started
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2796 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_fetch)
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2797 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_fetch)
NOTE: recipe lame-3.100-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2798 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2799 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2800 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_fetch)
NOTE: Running task 2801 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-3.4.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Started
NOTE: recipe ell-0.58-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_write_config: Succeeded
NOTE: Running task 2802 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_fetch)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.58-r0: task do_fetch: Succeeded
NOTE: Running task 2803 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_fetch)
NOTE: recipe ofono-2.1-r0: task do_fetch: Started
NOTE: Running task 2804 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_unpack)
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: Running task 2805 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_unpack)
NOTE: Running task 2806 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_unpack)
NOTE: Running task 2807 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2808 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_fetch: Started
NOTE: recipe ofono-2.1-r0: task do_fetch: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_fetch: Started
NOTE: Running task 2809 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_unpack)
NOTE: recipe nghttp2-1.56.0-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: Running task 2810 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_unpack)
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: Running task 2811 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 2812 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_fetch: Succeeded
NOTE: Running task 2813 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Started
NOTE: recipe speex-1.2.1-r0: task do_fetch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Started
NOTE: Running task 2814 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 2815 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 2816 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: Running task 2817 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe taglib-1.13.1-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: Running task 2818 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Succeeded
NOTE: Running task 2819 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: Running task 2820 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_unpack)
NOTE: Running task 2821 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 2822 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_unpack)
NOTE: Running task 2823 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Succeeded
NOTE: Running task 2824 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_unpack)
NOTE: Running task 2825 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_unpack)
NOTE: Running task 2826 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2827 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Started
NOTE: recipe ell-0.58-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_fetch: Succeeded
NOTE: Running task 2828 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_unpack)
NOTE: Running task 2829 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_unpack)
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Started
NOTE: recipe ofono-2.1-r0: task do_unpack: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2830 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_patch)
NOTE: Running task 2831 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_collect_spdx_deps)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: Running task 2832 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_patch)
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: recipe taglib-1.13.1-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2833 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: Running task 2834 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Started
NOTE: Running task 2835 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_collect_spdx_deps)
NOTE: recipe speex-1.2.1-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.58-r0: task do_unpack: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2836 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_patch)
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Started
NOTE: recipe taglib-1.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 2837 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_patch)
NOTE: Running task 2838 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_collect_spdx_deps)
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: Running task 2839 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_unpack: Started
NOTE: Running task 2840 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_patch)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Started
NOTE: Running task 2841 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_collect_spdx_deps)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to ca904cc12661e9ff90c127b846ed13e446994b8ea6f02608921a9a3e91322e85
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Started
NOTE: Running task 2862 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: Running task 2864 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe ofono-2.1-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2870 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_patch)
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_patch: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ell-0.58-r0: task do_patch: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 2871 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_patch)
NOTE: Running task 2872 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_collect_spdx_deps)
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2873 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: Running task 2874 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2875 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_patch)
NOTE: Running task 2876 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_collect_spdx_deps)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2877 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lame-3.100-r0: task do_collect_spdx_deps: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ell-0.58-r0: task do_patch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2878 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_deploy_source_date_epoch)
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 2879 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_patch)
NOTE: recipe ofono-2.1-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Succeeded
NOTE: Running task 2880 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: Running task 2881 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_collect_spdx_deps)
NOTE: recipe nghttp2-1.56.0-r0: task do_patch: Started
NOTE: Running task 2882 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 2883 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_patch)
NOTE: recipe nghttp2-1.56.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speex-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe ell-0.58-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Started
NOTE: Running task 2884 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_unpack: Succeeded
NOTE: Running task 2885 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_package_setscene: Succeeded
NOTE: Running task 2886 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_collect_spdx_deps)
NOTE: Running setscene task 1148 of 1148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_unpack: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ell-0.58-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Started
NOTE: Running task 2888 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_patch)
NOTE: recipe libtool-2.4.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lame-3.100-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_patch: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2889 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_generate_toolchain_file)
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Succeeded
NOTE: Running task 2890 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: Running task 2891 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-2.1-r0: task do_patch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2892 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe taglib-1.13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2893 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe taglib-1.13.1-r0: task do_patch: Succeeded
NOTE: Running task 2894 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_generate_toolchain_file)
NOTE: Running task 2895 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: Running task 2896 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2897 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2898 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2899 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_configure)
NOTE: recipe nghttp2-1.56.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2900 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_configure)
NOTE: recipe ell-0.58-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2902 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.56.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2912 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_packagedata)
NOTE: recipe taglib-1.13.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Succeeded
NOTE: Running task 2915 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_deploy_source_date_epoch)
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_patch: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Started
NOTE: Running task 2916 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2917 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_populate_lic)
NOTE: Running task 2918 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2919 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2920 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_configure)
NOTE: Running task 2921 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_configure)
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2922 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2923 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: recipe taglib-1.13.1-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_configure: Started
NOTE: Running task 2924 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe ell-0.58-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2925 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_populate_lic: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_configure: Started
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ell-0.58-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 211e462a1e5567354a6419194e4f8bd8b7dae95ee7ba36a440d71779fe8aacbc
NOTE: Setscene tasks completed
NOTE: Running task 2931 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 2935 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 2942 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_collect_spdx_deps)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2945 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata: Succeeded
NOTE: recipe ell-0.58-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe ell-0.58-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2947 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_compile)
NOTE: recipe taglib-1.13.1-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_configure: Succeeded
NOTE: Running task 2948 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_compile: Succeeded
NOTE: Running task 2949 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_install: Succeeded
NOTE: Running task 2950 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2951 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_package: Succeeded
NOTE: Running task 2952 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_packagedata: Started
NOTE: recipe taglib-1.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2953 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_install)
NOTE: recipe taglib-1.13.1-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_packagedata: Succeeded
NOTE: Running task 2954 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_create_spdx)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_create_spdx: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_create_spdx: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_install: Succeeded
NOTE: Running task 2955 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_package)
NOTE: Running task 2956 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_populate_sysroot)
NOTE: recipe taglib-1.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.13.1-r0: task do_package: Started
NOTE: recipe taglib-1.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_configure: Succeeded
NOTE: Running task 2957 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_compile)
NOTE: recipe nghttp2-1.56.0-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Succeeded
NOTE: Running task 2958 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_compile)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_compile: Started
NOTE: recipe taglib-1.13.1-r0: task do_package: Succeeded
NOTE: Running task 2959 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_packagedata)
NOTE: recipe taglib-1.13.1-r0: task do_packagedata: Started
NOTE: recipe ell-0.58-r0: task do_configure: Succeeded
NOTE: Running task 2960 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_compile)
NOTE: recipe ell-0.58-r0: task do_compile: Started
NOTE: recipe taglib-1.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2961 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_create_spdx)
NOTE: recipe taglib-1.13.1-r0: task do_create_spdx: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_compile: Succeeded
NOTE: Running task 2962 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_install)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_install: Started
NOTE: recipe taglib-1.13.1-r0: task do_create_spdx: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_compile: Succeeded
NOTE: Running task 2963 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_install)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_install: Succeeded
NOTE: Running task 2964 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_populate_sysroot)
NOTE: Running task 2965 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_package)
NOTE: recipe nghttp2-1.56.0-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_package: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_install: Succeeded
NOTE: Running task 2966 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_populate_sysroot)
NOTE: Running task 2967 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_package)
NOTE: recipe nghttp2-1.56.0-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_populate_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 2968 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: recipe ell-0.58-r0: task do_compile: Succeeded
NOTE: Running task 2969 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: Running task 2970 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_install)
NOTE: recipe nghttp2-1.56.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe ell-0.58-r0: task do_install: Started
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: Running task 2971 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_compile)
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2972 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_compile)
NOTE: recipe ell-0.58-r0: task do_install: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Started
NOTE: Running task 2973 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_populate_sysroot)
NOTE: Running task 2974 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_package)
NOTE: recipe nghttp2-1.56.0-r0: task do_package: Succeeded
NOTE: recipe ell-0.58-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 2975 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_packagedata)
NOTE: recipe ell-0.58-r0: task do_package: Started
NOTE: Running task 2976 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_compile)
NOTE: recipe nghttp2-1.56.0-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 2977 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_package: Succeeded
NOTE: Running task 2978 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2979 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_create_spdx)
NOTE: recipe ell-0.58-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2980 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.56.0-r0: task do_create_spdx: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2981 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_create_spdx)
NOTE: recipe ofono-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 2982 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 2983 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_create_spdx: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_create_spdx: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2984 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_install)
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2985 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2986 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-2.1-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2987 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2988 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_package)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2989 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2990 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2991 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 2992 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe speex-1.2.1-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: Running task 2993 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2994 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_create_spdx)
NOTE: recipe ell-0.58-r0: task do_package: Succeeded
NOTE: Running task 2995 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_packagedata)
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx: Started
NOTE: recipe ell-0.58-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 2996 of 3073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_collect_spdx_deps)
NOTE: recipe ell-0.58-r0: task do_packagedata: Failed
NOTE: recipe avahi-0.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Succeeded
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: recipe avahi-0.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_compile: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Succeeded
NOTE: recipe ofono-2.1-r0: task do_configure: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_configure: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2996 tasks of which 2819 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_packagedata
Summary: There were 112 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-src went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-dbg went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-staticdev went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-dev went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-doc went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-locale went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/ell/0.58/temp/log.do_packagedata.1999343
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_packagedata) failed with exit code '1'

--===============5167266588865514574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1845 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1844 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-c3a9de01766c9fdf0e8d7d8b2d137acf09c7fdf0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c3a9de01766c9fdf0e8d7d8b2d137acf09c7fdf0"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 155 Local 45 Mirrors 0 Missed 110 Current 1001 (29% match, 90% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1011 of 1156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1018 of 1156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1039 of 1156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1137 of 1156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_create_spdx_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-native-4.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1150 of 1156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_packagedata_setscene)
NOTE: recipe shadow-native-4.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 1561 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.22.5/temp/log.do_packagedata_setscene.1896694
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1154 of 1156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_package_setscene: Started
NOTE: Running task 2260 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_recipe_qa)
NOTE: Running task 2261 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_recipe_qa)
NOTE: Running task 2263 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_recipe_qa)
NOTE: Running task 2266 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_recipe_qa)
NOTE: Running task 2355 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_recipe_qa)
NOTE: Running task 2356 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_recipe_qa)
NOTE: Running task 2357 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_recipe_qa)
NOTE: Running task 2358 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_recipe_qa)
NOTE: Running task 2427 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_recipe_qa)
NOTE: Running task 2441 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_recipe_qa)
NOTE: Running task 2482 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_recipe_qa)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_recipe_qa: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa: Started
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa: Started
NOTE: recipe ell-0.58-r0: task do_recipe_qa: Started
NOTE: Running task 2526 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_recipe_qa)
NOTE: Running task 2558 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_recipe_qa)
NOTE: Running task 2560 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_recipe_qa)
NOTE: Running task 2561 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_recipe_qa)
NOTE: Running task 2562 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_recipe_qa)
NOTE: Running task 2572 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_write_config)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa: Started
NOTE: recipe libtool-2.4.7-r0: task do_recipe_qa: Started
NOTE: recipe ofono-2.1-r0: task do_recipe_qa: Started
NOTE: recipe avahi-0.8-r0: task do_recipe_qa: Started
NOTE: Running task 2648 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2679 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_write_config)
NOTE: recipe nghttp2-1.56.0-r0: task do_recipe_qa: Started
NOTE: Running task 2726 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe pulseaudio-16.1-r0: task do_recipe_qa: Started
NOTE: Running task 2727 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa: Started
NOTE: Running task 2748 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_write_config)
NOTE: recipe ell-0.58-r0: task do_recipe_qa: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_recipe_qa: Started
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa: Started
NOTE: Running task 2776 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_fetch)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_recipe_qa: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_recipe_qa: Started
NOTE: recipe lame-3.100-r0: task do_recipe_qa: Started
NOTE: Running task 2788 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 2799 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_fetch)
NOTE: Running task 2800 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: recipe libsoup-3.4.2-r0: task do_recipe_qa: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2815 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_recipe_qa: Started
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Started
NOTE: recipe libtool-2.4.7-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2816 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: recipe avahi-0.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe ofono-2.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 2817 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 2818 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_fetch)
NOTE: recipe nghttp2-1.56.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running task 2819 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_write_config: Started
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Started
NOTE: recipe ell-0.58-r0: task do_fetch: Started
NOTE: Running task 2820 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_fetch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: Running task 2821 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_fetch)
NOTE: recipe ell-0.58-r0: task do_fetch: Succeeded
NOTE: Running task 2822 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_unpack)
NOTE: recipe taglib-1.13.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2823 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: recipe lame-3.100-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2824 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_unpack)
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Succeeded
NOTE: Running task 2825 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_fetch)
NOTE: Running task 2826 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Started
NOTE: Running task 2827 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2828 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_fetch)
NOTE: Running task 2829 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_fetch)
NOTE: Running task 2830 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 2831 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_fetch)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_write_config: Succeeded
NOTE: Running task 2832 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_unpack)
NOTE: Running task 2833 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_fetch: Succeeded
NOTE: Running task 2834 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 2835 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-2.1-r0: task do_fetch: Started
NOTE: Running task 2836 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_fetch)
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: Running task 2837 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: Running task 2838 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.56.0-r0: task do_fetch: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe ofono-2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2839 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_unpack)
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_fetch: Started
NOTE: Running task 2840 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: recipe ell-0.58-r0: task do_unpack: Started
NOTE: Running task 2841 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.56.0-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2842 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_unpack)
NOTE: Running task 2843 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe taglib-1.13.1-r0: task do_fetch: Started
NOTE: Running task 2844 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 2845 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_unpack)
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2846 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe taglib-1.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 2847 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_patch)
NOTE: Running task 2848 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_unpack: Started
NOTE: Running task 2849 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_unpack)
NOTE: Running task 2850 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_unpack)
NOTE: Running task 2851 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_unpack)
NOTE: Running task 2852 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_fetch: Started
NOTE: Running task 2853 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_patch)
NOTE: Running task 2854 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_unpack)
NOTE: recipe ofono-2.1-r0: task do_unpack: Started
NOTE: Running task 2855 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 2856 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2857 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_collect_spdx_deps)
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_fetch: Succeeded
NOTE: Running task 2858 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_unpack)
NOTE: Running task 2859 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_collect_spdx_deps)
NOTE: recipe nghttp2-1.56.0-r0: task do_unpack: Started
NOTE: recipe ell-0.58-r0: task do_unpack: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Started
NOTE: Running task 2860 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2861 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_patch)
NOTE: recipe taglib-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Started
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 1643135a7ed0ef8842c7f0dd405511415ac6e09e1ea0798ace5d702873f40c92
NOTE: recipe taglib-1.13.1-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: Running task 2883 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe ell-0.58-r0: task do_patch: Started
NOTE: recipe taglib-1.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 2889 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_patch)
NOTE: Running task 2890 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_collect_spdx_deps)
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 2891 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: recipe ofono-2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2892 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: Running task 2893 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_collect_spdx_deps)
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2894 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_patch)
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.58-r0: task do_patch: Succeeded
NOTE: Running task 2895 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: recipe speex-1.2.1-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2896 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_collect_spdx_deps)
NOTE: recipe libdaemon-0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2897 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_deploy_source_date_epoch)
NOTE: Running task 2898 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ell-0.58-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Succeeded
NOTE: Running task 2899 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 2900 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_unpack: Succeeded
NOTE: Running task 2901 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_patch)
NOTE: recipe taglib-1.13.1-r0: task do_patch: Started
NOTE: recipe taglib-1.13.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2902 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_patch)
NOTE: Running task 2903 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_collect_spdx_deps)
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_unpack: Succeeded
NOTE: Running task 2904 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_patch)
NOTE: Running task 2905 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: Running task 2906 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_collect_spdx_deps)
NOTE: recipe speex-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe lame-3.100-r0: task do_collect_spdx_deps: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-2.1-r0: task do_patch: Started
NOTE: recipe ell-0.58-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: Running task 2907 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: Running task 2908 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: Running task 2909 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_collect_spdx_deps)
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_package_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 1156 of 1156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_recipe_qa_setscene)
NOTE: Running task 2910 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_patch)
NOTE: recipe libtool-2.4.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe taglib-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_patch: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_patch: Started
NOTE: Running task 2912 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_generate_toolchain_file)
NOTE: Running task 2913 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.56.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Started
NOTE: recipe libtool-2.4.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2914 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_patch)
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Succeeded
NOTE: Running task 2915 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-2.1-r0: task do_patch: Succeeded
NOTE: Running task 2916 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: Running task 2917 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2918 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2919 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe taglib-1.13.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe taglib-1.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ell-0.58-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_patch: Succeeded
NOTE: Running task 2920 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_configure)
NOTE: Running task 2921 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_generate_toolchain_file)
NOTE: Running task 2922 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: Running task 2923 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2924 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Setscene tasks completed
NOTE: recipe ofono-2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2926 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2936 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_packagedata)
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2937 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Started
NOTE: Running task 2940 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe taglib-1.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2941 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_configure)
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_patch: Succeeded
NOTE: Running task 2942 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2943 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2944 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata: Started
NOTE: Running task 2945 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2946 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe taglib-1.13.1-r0: task do_configure: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2947 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_populate_lic: Started
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ell-0.58-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_configure: Started
NOTE: Running task 2948 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_configure)
NOTE: Running task 2949 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b61b8c6b9f8fe2512f1b067fc9acff065964ed495736da2a7319057949c65276
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_populate_lic: Succeeded
NOTE: recipe ell-0.58-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: Running task 2955 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 2959 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 2966 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata: Succeeded
NOTE: recipe ell-0.58-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2970 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe ell-0.58-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2971 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_compile)
NOTE: recipe taglib-1.13.1-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_configure: Succeeded
NOTE: Running task 2972 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_compile: Succeeded
NOTE: Running task 2973 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_install: Succeeded
NOTE: Running task 2974 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2975 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_package: Succeeded
NOTE: Running task 2976 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_packagedata: Started
NOTE: recipe taglib-1.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2977 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_install)
NOTE: recipe taglib-1.13.1-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_packagedata: Succeeded
NOTE: Running task 2978 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_create_spdx)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_create_spdx: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_create_spdx: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_install: Succeeded
NOTE: Running task 2979 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_package)
NOTE: Running task 2980 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_populate_sysroot)
NOTE: recipe taglib-1.13.1-r0: task do_package: Started
NOTE: recipe taglib-1.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_configure: Succeeded
NOTE: Running task 2981 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_compile)
NOTE: recipe nghttp2-1.56.0-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Succeeded
NOTE: Running task 2982 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_compile)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_compile: Started
NOTE: recipe taglib-1.13.1-r0: task do_package: Succeeded
NOTE: Running task 2983 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_packagedata)
NOTE: recipe taglib-1.13.1-r0: task do_packagedata: Started
NOTE: recipe taglib-1.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2984 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_create_spdx)
NOTE: recipe taglib-1.13.1-r0: task do_create_spdx: Started
NOTE: recipe ell-0.58-r0: task do_configure: Succeeded
NOTE: Running task 2985 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_compile)
NOTE: recipe ell-0.58-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_compile: Succeeded
NOTE: Running task 2986 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_install)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_install: Started
NOTE: recipe taglib-1.13.1-r0: task do_create_spdx: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_compile: Succeeded
NOTE: Running task 2987 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_install)
NOTE: recipe nghttp2-1.56.0-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_install: Succeeded
NOTE: Running task 2988 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_populate_sysroot)
NOTE: Running task 2989 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_package)
NOTE: recipe nghttp2-1.56.0-r0: task do_install: Succeeded
NOTE: Running task 2990 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_populate_sysroot)
NOTE: Running task 2991 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_package)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_package: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 2992 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe ell-0.58-r0: task do_compile: Succeeded
NOTE: Running task 2993 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_install)
NOTE: recipe ell-0.58-r0: task do_install: Started
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: Running task 2994 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_compile)
NOTE: recipe nghttp2-1.56.0-r0: task do_package: Succeeded
NOTE: Running task 2995 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_packagedata)
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2996 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_compile)
NOTE: recipe ell-0.58-r0: task do_install: Succeeded
NOTE: Running task 2997 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_populate_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 2998 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_package)
NOTE: Running task 2999 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_packagedata: Succeeded
NOTE: recipe ell-0.58-r0: task do_populate_sysroot: Started
NOTE: Running task 3000 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_create_spdx)
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: recipe ell-0.58-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: Running task 3001 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_compile)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_package: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_create_spdx: Started
NOTE: Running task 3002 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 3003 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 3004 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe nghttp2-1.56.0-r0: task do_create_spdx: Succeeded
NOTE: recipe ell-0.58-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3005 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3006 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_create_spdx)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe ofono-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_create_spdx: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3007 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_create_spdx: Succeeded
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 3008 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 3009 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_install)
NOTE: recipe ofono-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3010 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_configure)
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Started
NOTE: recipe ofono-2.1-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 3011 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 3012 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3013 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 3014 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3015 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3016 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 3017 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_create_spdx)
NOTE: recipe speex-1.2.1-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx: Started
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 3018 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_collect_spdx_deps)
NOTE: recipe ell-0.58-r0: task do_package: Succeeded
NOTE: Running task 3019 of 3097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe ell-0.58-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ell-0.58-r0: task do_packagedata: Failed
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_compile: Succeeded
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Succeeded
NOTE: recipe ofono-2.1-r0: task do_configure: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_configure: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 3019 tasks of which 2843 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_packagedata
Summary: There were 112 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-src went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-dbg went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-staticdev went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-dev went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-doc went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-locale went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ell/0.58/temp/log.do_packagedata.1941950
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_packagedata) failed with exit code '1'

--===============5167266588865514574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1844 targets, 50 skipped, 0 masked, 0 errors.
Removing 118 recipes from the core2-32 sysroot...done.
Removing 117 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-c3a9de01766c9fdf0e8d7d8b2d137acf09c7fdf0"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c3a9de01766c9fdf0e8d7d8b2d137acf09c7fdf0"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 739 Local 635 Mirrors 0 Missed 104 Current 380 (85% match, 90% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch qemux86...done.
Removing 1 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 381 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 385 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 388 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 389 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx_setscene)
NOTE: Running setscene task 390 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 397 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 398 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 399 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 417 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_create_spdx_setscene)
NOTE: Running setscene task 421 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 423 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 431 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 432 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.69-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 479 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 481 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 483 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 485 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_create_spdx_setscene)
NOTE: Running setscene task 492 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 495 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 504 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 513 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 531 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 534 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 541 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 543 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 545 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.69-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-73-2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 553 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 554 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 559 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 561 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 562 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 563 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 564 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 575 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 576 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 577 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 578 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 580 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 585 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_create_spdx_setscene)
NOTE: recipe icu-73-2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 587 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 593 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 597 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 600 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 602 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 604 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 606 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: Running task 1093 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_recipe_qa)
NOTE: Running task 1094 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_recipe_qa)
NOTE: Running task 1095 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_recipe_qa)
NOTE: Running task 1096 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_recipe_qa)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1111 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_recipe_qa)
NOTE: Running task 1112 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_recipe_qa)
NOTE: Running task 1113 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_recipe_qa)
NOTE: Running task 1139 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_recipe_qa)
NOTE: Running task 1140 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_recipe_qa)
NOTE: Running task 1142 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_recipe_qa)
NOTE: Running task 1147 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_recipe_qa)
NOTE: Running task 1149 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_recipe_qa)
NOTE: Running task 1150 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_recipe_qa)
NOTE: Running task 1151 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_recipe_qa)
NOTE: Running task 1152 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_recipe_qa)
NOTE: Running task 1162 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_write_config)
NOTE: Running task 1169 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_recipe_qa)
NOTE: Running task 1182 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_write_config)
NOTE: Running task 1195 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_write_config)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 608 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 609 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 610 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 611 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 612 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 613 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 614 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 615 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ell-0.58-r0: task do_recipe_qa: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_recipe_qa: Started
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ofono-2.1-r0: task do_recipe_qa: Started
NOTE: recipe mpg123-1.31.3-r0: task do_recipe_qa: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_recipe_qa: Started
NOTE: Running setscene task 616 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_recipe_qa: Started
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_recipe_qa: Started
NOTE: Running setscene task 617 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa: Started
NOTE: recipe lame-3.100-r0: task do_recipe_qa: Started
NOTE: recipe avahi-0.8-r0: task do_recipe_qa: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Started
NOTE: recipe libsoup-3.4.2-r0: task do_recipe_qa: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_recipe_qa: Started
NOTE: Running setscene task 619 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 622 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 628 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_write_config: Started
NOTE: recipe bluez5-5.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Succeeded
NOTE: Running setscene task 637 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_write_config: Succeeded
NOTE: Running setscene task 640 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_recipe_qa: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1243 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1244 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1245 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_fetch)
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ell-0.58-r0: task do_recipe_qa: Succeeded
NOTE: recipe ofono-2.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 644 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1246 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_fetch)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1247 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_fetch)
NOTE: Running task 1248 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 1249 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_fetch)
NOTE: Running task 1250 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_fetch)
NOTE: recipe lame-3.100-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 645 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1256 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_fetch)
NOTE: Running task 1257 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_fetch)
NOTE: recipe avahi-0.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 648 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1263 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running setscene task 650 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1264 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_fetch)
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1265 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: Running task 1266 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_fetch)
NOTE: Running task 1267 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 1268 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_fetch)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_fetch: Started
NOTE: Running setscene task 651 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 653 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 655 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 656 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 657 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Started
NOTE: recipe ell-0.58-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe taglib-1.13.1-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: recipe ell-0.58-r0: task do_fetch: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1269 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_unpack)
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe ofono-2.1-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1270 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_unpack)
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Started
NOTE: recipe taglib-1.13.1-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1271 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_unpack)
NOTE: recipe speex-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe ofono-2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1272 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_unpack)
NOTE: recipe sqlite3-3_3.43.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 1273 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_unpack)
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_fetch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_fetch: Succeeded
NOTE: Running task 1274 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: Running task 1275 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 1276 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: Running setscene task 659 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 664 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 668 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 669 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running task 1277 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/gstreamer1.0-plugins-base/1.22.5/temp/log.do_packagedata_setscene.2129398
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 671 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_package_setscene)
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 673 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_fetch: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe ell-0.58-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe taglib-1.13.1-r0: task do_unpack: Started
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: Running setscene task 675 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe speex-1.2.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_fetch: Succeeded
NOTE: Running setscene task 677 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe ofono-2.1-r0: task do_unpack: Started
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 680 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe taglib-1.13.1-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: recipe ell-0.58-r0: task do_unpack: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 683 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 684 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 686 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 690 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 691 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_create_spdx_setscene)
NOTE: Running setscene task 695 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 697 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 698 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 699 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Succeeded
NOTE: Running task 1312 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_patch)
NOTE: Running task 1314 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: Running task 1315 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_patch)
NOTE: Running task 1317 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe ofono-2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1320 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_unpack)
NOTE: Running task 1321 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_unpack)
NOTE: Running task 1322 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_patch)
NOTE: Running task 1323 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: Running task 1324 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_patch)
NOTE: Running task 1327 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_unpack)
NOTE: Running task 1328 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 1329 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_patch)
NOTE: Running task 1330 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_patch)
NOTE: Running task 1331 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_unpack)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1332 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ell-0.58-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Started
NOTE: recipe ofono-2.1-r0: task do_patch: Started
NOTE: recipe taglib-1.13.1-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Started
NOTE: recipe ell-0.58-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1343 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_unpack: Started
NOTE: recipe libxcb-1.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 707 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 708 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1358 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: Running task 1365 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1366 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 710 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 712 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 713 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: recipe taglib-1.13.1-r0: task do_patch: Succeeded
NOTE: Running task 1367 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_generate_toolchain_file)
NOTE: Running task 1368 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Succeeded
NOTE: recipe ell-0.58-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1369 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_deploy_source_date_epoch)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1370 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe speex-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_patch: Started
NOTE: recipe ofono-2.1-r0: task do_patch: Succeeded
NOTE: Running task 1371 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1372 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: Running task 1373 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe taglib-1.13.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1375 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe taglib-1.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 715 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_patch: Succeeded
NOTE: Running task 1376 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_patch)
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_unpack: Succeeded
NOTE: Running task 1377 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1378 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_patch)
NOTE: recipe taglib-1.13.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1379 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_patch)
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.58-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: Running task 1385 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1386 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1391 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_package_setscene: Started
NOTE: Running task 1397 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Started
NOTE: Running setscene task 717 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_unpack: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_patch: Started
NOTE: Running task 1402 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_patch)
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Started
NOTE: recipe taglib-1.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Succeeded
NOTE: Running task 1403 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_recipe_qa_setscene)
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 722 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_patch: Succeeded
NOTE: Running task 1405 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_generate_toolchain_file)
NOTE: Running task 1406 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1407 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1408 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1409 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Succeeded
NOTE: Running task 1415 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 726 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 1421 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1422 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_populate_lic)
NOTE: recipe nghttp2-1.56.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running task 1423 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1425 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_populate_lic: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1444 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_populate_lic: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_populate_lic unihash changed to 21a265efe98983280b41624de881136a040f275e0f8abb14ae038c7ef297c17e
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1445 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 1446 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 730 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 731 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 732 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 733 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 734 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 735 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 736 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 737 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 739 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 740 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 741 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 744 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 745 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 746 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 747 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 749 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 750 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1453 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 756 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 760 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 761 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 763 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 767 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 770 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 771 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 773 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 775 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 778 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 779 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 781 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 782 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 785 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 790 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 791 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 792 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 794 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 796 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 798 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 800 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 802 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 803 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 806 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 807 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 808 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 809 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 810 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 813 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 814 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 815 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 816 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 817 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 818 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 820 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 823 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 826 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 827 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 829 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 831 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 833 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 834 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 837 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_packagedata_setscene)
NOTE: Running setscene task 838 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 839 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 840 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 841 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 842 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 843 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 844 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 847 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_23.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 848 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 850 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 851 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 852 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 853 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 854 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 855 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 858 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 862 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 863 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 865 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 866 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 868 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 869 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 872 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 876 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 877 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 878 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 879 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 880 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 881 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 883 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 884 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 886 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 887 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 889 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 891 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 892 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 894 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 896 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 897 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 901 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 903 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 904 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 906 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 910 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 911 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 913 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 914 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 916 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 917 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 919 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 921 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 923 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 926 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 928 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 930 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 931 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 933 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1676 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running setscene task 935 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 936 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 938 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 939 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 942 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 943 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 944 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7351db59a76fe6687e6c58aac56fb00a612739e07148a4d24158e8e0ce78924c
NOTE: Running setscene task 947 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 948 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 949 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 950 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 951 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 952 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 953 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1692 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 955 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 956 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 957 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 958 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 960 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 961 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 962 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 963 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 964 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 965 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 966 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 967 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 968 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 969 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 971 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 973 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 974 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 976 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 977 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 978 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 983 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 984 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 986 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 987 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 988 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 989 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 991 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 992 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 993 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 994 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 995 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 996 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 997 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1001 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1004 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1006 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1008 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1017 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1019 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1020 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1021 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1023 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1025 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1026 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1027 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1029 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1032 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1034 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1036 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1038 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1040 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1042 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1044 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1046 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1048 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1050 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1052 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1054 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1056 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1059 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1060 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1062 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1063 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1065 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1067 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1069 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1070 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1071 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1073 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1076 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1078 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1080 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1081 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1083 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1085 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1086 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1088 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1089 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1091 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1093 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1094 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1095 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1099 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1100 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1102 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1107 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1109 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1110 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1113 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1114 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1115 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1117 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1119 of 1119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2205 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 2551 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2553 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2565 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2598 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2660 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2661 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2711 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2713 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2772 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2796 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2800 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_collect_spdx_deps)
NOTE: Running task 2801 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_collect_spdx_deps)
NOTE: recipe nghttp2-1.56.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2806 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_collect_spdx_deps)
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2820 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_collect_spdx_deps)
NOTE: recipe taglib-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2821 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_collect_spdx_deps)
NOTE: Running task 2834 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_collect_spdx_deps)
NOTE: Running task 2836 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libdaemon-0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtool-2.4.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2839 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_collect_spdx_deps: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 8a7bbd9a4ef3d606d2a093916bfc42cb5b7b2deee0a52b5db7efbe2c2c76485b
NOTE: recipe speexdsp-1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2858 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_prepare_recipe_sysroot)
NOTE: recipe taglib-1.13.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtool-2.4.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2859 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_configure)
NOTE: Running task 2860 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: Running task 2866 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_collect_spdx_deps)
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2867 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe taglib-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2868 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_configure)
NOTE: recipe ell-0.58-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Started
NOTE: Running task 2869 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_configure)
NOTE: recipe ell-0.58-r0: task do_collect_spdx_deps: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2870 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe taglib-1.13.1-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2871 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: recipe nghttp2-1.56.0-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: recipe ell-0.58-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ell-0.58-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2872 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_configure)
NOTE: recipe ell-0.58-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2874 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_compile)
NOTE: recipe taglib-1.13.1-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_configure: Succeeded
NOTE: Running task 2875 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_compile: Succeeded
NOTE: Running task 2876 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_install: Succeeded
NOTE: Running task 2877 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2878 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_package: Succeeded
NOTE: Running task 2879 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_packagedata: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2880 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_create_spdx)
NOTE: Running task 2881 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_create_spdx: Started
NOTE: recipe taglib-1.13.1-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_create_spdx: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_install: Succeeded
NOTE: Running task 2882 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_package)
NOTE: Running task 2883 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_populate_sysroot)
NOTE: recipe taglib-1.13.1-r0: task do_package: Started
NOTE: recipe taglib-1.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_configure: Succeeded
NOTE: Running task 2884 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_compile)
NOTE: recipe nghttp2-1.56.0-r0: task do_compile: Started
NOTE: recipe taglib-1.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_compile: Succeeded
NOTE: Running task 2885 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_install)
NOTE: recipe taglib-1.13.1-r0: task do_package: Succeeded
NOTE: Running task 2886 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_packagedata)
NOTE: recipe ell-0.58-r0: task do_configure: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_install: Started
NOTE: Running task 2887 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_compile)
NOTE: recipe taglib-1.13.1-r0: task do_packagedata: Started
NOTE: recipe ell-0.58-r0: task do_compile: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_install: Succeeded
NOTE: Running task 2888 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_populate_sysroot)
NOTE: Running task 2889 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_package)
NOTE: recipe taglib-1.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2890 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_create_spdx)
NOTE: recipe nghttp2-1.56.0-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_package: Started
NOTE: recipe taglib-1.13.1-r0: task do_create_spdx: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_create_spdx: Succeeded
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 2891 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 2892 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 2893 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_compile)
NOTE: Running task 2894 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_compile)
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Started
NOTE: recipe libtool-2.4.7-r0: task do_compile: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_package: Succeeded
NOTE: Running task 2895 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_packagedata)
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: Running task 2896 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_compile)
NOTE: recipe ell-0.58-r0: task do_compile: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_packagedata: Started
NOTE: Running task 2897 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_install)
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Started
NOTE: recipe ell-0.58-r0: task do_install: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2898 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_create_spdx)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 2899 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe nghttp2-1.56.0-r0: task do_create_spdx: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe ell-0.58-r0: task do_install: Succeeded
NOTE: Running task 2900 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_populate_sysroot)
NOTE: Running task 2901 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_package)
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2902 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_install)
NOTE: recipe ell-0.58-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_create_spdx: Succeeded
NOTE: recipe ell-0.58-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 2903 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 2904 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe ell-0.58-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2905 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2906 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2907 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2908 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_package)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Started
NOTE: recipe ofono-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2909 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_configure)
NOTE: recipe ofono-2.1-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2910 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2911 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2912 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe speex-1.2.1-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 2913 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: Running task 2914 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2915 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_create_spdx)
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx: Started
NOTE: recipe ell-0.58-r0: task do_package: Succeeded
NOTE: Running task 2916 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 2917 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_collect_spdx_deps)
NOTE: Running task 2918 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata)
NOTE: recipe ell-0.58-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtool-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 2919 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_install)
NOTE: recipe ell-0.58-r0: task do_packagedata: Failed
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: recipe avahi-0.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_install: Started
NOTE: recipe libtool-2.4.7-r0: task do_install: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Succeeded
NOTE: recipe ofono-2.1-r0: task do_configure: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_configure: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2919 tasks of which 2747 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_packagedata
Summary: There were 112 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-src went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-dbg went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-staticdev went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-dev went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-doc went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-locale went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.58/temp/log.do_packagedata.2195764
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_packagedata) failed with exit code '1'

--===============5167266588865514574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1844 targets, 65 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-c3a9de01766c9fdf0e8d7d8b2d137acf09c7fdf0"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c3a9de01766c9fdf0e8d7d8b2d137acf09c7fdf0"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 153 Local 43 Mirrors 0 Missed 110 Current 979 (28% match, 90% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 990 of 1132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 997 of 1132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1126 of 1132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 1549 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/gstreamer1.0-plugins-base/1.22.5/temp/log.do_packagedata_setscene.2012131
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1130 of 1132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_package_setscene: Started
NOTE: Running task 2237 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_recipe_qa)
NOTE: Running task 2239 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_recipe_qa)
NOTE: Running task 2240 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_recipe_qa)
NOTE: Running task 2243 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_recipe_qa)
NOTE: Running task 2331 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_recipe_qa)
NOTE: Running task 2332 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_recipe_qa)
NOTE: Running task 2333 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_recipe_qa)
NOTE: Running task 2335 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_recipe_qa)
NOTE: Running task 2392 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_recipe_qa)
NOTE: Running task 2404 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_recipe_qa)
NOTE: Running task 2444 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_recipe_qa)
NOTE: Running task 2485 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_recipe_qa)
NOTE: recipe ell-0.58-r0: task do_recipe_qa: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_recipe_qa: Started
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa: Started
NOTE: Running task 2516 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_recipe_qa)
NOTE: Running task 2517 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_recipe_qa)
NOTE: Running task 2518 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_recipe_qa)
NOTE: Running task 2520 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_recipe_qa)
NOTE: Running task 2529 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_write_config)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa: Started
NOTE: Running task 2597 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_recipe_qa)
NOTE: Running task 2618 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_write_config)
NOTE: recipe ofono-2.1-r0: task do_recipe_qa: Started
NOTE: recipe libtool-2.4.7-r0: task do_recipe_qa: Started
NOTE: recipe avahi-0.8-r0: task do_recipe_qa: Started
NOTE: Running task 2685 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_write_config)
NOTE: recipe nghttp2-1.56.0-r0: task do_recipe_qa: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_recipe_qa: Started
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa: Started
NOTE: Running task 2740 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2741 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe lame-3.100-r0: task do_recipe_qa: Started
NOTE: recipe mpg123-1.31.3-r0: task do_recipe_qa: Started
NOTE: recipe ell-0.58-r0: task do_recipe_qa: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_recipe_qa: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2742 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_fetch)
NOTE: Running task 2743 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_fetch)
NOTE: recipe taglib-1.13.1-r0: task do_recipe_qa: Started
NOTE: Running task 2744 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: recipe libsoup-3.4.2-r0: task do_recipe_qa: Started
NOTE: Running task 2745 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe ofono-2.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_recipe_qa: Started
NOTE: Running task 2746 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_fetch)
NOTE: recipe libtool-2.4.7-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2747 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_fetch)
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Started
NOTE: Running task 2748 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: recipe nghttp2-1.56.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe avahi-0.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_write_config: Started
NOTE: Running task 2749 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_fetch)
NOTE: Running task 2750 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Started
NOTE: recipe ell-0.58-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_fetch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2751 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_fetch)
NOTE: Running task 2752 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: Running task 2753 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_fetch)
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.58-r0: task do_fetch: Succeeded
NOTE: Running task 2754 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_unpack)
NOTE: Running task 2755 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Succeeded
NOTE: recipe lame-3.100-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2756 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_unpack)
NOTE: recipe taglib-1.13.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: Running task 2757 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 2758 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_write_config: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Started
NOTE: Running task 2759 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 2760 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2761 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_fetch)
NOTE: Running task 2762 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: recipe ofono-2.1-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 2763 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_fetch)
NOTE: Running task 2764 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_unpack)
NOTE: Running task 2765 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_fetch: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_fetch: Started
NOTE: Running task 2766 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 2767 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-2.1-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: Running task 2768 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_unpack)
NOTE: recipe nghttp2-1.56.0-r0: task do_fetch: Succeeded
NOTE: Running task 2769 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_unpack)
NOTE: Running task 2770 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 2771 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: Running task 2772 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Started
NOTE: Running task 2773 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.58-r0: task do_unpack: Started
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Started
NOTE: recipe speex-1.2.1-r0: task do_fetch: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: Running task 2774 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_unpack)
NOTE: Running task 2775 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: Running task 2776 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe speex-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Succeeded
NOTE: Running task 2777 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_unpack)
NOTE: Running task 2778 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_unpack)
NOTE: Running task 2779 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 2780 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_unpack: Started
NOTE: Running task 2781 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_patch)
NOTE: Running task 2782 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_unpack)
NOTE: recipe taglib-1.13.1-r0: task do_fetch: Started
NOTE: Running task 2783 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_fetch: Succeeded
NOTE: Running task 2784 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-2.1-r0: task do_unpack: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_unpack: Started
NOTE: recipe taglib-1.13.1-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: Running task 2785 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_unpack)
NOTE: recipe nghttp2-1.56.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2786 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: Running task 2787 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: Running task 2788 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_patch)
NOTE: Running task 2789 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_collect_spdx_deps)
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.58-r0: task do_unpack: Succeeded
NOTE: Running task 2790 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_collect_spdx_deps)
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Started
NOTE: Running task 2791 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_patch)
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 1b8ac91861a0f2c5c171540a5748a6ed90e24a5891f0a487d79f02ad63ce0770
NOTE: recipe speex-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe taglib-1.13.1-r0: task do_unpack: Started
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Started
NOTE: Running task 2813 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_prepare_recipe_sysroot)
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_unpack: Started
NOTE: recipe taglib-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Started
NOTE: Running task 2814 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_patch)
NOTE: Running task 2815 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: Running task 2821 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_collect_spdx_deps)
NOTE: recipe ell-0.58-r0: task do_patch: Started
NOTE: recipe taglib-1.13.1-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ofono-2.1-r0: task do_unpack: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2822 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_patch)
NOTE: Running task 2823 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_collect_spdx_deps)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2824 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_patch)
NOTE: Running task 2825 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: recipe ell-0.58-r0: task do_patch: Succeeded
NOTE: Running task 2826 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: Running task 2827 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Succeeded
NOTE: Running task 2828 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2829 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_patch)
NOTE: Running task 2830 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_collect_spdx_deps)
NOTE: recipe nghttp2-1.56.0-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Succeeded
NOTE: Running task 2831 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_patch)
NOTE: Running task 2832 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_collect_spdx_deps)
NOTE: recipe libdaemon-0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2833 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe ell-0.58-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speex-1.2.1-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe taglib-1.13.1-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: Running task 2834 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Succeeded
NOTE: recipe lame-3.100-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2835 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_patch)
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-2.1-r0: task do_patch: Started
NOTE: Running task 2836 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Started
NOTE: recipe taglib-1.13.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2837 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: Running task 2838 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_collect_spdx_deps)
NOTE: recipe ell-0.58-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2839 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: recipe nghttp2-1.56.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2840 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_collect_spdx_deps)
NOTE: recipe speex-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2841 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe lame-3.100-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Started
NOTE: Running task 2842 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.56.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_patch: Started
NOTE: recipe taglib-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_collect_spdx_deps: Started
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ofono-2.1-r0: task do_patch: Succeeded
NOTE: Running task 2843 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: Running task 2844 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_patch)
NOTE: recipe taglib-1.13.1-r0: task do_patch: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: Running task 2845 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_package_setscene: Succeeded
NOTE: Running task 2846 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2847 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_generate_toolchain_file)
NOTE: Running task 2848 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_collect_spdx_deps: Started
NOTE: Running setscene task 1132 of 1132 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_recipe_qa_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2850 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_generate_toolchain_file)
NOTE: Running task 2851 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_deploy_source_date_epoch)
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2852 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_configure)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_patch: Succeeded
NOTE: Running task 2853 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.58-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2854 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2855 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_patch: Started
NOTE: recipe taglib-1.13.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe taglib-1.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2856 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe nghttp2-1.56.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2857 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe taglib-1.13.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2858 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: Running task 2869 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2870 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_packagedata)
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_patch: Succeeded
NOTE: Running task 2873 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2874 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb:do_populate_lic)
NOTE: recipe taglib-1.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe ofono-2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2875 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_configure)
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2876 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2877 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2878 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_populate_lic: Started
NOTE: Running task 2879 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: recipe taglib-1.13.1-r0: task do_configure: Started
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_configure: Started
NOTE: recipe ell-0.58-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2880 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_configure)
NOTE: recipe nghttp2-1.56.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 0d4103f1bca9844c30c64cd0a758b174d707f3ff7e833e2ec3ed74f2386b5c0e
NOTE: Setscene tasks completed
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_populate_lic: Succeeded
NOTE: Running task 2886 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ell-0.58-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 2890 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 2897 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_collect_spdx_deps)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ell-0.58-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2900 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe ell-0.58-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2902 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_compile)
NOTE: recipe taglib-1.13.1-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_configure: Succeeded
NOTE: Running task 2903 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_compile: Succeeded
NOTE: Running task 2904 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_install: Succeeded
NOTE: Running task 2905 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2906 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_package: Succeeded
NOTE: Running task 2907 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_packagedata: Succeeded
NOTE: Running task 2908 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_create_spdx)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_create_spdx: Started
NOTE: recipe taglib-1.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2909 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_create_spdx: Succeeded
NOTE: recipe taglib-1.13.1-r0: task do_install: Started
NOTE: recipe taglib-1.13.1-r0: task do_install: Succeeded
NOTE: Running task 2910 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_package)
NOTE: Running task 2911 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_populate_sysroot)
NOTE: recipe taglib-1.13.1-r0: task do_package: Started
NOTE: recipe taglib-1.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_configure: Succeeded
NOTE: Running task 2912 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_compile)
NOTE: recipe nghttp2-1.56.0-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Succeeded
NOTE: Running task 2913 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_compile)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_compile: Started
NOTE: recipe ell-0.58-r0: task do_configure: Succeeded
NOTE: Running task 2914 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_compile)
NOTE: recipe taglib-1.13.1-r0: task do_package: Succeeded
NOTE: Running task 2915 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_packagedata)
NOTE: recipe ell-0.58-r0: task do_compile: Started
NOTE: recipe taglib-1.13.1-r0: task do_packagedata: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_compile: Succeeded
NOTE: Running task 2916 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_install)
NOTE: recipe taglib-1.13.1-r0: task do_packagedata: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_install: Started
NOTE: Running task 2917 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.1.bb:do_create_spdx)
NOTE: recipe taglib-1.13.1-r0: task do_create_spdx: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_compile: Succeeded
NOTE: Running task 2918 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_install)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_install: Succeeded
NOTE: Running task 2919 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_populate_sysroot)
NOTE: Running task 2920 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_package)
NOTE: recipe nghttp2-1.56.0-r0: task do_install: Started
NOTE: recipe taglib-1.13.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_install: Succeeded
NOTE: Running task 2921 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_populate_sysroot)
NOTE: Running task 2922 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_package)
NOTE: recipe nghttp2-1.56.0-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 2923 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: Running task 2924 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_compile)
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Started
NOTE: recipe ell-0.58-r0: task do_compile: Succeeded
NOTE: Running task 2925 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_install)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ell-0.58-r0: task do_install: Started
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 2926 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 2927 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_compile: Started
NOTE: Running task 2928 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_package: Succeeded
NOTE: Running task 2929 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_package: Succeeded
NOTE: recipe ell-0.58-r0: task do_install: Succeeded
NOTE: Running task 2930 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata)
NOTE: Running task 2931 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_populate_sysroot)
NOTE: recipe nghttp2-1.56.0-r0: task do_packagedata: Started
NOTE: Running task 2932 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_package)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 2933 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 2934 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe ell-0.58-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.58-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2935 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_create_spdx)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2936 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_create_spdx)
NOTE: recipe nghttp2-1.56.0-r0: task do_create_spdx: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_create_spdx: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ell-0.58-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2937 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2938 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.56.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_create_spdx: Succeeded
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2939 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_install)
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Started
NOTE: recipe ofono-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2940 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_configure)
NOTE: recipe ofono-2.1-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2941 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2942 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2943 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 2944 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2945 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2946 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: Running task 2947 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_create_spdx)
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2948 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx: Started
NOTE: recipe speex-1.2.1-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 2949 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_collect_spdx_deps)
NOTE: recipe avahi-0.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe avahi-0.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ell-0.58-r0: task do_package: Succeeded
NOTE: Running task 2950 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_packagedata)
NOTE: recipe ell-0.58-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2951 of 3028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata)
NOTE: recipe ell-0.58-r0: task do_packagedata: Failed
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_compile: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Succeeded
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: recipe ofono-2.1-r0: task do_configure: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_configure: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2951 tasks of which 2774 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_packagedata
Summary: There were 112 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-src went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-dbg went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-staticdev went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-dev went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-doc went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell-locale went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: QA Issue: Package version for package ell went backwards which would break package feeds (from 0:0.59-r0 to 0:0.58-r0) [version-going-backwards]
ERROR: ell-0.58-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/ell/0.58/temp/log.do_packagedata.2058415
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_packagedata) failed with exit code '1'

--===============5167266588865514574==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-good-upgrade-1.22.5-1.22.6.patch"

RnJvbSA5ZDg5MTJlYTkxNzAzZWU1NTc2NzQwM2M0ZmNkZWIwNWM1NDNmMTBiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAxNzoyNDo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1wbHVnaW5zLWdvb2Q6IHVwZ3JhZGUgMS4yMi41IC0+IDEuMjIuNgoKLS0tCiAu
Li51Z2lucy1nb29kXzEuMjIuNS5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjIu
Ni5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEu
MC1wbHVnaW5zLWdvb2RfMS4yMi41LmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4y
Mi42LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjIuNS5iYiBiL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjIuNi5iYgpz
aW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9n
c3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjIyLjUuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29k
XzEuMjIuNi5iYgppbmRleCA5M2YwZTc2ZWU5Li42Yjc2YmE5NTdlIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8x
LjIyLjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1wbHVnaW5zLWdvb2RfMS4yMi42LmJiCkBAIC04LDcgKzgsNyBAQCBTUkNfVVJJID0gImh0
dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LXBsdWdpbnMtZ29vZC9nc3Qt
cGx1Z2lucy1nbwogICAgICAgICAgICBmaWxlOi8vMDAwMS1xdC1pbmNsdWRlLWV4dC1xdC1nc3Rx
dGdsLmgtaW5zdGVhZC1vZi1nc3QtZ2wtZ3N0Z2xmLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTov
LzAwMDEtdjRsMi1EZWZpbmUtaW9jdGxfcmVxX3QtZm9yLXBvc2l4LWxpbnV4LWNhc2UucGF0Y2gi
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiNjdiMzEzMTNhNTRjNjkyOWI4Mjk2OWQ0MWQzY2Zk
ZjJmNThkYjU3M2ZiNWY0OTFlNmJiYTVkODRhZWEwNzc4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImIzYjA3ZmUzZjFjZTdmZTkzYWE5YmU3MjE3ODY2MDQ0NTQ4ZjM1YzRhNzc5MjI4MGVlYzdlMTA4
YTMyZjk4MTciCiAKIFMgPSAiJHtXT1JLRElSfS9nc3QtcGx1Z2lucy1nb29kLSR7UFZ9IgogCi0t
IAoyLjM5LjIKCg==

--===============5167266588865514574==--

