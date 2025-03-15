Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9934C35FF8
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:19 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.10333.1742048296258035835
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=LijVigeb;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=sAhWwwB6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101959a2b7ae5-fe62b6ff-f3b4-4e39-a4dd-0940196bc604-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048295;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fJXcXPAfmVEa4aHXRcUKqvmVa/Zng2qE10rSCoAHjxQ=;
	b=LijVigebMZq1sf2X7FlEeErZj2jeQgXVAQmPiyxZTFWk/UerU0hCgB3U0QVYp6LT
	P/HCeM4feB/AEAVfhHSRxoAA41pvKvbFK3+kSLVi2mWW2Zm8na4bEB1zjC+A20rlm/7
	Z74fUW+s7yrtuWRnU3R0jLMOpafwMEoZijeJXUwY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048295;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fJXcXPAfmVEa4aHXRcUKqvmVa/Zng2qE10rSCoAHjxQ=;
	b=sAhWwwB6d+CUy01gb3t5oVW10kj2wJg0riHHApe3Md7lYOreVBR3K/gG7QIm1dEj
	IipY1oSZZhoQTg7L+DgaZozl5usVb1scb3wkZ63USaLuVGPwTjiO+LNv+KHRGI0Jz86
	eUwvei5zAZRdigagK8NhpnMCJ+vrzgGyhJiZK/V0=
Content-Type: multipart/mixed; boundary="===============0071653967019723353=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libdnf: upgrading to 0.74.0 FAILED
Message-ID: <010101959a2b7ae5-fe62b6ff-f3b4-4e39-a4dd-0940196bc604-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212897

--===============0071653967019723353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libdnf* to *0.74.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libdnf failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1884 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:80d7b4838c47982c1243d6fa73bfb88fa7d6b4d1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 91a0bf9aada36a722855051526f012e0b5ab1af9
WARNING: Command 'git rebase 91a0bf9aada36a722855051526f012e0b5ab1af9' failed:
Auto-merging CMakeLists.txt
CONFLICT (content): Merge conflict in CMakeLists.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libdnf
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libdnf/libdnf_0.74.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0071653967019723353==--

