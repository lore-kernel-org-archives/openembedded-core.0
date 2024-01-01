Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB76C48BF3
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:09 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.4583.1704114719298276857
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=O30FVT03;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BhopKZM5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018cc52706b3-6f7fb918-bbc1-407e-ae77-89fe92859532-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114718;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=erbsK5hf2PZUU9m06KRSMRait49j/tKzu9Lhldb9b3E=;
	b=O30FVT03GtUJ4NJtmcKt+Sc8aQ2hT6K9/NDEP5OMW20ijE/Ou6Zm7H712UtIT+4t
	EJabM8wb69OtsLBxJly4IJp5Yqe28n1sFUMl75arSzgAczni3hEmYeJZtGx5gjkjEkE
	ZZ13QMDnSqaZl9v508gbOWsCcgA+for48Km/gGhQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114718;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=erbsK5hf2PZUU9m06KRSMRait49j/tKzu9Lhldb9b3E=;
	b=BhopKZM5ej6ta+rUOjEpsFKKBTlyTbFJcI5yA8N6q8WQfJ0E61VuhwsUszUMK18l
	/FnihW7Pm+i7VltEXho4pnEseO1AQ3cjS4Bl1REJp0CjRtPhJytWG+oIHSeCzVJdEPZ
	fn/hGOG/aADwNXwYiWo91YoR76T/i0kLmnu9GGgI=
Content-Type: multipart/mixed; boundary="===============3891711512255628784=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 255.2 FAILED
Message-ID: <0101018cc52706b3-6f7fb918-bbc1-407e-ae77-89fe92859532-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:11:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193107

--===============3891711512255628784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *255.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd-boot failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1847 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-c33040fe73a450b3e6c9ba483d5b7e5e533f292b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c33040fe73a450b3e6c9ba483d5b7e5e533f292b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 2c9e1ae02a74bd5383065885941aa272bbe0d1f8
WARNING: Command 'git rebase 2c9e1ae02a74bd5383065885941aa272bbe0d1f8' failed:
Auto-merging src/hibernate-resume/hibernate-resume-generator.c
CONFLICT (content): Merge conflict in src/hibernate-resume/hibernate-resume-generator.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/systemd-boot
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemd-boot/systemd-boot_255.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3891711512255628784==--

