Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CF1C54E66
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:18 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.36974.1709330716328812179
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DNO6csy6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UrhKzajj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018dfc0cd6fb-acd9172a-24ff-41f3-bc57-e0a4f2b7895d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WrWkKuEGXVMZBKV2B0RsrLEGqTxZuHxEfgXnPmD5/mA=;
	b=DNO6csy6aWmQvBpnLfiJ97WBM7fFHkDAh1qI+E6uhlz3aFL2yaS6Qfi3DD17olyv
	1BkQF7dJaUXMDQPOPJOuOmBs56sGqIdq610HclsJzVjTfTLveiknhnVnA6q7bdWzkNP
	jcyQ+wYxun17sbxA4KAqj36dhp7PEhANb2Rutock=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WrWkKuEGXVMZBKV2B0RsrLEGqTxZuHxEfgXnPmD5/mA=;
	b=UrhKzajjTkTW19asq8Kje/08n7pZTm7lEsYSx/1HYB28EABEJxBTBaj71TYsrgO1
	4xfX0FOZ9u04Wm7vKXqbQd19Dv+/tWdxGGwadeEL2l2Mx9TPyWgyVRnKX+Cv9vYA4Wo
	6pn+0cQlD3WfhOpOQmcWho/qTYXf3s4uGmTsbF7o=
Content-Type: multipart/mixed; boundary="===============9014864933674238747=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] tcl: upgrading to 8.6.14 FAILED
Message-ID: <0101018dfc0cd6fb-acd9172a-24ff-41f3-bc57-e0a4f2b7895d-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196484

--===============9014864933674238747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *tcl* to *8.6.14* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe tcl failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1868 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-4ed7a7c141ead826be40225f59927b390a1ad267"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4ed7a7c141ead826be40225f59927b390a1ad267"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 15 seconds
Loading cache...done.
Loaded 1868 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (915 cached, 2 parsed). 1864 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-4ed7a7c141ead826be40225f59927b390a1ad267"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4ed7a7c141ead826be40225f59927b390a1ad267"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  22% |########                            | ETA:  0:00:02
Adding changed files:  45% |################                    | ETA:  0:00:01
Adding changed files:  67% |########################            | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://downloads.sourceforge.net/tcl/tcl-core8.6.14-src.tar.gz...
INFO: Rebasing devtool onto 674882f7ee72521bb1fa4acfb20ae224eb91e25c
WARNING: Command 'git rebase 674882f7ee72521bb1fa4acfb20ae224eb91e25c' failed:
Auto-merging unix/Makefile.in
CONFLICT (content): Merge conflict in unix/Makefile.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/tcl
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/tcl/tcl_8.6.14.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9014864933674238747==--

