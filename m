Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B368EC25B73
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:28 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.799.1686887481902846143
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GfEDaw4s;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010188c2544c20-7b7026e3-40de-4761-aa6d-ecf21be58b9b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887484;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Omsn6OAViL2sktGeXQCTVw8hn1pISn2j1j9y/8WxWXk=;
	b=GfEDaw4sfOVF1TW3WIcnK+vJtQHvJlvw/wvfZWtnVIwjFa3F0ZNZutQb6Ml8demc
	0nKCv9TCYOeIHs9SrGleue/5v+pq501PW2Zv4Rl6WoiIbd8sJVtxsft3ul9EzVrJTWN
	J9iHoUdA6ZtmQGvOYRC6zsxSCxeo7eTTILiBQ9RE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887484;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Omsn6OAViL2sktGeXQCTVw8hn1pISn2j1j9y/8WxWXk=;
	b=C/vekxBRdk8QQWdnMzuCETtfDpBNFLqkEZEJvjPjquMxTqujaEy1vwa9v4gytsTv
	/9F1RALY8rYIbug8aZq8f4S623QnSnfuzL6U+cQzEadO5TlhIlxxPVRnc+KPeLSjLSp
	8WbPnv+SMi6Bgb0U+fYu12qNlvwsNd5Y7qsJ5cwY=
Content-Type: multipart/mixed; boundary="===============5999262422089011468=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-validation-layers: upgrading to 1.3.250.0 FAILED
Message-ID: <01010188c2544c20-7b7026e3-40de-4761-aa6d-ecf21be58b9b-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182940

--===============5999262422089011468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-validation-layers* to *1.3.250.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe vulkan-validation-layers failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry... (21:13:14.087662)
NOTE: Directory listing: ['conf', 'upgrade-helper', 'bitbake-cookerdaemon.log', 'buildhistory', 'workspace', 'cache', 'tmp', 'downloads', 'sstate-cache']
NOTE: Retrying server connection (#1)... (21:13:14.197516)
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1802 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1e8e4ce5261aec91e6c257fdadf6f34ecaa573c7"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 1541e00a63cd125f15d231d5a8059ebe66503b25
WARNING: Command 'git rebase 1541e00a63cd125f15d231d5a8059ebe66503b25' failed:
Auto-merging build-android/jni/Application.mk
CONFLICT (content): Merge conflict in build-android/jni/Application.mk
Auto-merging build-android/jni/shaderc/Application.mk
CONFLICT (content): Merge conflict in build-android/jni/shaderc/Application.mk

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/vulkan-validation-layers
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/vulkan-validation-layers/vulkan-validation-layers_1.3.250.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5999262422089011468==--

