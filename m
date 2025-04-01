Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4510C369CC
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:24 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.18061.1743511402834266144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=c9sx4giF;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=X458QOf1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010195f160ba95-c8e535ff-a202-4cec-932b-ae3bbb0fbf2c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511403;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4OKQfVORFG8xnWA+Op4eIRLP2kq8Qi3KWQNVvNlE62w=;
	b=c9sx4giFWvuMyZROhupia7gDKYeEW+femZhvXbXPieDOrWUxLRBM+5egYfWvgSPF
	M/pJmmy86r3rQu36QjpjDgAcHigb7HofI4YWMeqT4pRMWcbOYNlzg2X38dYT0FvkvDZ
	FhY1xSDWRLT4NFU0x+VjtjVjIqH9pWHlmdjbJ0oA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511403;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4OKQfVORFG8xnWA+Op4eIRLP2kq8Qi3KWQNVvNlE62w=;
	b=X458QOf1hUWo9kLNi4FAk8kqLAae4i+9NiqPO6547b5pLuaFz7K4PSpWCCDaD1dD
	pN2ePK9Jb5+dxHHuj7O2m+Vp97R/r5AqEWCVgs6cb/UynB9ky67coa/wLPwiqYlvkwj
	KdLTVi7k/JFjVb81KHSX83vTa0tKCO1vkd7vFABo=
Content-Type: multipart/mixed; boundary="===============2977033447218903081=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 398e112173f492ddf8d48c8b76ea9965a21fa308 FAILED
Message-ID: <01010195f160ba95-c8e535ff-a202-4cec-932b-ae3bbb0fbf2c-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214085

--===============2977033447218903081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-helloworld* to *398e112173f492ddf8d48c8b76ea9965a21fa308* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S 398e112173f492ddf8d48c8b76ea9965a21fa308
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1886 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:5c26c9a756bff622574b6c6b979142857f4d7afb"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 398e112173f492ddf8d48c8b76ea9965a21fa308' failed with exit code 128:
fatal: unable to read tree (398e112173f492ddf8d48c8b76ea9965a21fa308)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2977033447218903081==--

