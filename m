Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9227DD6205D
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:42 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.4679.1731964633083259581
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=IJLcKeTH;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=2+2OnGjy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019341235b08-2eeb495f-b3dd-4d35-b949-f2b9463379f5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964656;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ul2lSj2zQCdauCXwtXajFPfTLaGnWA9ESVWF0wPg8/U=;
	b=IJLcKeTHQHjkvCsMOdF/pzZfXyvQjODw/aIN4qrrIsdnaNOKF1E5R5kHqlSxn/I7
	pAgPLbdaCzp6jX+d1KC8twnKFWZBIUQjiBElTXHGHJnfzRduS30jhMj1LQIlR9zT0BW
	MkmQRbr3hg9Z8Kl+Dk76pJ9ou8Krsm1ei2RMn2BU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964656;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ul2lSj2zQCdauCXwtXajFPfTLaGnWA9ESVWF0wPg8/U=;
	b=2+2OnGjyYZUOSIuXebImEkj3cxEphTB5G1E3Q1+MqJlMVatSMYPjLrAlKoIMa4hw
	NK/LIg9287lzW9zZXnCxKSiFFBjEqa+773tcCG/i0sCW3Hgt5t33XYh+OIb5EEPdYog
	+uwvCjyL7kXfL7OzIZj3TiSyDlIpmqV82SW6hPLQ=
Content-Type: multipart/mixed; boundary="===============7218293575261041506=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] texinfo: upgrading to 7.1.1 FAILED
Message-ID: <0101019341235b08-2eeb495f-b3dd-4d35-b949-f2b9463379f5-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207317

--===============7218293575261041506==
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
Loaded 1880 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:e7a95121ebe87f7ca423557ac78821ef15f42b65"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 13 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1881 targets, 41 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:e7a95121ebe87f7ca423557ac78821ef15f42b65"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-xy55xy7q: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-ktkl_6kd/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-ktkl_6kd/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 12 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  11% |###                                 | ETA:  0:00:11
Adding changed files:  22% |#######                             | ETA:  0:00:07
Adding changed files:  33% |###########                         | ETA:  0:00:05
Adding changed files:  44% |###############                     | ETA:  0:00:04
Adding changed files:  55% |###################                 | ETA:  0:00:03
Adding changed files:  66% |#######################             | ETA:  0:00:02
Adding changed files:  77% |###########################         | ETA:  0:00:01
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:06
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/texinfo/texinfo-7.1.1.tar.gz...
INFO: Rebasing devtool onto 831d7bfb8b4f58d36e824d1ebe0705cc8da9cc0d
WARNING: Command 'git rebase 831d7bfb8b4f58d36e824d1ebe0705cc8da9cc0d' failed:
Auto-merging doc/Makefile.am
Auto-merging man/Makefile.am
CONFLICT (content): Merge conflict in man/Makefile.am

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/texinfo
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/texinfo/texinfo_7.1.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7218293575261041506==--

