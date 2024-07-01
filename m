Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0ABC3DA7F
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:58:00 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.2110.1719853076159252471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=j+cWtSgc;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=sNptqOe/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101906f3b4bb9-2eccb079-5184-4950-84dc-d6101c27b816-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853075;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nonqOYGzvq4WRwOhWK1KiTN+MTOmEIGUkzPnUQgKtfM=;
	b=j+cWtSgcIQG+4qg8RxdRU7IQApjAPuzwZJYYkti+Bqh6/JB55Q4+U9lu6NJbZl+w
	xN0yKPKmAevnAxCiKP+W/01XNNtuwRcRRNh4Kj0X1UPyyJBH4uu6zfPg0wE1OMerAYF
	H2XDdSAwTEGdSkx7E6O3UWs4XbXfsi14p4URYPOw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853075;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nonqOYGzvq4WRwOhWK1KiTN+MTOmEIGUkzPnUQgKtfM=;
	b=sNptqOe/pJ0hKMhsEZt7IyN5y4FrtQKO8LTLy7psc4KU0ac6wNbeR6mKYM3CbnFn
	lOVKu/laJ6CHVuZDi0zfMJ+5IauJwWv6O8iUAxDFm3SVLeH+Di23d9JoMxuctXTvUYU
	LcEuWTDXEHGHhfnKJyhdsOtKcKCMOuWmWfrI+GR0=
Content-Type: multipart/mixed; boundary="===============9070567789218884117=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] perl: upgrading to 5.40.0 FAILED
Message-ID: <010101906f3b4bb9-2eccb079-5184-4950-84dc-d6101c27b816-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201335

--===============9070567789218884117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *perl* to *5.40.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe perl failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-ca2824161ea8a23479dc9c6d1d39732c1b4974b7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ca2824161ea8a23479dc9c6d1d39732c1b4974b7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
Loading cache...done.
Loaded 1878 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (917 cached, 2 parsed). 1879 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-ca2824161ea8a23479dc9c6d1d39732c1b4974b7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ca2824161ea8a23479dc9c6d1d39732c1b4974b7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-cnmj8yel: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-6hb4nwma/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-6hb4nwma/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   6% |##                                  | ETA:  0:00:02
Adding changed files:  13% |####                                | ETA:  0:00:01
Adding changed files:  20% |#######                             | ETA:  0:00:01
Adding changed files:  27% |#########                           | ETA:  0:00:01
Adding changed files:  33% |############                        | ETA:  0:00:01
Adding changed files:  40% |##############                      | ETA:  0:00:01
Adding changed files:  47% |#################                   | ETA:  0:00:00
Adding changed files:  54% |###################                 | ETA:  0:00:00
Adding changed files:  60% |#####################               | ETA:  0:00:00
Adding changed files:  67% |########################            | ETA:  0:00:00
Adding changed files:  74% |##########################          | ETA:  0:00:00
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://www.cpan.org/src/5.0/perl-5.40.0.tar.gz;name=perl...
INFO: Rebasing devtool onto 80212c3f9839921a24dc8a61101d5a69e972e569
WARNING: Command 'git rebase 80212c3f9839921a24dc8a61101d5a69e972e569' failed:
Auto-merging ext/Errno/Errno_pm.PL
CONFLICT (content): Merge conflict in ext/Errno/Errno_pm.PL

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 80212c3f9839921a24dc8a61101d5a69e972e569
WARNING: Command 'git rebase 80212c3f9839921a24dc8a61101d5a69e972e569' failed:
Auto-merging ext/Errno/Errno_pm.PL
CONFLICT (content): Merge conflict in ext/Errno/Errno_pm.PL

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-target onto 80212c3f9839921a24dc8a61101d5a69e972e569
WARNING: Command 'git rebase 80212c3f9839921a24dc8a61101d5a69e972e569' failed:
Auto-merging ext/Errno/Errno_pm.PL
CONFLICT (content): Merge conflict in ext/Errno/Errno_pm.PL

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/perl
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/perl/perl_5.40.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9070567789218884117==--

