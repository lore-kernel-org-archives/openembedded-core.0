Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E0FC3ABA9
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:36 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.18047.1743511393838442158
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=RUc5Ch2J;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=bGIsi3tN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010195f160e786-455c74fb-aaab-4de2-a6f5-7744b36c3a43-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511414;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=h51TiUB63xqDYB0h4QDCFgllxCO6Hgr36p1P0FTooNY=;
	b=RUc5Ch2JFAIKmmR9WiXRH1nHoDH+rhea62UJLI+daqjZuMMHMOeY8aqagAWnU0bt
	vLPZXvN9ZSguxmkktEUx/cZD3+tMPkECexMjqu/j5iR3jXpHYYV5VkmyriX0oQQpd1l
	kf+FdOcjgoQJKCLNVbX9OUaWJLwOM0QFGuXgqd7E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511414;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=h51TiUB63xqDYB0h4QDCFgllxCO6Hgr36p1P0FTooNY=;
	b=bGIsi3tNel/JyWxMuzzVASkZ9YwsjbO2mqdisiTKXKtA0p9afB80x5IO4J89XyvM
	eGlQaNdHvLI3dQ2xmAvz4rwHJD+8qFwSLMApHE5SD4PR8VMnUPSFZNf+EfBTWuVcn/z
	an1H1xwWclsFgyiEgQjerg/cZ07hULe6+zhw0tm0=
Content-Type: multipart/mixed; boundary="===============0356100426094884503=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vte: upgrading to 0.80.0 FAILED
Message-ID: <01010195f160e786-455c74fb-aaab-4de2-a6f5-7744b36c3a43-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214123

--===============0356100426094884503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vte* to *0.80.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe vte failed.
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
workspace            = "tmp-auh-upgrades:d8613207831cd9227fb28ec77e8a49bc6b1cfaa9"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
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
workspace            = "tmp-auh-upgrades:d8613207831cd9227fb28ec77e8a49bc6b1cfaa9"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-tle9hlhv: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-xbubiizj/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-xbubiizj/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//vte/0.80/vte-0.80.0.tar.xz;name=archive...
INFO: Rebasing devtool onto ea9d2565595b21c6f08ce27bf85e0de28a48a1f2
WARNING: Command 'git rebase ea9d2565595b21c6f08ce27bf85e0de28a48a1f2' failed:
Auto-merging README.md
CONFLICT (content): Merge conflict in README.md

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/vte
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/vte/vte_0.80.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0356100426094884503==--

