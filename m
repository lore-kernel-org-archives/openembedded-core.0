Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879CAC54ED1
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:57 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.1786.1746113615645740914
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=GXKPlpAn;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=XAfmnuCs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101968c7b83e2-9d59f4bc-b89f-4f3e-9458-948d1f67d7e4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113627;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZlIz5ASJxx18mmL+sAWOOydacrgufjJJTA6Xp6aNBOI=;
	b=GXKPlpAn6DN3/E149GMPCMCDv/q+nLM+a5coDHmHqmdZrCQOi0yP5MuN9JiKTcwF
	YWFPjjQRhoe4gBN8qAe+caLyFDKLqEUSlD5d6xaPZKB/sBMVvDDpj7RCev4TWgLW+oB
	rf0DfdwtzbvCOyxM9LPX+EoTVMhy3ODFw8m2nY6w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113627;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZlIz5ASJxx18mmL+sAWOOydacrgufjJJTA6Xp6aNBOI=;
	b=XAfmnuCs+02YGdoecsVgzpJSwDxIUT3G0RrPcXEcdLxJWNJQFCgKfu8i0VkV3+3b
	/EsYR1XadxBYGfcvg89Ps1hpu+m1nVg8h0+dVsPWvJ0vkcZSdUloQPkP9BABvP+j0oU
	zLKrJLLmMk3P56hK9UtXYOYDQpWPbWhuiAcyfGdU=
Content-Type: multipart/mixed; boundary="===============1694727129403371359=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] unfs3: upgrading to 0.11.0 FAILED
Message-ID: <010101968c7b83e2-9d59f4bc-b89f-4f3e-9458-948d1f67d7e4-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215843

--===============1694727129403371359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *unfs3* to *0.11.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe unfs3 failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1897 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:79e462eeb5e9f6cf844d9f4166317e3c80ab6f64"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto ec1660ba33c80d5c67131e163e68834c1a10e243
WARNING: Command 'git rebase ec1660ba33c80d5c67131e163e68834c1a10e243' failed:
Auto-merging daemon.c
CONFLICT (content): Merge conflict in daemon.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/unfs3
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/unfs3/unfs3_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1694727129403371359==--

