Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50905C54E91
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:14 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.75497.1722536828104115023
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=cVysjfAS;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=QZhCNhFL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101910f323240-5ce78fce-ff7e-462e-a3c1-d9daf0677dce-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536833;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TOsgDXYMqfQe5PmS/MAg5EFrw7kn13lQiY3dlKduKo8=;
	b=cVysjfASBeYPnzsP37ZEgDhce4+3ad/cF/ap73E9fOtO6H+BiD6ye2XPNYYgu3zT
	pni/75LSCecJnTUQTYmrXvSkR1gjTRfNjEx4/04i2Kpfs0ACStP8F9JHZfjKptI6tLZ
	Zs7FMnw6ld/+CNkDLCW7huBzuC9wZ7MsLDll/+lc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536833;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TOsgDXYMqfQe5PmS/MAg5EFrw7kn13lQiY3dlKduKo8=;
	b=QZhCNhFLtRT6n3RWE9em2up5Eb7632rYaH/kMBzKlGur2Ah9GOET/51lgDQiUtSF
	L3EHk8sNiYeCZWdJh/ZbVK4JqDDFk+uqouJRfZl9Tt0Y8ZyaGTQzgZ5/OilBJbzBUmi
	h2Wgze5Nds3gKF7RkjJtbDVG72JbK0q0jRIG5u6M=
Content-Type: multipart/mixed; boundary="===============0754193585741437945=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 9487ac2f3be74dd0d3ce4580d3fd45cee0359cb1 FAILED
Message-ID: <010101910f323240-5ce78fce-ff7e-462e-a3c1-d9daf0677dce-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202851

--===============0754193585741437945==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *9487ac2f3be74dd0d3ce4580d3fd45cee0359cb1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S 9487ac2f3be74dd0d3ce4580d3fd45cee0359cb1
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1883 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-91eb39ad6fa1f33b9e19deaba0421c152354f9a1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:91eb39ad6fa1f33b9e19deaba0421c152354f9a1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 9487ac2f3be74dd0d3ce4580d3fd45cee0359cb1
WARNING: Command 'git rebase 9487ac2f3be74dd0d3ce4580d3fd45cee0359cb1' failed:
Failed to merge submodule third_party/spdlog
CONFLICT (submodule): Merge conflict in third_party/spdlog
Recursive merging with submodules currently only supports trivial cases.
Please manually handle the merging of each conflicted submodule.
This can be accomplished with the following steps:
 - go to submodule (third_party/spdlog), and either merge commit 90ce4aae
   or update to an existing commit which has merged those changes
 - come back to superproject and run:

      git add third_party/spdlog

   to record the above merge or update
 - resolve any other conflicts in the superproject
 - commit the resulting index in the superproject

You will need to resolve conflicts in order to complete the upgrade.
ERROR: Execution of 'git rev-list devtool-base..b84c498eb7919a3e8f49419434394451009eb7d5' failed with exit code 128:
fatal: Invalid revision range devtool-base..b84c498eb7919a3e8f49419434394451009eb7d5



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0754193585741437945==--

