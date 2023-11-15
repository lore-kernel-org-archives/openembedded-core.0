Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D21C54F9E
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:13 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.14628.1700059030659166669
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=L9Tjoxsl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=m4y5R1Ds;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018bd36a2551-419e9bb6-c495-484f-b789-de34353d192e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=v8yXGgXagtjfXDMuPsKxpk38mf8Ewrnj0aKsphdqQjY=;
	b=L9Tjoxsl1scImXL7bzZ4UOJ4hGxT/5ax6Nyy2T7bIgY+P4oCT5J5tq8ptODHF8IO
	02mFYIag0QwytDDgSJavTG5BMH0EKUSfh5H/IsV5ugW98NueloED1mhgb8dC6MNEqau
	x+FMq8L/BIOduCp5wi7DDQtRbmbDiWHcu3HMgo6c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=v8yXGgXagtjfXDMuPsKxpk38mf8Ewrnj0aKsphdqQjY=;
	b=m4y5R1DsIDXKXEQqH/oYBJMyc4sMW/CorXAx0NtMSO6tBhk05nzip7Z6ZekBYfTD
	aqMd6Ct4ZRGvKYqgb3k009XT0VADLh1KZ7wjzUNjnQ4vtuTQtTk6LaaU3smesoqaApe
	fRDPbsv9eeGSIOteEEYroQirufhR3ZuG3UB9U4So=
Content-Type: multipart/mixed; boundary="===============8944208462162893399=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-bootchart: upgrading to 235 FAILED
Message-ID: <0101018bd36a2551-419e9bb6-c495-484f-b789-de34353d192e-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190649

--===============8944208462162893399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-bootchart* to *235* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd-bootchart failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1848 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-5ee7ada6287a8b28dccf1ecf13d376f5a08e2657"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:5ee7ada6287a8b28dccf1ecf13d376f5a08e2657"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 8ab9680a1bd5eb8fe7a7dcc44897af7ee41e56e7
WARNING: Command 'git rebase 8ab9680a1bd5eb8fe7a7dcc44897af7ee41e56e7' failed:
Auto-merging src/architecture.h
CONFLICT (content): Merge conflict in src/architecture.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-libc-musl onto 8ab9680a1bd5eb8fe7a7dcc44897af7ee41e56e7
WARNING: Command 'git rebase 8ab9680a1bd5eb8fe7a7dcc44897af7ee41e56e7' failed:
Auto-merging src/architecture.h
CONFLICT (content): Merge conflict in src/architecture.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/systemd-bootchart
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemd-bootchart/systemd-bootchart_235.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8944208462162893399==--

