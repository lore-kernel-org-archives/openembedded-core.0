Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A918DC52D7C
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:25 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.75766.1722536838273290325
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=QCBQgzIW;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=38G/E3f4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101910f32410a-0ea8beec-3c8d-4d03-baaf-710ab50aa98a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536837;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KB1uCaNuzRPs4q87QUzakQ7V2gqQJ+LU3RrNf09blcs=;
	b=QCBQgzIWCER2FpfB5IRa0Dt/oeOTFpw8LBOiylI1DbJcjmBwel3JKUhslkaKj52c
	fAhZAa4LjM/EE5+OcDpDTzWlQ+I1AC+j38tF7VRyzo9eHXoNBfO1wUh1I/kUIQzrI7z
	AnLKwbM0X+PUHpeQMBu6p1CeJX95rcN8KWvalbwo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536837;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KB1uCaNuzRPs4q87QUzakQ7V2gqQJ+LU3RrNf09blcs=;
	b=38G/E3f4DaiFP0I3tMplBIamEEmB5AkQP+5Z405Vio9gfY5AIB7U5TZTsG0/NBHi
	pbbbNt+HkYPZF7e+0XpPhT2OEYqLox1nU4xraIaXI44l/qy8MaKpE2BumDSbheWR5tY
	33A6reEdnmcqa7Bgc6ex6+57gNKUbEFhV6byzt4g=
Content-Type: multipart/mixed; boundary="===============5704878976186199407=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libgpg-error: upgrading to 1.50 FAILED
Message-ID: <010101910f32410a-0ea8beec-3c8d-4d03-baaf-710ab50aa98a-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202877

--===============5704878976186199407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libgpg-error* to *1.50* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libgpg-error failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1884 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-7abcc988c8a1654e13f8c4a0a67519b3f58c6c1b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7abcc988c8a1654e13f8c4a0a67519b3f58c6c1b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
Loading cache...done.
Loaded 1884 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (919 cached, 2 parsed). 1884 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-7abcc988c8a1654e13f8c4a0a67519b3f58c6c1b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7abcc988c8a1654e13f8c4a0a67519b3f58c6c1b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-nxvdt8p0: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-jvh4tqof/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-jvh4tqof/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.50.tar.bz2...
INFO: Rebasing devtool onto 14df3a57b31c77a55e2aa317e36f51ce4331dca0
WARNING: Command 'git rebase 14df3a57b31c77a55e2aa317e36f51ce4331dca0' failed:
Auto-merging src/gpg-error.m4
CONFLICT (content): Merge conflict in src/gpg-error.m4

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/libgpg-error
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libgpg-error/libgpg-error_1.50.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5704878976186199407==--

