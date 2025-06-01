Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D5BC8303D
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:58 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.27775.1748786129144655672
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=prKHugqc;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=id5xuP0G;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101972bc6ed1d-c58b6f1f-7d90-4f07-8745-73bdc3ae6f47-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=U2BOJ72b/p/VlS2P7njzD/zMoDtk8IV151wXdGFoGcU=;
	b=prKHugqcLVn2Yl2lQIo8dEOTWIr0xyfoMaNTVSI5MopZU2TdKlMxhfp4fTHaFaJn
	MFISk+vNhh1h4DOq6qbackQjXozTOUoU/xwNmUeMWCdndn7dATotQNVk5tBXPbVDSFr
	AcHdbIGKWC2kCNDUvN2pKFDSmKnL7wwhOOIgYXxk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=U2BOJ72b/p/VlS2P7njzD/zMoDtk8IV151wXdGFoGcU=;
	b=id5xuP0Gkbf1LZ+cza3xvGwJp4/r2d7B/s0q6K1fQ5UXP60i08v1u2BTkz8/2h5v
	gN25FGosb0Pph2bTiLzlgr0pnq1lg6kZnWXTPRKdE3iLTDCYoxfkhOfDJWKWDA4cPNg
	x9EHXt4Xw6UUXirws+94EBsNYaH6+UgbUoWDqvvs=
Content-Type: multipart/mixed; boundary="===============8567505843260224035=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libsecret: upgrading to 0.21.7 FAILED
Message-ID: <010101972bc6ed1d-c58b6f1f-7d90-4f07-8745-73bdc3ae6f47-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217640

--===============8567505843260224035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libsecret* to *0.21.7* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libsecret failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1915 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:d2b2b4b8c25964aa7c1bfa9e184da671eaa41832"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 8 Local 8 Mirrors 0 Missed 0 Current 25 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (0 cached, 937 parsed). 1916 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:d2b2b4b8c25964aa7c1bfa9e184da671eaa41832"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 9 Local 8 Mirrors 0 Missed 1 Current 19 (88% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-fo2vqeov: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-dwghhchy/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-dwghhchy/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//libsecret/0.21/libsecret-0.21.7.tar.xz;name=archive...
INFO: Rebasing devtool onto abfee0c13d635f9933b5d756a2bb49b47e2f6ecc
WARNING: Command 'git rebase abfee0c13d635f9933b5d756a2bb49b47e2f6ecc' failed:
Auto-merging meson_options.txt
CONFLICT (content): Merge conflict in meson_options.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libsecret
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libsecret/libsecret_0.21.7.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8567505843260224035==--

