Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24967C04A6A
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:28 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.826.1686887483423077411
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KQMxH8Kx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010188c2544bc7-d83dbe2d-8290-4dd8-b2bd-3ba94dfe2f07-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887484;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jQBQlqXltigfwDQjlL2MOcz+V34VYbhnaB16slfcsmU=;
	b=KQMxH8KxDA/o/OmSHpsWLj6QNXIF3v1tA1KNS+5lT7l+LrIEPyDNSE3J1H6RnFKK
	WlduA/i0+m84+rcjdqGbukXRxXjui9+M1xic2TnmmtpJJvobFeo/Ck298qrpjfblplW
	2aRX9JRBcTpfytFezrTv94LT1GkjUrI9sB0cbHGo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887484;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jQBQlqXltigfwDQjlL2MOcz+V34VYbhnaB16slfcsmU=;
	b=MC0P1VKLEfkKtdVBiIrVF0wnsnsfEn4OaTr7gvSDU+Dfq1U+aj117dzjo0ufKfPl
	DjmWETk9hNDsn39QLOjG/ZMupKCBRhkq+a+jx7CvXmd52pYr8kNQGaC0GcWkCQnXRvb
	aIjr1NoYi3GwtAok/xJHlLWtyrgV/ZDVoDK+j0Mk=
Content-Type: multipart/mixed; boundary="===============4320506248418439989=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-loader: upgrading to 1.3.250.0 FAILED
Message-ID: <01010188c2544bc7-d83dbe2d-8290-4dd8-b2bd-3ba94dfe2f07-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182964

--===============4320506248418439989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-loader* to *1.3.250.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-loader -V 1.3.250.0 -S f372068d09fc13bcf54b8c81274f37aa5f46aea3
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (21:02:18.018201)
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1802 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:612c76e3707abcd470fc607ffc5f687b93f941f3"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision f372068d09fc13bcf54b8c81274f37aa5f46aea3 was found on multiple branches: 
  sdk-1.3.250
  stabilized_release_2023_05
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4320506248418439989==--

