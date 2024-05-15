Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E39C25B78
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:18 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1229.1715794336639946274
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=CGKL3Zvd;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=tq8Kb2MH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018f7d4fd821-0178cc7c-a003-4d53-8080-c049d3e4f51d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794336;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3e7SUPPhLB7kLO21j06AqophqzOzTsX8pymexS2T7Zk=;
	b=CGKL3Zvd1jZ3C6sxqV9gX5SKYAHvIlqaoBY8aOet4dQlIYVRLBmvdpITR0RZjrsb
	7aipgD3cBaDPSFls/zsyQQVdXeU8YAGjRn31qgnx5s+Jp+vfv8umxNjzcJz6FRnZ9wx
	B85nF5BrNQy1cipi6BblWqs4/bxzJrbj7uYH2JPo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794336;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3e7SUPPhLB7kLO21j06AqophqzOzTsX8pymexS2T7Zk=;
	b=tq8Kb2MHAaWEgQ+XrwskG45Tf9ok9fkS3wZrzrGICKV1vTNj86zLztuci75msN59
	obCTULJCQDYn14Co7fvdtqeQXoWUXUchAWs1V8yq1mkOmgH8fDkNMF0KLdl9t6Ik8Ld
	o57XSOMk1LKisu18MwcQK5bJKYMHgSSlix0Yn9Mk=
Content-Type: multipart/mixed; boundary="===============2483282575422207775=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pciutils: upgrading to 3.12.0 FAILED
Message-ID: <0101018f7d4fd821-0178cc7c-a003-4d53-8080-c049d3e4f51d-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199296

--===============2483282575422207775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pciutils* to *3.12.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe pciutils failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-79ab2413e082838291157445038476f9d8edb586"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:79ab2413e082838291157445038476f9d8edb586"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
Loading cache...done.
Loaded 1880 entries from dependency cache.
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
DISTRO_VERSION       = "5.0+snapshot-79ab2413e082838291157445038476f9d8edb586"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:79ab2413e082838291157445038476f9d8edb586"

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
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://cdn.kernel.org/pub/software/utils/pciutils/pciutils-3.12.0.tar.xz...
INFO: Rebasing devtool onto 7426dd88e64d254a031896ab9a2411b089b5e02d
WARNING: Command 'git rebase 7426dd88e64d254a031896ab9a2411b089b5e02d' failed:
Auto-merging Makefile
CONFLICT (content): Merge conflict in Makefile
Auto-merging lib/configure

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/pciutils
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/pciutils/pciutils_3.12.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2483282575422207775==--

