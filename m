Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77813C3ABBB
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:45 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1789.1746113616102970307
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ASq+OfYS;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Hn1AYyVx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101968c7b56d5-11645261-d6ff-4067-89eb-0d2618a99b4e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113615;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AfpH/LsPLtE+4KnrKIi84PXEYarUmtoW53L3sNjTivc=;
	b=ASq+OfYSNkUg6jLsdWRQjLjpanXPFmbpKj8CU2tGdK8fNWLc87rgOBfLCTUd0QFC
	SUHhrs9xEiAzXkM4RRjSsis/oUrvH24HUm0s/R06idg4ngo9ymACiAa3LzYKYBRidUf
	JoZV19DhTVjMOT64sQMCjHl+oBOJq4TC07UY3W8c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113615;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AfpH/LsPLtE+4KnrKIi84PXEYarUmtoW53L3sNjTivc=;
	b=Hn1AYyVxPzASWP6MitE16qkYyMJARDVfF+Qn0yZgpOOa92AsiwwmcCbFOsDUu/8a
	Ou413tJzJFtJAdJn0apY5UaN7n37FpJG1LpamLi4BMBKUlc8iLEzqK9k/lmhtzsn+SW
	naiBDIjumDGF3rXA20xgca7ZwiJjuXYEfo+J3XHU=
Content-Type: multipart/mixed; boundary="===============6923419206525515506=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm: upgrading to 20.1.4 FAILED
Message-ID: <010101968c7b56d5-11645261-d6ff-4067-89eb-0d2618a99b4e-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215805

--===============6923419206525515506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *llvm* to *20.1.4* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade llvm -V 20.1.4
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1897 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:68c1792596a2037946b4f450e69add45ab81b3d4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250501082833.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250501082833.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
ERROR: Applying patch 'spirv-internal-build.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/llvm/20.1.2/devtooltmp-sddmfdx_/workdir/llvm-project-20.1.2.src'
CmdError('sh -c \'PATCHFILE="spirv-internal-build.patch" git -c user.name="OpenEmbedded" -c user.email="oe.patch@oe" commit -F /tmp/tmptujpl0a4 --no-verify --author="Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>" --date="Fri, 21 Mar 2025 17:17:52 +0200"\'', 0, 'stdout: On branch devtool-orig
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
  (commit or discard the untracked or modified content in submodules)
\tmodified:   llvm/projects/SPIRV-LLVM-Translator (modified content)

no changes added to commit (use "git add" and/or "git commit -a")

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/llvm/20.1.2/devtooltmp-sddmfdx_/temp/log.do_patch.2871291
ERROR: Extracting source for llvm failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6923419206525515506==--

