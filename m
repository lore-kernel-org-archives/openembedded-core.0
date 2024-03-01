Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC910C54EBD
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:19 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.36644.1709330717917969204
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PF+cXoff;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=S+vDehjk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018dfc0cda40-ec8b89a6-bd37-446b-986c-c369c4a91941-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GkPGi+GYVp5/gUKD3zq+UK7WfeIuSd/2MOWd6OKEhzY=;
	b=PF+cXoffjYFhWPxwMqfMm0DvHJncal7uGZx3GP9++WZpciDHXSrahI+2Hm3Z0Lsh
	DjC3bHcTaQcqalEM23l/KTlij5CEgvFxaxgjNTBNpqcMsjuJrkuSqZFR9gN/Fgt6pE5
	xLQFJtcMIva/dqjFxbs1R9UkJXNjVep2EtrnRENI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GkPGi+GYVp5/gUKD3zq+UK7WfeIuSd/2MOWd6OKEhzY=;
	b=S+vDehjklFB1jgqJmB+91eioVhTtmXfjd9NFfCwo6puQQX5ZES2BShYAQM5n2Ql3
	4HwZMIDD2hLsQkl+RWh+Z5WMP4/+YzRMITTht0JKrA8+OmWqdRCh3LW3q+u/NI+LvU+
	jNNtPxMDPgFHyUc+DOrq6T39nW4yJxGGR4BWElWc=
Content-Type: multipart/mixed; boundary="===============5252829879100195236=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtraceevent: upgrading to 1.8.2 FAILED
Message-ID: <0101018dfc0cda40-ec8b89a6-bd37-446b-986c-c369c4a91941-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196526

--===============5252829879100195236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libtraceevent* to *1.8.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libtraceevent failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1863 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-bb5a28ebc6a18ba198b3a16850021e84b016ecdd"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:bb5a28ebc6a18ba198b3a16850021e84b016ecdd"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 6f6d5802f31992e7527a4c32b43a32fda6bf6bdf
WARNING: Command 'git rebase 6f6d5802f31992e7527a4c32b43a32fda6bf6bdf' failed:
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build
Auto-merging meson_options.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/libtraceevent
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libtraceevent/libtraceevent_1.8.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5252829879100195236==--

