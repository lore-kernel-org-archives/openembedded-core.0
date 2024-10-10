Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D104CFD35E
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:18 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.53349.1728588940440488457
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=XBIED6kR;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Y3fJp6VO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019277ee69f1-2b66810b-e56b-44fc-8b43-236a3527a924-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FipLOZwU4D7iZyUkir5FgSlnHPd5GzjKqIzWSWT9xuM=;
	b=XBIED6kR0S9FZpV7Dgtr/0/rtL1ZdDp1pCzhAz92a9CF+iZnMajWykYhQYyMecD8
	mSuPor56XBV+vwkSXJMzJrEalq8SjooOfwtQyEE1XIWe2k9EgZgCWcDAkl2c+dDOl9d
	4csYXqTmulzm7XwjXcLry+TkQOKMpMpU5rWK3zpA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FipLOZwU4D7iZyUkir5FgSlnHPd5GzjKqIzWSWT9xuM=;
	b=Y3fJp6VORN6pwSEHrBfH3m1Gp+CALemjPKpv3KlIjMOGcq3TtZXC0XpSuiiy5bmW
	AOZi+YQd5b/8R9WgHdN47S0UQhI5niIG5fCEXp5uzUIDtyMvSDBqGfRWsWw76xlf/CD
	48NGuOVxHycP3JxHvmp/PTLqKR1jrXzqhon5GWNo=
Content-Type: multipart/mixed; boundary="===============4302391676879687828=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 1a5e218e545549299aaf35cae608b33838e220d7 FAILED
Message-ID: <0101019277ee69f1-2b66810b-e56b-44fc-8b43-236a3527a924-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205512

--===============4302391676879687828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-helloworld* to *1a5e218e545549299aaf35cae608b33838e220d7* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S 1a5e218e545549299aaf35cae608b33838e220d7
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1871 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:3565fc31c580ef1367fb252d5734984e6479c89d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 1a5e218e545549299aaf35cae608b33838e220d7' failed with exit code 128:
fatal: reference is not a tree: 1a5e218e545549299aaf35cae608b33838e220d7



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4302391676879687828==--

