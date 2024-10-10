Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8916ED0EE24
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:06 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.53278.1728588959207840763
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=G4qaCba+;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=4P02ul8r;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019277ee63c9-833cf744-3e00-4371-800c-9816e12bdf07-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588964;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=P5zqqff7wpjh2DIv/mlYUSzlgMR8hYhDryZH7TPKyyg=;
	b=G4qaCba+y+JeztLwp+9juLVaSuHhaAQZP3wF5jXEyn14QyAGmv5HLVbuAsGlaoJW
	hyvCbPA642Rf4k5K1XUQ+OSCJK+ozJwW+jMB3ZRUL2fLLaoYOFuChkpi4ae3O22PNOy
	5qjzvWFEdtAVI+FmiVWX1rUxzgbmlocYWB0eOplE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588964;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=P5zqqff7wpjh2DIv/mlYUSzlgMR8hYhDryZH7TPKyyg=;
	b=4P02ul8rhqDG0AlLmqdZPCBDR3LKALC18R11DVu77nblvUvQrgipXcPjZafmggU4
	TffYbsMA3Ndspj4bSxHX5rtCGo68+XVSImkOUCcEcOJK1PLm/x8ANddwUohNrmesWhL
	adsfdOihC2DptLOuQdNK/s/PE+PqHxwQAi8BHDFs=
Content-Type: multipart/mixed; boundary="===============3730000822922556338=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-loader: upgrading to 1.3.296.0 FAILED
Message-ID: <0101019277ee63c9-833cf744-3e00-4371-800c-9816e12bdf07-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205507

--===============3730000822922556338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-loader* to *1.3.296.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-loader -V 1.3.296.0 -S 7aeb5e4324957b6f60dac5c8cedb955df4fecbfb
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
workspace            = "tmp-auh-upgrades:7c8199014e475cb8a23db573b02c136fdbe5835f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision 7aeb5e4324957b6f60dac5c8cedb955df4fecbfb was found on multiple branches: 
  stabilized_release_2024_09
  vulkan-sdk-1.3.296
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3730000822922556338==--

