Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C7CC3DA49
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:43 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.42232.1717263219836599678
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Fkkc/vP8;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=oO7XsVlf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018fd4dd383e-95aada07-b740-4d81-826a-97f43efa3020-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uEAq75I5ey/rcR8RPlbDqDD6MB6RnimA1+JKEl/L4WQ=;
	b=Fkkc/vP8f92lhGY0doPoAtRR8d5hKOz3Hs+umZt8ZV9dM4TGZn0a/gVsuEGqyK1f
	XiiARQ8IqkonAfhRSR1VfX7go1MCNSZ1v/EdwSs2RbA80PbOo1wcSBcJK9CMgqBqooc
	Fa9MoJ7F8h9i1vrwgis2ajFVC2DtunbAvwWBYcZk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uEAq75I5ey/rcR8RPlbDqDD6MB6RnimA1+JKEl/L4WQ=;
	b=oO7XsVlfrceBYsTYNXYLSOxmLbYQZzbHot47S53yyai3kQ0wNYF+hQVScj2Op+se
	eF1TAe7n27CsiFrFKfHDkKZJtTnxsNrMv9lszRK0lea8DZsWA5sx5HeVzfP4HBijcRf
	YoT1nBu9hUqDaP4cEfz6uHlW2Z3minYYoDzq7ZEU=
Content-Type: multipart/mixed; boundary="===============0057442077498324213=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 3a6e27d01deaf6b2975f3545139d40cc768a046c FAILED
Message-ID: <0101018fd4dd383e-95aada07-b740-4d81-826a-97f43efa3020-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200190

--===============0057442077498324213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-samples* to *3a6e27d01deaf6b2975f3545139d40cc768a046c* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S 3a6e27d01deaf6b2975f3545139d40cc768a046c
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-7f363100e49ac857522ce411267e01230cf3a2ce"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7f363100e49ac857522ce411267e01230cf3a2ce"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 3a6e27d01deaf6b2975f3545139d40cc768a046c
WARNING: Command 'git rebase 3a6e27d01deaf6b2975f3545139d40cc768a046c' failed:
Failed to merge submodule third_party/spdlog
CONFLICT (submodule): Merge conflict in third_party/spdlog
Recursive merging with submodules currently only supports trivial cases.
Please manually handle the merging of each conflicted submodule.
This can be accomplished with the following steps:
 - go to submodule (third_party/spdlog), and either merge commit ee2067b8
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
--===============0057442077498324213==--

