Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA810C54E51
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:32 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.20163.1708018345245219721
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GbkRiePw;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=msWKwa0j;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018dadd3aa9a-74dea03b-5995-41d7-b3f4-fd761b67faee-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018346;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qs4ApXa5+4RR+tn9on9SLGljc5tP02L/yXdLEiv06Hg=;
	b=GbkRiePwTPaEpMTw+50FSl5ZGl3M1OKpMbH1UEy/KpL6Jz8H5fCGUNqcmY0PX/lM
	K9MRV2PXHrlTTgBvxyl5vzlzElWEOfbxEW0/NKH9tnLqkfkO11iJROZeJRs7itPRtvd
	A19ASsKsiIeRtSo63lRyoxf1Wg/UASMpkUeOJLsY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018346;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qs4ApXa5+4RR+tn9on9SLGljc5tP02L/yXdLEiv06Hg=;
	b=msWKwa0jeuijHX4DcKdT+3QtpnJn1o78R1+gka3j9CcGzoLKvJelPioiDXuyS1fg
	3nCJDPNvOYqQe2XbGadaWKwYJnRF4dU5DXajMlNB5PsioXmAzxMgrAqFqhsTYy2EUfW
	kGKHEXxtqKyTpt1ZCzSfil1edQk6lE7gl+lDS2Mw=
Content-Type: multipart/mixed; boundary="===============5417824024093858709=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtraceevent: upgrading to 1.8.2 FAILED
Message-ID: <0101018dadd3aa9a-74dea03b-5995-41d7-b3f4-fd761b67faee-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195651

--===============5417824024093858709==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libtraceevent* to *1.8.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libtraceevent failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1857 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-08a21abdc7184bc6c6a2c1aee479aac6e2cd148f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:08a21abdc7184bc6c6a2c1aee479aac6e2cd148f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 6f6d5802f31992e7527a4c32b43a32fda6bf6bdf
WARNING: Command 'git rebase 6f6d5802f31992e7527a4c32b43a32fda6bf6bdf' failed:
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build
Auto-merging meson_options.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/libtraceevent
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libtraceevent/libtraceevent_1.8.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5417824024093858709==--

