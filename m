Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3CABC27C44
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:31 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.1286.1715794338693647453
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=GMnuaRKT;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=FXbEBYyu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018f7d4fe554-b58c29bd-4507-4a1d-9a65-79337fb1ec23-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TjHKwK4eSLHc6ZHpP0nyl7mPG6pXG4Bpkucvk8G4GU0=;
	b=GMnuaRKTQhUm6RoM8CMfcx9+GGC8jNbDAfrlGABczfiKGZyLjm7kgK7YPdLatT2x
	X8JBKkqh9l/F0YikcP17H3JZhmXUTJX2lRwMgx2Mp8i3k+gC7Mcpmt8Si9vz5KIExKL
	84BdLmtbvoPpCYagR+YElnYWkHKhOOMtlU8EEO0Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TjHKwK4eSLHc6ZHpP0nyl7mPG6pXG4Bpkucvk8G4GU0=;
	b=FXbEBYyu0T3kQjqZKINwzUJ+OpPnRt1K1llr7ntRuQ61UsQIbHwkbSuNqm35x3Oy
	RaEEYq8MmvikS6NSsCSYW9ezBW+DC6cIWS0DCdUY1i2BwpS9uml5pm+b6QfWXd2pwwY
	vuvSxZa6RBkHzrM5sd5VdlvSpCDfq1HnxzRqgOv0=
Content-Type: multipart/mixed; boundary="===============0508013391046489035=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ffmpeg: upgrading to 7.0 FAILED
Message-ID: <0101018f7d4fe554-b58c29bd-4507-4a1d-9a65-79337fb1ec23-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199390

--===============0508013391046489035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ffmpeg* to *7.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe ffmpeg failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-f95809543d113c605ce3c4c8b4a12b008e26f629"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f95809543d113c605ce3c4c8b4a12b008e26f629"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1879 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (920 cached, 2 parsed). 1880 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-f95809543d113c605ce3c4c8b4a12b008e26f629"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f95809543d113c605ce3c4c8b4a12b008e26f629"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   4% |#                                   | ETA:  0:00:03
Adding changed files:   9% |###                                 | ETA:  0:00:02
Adding changed files:  14% |#####                               | ETA:  0:00:02
Adding changed files:  19% |#######                             | ETA:  0:00:01
Adding changed files:  24% |########                            | ETA:  0:00:01
Adding changed files:  29% |##########                          | ETA:  0:00:01
Adding changed files:  34% |############                        | ETA:  0:00:01
Adding changed files:  39% |##############                      | ETA:  0:00:01
Adding changed files:  44% |###############                     | ETA:  0:00:01
Adding changed files:  48% |#################                   | ETA:  0:00:01
Adding changed files:  53% |###################                 | ETA:  0:00:01
Adding changed files:  58% |#####################               | ETA:  0:00:00
Adding changed files:  63% |######################              | ETA:  0:00:00
Adding changed files:  68% |########################            | ETA:  0:00:00
Adding changed files:  73% |##########################          | ETA:  0:00:00
Adding changed files:  78% |############################        | ETA:  0:00:00
Adding changed files:  83% |#############################       | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.ffmpeg.org/releases/ffmpeg-7.0.tar.xz...
INFO: Rebasing devtool onto 8a91018c810652288380b99a690fcd39aa26041b
WARNING: Command 'git rebase 8a91018c810652288380b99a690fcd39aa26041b' failed:
Auto-merging configure
Auto-merging libavcodec/Makefile
Auto-merging libavcodec/vulkan_av1.c
CONFLICT (content): Merge conflict in libavcodec/vulkan_av1.c
Auto-merging libavcodec/vulkan_decode.c
Auto-merging libavcodec/vulkan_decode.h
Auto-merging libavcodec/vulkan_video.c
CONFLICT (content): Merge conflict in libavcodec/vulkan_video.c
Auto-merging libavcodec/vulkan_video.h
Auto-merging libavutil/hwcontext_vulkan.c
Auto-merging libavutil/vulkan_loader.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/ffmpeg
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/ffmpeg/ffmpeg_7.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0508013391046489035==--

