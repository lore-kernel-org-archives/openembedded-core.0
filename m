Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C5E5C61CE5
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:32:01 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.11050.1747312321005425656
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bYu5S2ql;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=e5qmGlDq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010196d3ee2002-95af52c0-2178-443b-84d4-e44585d601aa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312320;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gcLYUdkRiG8sUPFmuHG5HoaYuDJOYRu9SF/qNNm/a4k=;
	b=bYu5S2ql2vzPuoqDkIXHDA+Q9IUD5EvFSX70EB/FXH5GnlbXW8n/QJccX0aWjqxB
	7Tdr+dKVpjEkRg+rEqW2ctqE375muRiQrUQgpkAy96t4kG5XE9Qu/esSZi7+jt1Wvdc
	79o6xfc+CghHgaDY3e1s11uszNLe+k+hxQUv07No=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312320;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gcLYUdkRiG8sUPFmuHG5HoaYuDJOYRu9SF/qNNm/a4k=;
	b=e5qmGlDqihz/1OmONuKe+ZIk/kotocN6HbJT7U3zJwwektLsoMRuaQLzgx1S48Zn
	XhsC2HgNoPKtROLJuXYIqJINzwIlzPMnJefYVystpEnpZ59Mnwgq2mDVz7hKR9ZISdS
	n/y9dW31guUMEFJYtGYWOhngpXB7nJOh5n5k4mFU=
Content-Type: multipart/mixed; boundary="===============8029297888743568489=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] unfs3: upgrading to 0.11.0 FAILED
Message-ID: <01010196d3ee2002-95af52c0-2178-443b-84d4-e44585d601aa-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:32:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216632

--===============8029297888743568489==
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
Loaded 1916 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:8051a96396e33d85e5e22b8d92c1863f9f9366a3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
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
--===============8029297888743568489==--

