Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C1AC8302F
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:57 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.27785.1748786145708762005
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jhMPnI66;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rELknRQf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101972bc6f796-11a9ee3e-f18a-4804-956b-cf24eecb7b43-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786149;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GNHgyx3TniZh6T/phk2TqeGKdXAn+XuOUGcexwSFJO8=;
	b=jhMPnI66k6Iosh+XT3BOZWTUcqp0fabjXFiMHwY1qPlsQz8ZkayEWKzOLFHcCzWF
	rSw8TXW+eF5U28ZDxVO5uJ3elLZDLjWFK02ukdl24xY9ocTh2rmxEsYELB6vn6xzJOn
	kphJeqg140FO5NmAqPPjuIxSZDhSgzYoI68LIm1E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786149;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GNHgyx3TniZh6T/phk2TqeGKdXAn+XuOUGcexwSFJO8=;
	b=rELknRQfbqaebXRzVFlZwaflyAiwhbKHI8upArIfH8dAZmlgBQG9rOvRLpKZTwq1
	owe+r7TM2o/xKRs6z/YFMWx714hDhHVt9oGxY4j4+X0U+Sc/dHmt497oX4s+PdjBpw7
	PExjwwGUCam4K7Mj60lxlKTGkngXJ6rDkw5DPKiY=
Content-Type: multipart/mixed; boundary="===============2634993783674176002=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gst-examples: upgrading to 13.0.1 FAILED
Message-ID: <010101972bc6f796-11a9ee3e-f18a-4804-956b-cf24eecb7b43-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217652

--===============2634993783674176002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gst-examples* to *13.0.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gst-examples failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1915 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:f4ad3111d02a39c239831fea89af8839829a5f37"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 2b607442d9e49d3f1ba3882e5e5060d5967c8cd7
WARNING: Command 'git rebase 2b607442d9e49d3f1ba3882e5e5060d5967c8cd7' failed:
Auto-merging AUTHORS
Auto-merging COPYING
CONFLICT (add/add): Merge conflict in COPYING
Auto-merging NEWS

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/gst-examples
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/gst-examples/gst-examples_13.0.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2634993783674176002==--

