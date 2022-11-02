Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E4DDC64E7E
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web08.879.1667349634272121238
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Fk98fPMF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018435c85a9e-90d61a6c-4d2b-40cf-a61c-e86cfeaef2d3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kT6iLCBiMaJYmHm91R8j0lTumONiJJB+YfUtDVE0NSs=;
	b=Fk98fPMFzBLDPVmlPismhUb4+Rwpyl+R+3YOmWVYMeDw2nlO2B8yXcab7gLXEPa/
	3MmwoxhCpMxgGhmigPfcbDYDjOzb4k9rrcMNMdQzUIoSpX0VKxiUqBczies91k43Ziy
	Q++pCEsJhIRGTDKsLxU9Mq5kKtDAcJZyvBRONZUI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kT6iLCBiMaJYmHm91R8j0lTumONiJJB+YfUtDVE0NSs=;
	b=eS7BI0Dg0+8vBAv5a6DlP/ahagnO1RVZVSbAJKKoBi6TMmy0Fj2C42mqyUWqxBIF
	oJWE3tZZaXEGMvM44sEGjEbqzDUaWXkVjbTThSz1eWiCzMc+SXD46So824LN/MFJbM2
	blkgBubJAv1sRZa6qZRIpGRNol9aXkCo4++TjTus=
Content-Type: multipart/mixed; boundary="===============0655561480823069603=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] swig: upgrading to 4.1.0 FAILED
Message-ID: <0101018435c85a9e-90d61a6c-4d2b-40cf-a61c-e86cfeaef2d3-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172447

--===============0655561480823069603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *swig* to *4.1.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe swig failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1664 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:86bfb58317f96d91ce159a76a8e8d77720ca2a19"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1664 entries from dependency cache.
Parsing recipes...done.
Parsing of 887 .bb files complete (885 cached, 2 parsed). 1665 targets, 35 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:86bfb58317f96d91ce159a76a8e8d77720ca2a19"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   6% |##                                  | ETA:  0:00:01
Adding changed files:  12% |####                                | ETA:  0:00:01
Adding changed files:  18% |######                              | ETA:  0:00:01
Adding changed files:  24% |########                            | ETA:  0:00:01
Adding changed files:  31% |###########                         | ETA:  0:00:01
Adding changed files:  37% |#############                       | ETA:  0:00:01
Adding changed files:  43% |###############                     | ETA:  0:00:00
Adding changed files:  49% |#################                   | ETA:  0:00:00
Adding changed files:  56% |####################                | ETA:  0:00:00
Adding changed files:  62% |######################              | ETA:  0:00:00
Adding changed files:  68% |########################            | ETA:  0:00:00
Adding changed files:  74% |##########################          | ETA:  0:00:00
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files:  87% |###############################     | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://downloads.sourceforge.net/swig/swig-4.1.0.tar.gz...
INFO: Rebasing devtool onto 5732f286ba3b2d8ca4a0518afe08e6496566290c
WARNING: Command 'git rebase 5732f286ba3b2d8ca4a0518afe08e6496566290c' failed:
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/swig
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/swig/swig_4.1.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0655561480823069603==--

