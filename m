Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E78DC54E63
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:34 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.20180.1708018346551097697
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PC3vdxyG;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NIIP4sAe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018dadd3a65a-00b74e23-13a5-4ac5-b80d-7ad0ccca1e69-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018346;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6RNG7Edm52gAIv6OTj+rGjjWiZDpYL6feJkWyrSf5sQ=;
	b=PC3vdxyGI2In+x9rppcqeJLhH9P9+fr6rLTVLBicFUZQWTRKLEGqHw/B4wT7xauy
	rdw9Qq1U6ZAR6UTBTsEQzyHI3rcTx6ZIag0hkixGdIomPe6pRwLR8W9O3ZNMtzjVJwy
	pPepzj5KgK1ioVKzfyIKm8FO2QnqHuHxzLbRJDKM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018346;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6RNG7Edm52gAIv6OTj+rGjjWiZDpYL6feJkWyrSf5sQ=;
	b=NIIP4sAezm3Xvvdkwndd7sFJQh+4n8WONl6Twd7ImBxzGxCKcTgFjfPaSbA58ddj
	m8ft0ZM8fcntiFtgDEO0wkQXL4WLOgw8icnWCX2h8leWDCQ1QvxNDfKLaIiJpBk/cJ+
	Z6+f8Y/cz1L2KZ3+A7bZ7fBrxNV4s8TAZtLnDUBQ=
Content-Type: multipart/mixed; boundary="===============7377209226631453702=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpam: upgrading to 1.6.0 FAILED
Message-ID: <0101018dadd3a65a-00b74e23-13a5-4ac5-b80d-7ad0ccca1e69-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195635

--===============7377209226631453702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libpam* to *1.6.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libpam failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1857 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-751ddabb138ced670a1c043db561c90a4bfc3c4b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:751ddabb138ced670a1c043db561c90a4bfc3c4b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 1857 entries from dependency cache.
Parsing recipes...done.
Parsing of 915 .bb files complete (913 cached, 2 parsed). 1858 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-751ddabb138ced670a1c043db561c90a4bfc3c4b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:751ddabb138ced670a1c043db561c90a4bfc3c4b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  21% |#######                             | ETA:  0:00:00
Adding changed files:  42% |###############                     | ETA:  0:00:00
Adding changed files:  64% |#######################             | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/linux-pam/linux-pam/releases/download/v1.6.0/Linux-PAM-1.6.0.tar.xz...
INFO: Rebasing devtool onto eef6c56fbd3e798f0ffaabdc1d2e77aec9cddef5
WARNING: Command 'git rebase eef6c56fbd3e798f0ffaabdc1d2e77aec9cddef5' failed:
Auto-merging examples/tty_conv.c
CONFLICT (content): Merge conflict in examples/tty_conv.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/libpam
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libpam/libpam_1.6.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7377209226631453702==--

