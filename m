Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E23A5C83035
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:57 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.27779.1748786133860078651
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=zkWk/ADN;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=gJ0ucrdt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101972bc6f2eb-1e285630-5917-4ee0-af25-4bda9dee4002-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3sPJGHHpdZO7SsPx3Acb73UC7XIxkAIWacW+h1TDlsw=;
	b=zkWk/ADNP3nMR7AVR22v2FKEk4XPNxFK2Por82hYq61JmysZEEKdwe366zIXasG+
	e7DI0VJCp7qYt+FgDGAM1/9j0ndngbPCDG0NOXB/wP5R1y2bHtfpv+u+Z8gd+HnUELv
	rKOmo7seBMuyNg/R3BjiqxYg5VmgUpBr4vG4fzK0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3sPJGHHpdZO7SsPx3Acb73UC7XIxkAIWacW+h1TDlsw=;
	b=gJ0ucrdtHjfBuzKwGMi8oLjhnfbop75Nez08EHNNs9uYvWOVfIk34B7dNqaEV9GJ
	ejPps3JsvLXV51H6Ab1oY3qHkEsISfG1fd/ega4hF+9V3R2B3e5WRU1dajmh7JZinET
	gKJyzBoIFp/1QMqvB3WO+9OUMJhUSocRzuNBFCT0=
Content-Type: multipart/mixed; boundary="===============1548082250726166496=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-llvm-translator: upgrading to 20.1.3 FAILED
Message-ID: <010101972bc6f2eb-1e285630-5917-4ee0-af25-4bda9dee4002-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217647

--===============1548082250726166496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-llvm-translator* to *20.1.3* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade spirv-llvm-translator -V 20.1.3 -S 834db1a1985ac36d5a3e1b4b34dc1ca3f919ad5b
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1915 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:2335f97de080ac4c76770c4084ac0fa047cad70b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision 834db1a1985ac36d5a3e1b4b34dc1ca3f919ad5b was found on multiple branches: 
  backport/pr-3104-to-llvm_release_200
  backport/pr-3190-to-llvm_release_200
  llvm_release_200
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1548082250726166496==--

