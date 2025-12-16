Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1594D5B87C
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:23 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17390.1765872134595423694
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=tNxb2/WG;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Kn1HHHCZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019b262e6588-f2f4f4d3-b978-4d17-8436-dbdf7ec152f3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872134;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PVaX8FzpERlkrjZ2tY8iivptOcAZbrW9WXfdgcrISqE=;
	b=tNxb2/WGT5+d+uLwJiHDJvrSCrUxZoXSFq5wcIDtlmO9gt1/M03q3UMFbFNLq0e4
	dype41MU1pOXxiMBH/xJn5FYYWxFWkOdJDORoXmBYm5dc1YINC1TJDOi1OhXbpqxAT3
	ucnOGEsTaRwvXJdW6XWLs96/uVakG50ZnmBgGeuA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872134;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PVaX8FzpERlkrjZ2tY8iivptOcAZbrW9WXfdgcrISqE=;
	b=Kn1HHHCZfsMp8d5J+rRrxXHFezkdFLnpkHbqgj9t6AbbiZCoTAwWBIHekfKq9893
	63wQLDoeNQsr2IF8hkPvrVe7Wo6TrDgE12WgWqMh3HEA2BSERMtweHqTyQyWtKN8HCA
	FQhYG4/w35zsHkj3pXG/cjZbFer6fRv53HPiPqAg=
Content-Type: multipart/mixed; boundary="===============6100057133567109104=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnu-efi: upgrading to 4.0.4 FAILED
Message-ID: <0101019b262e6588-f2f4f4d3-b978-4d17-8436-dbdf7ec152f3-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227774

--===============6100057133567109104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gnu-efi* to *4.0.4* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gnu-efi failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1950 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-a16190c58c67286fbb4f04f9f5dadb348eeaf330"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:a16190c58c67286fbb4f04f9f5dadb348eeaf330"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 37cd8f069bde6715eebdc5e38a8f15ee6de5edcf
WARNING: Command 'git rebase 37cd8f069bde6715eebdc5e38a8f15ee6de5edcf' failed:
Auto-merging Make.defaults
CONFLICT (content): Merge conflict in Make.defaults

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/gnu-efi
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/gnu-efi/gnu-efi_4.0.4.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6100057133567109104==--

