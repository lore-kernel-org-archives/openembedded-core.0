Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 995C1CAC581
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:31 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.89795.1756850186776840562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RaYmb9CJ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=L2nBwxyG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101990c6e6805-3088fdbe-ac17-4386-bf56-3b65017f50da-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850186;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HxHzK3tek/oGZg/RgimFfDhI0fnxPBrUyBqjFsqUOJY=;
	b=RaYmb9CJX/wgcqR4oP/RksmJOQjVay+ZrMphrWKKAlrJEolckJet6tza34cRuk3M
	GdCrujWuP7QM8LM88ESNmIhIe3hXNTTlGGHVRakFURd/HTJZ7t3o8ElnuQmRgPTumUk
	DHo7MQrDWicmgWPQX2NtfHIbYgRE2riqQpKWzv8M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850186;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HxHzK3tek/oGZg/RgimFfDhI0fnxPBrUyBqjFsqUOJY=;
	b=L2nBwxyGRZzS5DXMwoETbXJoOfU7izy3fsF6XHLx5+NYn1mukkFdp3SnPGykjl6v
	RyXXa8Si4+IvsCWHDry1o92QnwoYCP3SaPnZGjmorrsd4KabAY5OKkbWa1XB3hzu68o
	KhQDWaI9pz37+tG+lOdvdpR0NuUIXflZdxMvW1hA=
Content-Type: multipart/mixed; boundary="===============5588049034432522813=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ovmf: upgrading to edk2-stable202508 FAILED
Message-ID: <010101990c6e6805-3088fdbe-ac17-4386-bf56-3b65017f50da-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222768

--===============5588049034432522813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ovmf* to *edk2-stable202508* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe ovmf failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1940 entries from dependency cache.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-6cabbb27d79eb1722031a9b9142cd6d20df97174"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6cabbb27d79eb1722031a9b9142cd6d20df97174"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto d46aa46c8361194521391aa581593e556c707c6e
WARNING: Command 'git rebase d46aa46c8361194521391aa581593e556c707c6e' failed:
Auto-merging BaseTools/Conf/tools_def.template
CONFLICT (content): Merge conflict in BaseTools/Conf/tools_def.template

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool onto f4153a09f87cbb9c826d8fc12c74642bb2d879ea
INFO: Rebasing devtool onto 8c89224991adff88d53cd380f42a2baa36f91454
INFO: Rebasing devtool onto aea7aaf2abb04789f5868cbabec406ea43aa84bf
WARNING: Command 'git rebase aea7aaf2abb04789f5868cbabec406ea43aa84bf' failed:
Auto-merging crypto/threads_win.c
CONFLICT (content): Merge conflict in crypto/threads_win.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool onto f4153a09f87cbb9c826d8fc12c74642bb2d879ea
INFO: Rebasing devtool onto 4ef89209a239c1aea328cf13c05a2807e5c146d1
INFO: Rebasing devtool onto cfff805481bdea27f900c32698171286542b8d3c
INFO: Rebasing devtool onto 370b5944c046bab043dd8b133727b2135af7747a
INFO: Rebasing devtool onto e9ebfa7e77a6bee77df44e096b100e7131044059
INFO: Rebasing devtool onto 98ef964e1e9a0c39c7efb67143d3a13a819432e0
INFO: Rebasing devtool onto 1cc9cde3448cdd2e000886a26acf1caac2db7cf1
INFO: Rebasing devtool onto 86add13493e5c881d7e4ba77fb91c1f57752b3a4
INFO: Rebasing devtool onto 83d4e1ebef3588fae48b69a7352cc21801cb70bc
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/ovmf
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/ovmf/ovmf_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5588049034432522813==--

