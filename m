Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A26EEE24D
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:00 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.29676.1694804393895857712
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Y1xJ64f1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SY+6kdDb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018a9a36bba2-9151bbed-2ddb-47cf-8d6d-800aa6be5cae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EZQKbeFc3Sg/JKf8BWOoCyARQo02I3Cn18XuBPXHHDg=;
	b=Y1xJ64f1TBAa7CzD+1ptez+CvBCX0Xqkmtj9fizxEsPr5eUSsnDNLiK59nizJTEr
	ZpE0gOHxmZb/6qR2GYIQPDnRZUb5tIv22a1J/v9nMGYQ/MjYCzcElkSWHj3xmOyrjxM
	/IoXu8rxtbbyIvQqdd5hEwSOMbBTAd+i4qIQoQ4Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EZQKbeFc3Sg/JKf8BWOoCyARQo02I3Cn18XuBPXHHDg=;
	b=SY+6kdDbDLpCHKrrKLNTUUFoxakMNETy/hj2zBjyb+1RpW/DDhyeYs1pli4wQIsN
	xwFa1jEGy4Xyxw/QY2gFVRTPcnty7YWladGzucDMw8PitlqC76Y5CxYxFZVuNaF/adr
	TjnuixEID/vxNaEQSJj3hb06ffqeEKBf7uUTB8fM=
Content-Type: multipart/mixed; boundary="===============6754303585997376720=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libdnf: upgrading to 0.71.0 FAILED
Message-ID: <0101018a9a36bba2-9151bbed-2ddb-47cf-8d6d-800aa6be5cae-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187701

--===============6754303585997376720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libdnf* to *0.71.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libdnf failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (08:45:24.580376)
Loading cache...done.
Loaded 1807 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-54535b0d7da7529dbb74adae26bc613938e6d803"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:54535b0d7da7529dbb74adae26bc613938e6d803"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 29 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 39098f39806becdc87cf93e03a49ae89a33e7ede
WARNING: Command 'git rebase 39098f39806becdc87cf93e03a49ae89a33e7ede' failed:
Auto-merging CMakeLists.txt
CONFLICT (content): Merge conflict in CMakeLists.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/libdnf
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/libdnf/libdnf_0.71.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6754303585997376720==--

