Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6308EC3ABA2
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:36 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.18075.1743511396844481230
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ZieEgkDB;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ihL4VEfS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010195f160c14a-5eeb0c51-49bd-49f3-83ab-6ee89cea7340-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511404;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xREWevBRMTiMK8qL7mdNXY4N21NslyaxEMjdyjYMpe8=;
	b=ZieEgkDBSnqWRfrfsenevzNHjcKpoXKe+8z9CzOgxMraKKP6bLygKmkMh/S2dYoJ
	fbBk16wvrUf+epPRDniRtaoL3x00L4OEjrNXIcT71YZH1FCgQC9p9aYbcu84F5GRYcU
	nEBwInc0Fa0vxcL9pH4ypASPoEJeDbHQpaJB0wGU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511404;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xREWevBRMTiMK8qL7mdNXY4N21NslyaxEMjdyjYMpe8=;
	b=ihL4VEfSHy2dOdepEOy+Ev716p9dACPUK91BZb18277kThFbzxf+h0kcytDB/GKv
	e+g11B6e3Lft4j6CubekfoCMoa/3pAbmhDDNLq12EE7Y026BOxpZ5op+Ch2l10oUnif
	xotVJYTCzZ4fNavUIsHXwchIH9g57wPO0GgYjxG8=
Content-Type: multipart/mixed; boundary="===============4006820960524596924=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] which: upgrading to 2.23 FAILED
Message-ID: <01010195f160c14a-5eeb0c51-49bd-49f3-83ab-6ee89cea7340-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214088

--===============4006820960524596924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *which* to *2.23* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe which failed.
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
workspace            = "tmp-auh-upgrades:bde12cdb0488a11ca12e34831c5bb566bfc59835"

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
workspace            = "tmp-auh-upgrades:bde12cdb0488a11ca12e34831c5bb566bfc59835"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-ncqbxp39: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-4jalpy8_/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-4jalpy8_/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/which/which-2.23.tar.gz...
INFO: Rebasing devtool onto f0c617b7c4e405668149958e4cb2d15452077f70
WARNING: Command 'git rebase f0c617b7c4e405668149958e4cb2d15452077f70' failed:
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/which
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/which/which_2.23.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4006820960524596924==--

