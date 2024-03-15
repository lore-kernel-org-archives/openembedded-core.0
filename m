Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F131C54EF4
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:15 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.1277.1710522012517623170
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=J3j8YAQ7;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=NeQXDFor;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018e430e9b47-0f338843-49c2-4438-9b10-3a7d6cd33403-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522014;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=G+yLaNrCASroQM3RSDEUWxSAJgu1MSm8J9Xtq0g2XIc=;
	b=J3j8YAQ7S82sY53VlXu4xVZtjIM7tjmqzjTdJcwPWn4OmrY5IRemwU3hM+NCtR3L
	ieRGG5RM7zubnMm/CIqjiwCQBi7TnXiloACbnJuGVjjsbdNyTOTdDjqGQujUDg68EH/
	GB6/q8XXgsPceVXslRm+5ceEe7j6r1qZps7WlS9g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522014;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=G+yLaNrCASroQM3RSDEUWxSAJgu1MSm8J9Xtq0g2XIc=;
	b=NeQXDForZoKOjJhrUH7NoJ6VPspWsKQ8WwkeqoQ6tn0iKf7ikwk7ThxRPi6+cnLW
	SrJ4rQIkTPJc2S1FIFwMDWIgvccOFMQbRgOIssKlOjk/lse3jGK/+U77cZBSnOyAKtq
	7w9hMilEddgll4DclxJuXsBVn6uWs+WCoNUMIyEg=
Content-Type: multipart/mixed; boundary="===============2247509830662269624=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 0d0cf9b90541d349ceb49682d063d27a8c2432de FAILED
Message-ID: <0101018e430e9b47-0f338843-49c2-4438-9b10-3a7d6cd33403-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197211

--===============2247509830662269624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-samples* to *0d0cf9b90541d349ceb49682d063d27a8c2432de* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S 0d0cf9b90541d349ceb49682d063d27a8c2432de
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-ff9329ddea835904bc59a0a089a7248221b8574c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ff9329ddea835904bc59a0a089a7248221b8574c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 0d0cf9b90541d349ceb49682d063d27a8c2432de
WARNING: Command 'git rebase 0d0cf9b90541d349ceb49682d063d27a8c2432de' failed:
Failed to merge submodule third_party/spdlog
CONFLICT (submodule): Merge conflict in third_party/spdlog
Recursive merging with submodules currently only supports trivial cases.
Please manually handle the merging of each conflicted submodule.
This can be accomplished with the following steps:
 - go to submodule (third_party/spdlog), and either merge commit c3325095
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
--===============2247509830662269624==--

