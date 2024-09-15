Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3291FC3601A
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:21 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.115393.1726410840756965070
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=EXzoCeAc;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=uzbi7Lkn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010191f61adb5b-458eb472-4ce6-4374-bcc0-84577de5d8e3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aJTrKFnMS6+2TCVAyTsP/n+Vdt8hWk4rMNSQgeeQOO8=;
	b=EXzoCeAc0SNPO+iz7Twrxk71GZn9q5qY0C/jGOU808JGESOMtj1PBSQhWPhbcNok
	aCHZyMlk420u40GgJ44lPNEhbE/zMctAnbwDi4pPbr6lMCwpurph/T9JQ5vjW77XC4W
	SeSy3t0qwUg2t4TbqMqbQASe3Tp0TKlSV2u8Q09w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aJTrKFnMS6+2TCVAyTsP/n+Vdt8hWk4rMNSQgeeQOO8=;
	b=uzbi7Lkn5YpG4aJmZBfUxeZ25e7e/X0kOreTCxhS84Xe5FPE5qw2y2S78R0SiV9M
	55E+YTG0ImQHLzzEFVxdmOfPvloKROdIlc953I4T4sXN97FwM6hNaAZbZaHSg0hIMsy
	mpZDuCUPByhiFSMvyqdLXxqGzB6jcqavtN3G0OXU=
Content-Type: multipart/mixed; boundary="===============6212146854737625413=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] texinfo: upgrading to 7.1.1 FAILED
Message-ID: <01010191f61adb5b-458eb472-4ce6-4374-bcc0-84577de5d8e3-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204540

--===============6212146854737625413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *texinfo* to *7.1.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe texinfo failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1867 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-c3bb086143dac36886c43a02ae2743b91c57ac22"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c3bb086143dac36886c43a02ae2743b91c57ac22"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (0 cached, 917 parsed). 1868 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-c3bb086143dac36886c43a02ae2743b91c57ac22"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c3bb086143dac36886c43a02ae2743b91c57ac22"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-vaj393fm: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-c5axeut2/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-c5axeut2/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  11% |###                                 | ETA:  0:00:01
Adding changed files:  22% |#######                             | ETA:  0:00:01
Adding changed files:  33% |###########                         | ETA:  0:00:00
Adding changed files:  44% |###############                     | ETA:  0:00:00
Adding changed files:  55% |###################                 | ETA:  0:00:00
Adding changed files:  66% |#######################             | ETA:  0:00:00
Adding changed files:  77% |###########################         | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/texinfo/texinfo-7.1.1.tar.gz...
INFO: Rebasing devtool onto c011ef05842e90e71f874f13273f0ac22252c21e
WARNING: Command 'git rebase c011ef05842e90e71f874f13273f0ac22252c21e' failed:
Auto-merging doc/Makefile.am
Auto-merging man/Makefile.am
CONFLICT (content): Merge conflict in man/Makefile.am

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/texinfo
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/texinfo/texinfo_7.1.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6212146854737625413==--

