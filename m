Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D143C52D7D
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:25 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.75751.1722536828607117782
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=S9tV9Yzx;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=uWdpAiBo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101910f32450d-06035655-66e8-40d4-bc18-75a226758876-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536838;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nnoH9jKna75fEbXygoGgxlDfg4gB1i7AVNO+LRisuQo=;
	b=S9tV9YzxR04tDqZ0AOUPV040f5cgdMvH3C7X81P1N7TFjsXVM8eEnyYtGGRov7ue
	3Nmup2nTXX9abuV9zpMShxVneafBD6Hm0k4j9SEiT83DGZhgNhgEvllc10nDLPQDYGP
	LQ8JZT68ivC0f4IsZc4MKXGIufh7i5C8vLFTmlSQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536838;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nnoH9jKna75fEbXygoGgxlDfg4gB1i7AVNO+LRisuQo=;
	b=uWdpAiBohhhrz0qhdt65LwRKkEgfL2eU09WLb9MCVnXw04my51menq0//VZTiJGy
	p1wu3D+bt9IzsHzehpfmko3nIFF2caR6GvOU4ecF92P7cgzSZYtr8HA2xihy7TngYdF
	AfCQcFW3pkbNa6NsrUHEry0y6JJckitMItHWfqQQ=
Content-Type: multipart/mixed; boundary="===============6231848075422272336=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] nettle: upgrading to 3.10 FAILED
Message-ID: <010101910f32450d-06035655-66e8-40d4-bc18-75a226758876-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202880

--===============6231848075422272336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *nettle* to *3.10* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe nettle failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1883 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-7a51dda65b997ecc28b1b37d611b5e21292d3982"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7a51dda65b997ecc28b1b37d611b5e21292d3982"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1883 entries from dependency cache.
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
DISTRO_VERSION       = "5.0+snapshot-7a51dda65b997ecc28b1b37d611b5e21292d3982"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7a51dda65b997ecc28b1b37d611b5e21292d3982"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-ncwe7e42: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-fihhtw82/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-fihhtw82/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  53% |###################                 | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/nettle/nettle-3.10.tar.gz...
INFO: Rebasing devtool onto 064ced6154864acb2a8676aff8e4135c2e063105
WARNING: Command 'git rebase 064ced6154864acb2a8676aff8e4135c2e063105' failed:
Auto-merging Makefile.in
Auto-merging testsuite/Makefile.in
CONFLICT (content): Merge conflict in testsuite/Makefile.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/nettle
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/nettle/nettle_3.10.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6231848075422272336==--

