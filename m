Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C0FD62075
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:53 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.4685.1731964639947400615
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ZTHrZkrV;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=LEdiqsgV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010193412381ca-76a0e859-c6a6-400d-adc9-b936c8ad8fce-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964666;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aQIhEaT9WuIZRN0KbZS6lYCzjT+Dzcvxb5m/29Kmrhw=;
	b=ZTHrZkrVWzEBjqDBwlwGotlvx3G0yowuPo5L32ZbJ7vo3k/QjjTH/C3fUZI8DCHY
	peSQvhIJfCWV1kXI2U/WuHz8kbMmal91eTgJs75yAzRKCG9dOyp46cb9TZrHaDrrWZr
	ui3LoRJAr1ED4/XdD+kr+LSdvwqYHgXUAbcW1two=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964666;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aQIhEaT9WuIZRN0KbZS6lYCzjT+Dzcvxb5m/29Kmrhw=;
	b=LEdiqsgVv1Fd8gs6PvHJWo1ibtwjOa18eS8DORZA5kELAAfN4VATUZnQ8CQ4tPIs
	yq4ffqeqr+/m2uY2+Q5X8c+lu0c5f1Sai730+5VobTwWrFg5t6/OUJxal3f4E9CB16M
	ADqkQo6LArccqYCpqHTYRQOjHRzvden7/CAmDufk=
Content-Type: multipart/mixed; boundary="===============7795357459688220979=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-loader: upgrading to 1.3.296.0 FAILED
Message-ID: <01010193412381ca-76a0e859-c6a6-400d-adc9-b936c8ad8fce-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207332

--===============7795357459688220979==
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
Loaded 1880 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:04a9c81f4bd7c92d4607e17820ad6dcb6fa16b14"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 11 seconds

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
--===============7795357459688220979==--

