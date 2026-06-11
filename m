Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD34CD98DB
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:38 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50601.1781195492677805375
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cPM9c6an;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Vm4w6snJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019eb78649bf-442d1332-481d-436c-9b9f-c71ef746abf2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195491;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KUXzzDCOKXlZPhRc9aJv+nneADErL9Qcs4HQ/2OR1UU=;
	b=cPM9c6an/K5dSZtq8a7eDYDguuUAasHxc8SrxD3rESKEh3pXM5fBYh6tXh3yY1k/
	xcoGkQDe+voOfIRRIWolj/JRxQ6Aqi0ZgRy0k+S/sdOABILR66NAr0bOJpGGfmLJ1Ls
	Au3+pa6KWJFdYk6g+XoT5IwOZcpZkVrmm8hVJphg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195491;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KUXzzDCOKXlZPhRc9aJv+nneADErL9Qcs4HQ/2OR1UU=;
	b=Vm4w6snJiChCAj8icYd7pl6Krtgi+lPTTbbsRRIlkuhWYIG81fXdI3Fyz5UbeJ9b
	n9N8ko6WzEHh5JL4V/jMmrOd/wZBkexqVBg6wbLwOhSMEONvCBHHbgDp+wwa1zz8V1j
	xKU+NITbES7gsSw/st6qGot0wBiG5Gl8oBEOgk6o=
Content-Type: multipart/mixed; boundary="===============4504584977480986413=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Viswanath Kraleti <quic_vkraleti@quicinc.com>, 
	Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>, 
	Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 systemd-boot-native,systemd,systemd-systemctl-native,systemd-boot: upgrading
 to 260.2,260.2,260.2,260.2 FAILED
Message-ID: <0101019eb78649bf-442d1332-481d-436c-9b9f-c71ef746abf2-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238453

--===============4504584977480986413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *systemd-boot-native,systemd,systemd-systemctl-native,systemd-boot* to *260.2,260.2,260.2,260.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd-boot-native failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1980 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-c1e1370f75c4e0f6bccbf2fc7b903c41784dcad0"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:c1e1370f75c4e0f6bccbf2fc7b903c41784dcad0"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
done.
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto f1d0952a125b96b7ab2f1ff29a87448ade8ac29b
WARNING: Command 'git rebase f1d0952a125b96b7ab2f1ff29a87448ade8ac29b' failed:
Auto-merging .semaphore/semaphore-runner.sh
CONFLICT (content): Merge conflict in .semaphore/semaphore-runner.sh

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/systemd-boot-native
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemd-boot-native/systemd-boot-native_260.2.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/systemd-boot-native.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4504584977480986413==--

