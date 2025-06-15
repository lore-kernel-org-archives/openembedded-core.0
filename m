Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40A7C83032
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:14:53 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.8859.1749993278910107075
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TAjVSWDm;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=J9hs9fvr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019773ba865c-1f51a03c-3123-44b9-9761-b62eedf0e45d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993293;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7CaKOL0X+qulno+c3cdZ8QpLW9i34DFrrQCgD1SnuCY=;
	b=TAjVSWDmG0Ce6fPy7Yw9k8+toeYsDBE54EG7JK2U7es7uKjjo8HWEWWgcY739rtF
	3dsUBRb6FBgjfHQaPXROQDiRT/44Z6m5WOAkVBVa8w9SThWzM6Wwaq4L5VmCCv/vcEY
	jf9/4HfAgM1Bj/ULUjXetDvZ178pk+0uLWHalHrQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993293;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7CaKOL0X+qulno+c3cdZ8QpLW9i34DFrrQCgD1SnuCY=;
	b=J9hs9fvrINr8MgObFed+4Eq/MZsyf7OYOgLX/TNTnCIG9RtNgMaiAUmwpwdWYcpL
	j7wpSfGy1WCXbkbWMLIuVzsVfEB1A4cOWjFVXvjbK4yvbiESP18hkll9GC7uN+/UP+7
	OlN4OmcX/baNSmePiVzU6N0ksGota56VVmtZ9PFU=
Content-Type: multipart/mixed; boundary="===============7442165869169814031=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?b?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm-sequoia: upgrading to 1.8.0 FAILED
Message-ID: <0101019773ba865c-1f51a03c-3123-44b9-9761-b62eedf0e45d-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218701

--===============7442165869169814031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpm-sequoia* to *1.8.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade rpm-sequoia -V 1.8.0 -S 29545a41b24cb09e37aa85722a333e0924166d13
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1910 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:1984077960486a64656d6f7bea938ddbd6cb107f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 29545a41b24cb09e37aa85722a333e0924166d13' failed with exit code 128:
fatal: unable to read tree (29545a41b24cb09e37aa85722a333e0924166d13)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7442165869169814031==--

