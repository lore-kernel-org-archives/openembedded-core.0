Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A66C88CB4
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:19 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.24020.1677681914072986383
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fStjR13W;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101869da26d73-989fbf4a-ef32-49ee-820b-8bb0a48d4bce-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Mh5e6qIwCPUNq+GYqlE7k0qYlxhMdTY7qasQ2v3k4nI=;
	b=fStjR13WJClZGhCMJEC0f+hwy5je1Jv9B//eLxHXZ6AqAjru9vzyzWk8GUqhNZoM
	42LeulqXx9r1+3iZ27Uc+np+VbBqSq1m3ZnrZGPlleDDZX/AHz/RtGBQXPJQhcM2kdA
	fP6h7ThNYV7Jy+zi8TAbA8VuPN89Dvv/pypCu/P4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Mh5e6qIwCPUNq+GYqlE7k0qYlxhMdTY7qasQ2v3k4nI=;
	b=EeNLjZg22sMU/GietT4J6tafir9r9Pz8uUnrAHU+dqCTR6QBs+QUCAXS6+gtnL5F
	5JZBPzla1AFblQGvsqxMO5yyOL/Ybja4lNzlC4VVsWhBmtiasRKTXgJFO5z4PBMZcRB
	Fdb7WKKYleejGxMFPsVwC1Z6jl5M8/Jyf5h8fT4Y=
Content-Type: multipart/mixed; boundary="===============7342605345123597724=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.2 FAILED
Message-ID: <010101869da26d73-989fbf4a-ef32-49ee-820b-8bb0a48d4bce-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177894

--===============7342605345123597724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *6.2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade btrfs-tools -V 6.2 -S 6439e92cba81c068afca76f8e010fb7175620176
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (07:48:13.731444)
Loading cache...done.
Loaded 1697 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-154bf71c30570beda6c049163602dcdff71c4e49"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:154bf71c30570beda6c049163602dcdff71c4e49"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision 6439e92cba81c068afca76f8e010fb7175620176 was found on multiple branches: 
  
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7342605345123597724==--

