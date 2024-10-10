Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C00D24448
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:54 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.53367.1728588951632949875
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=B7GrvQjn;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=m6dWHs+/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019277eefa22-69b56177-b8da-4bd7-8159-31e061c04ca3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728589003;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tgdu85THA0m11OXvMnLz8i0eX8NNMkb1D1kPWwJ14/Y=;
	b=B7GrvQjn2AiPPohFQmGtXz+AmffjSH1KBuETwE3I4PjGLHYhgHfb7WVSyHdtCMQJ
	LWSFGiLbg/qwEpSPzfPJqYcmz88BaqCwmXdN2M5u7CC5fU5ifsa4L8BBIW6tnS5Hx1F
	MwwBGcnbBwltivPTUmS4wFykokbilpQTXO0pX95U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728589003;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tgdu85THA0m11OXvMnLz8i0eX8NNMkb1D1kPWwJ14/Y=;
	b=m6dWHs+/1cdsbRIiu9/SyXYEQaJv6S29MS72G17c03RmU5rDoDbotLjbsd6Xxur4
	EPscP8DBiiiF2ByYm8sdW9HE3NA5thpu1Hi6YTVEh37ddn+i/DAADUKekaaFMyT9pbb
	Sl+LRrassGb6g91qOmeOsb62N01MGexv4K8DWubM=
Content-Type: multipart/mixed; boundary="===============7064363567393210974=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpipeline: upgrading to 1.5.8 FAILED
Message-ID: <0101019277eefa22-69b56177-b8da-4bd7-8159-31e061c04ca3-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205631

--===============7064363567393210974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libpipeline* to *1.5.8* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libpipeline failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1871 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:302df559f8e4b5551bd78dbf6e554e9dfb2cc799"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (0 cached, 918 parsed). 1872 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:302df559f8e4b5551bd78dbf6e554e9dfb2cc799"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-j6wwrph1: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-3ia5lt0z/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-3ia5lt0z/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  30% |##########                          | ETA:  0:00:00
Adding changed files:  60% |#####################               | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.savannah.gnu.org/releases/libpipeline/libpipeline-1.5.8.tar.gz...
INFO: Rebasing devtool onto 61cdc736d77816a5d5371d4ef36e52239e7952e1
WARNING: Command 'git rebase 61cdc736d77816a5d5371d4ef36e52239e7952e1' failed:
Auto-merging gl/m4/largefile.m4
CONFLICT (content): Merge conflict in gl/m4/largefile.m4

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libpipeline
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libpipeline/libpipeline_1.5.8.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7064363567393210974==--

