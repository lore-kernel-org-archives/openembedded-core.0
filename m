Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 886CFC7EE2F
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.30351.1675272853861999610
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=U0a33t+p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101860e0b1619-b2bf59e0-46c7-44d6-8d38-b05e4fcbc3b6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ljMsOgXGh3h+KgHJ2pHz03AGuTeGKdggOnp5Q3DwnN4=;
	b=U0a33t+p36Za2iWrJBTO2V+y8ixBpnccOcK7ttPg66BsI41fNTd4Xx4dIYCnaIh3
	ho3c3voTCg+H65fooggIOUqA5cpoo5V8b0XTtdaNl1aJlzpHaPhH8VjgTyPA/m7SQsr
	GPJDPmZZ7DkX6ZqHE2O6uJEObbRenJDEXa91xdGg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ljMsOgXGh3h+KgHJ2pHz03AGuTeGKdggOnp5Q3DwnN4=;
	b=G/6cAQy105f6mpHZTa53lg8xDA9NTsbqaE+WsPrEscfKxFhFHNFOkf5yLM4rYCi0
	vXXSPlrkk1vY0da3ofmDBNt7LVAkLQq/Sa3eDjFcYQxEIyfFy/Symx6BQGy6anesXYk
	kK/bdL4+PdlfSRolANqZxLUQ0Zeins83fg4uN20I=
Content-Type: multipart/mixed; boundary="===============1239026505969821569=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Lukasz Majewski <lukma@denx.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glibc-tests: upgrading to 2.37 FAILED
Message-ID: <010101860e0b1619-b2bf59e0-46c7-44d6-8d38-b05e4fcbc3b6-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176573

--===============1239026505969821569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glibc-tests* to *2.37* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade glibc-tests -V 2.37 -S 2412deae1af0ca37b096ff73517486e7d1e9fe46
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry... (07:05:13.987939)
NOTE: Directory listing: ['upgrade-helper', 'bitbake-cookerdaemon.log', 'buildhistory', 'conf', 'tmp', 'downloads', 'cache', 'sstate-cache', 'workspace']
NOTE: Retrying server connection (#1)... (07:05:14.118698)
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1697 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a3654d799019e8817e72da09d14ae699331dc7c4"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 2412deae1af0ca37b096ff73517486e7d1e9fe46
WARNING: Command 'git rebase 2412deae1af0ca37b096ff73517486e7d1e9fe46' failed:
Auto-merging NEWS
CONFLICT (content): Merge conflict in NEWS
Auto-merging dlfcn/dlopen.c

You will need to resolve conflicts in order to complete the upgrade.
ERROR: Could not decode SRC_URI: The URL: '${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc' is invalid and cannot be interpreted


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1239026505969821569==--

