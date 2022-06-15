Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02EC0CCA48E
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:46 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.4449.1655298222094350203
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=buO+IqRT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010181677663d3-f984ff34-4bae-4901-8092-66fefcae65ec-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gFvAiQpL+Bl8Xjgehrhx+KonuaUFg5g2FQdJZpk29jc=;
	b=buO+IqRTIM155jf/Ql2KJsqSHWT3vnMoQXGYTPTwMXqCrkQE0Z8wxpfO2spIC8bO
	eV5HvCezRbioJS44vrpFVh5C4UOJisdQXZUvTXM5cxNEvhPItmYPWj+861ShbJES3FR
	s/ni3rWrNXomKEQbbTzP7uMIJ1xzMdbpRnjDeI6U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gFvAiQpL+Bl8Xjgehrhx+KonuaUFg5g2FQdJZpk29jc=;
	b=WeRh8qYqFYydTQXyp+jZ3iQ2xuSsYFa1u3hd1BNsJD0Lp0Q5cevQASr6CgzrLXZx
	vtlWgCW+pOpr6Qs+Sp71bL7Mk46hTdqdNTe0eDjmCRPe1CiwS4QEor9FQekmXN+c+g0
	yjG3pWMfJzzHNHL7g4ofZyEql7J3ke0LzXYPVX7o=
Content-Type: multipart/mixed; boundary="===============5729715348373666618=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] procps: upgrading to 4.0.0 FAILED
Message-ID: 
 <01010181677663d3-f984ff34-4bae-4901-8092-66fefcae65ec-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:41 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166965

--===============5729715348373666618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *procps* to *4.0.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe procps failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1642 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-5947e595b73e5719b61f27958d207fec035e6afb"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5947e595b73e5719b61f27958d207fec035e6afb"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 61825a5cc56b40c4afffd8c880b641210b05b3b7
WARNING: Command 'git rebase 61825a5cc56b40c4afffd8c880b641210b05b3b7' failed:
Auto-merging ps/output.c
CONFLICT (content): Merge conflict in ps/output.c
Auto-merging NEWS
CONFLICT (content): Merge conflict in NEWS

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/procps
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/procps/procps_4.0.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5729715348373666618==--

