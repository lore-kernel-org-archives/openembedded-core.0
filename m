Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B55C3DA46
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:25 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.1091.1714579214708476541
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fLM/0Y/F;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=bS005cq1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018f34e28df7-46cfe66c-8b71-432f-bc3c-b0c36bd871a7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579214;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TwCRhtZbsKIqgJSiRl4CMND4t/ockdJ6eghVWjWt+44=;
	b=fLM/0Y/Fm/177qr0cPK4HPxA9bOMI0jApjsL5fMj902qnVwObIQtSJZjaOVPjG1u
	6pRIEa9Sjg/MxlpiS9m/RRdQrm/hmsS6uvxFgfGiWreF0yeKvjhW5wls7dwOoYfdj/w
	J1fOJRpw1z/n2Kh0+B9TxY/tO6p2BYs47hxYVyT8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579214;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TwCRhtZbsKIqgJSiRl4CMND4t/ockdJ6eghVWjWt+44=;
	b=bS005cq1yeo5T1TZ2ORHt1GK8PGAg0hkHYi2kBixHpYGOIO4J5bSIOqEYM3o2okW
	mi/aUuTuuj998asncwnLQ7eHFoKZad05oje2APGpIYrgTSlCHWTgM+MGr35sbZQkg6Q
	ezW2osK1p7K1CsNYZYVKdTBjLjyMt44qgaKy1wMw=
Content-Type: multipart/mixed; boundary="===============3157100342472551625=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnu-efi: upgrading to 3.0.18 FAILED
Message-ID: <0101018f34e28df7-46cfe66c-8b71-432f-bc3c-b0c36bd871a7-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198800

--===============3157100342472551625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnu-efi* to *3.0.18* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gnu-efi failed.
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1876 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-aab1335523688531127ac964ad00131d8e721ab1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:aab1335523688531127ac964ad00131d8e721ab1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 14 Local 14 Mirrors 0 Missed 0 Current 16 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1876 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (919 cached, 2 parsed). 1877 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-aab1335523688531127ac964ad00131d8e721ab1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:aab1335523688531127ac964ad00131d8e721ab1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Creating workspace layer in /home/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://downloads.sourceforge.net/gnu-efi/files/gnu-efi-3.0.18.tar.bz2...
INFO: Rebasing devtool onto c0b502516844b27d24b0eecf7251f58d0eee32af
WARNING: Command 'git rebase c0b502516844b27d24b0eecf7251f58d0eee32af' failed:
Auto-merging Make.defaults
CONFLICT (content): Merge conflict in Make.defaults

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/gnu-efi
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/gnu-efi/gnu-efi_3.0.18.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3157100342472551625==--

