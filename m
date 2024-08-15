Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A191C54FB3
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:07 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.131418.1723748333857409325
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=D6CcbC4F;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=3OHhnOxJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010191576836de-06e6abd1-0291-4b27-9457-fe7a4dd6b9bd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EtU4NxBDEgBJ5mMFfWpqqML+sW+NeJ35Clzgxn6vWzA=;
	b=D6CcbC4FMYeLJcc1rw3jnk3WIcb+GE5ak2f8LuinG/mSgECq/P2C5fOg0QE6CJi5
	qV4gqnTvPx9Y2PaLzwsAYhk4Rt8w97KOYgFlJXpzMXojbwFYmCsa7Ibml/Z+38T2FV4
	ltBA/N4JL0hi99/U0kMIbRCGZDdzQG079aK5XHxA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EtU4NxBDEgBJ5mMFfWpqqML+sW+NeJ35Clzgxn6vWzA=;
	b=3OHhnOxJbJQKQIiO77nMBE6I4LJbcFKYAAVZI5XlJiwk9obgYnuE70GhsWJh+lu2
	0AUqIURa5b7sjSwYbGeceOIZKZRhc2bQEocPwh/iflLLH+ck/MnFC16rY39R86mexaE
	qxm6IPjLrDiNwyKAxpqO2THuj8Mj5gBouBYQkUO0=
Content-Type: multipart/mixed; boundary="===============1501761335589941291=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] readline: upgrading to 8.2.13 FAILED
Message-ID: <01010191576836de-06e6abd1-0291-4b27-9457-fe7a4dd6b9bd-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203349

--===============1501761335589941291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *readline* to *8.2.13* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe readline failed.
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
DISTRO_VERSION       = "5.0+snapshot-bd1554724192514492fb823fb13031ce8e2d53f6"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:bd1554724192514492fb823fb13031ce8e2d53f6"

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
DISTRO_VERSION       = "5.0+snapshot-bd1554724192514492fb823fb13031ce8e2d53f6"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:bd1554724192514492fb823fb13031ce8e2d53f6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-3wk2udaj: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-gi7gudh1/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-gi7gudh1/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/readline/readline-8.2.13.tar.gz;name=archive...
INFO: Rebasing devtool onto 92bb3c70b5a9017a8b5f36b3f109abe22f049ff2
WARNING: Command 'git rebase 92bb3c70b5a9017a8b5f36b3f109abe22f049ff2' failed:
Auto-merging patchlevel
CONFLICT (content): Merge conflict in patchlevel

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 92bb3c70b5a9017a8b5f36b3f109abe22f049ff2
WARNING: Command 'git rebase 92bb3c70b5a9017a8b5f36b3f109abe22f049ff2' failed:
Auto-merging patchlevel
CONFLICT (content): Merge conflict in patchlevel

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/readline
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/readline/readline_8.2.13.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1501761335589941291==--

