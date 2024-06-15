Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C51C3271F
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:27 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.18621.1718475800318270272
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Gny+Oei8;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=3MFoicQ3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101901d23bcf3-739334ac-9e10-4677-928a-dba281b18b3c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475799;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=B0PE8j0S94vR6ts4S/47Xeqo1kDJY0JzMiGyd+c0ico=;
	b=Gny+Oei8v3hDKK3MDb6AjX+xGJbpqmZDy/8QpxjIcegEr+rJ5LdJU4cwL5E/hPaV
	fPzSOKK2EiRT8n5wHNvFs6ejvJkye4Cbg/0I2ONlchT89gQmITM/J9TidQxeMrtJAEg
	g9Fb1esCxIq2uXFn2Uqf3Ggrom9M5jJg++DMkYxY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475799;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=B0PE8j0S94vR6ts4S/47Xeqo1kDJY0JzMiGyd+c0ico=;
	b=3MFoicQ32g12MEWUvyHZ6WZ5hJFa2Cmr+6GzELQ42BujkwLhf56HBpv76yDK0sJJ
	+J0cpqXpZQMBj15+8m9I7f+bDYGXp3tsI5cK6IPC3fnF9Xr54yiOzLfjTuU/3kPxLx/
	3/+4zMe6CuQQYGAeLTQJq90Jpmj411uRk0upfsBc=
Content-Type: multipart/mixed; boundary="===============7533199968316767128=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 23d68d6717116f575407b71caa6fbf7e980f3054 FAILED
Message-ID: <010101901d23bcf3-739334ac-9e10-4677-928a-dba281b18b3c-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200730

--===============7533199968316767128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-samples* to *23d68d6717116f575407b71caa6fbf7e980f3054* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S 23d68d6717116f575407b71caa6fbf7e980f3054
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1881 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-c8cb46b0be48da15642c0b78c4a6534be544b2bd"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c8cb46b0be48da15642c0b78c4a6534be544b2bd"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 23d68d6717116f575407b71caa6fbf7e980f3054
WARNING: Command 'git rebase 23d68d6717116f575407b71caa6fbf7e980f3054' failed:
Failed to merge submodule third_party/spdlog
CONFLICT (submodule): Merge conflict in third_party/spdlog
Recursive merging with submodules currently only supports trivial cases.
Please manually handle the merging of each conflicted submodule.
This can be accomplished with the following steps:
 - go to submodule (third_party/spdlog), and either merge commit 1b0d6f37
   or update to an existing commit which has merged those changes
 - come back to superproject and run:

      git add third_party/spdlog

   to record the above merge or update
 - resolve any other conflicts in the superproject
 - commit the resulting index in the superproject

You will need to resolve conflicts in order to complete the upgrade.
ERROR: Execution of 'git rev-list devtool-base..ee839b65f277ecaf26e4d3fd9877d9f37ced17d2' failed with exit code 128:
fatal: Invalid revision range devtool-base..ee839b65f277ecaf26e4d3fd9877d9f37ced17d2



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7533199968316767128==--

