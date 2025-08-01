Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06BC1C87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:00 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.88809.1754057270484144697
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nZzZoXcb;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=WBqDsG+d;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019865f5e426-d0ce9672-3f37-4ede-8006-c5593a4bf600-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057270;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Q7imiND3qOxrrWGx6Je//tS3GOfCKAg9Wc9F3nD/IHA=;
	b=nZzZoXcblyU7ReJ3uusPTsemGQIjhM5lB21lRKRGXLsEGTGPGWY0mZzo+uqr3ksE
	IwQD/enOLDIvex2BzlURsiHkvJheQgqNnEADu1JgHK3NDNv5Q1oYN90rZryzAfJEDmA
	EosLvQImjbtj1rBjSOipr/Se+PzX8LyBiMR/L4nI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057270;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Q7imiND3qOxrrWGx6Je//tS3GOfCKAg9Wc9F3nD/IHA=;
	b=WBqDsG+dhhRmW6GZjx4GR8pUG6xK1WucqkviOA0OahYEEmwAWEwQJ3YcI6jLzoMy
	197CEcOybFW4gbDKSvF8+4+bVdeqA6/OmX8V5EWiJvHFg7p+/sXqCNGX5/OZ4e6+MjK
	lWVB7fMx5sWT96+erGDw4rRXc9PiomkjJa3sIbN8=
Content-Type: multipart/mixed; boundary="===============3679833303646955983=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librepo: upgrading to 1.20.0 FAILED
Message-ID: <0101019865f5e426-d0ce9672-3f37-4ede-8006-c5593a4bf600-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221269

--===============3679833303646955983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *librepo* to *1.20.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe librepo failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1933 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-59a59f3bbd4cf3d0ed310c67850f8ebf58b83b43"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:59a59f3bbd4cf3d0ed310c67850f8ebf58b83b43"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 9 Local 9 Mirrors 0 Missed 0 Current 21 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 363cb70c6548be900832bc9b18ced3e7569da15a
WARNING: Command 'git rebase 363cb70c6548be900832bc9b18ced3e7569da15a' failed:
Auto-merging CMakeLists.txt
CONFLICT (content): Merge conflict in CMakeLists.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/librepo
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/librepo/librepo_1.20.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3679833303646955983==--

