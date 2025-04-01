Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2809C369A1
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:12 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.18034.1743511384586739636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=iRiS0pJL;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=RRVCcT+O;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010195f16087b3-db78261f-9458-496a-9459-c6fa17967c66-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511390;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=A06yjCP89MfO04yblnRxM0+PWsfJZLzpU6sxhd26DOw=;
	b=iRiS0pJL/fjl9eDuVlsFWddK3izpn7K6w1+EcRUF8WWtygfAvUkYZ0iBNE66PYSO
	mHAxhJCXCd3XfJyRYviLgDinMpeCHgYbjQ47gujZ1okUlxX//a8n0N0E7JBekPYPBo+
	q13sWOymdNNJRxbMYAu6oWeoANz7cyJ5DuIkwLAQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511390;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=A06yjCP89MfO04yblnRxM0+PWsfJZLzpU6sxhd26DOw=;
	b=RRVCcT+OZ/l1MsSeWAvVs/bX+Og0cgFvWwikRgB8+lk2MUJ5YyWUCBWK12vnayjT
	0WfFdmV5OrBhVozdBAjv4/daVbtR5aQe5DNASvGt55CKeEz0oCooemEI9FZrckwRM3G
	obcg7qTaHLCqju3sfk9fCZKOgdB5Kq8g1fXHrRBg=
Content-Type: multipart/mixed; boundary="===============5842993588170534289=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] kea: upgrading to 2.6.2 FAILED
Message-ID: <01010195f16087b3-db78261f-9458-496a-9459-c6fa17967c66-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214033

--===============5842993588170534289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *kea* to *2.6.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe kea failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1886 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1e3e0c0c08590c5a219e81ca89f2841d8ce56ad8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 925 .bb files complete (0 cached, 925 parsed). 1887 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1e3e0c0c08590c5a219e81ca89f2841d8ce56ad8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-l7t5xk6r: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-bhng1z16/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-bhng1z16/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  84% |##############################      | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching http://ftp.isc.org/isc/kea/2.6.2/kea-2.6.2.tar.gz...
INFO: Rebasing devtool onto df7481ef089731551d4de68c01335d713784ae46
WARNING: Command 'git rebase df7481ef089731551d4de68c01335d713784ae46' failed:
Auto-merging src/lib/dhcp/pkt_filter_lpf.cc
CONFLICT (content): Merge conflict in src/lib/dhcp/pkt_filter_lpf.cc

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/kea
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/kea/kea_2.6.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5842993588170534289==--

