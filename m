Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2339FCEDDB9
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:19 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12139.1763224746437543697
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RvOjwZIn;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=apxqIQt/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019a886284ac-23319ed8-c951-45a3-b910-a2dd2073c30f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=L62M54ArtoAa8WF1SKJBuNdsJorZwcFn8P1UUgdarBU=;
	b=RvOjwZInobJEdogYWrUJw1cWBRdvmoPe9bM6KEsrQzAuETMUcIqfNSd69m5gRF68
	OdpffF1FfAAsQAsoInwMkoRpMiOJg+lPW57njFOY0Cj3+6Xw0t/+yq4WDtLGXWjwwrG
	P9/swvlLp8KtmiQQTBf4KMbNvAarYIlkVXkONaeI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=L62M54ArtoAa8WF1SKJBuNdsJorZwcFn8P1UUgdarBU=;
	b=apxqIQt/pton8QetKq0M587BtpW+GTTMjv7ySojp9U/e+6DwDp93UybLN6LMfaiB
	bAj2Y7pjkk4r1KKLtbcINYRNHRZTiO2YB8sTlEYG3VUjDdYUnyPSwfpmO1ubpdfQdMJ
	+EN8AvT1nd/OvwkBk37umshUJ/3qjN9QtoluDr94=
Content-Type: multipart/mixed; boundary="===============7427596380868503244=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gst-examples: upgrading to 1.26.8 FAILED
Message-ID: <0101019a886284ac-23319ed8-c951-45a3-b910-a2dd2073c30f-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:39:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226432

--===============7427596380868503244==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gst-examples* to *1.26.8* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gst-examples failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1944 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-e324d9fbf2d1da822578a7366a2b27b77e0b5f97"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:e324d9fbf2d1da822578a7366a2b27b77e0b5f97"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
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
INFO: Rebasing devtool onto 16d77e12ad213ef24e76a8cc34d347b8221c9975
WARNING: Command 'git rebase 16d77e12ad213ef24e76a8cc34d347b8221c9975' failed:
Auto-merging subprojects/gst-examples/playback/player/gtk/meson.build
CONFLICT (content): Merge conflict in subprojects/gst-examples/playback/player/gtk/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/gst-examples
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/gst-examples/gst-examples_1.26.8.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7427596380868503244==--

