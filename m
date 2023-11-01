Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3649C05020
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:11 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.8675.1698848706738204608
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NkwKPXQ3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=YGT0Imwa;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.192, mailfrom: 0101018b8b460e19-a2f8b5b4-4069-409c-ad9f-caad8e42b907-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4IkFmpeojNYosL+T9Hm3GOAY26p5Cn4JIyzsmB8lvsA=;
	b=NkwKPXQ3sfTSpE0oLgS5pom8G+3fEjuAYRmDFJecxsdeSJbI/gzXIglxL8WSTjNk
	NtNPh9Nzjr5r/KR4It5X2Yb8mIFQjXxK+g5ubYsO7DaNSU5zb+ViZBN0tmelj4iCB03
	8MLMwOxryIz/y38XwzIX36VbrE0dCnsidkGpsISA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4IkFmpeojNYosL+T9Hm3GOAY26p5Cn4JIyzsmB8lvsA=;
	b=YGT0Imwa7zRtoE2VmcEixgWTHZyYCpCYvQPC8ypOshnyv/yaJreZseq+cBWCQ8YT
	lF/XgCbj/l664Og27TDxlRO4ZRnFD/hc++fLQhMfEk3qwjtnotjxUiKW/XWTubw8KlR
	QacmImTl6JSC6/3mE3A2qlF3zocqF3F3stp7r3c4=
Content-Type: multipart/mixed; boundary="===============0492066423215592848=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rt-tests: upgrading to 2.6 FAILED
Message-ID: <0101018b8b460e19-a2f8b5b4-4069-409c-ad9f-caad8e42b907-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190027

--===============0492066423215592848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rt-tests* to *2.6* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rt-tests failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry... (13:51:55.177431)
NOTE: Directory listing: ['conf', 'cache', 'downloads', 'upgrade-helper', 'buildhistory', 'tmp', 'sstate-cache', 'workspace', 'bitbake-cookerdaemon.log']
NOTE: Retrying server connection (#1)... (13:51:55.418722)
Loading cache...done.
Loaded 1842 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-b3862316b2c765c98d314f76489b6734da7f9dc8"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b3862316b2c765c98d314f76489b6734da7f9dc8"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 28 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 217cd8518c5f7777d490892aa9c765a6b2782cb5
WARNING: Command 'git rebase 217cd8518c5f7777d490892aa9c765a6b2782cb5' failed:
Auto-merging Makefile
CONFLICT (content): Merge conflict in Makefile

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/rt-tests
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/rt-tests/rt-tests_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0492066423215592848==--

