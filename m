Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA4ECFD31E
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:53 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.53350.1728588940637321485
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Sy5clGCc;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=PhxhhHmO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019277eefa3e-6868690e-e36e-4907-b8d2-2c390ab84096-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728589003;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=flmyUuEoV+1AWsrUL6FDJqGR99aP33TAATiO9a1Tkgs=;
	b=Sy5clGCcCFedSp2si7Q5WcKJL1N36FcvjqkdCK8Plbfd4c7ZGuwOd09nUHFPIPv9
	mdT4hN/Ye+nSUJOt5NyskqqrdR4q69HOCveDFnsIxTXhCM2IT5eOvZwymKOQVajU0dj
	4AVOlXxuFXa3MqBIKjP/vJqPQlvLciLUM0VqFlvI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728589003;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=flmyUuEoV+1AWsrUL6FDJqGR99aP33TAATiO9a1Tkgs=;
	b=PhxhhHmOSVvSjjZq7qAPMUjkU3fwknI4syQLbHDOCCoIXrGK/NqYv+IQ8CkHwnOX
	afAvwI9D24wZxR035zn9Si+ZWarTXqwUf0t4QpaoRF+F7IPgchAy73JpTIFN7moW9/a
	4M803sK2lc4I0s2MwPuECFbYD3aAoQLmYMkRETU8=
Content-Type: multipart/mixed; boundary="===============5134728554728630501=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-loader: upgrading to 1.3.296.0 FAILED
Message-ID: <0101019277eefa3e-6868690e-e36e-4907-b8d2-2c390ab84096-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205632

--===============5134728554728630501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-loader* to *1.3.296.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-loader -V 1.3.296.0 -S 7aeb5e4324957b6f60dac5c8cedb955df4fecbfb
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
workspace            = "tmp-auh-upgrades:792e087aeac91aef65fdae922819225f8e5fdc6e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision 7aeb5e4324957b6f60dac5c8cedb955df4fecbfb was found on multiple branches: 
  stabilized_release_2024_09
  vulkan-sdk-1.3.296
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5134728554728630501==--

