Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5680CA0FE8
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:14 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.88802.1754057268084825453
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=iemnKRjh;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=UU2O5Lgf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019865f61963-f2ec6f40-6409-4609-b94d-b7a8f02a8faa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057284;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MxhpWXBZPXxVIhe0Tkzuex7LE241UhQgWfhlT5Pc9/8=;
	b=iemnKRjhMykafcTsbmivdlZeocRYcvQf0pXP1fALI2iobslsNz5L9YqcnjRYjMB/
	L3fNdzYEMSWE+XMTrTcaZ3q2kxx87s1v2Hp0RmSZNO+XvPuhAJeQeUt5sIY2Sh3B+1T
	2jocURqSvE1EbtPJw1vNFM8D4PhgjRp0OCOQw1Ww=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057284;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MxhpWXBZPXxVIhe0Tkzuex7LE241UhQgWfhlT5Pc9/8=;
	b=UU2O5LgfRn68M4JH/1rWDFxBvE/4/Lob1DJRYU0gp/VOMkNnUi+U7a4gQ8/P54tv
	n92YGe0eQUwdoS4y8vHQJBHsKg+ngKBHG0oPam8b5qSe/nZvPm+qObKIXSY+MD/aVSg
	R0pzGCqz9aCGiPgvfzO4H13iG8ws0CsJlIszXirk=
Content-Type: multipart/mixed; boundary="===============5448179866221054664=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 fb5c2f323a5e15880a21a18497110cfae5c301d3 FAILED
Message-ID: <0101019865f61963-f2ec6f40-6409-4609-b94d-b7a8f02a8faa-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:08:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221316

--===============5448179866221054664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *fb5c2f323a5e15880a21a18497110cfae5c301d3* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S fb5c2f323a5e15880a21a18497110cfae5c301d3
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
DISTRO_VERSION       = "5.2.99+snapshot-94ca4ff153ee90808fed9cc181f1c9d096c3998e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:94ca4ff153ee90808fed9cc181f1c9d096c3998e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto fb5c2f323a5e15880a21a18497110cfae5c301d3
WARNING: Command 'git rebase fb5c2f323a5e15880a21a18497110cfae5c301d3' failed:
CONFLICT (modify/delete): third_party/glslang deleted in HEAD and modified in 4e28ce4 (Add changes from do_patch).  Version 4e28ce4 (Add changes from do_patch) of third_party/glslang left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
third_party/glslang: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5448179866221054664==--

