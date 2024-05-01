Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1233DC3065E
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:24 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.1102.1714579215790211765
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WOENfjFo;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=EJqvVXQI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018f34e2937c-8cd46f82-f51c-46b0-a11c-50b057adc1bd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579215;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ObLbb7RiOCDqTgtqsqGsm11CmCpYYuj/8FfOXlqU5Jk=;
	b=WOENfjFo17sFX0l0IV2X5OHUpTE55Su/qYSYSNWwPb4ivMgV7LZG9yCsFKhVhIEw
	JAg/gzqcWkGNmOCRNqiHdB4ErKRd7sgQ5/VMzBS53g65yo0JU3cQKT0Q/NC2p1JNfZJ
	VsUAQCTq+H1l4ByDgaAqORNGbkOjBY6WmpPkn6Ww=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579215;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ObLbb7RiOCDqTgtqsqGsm11CmCpYYuj/8FfOXlqU5Jk=;
	b=EJqvVXQIkbvdHJvW0UnBBAKoFyzZu1rhnQ6oMJZyupe6Qsf8UKmkzxJOOJgtXc9v
	Cek3lGRQm3X2dr0RnI6fyJY13P2ltwKH5htRwpYh9McuIRVCBJRcRuXHHkE8+mawaxL
	j7iGliTdZZQzu9alOUWPiOW3I4OOq2HDFY78MiHg=
Content-Type: multipart/mixed; boundary="===============7046575689275532592=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] quilt: upgrading to 0.68 FAILED
Message-ID: <0101018f34e2937c-8cd46f82-f51c-46b0-a11c-50b057adc1bd-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198811

--===============7046575689275532592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *quilt* to *0.68* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe quilt failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-c47fd8910af6c51a76bd83c739fa8e77d6202902"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c47fd8910af6c51a76bd83c739fa8e77d6202902"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1878 entries from dependency cache.
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
DISTRO_VERSION       = "5.0+snapshot-c47fd8910af6c51a76bd83c739fa8e77d6202902"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c47fd8910af6c51a76bd83c739fa8e77d6202902"

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
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.savannah.gnu.org/releases/quilt/quilt-0.68.tar.gz...
INFO: Rebasing devtool onto c1f56d93a9893d502ae4270fbd658cc2a150174c
WARNING: Command 'git rebase c1f56d93a9893d502ae4270fbd658cc2a150174c' failed:
Auto-merging quilt/scripts/patchfns.in
CONFLICT (content): Merge conflict in quilt/scripts/patchfns.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-target onto c1f56d93a9893d502ae4270fbd658cc2a150174c
WARNING: Command 'git rebase c1f56d93a9893d502ae4270fbd658cc2a150174c' failed:
Auto-merging quilt/scripts/patchfns.in
CONFLICT (content): Merge conflict in quilt/scripts/patchfns.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/quilt
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/quilt/quilt_0.68.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7046575689275532592==--

