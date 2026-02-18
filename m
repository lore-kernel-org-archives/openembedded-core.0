Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A27C531E5
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:49 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1427.1771440108828675007
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nwRA0E1L;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=lt7KTkM7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019c720ef2ec-ca3e3f5f-d4e6-46b8-9023-a0918285d3a0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440108;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FQxXj0B0NL7kJ7LxKbQA0TKcjDYDt82ucbgOoLB5pq4=;
	b=nwRA0E1LjQQBc+grA0s/P/b4c9qBIjrQZ/4zobD3gX8x5XDsAjiLRm5mVyBjBnye
	aGyQwDrUwSU46blVO8Z3Lmsyki7DZQFvFNR0dGxyRM/sNYpRkTluf+gFp6dZgJUoZ0m
	o3/DF+JSE8JYIJbz7lyP0kqnUGsD6mZlRY/EAsAA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440108;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FQxXj0B0NL7kJ7LxKbQA0TKcjDYDt82ucbgOoLB5pq4=;
	b=lt7KTkM7ByJCgM32EktrkVO6NTFFsK42iRj1LQSj7wLxRB98hetZsejdYpyEyxVX
	84ufuWxbGxRJByPLz+5f3dlqPVjdAnMhr8BEfBbxS/1EK911NCiV6s8muhTOgBL05CT
	pGorG1EkejrGH/lvVghAxFup+ZmwqYzallMvMYFE=
Content-Type: multipart/mixed; boundary="===============7453879630973400407=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mdadm: upgrading to 4.5 FAILED
Message-ID: <0101019c720ef2ec-ca3e3f5f-d4e6-46b8-9023-a0918285d3a0-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231377

--===============7453879630973400407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mdadm* to *4.5* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe mdadm failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1952 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-7327ddb76221364b711b6fa54057039e341ad845"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:7327ddb76221364b711b6fa54057039e341ad845"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 8f0c7692d48414ff7b3fe927ce75799c65ef24b1
WARNING: Command 'git rebase 8f0c7692d48414ff7b3fe927ce75799c65ef24b1' failed:
Auto-merging raid6check.c
CONFLICT (content): Merge conflict in raid6check.c
Auto-merging restripe.c
CONFLICT (content): Merge conflict in restripe.c
Auto-merging swap_super.c
CONFLICT (content): Merge conflict in swap_super.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/mdadm
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/mdadm/mdadm_4.5.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7453879630973400407==--

