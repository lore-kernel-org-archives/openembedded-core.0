Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADEEBE6529F
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:13:10 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29066.1769951579057699572
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=FQvKdwJf;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ROBkNyY5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019c1955c9a9-efb62f71-f39d-4e2e-8c20-e3cb401a215f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951578;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Qp/PdyX0kFhFEzcpy+U80FlXn8heICRj8CxVCR5/lsk=;
	b=FQvKdwJfHwS4viwh44ztJIWa2x0zvvGJkpd5MH/VkAuAAOmH4ETb89o0pOwyPROx
	7McujJlF052WLYVCy/4CUVZa+fbWEujlGbZfBJ24BRHG/f17kf7/He0OThig0KF3EpF
	MQ6/nhpRA69ra+ALMmM1IlL0SHXY9kKwE04LZjRA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951578;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Qp/PdyX0kFhFEzcpy+U80FlXn8heICRj8CxVCR5/lsk=;
	b=ROBkNyY52evr6E8EW6i+wFj1eBdp3jdccH50Zuu0eURF6BSDqT8j9ndogVcP39j4
	251oGvkYLrRCJ2Rt86j9JpomCQL1N1DD4H5c1oqMDPqVOfJHYr9u8rTcfuToR+WCjTT
	kDNbkOwDgNqcY0f2qfTN5gb3ph+5ZuaMKlGL3LZ4=
Content-Type: multipart/mixed; boundary="===============3585778028842482439=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gst-examples: upgrading to 1.28.0 FAILED
Message-ID: <0101019c1955c9a9-efb62f71-f39d-4e2e-8c20-e3cb401a215f-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230316

--===============3585778028842482439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gst-examples* to *1.28.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gst-examples failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1957 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-80d131b21371622b211634995d274e572d09b66c"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:80d131b21371622b211634995d274e572d09b66c"
meta-yocto-bsp       
meta-poky            = "master:de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 9058212f43074ef7df229e73cea135c4ea96e0d6
WARNING: Command 'git rebase 9058212f43074ef7df229e73cea135c4ea96e0d6' failed:
Auto-merging girs/GES-1.0.gir
Auto-merging girs/Gst-1.0.gir
Auto-merging girs/GstPbutils-1.0.gir
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build
Auto-merging subprojects/gst-devtools/meson.build
CONFLICT (content): Merge conflict in subprojects/gst-devtools/meson.build
Auto-merging subprojects/gst-docs/meson.build
CONFLICT (content): Merge conflict in subprojects/gst-docs/meson.build
Auto-merging subprojects/gst-editing-services/meson.build
CONFLICT (content): Merge conflict in subprojects/gst-editing-services/meson.build
Auto-merging subprojects/gst-examples/meson.build
CONFLICT (content): Merge conflict in subprojects/gst-examples/meson.build
Auto-merging subprojects/gst-integration-testsuites/meson.build
CONFLICT (content): Merge conflict in subprojects/gst-integration-testsuites/meson.build
Auto-merging subprojects/gst-libav/meson.build
CONFLICT (content): Merge conflict in subprojects/gst-libav/meson.build
Auto-merging subprojects/gst-plugins-bad/meson.build
CONFLICT (content): Merge conflict in subprojects/gst-plugins-bad/meson.build
Auto-merging subprojects/gst-plugins-base/meson.build
CONFLICT (content): Merge conflict in subprojects/gst-plugins-base/meson.build
Auto-merging subprojects/gst-plugins-good/meson.build
CONFLICT (content): Merge conflict in subprojects/gst-plugins-good/meson.build
Auto-merging subprojects/gst-plugins-rs.wrap
CONFLICT (content): Merge conflict in subprojects/gst-plugins-rs.wrap
Auto-merging subprojects/gst-plugins-ugly/meson.build
CONFLICT (content): Merge conflict in subprojects/gst-plugins-ugly/meson.build
Auto-merging subprojects/gst-python/meson.build
CONFLICT (content): Merge conflict in subprojects/gst-python/meson.build
Auto-merging subprojects/gst-rtsp-server/meson.build
CONFLICT (content): Merge conflict in subprojects/gst-rtsp-server/meson.build
Auto-merging subprojects/gstreamer-sharp/ges/generated/gst-editing-services-api.xml
CONFLICT (content): Merge conflict in subprojects/gstreamer-sharp/ges/generated/gst-editing-services-api.xml
Auto-merging subprojects/gstreamer-sharp/meson.build
CONFLICT (content): Merge conflict in subprojects/gstreamer-sharp/meson.build
Auto-merging subprojects/gstreamer-sharp/sources/generated/Gst.PbUtils/Constants.cs
CONFLICT (content): Merge conflict in subprojects/gstreamer-sharp/sources/generated/Gst.PbUtils/Constants.cs
Auto-merging subprojects/gstreamer-sharp/sources/generated/Gst/Constants.cs
CONFLICT (content): Merge conflict in subprojects/gstreamer-sharp/sources/generated/Gst/Constants.cs
Auto-merging subprojects/gstreamer-sharp/sources/generated/gstreamer-sharp-api.xml
CONFLICT (content): Merge conflict in subprojects/gstreamer-sharp/sources/generated/gstreamer-sharp-api.xml
CONFLICT (modify/delete): subprojects/gstreamer-vaapi/meson.build deleted in HEAD and modified in 50a1f31c47 (Back to development after 1.26.0).  Version 50a1f31c47 (Back to development after 1.26.0) of subprojects/gstreamer-vaapi/meson.build left in tree.
Auto-merging subprojects/gstreamer/meson.build
CONFLICT (content): Merge conflict in subprojects/gstreamer/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/gst-examples
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/gst-examples/gst-examples_1.28.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3585778028842482439==--

