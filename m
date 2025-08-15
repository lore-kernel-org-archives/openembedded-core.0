Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DBACA100C
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:25 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.11327.1755263222007256629
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=0XJIX3la;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=EeDJppLj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010198add79643-c199241f-e08f-4f85-83d7-7c390dbf7760-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263243;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FIoPeVkuizti2lHIXWAXZNjTzSv6P5g7sd5eUHALyUA=;
	b=0XJIX3lahib0jcQ3RZRJ/PpLpxqkwgAiS0jmI6XN9Qdwx9RI+kQKlgqAo+4wx6Wf
	JaqoEfcNdTMoyX4tyyVXl9YcPinZjmHA35zdQhmVYvvDRVYE32+WmB9FimHbjoeS4zQ
	X3Ie3GZWLphZe2ZBuHvDQIfIlYNf4QbWKcv95bOA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263243;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FIoPeVkuizti2lHIXWAXZNjTzSv6P5g7sd5eUHALyUA=;
	b=EeDJppLjNknyCKEs4osGIRaIWbMmxGQ/8n6TsFapeEFp/WONQnfe+IJLcLUADhBq
	Y8HQZfa/BH1cj2WbOlEf1NPp4VHdS+eL2c5O7IdUXioXm2saesmC2gTucH0iPOgN8QC
	EvqY2aZQYnwvikZ2igMRjkSWMe3mgvV9dNv/N35E=
Content-Type: multipart/mixed; boundary="===============4209710452079961905=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vte: upgrading to 0.80.3 FAILED
Message-ID: <01010198add79643-c199241f-e08f-4f85-83d7-7c390dbf7760-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221969

--===============4209710452079961905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vte* to *0.80.3* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe vte failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1941 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-c4d157c5a0a7aeaa7e4cd871101bc88c48f725b0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c4d157c5a0a7aeaa7e4cd871101bc88c48f725b0"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 8 Local 8 Mirrors 0 Missed 0 Current 25 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 945 .bb files complete (0 cached, 945 parsed). 1942 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-c4d157c5a0a7aeaa7e4cd871101bc88c48f725b0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c4d157c5a0a7aeaa7e4cd871101bc88c48f725b0"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 9 Local 8 Mirrors 0 Missed 1 Current 19 (88% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//vte/0.80/vte-0.80.3.tar.xz;name=archive...
INFO: Rebasing devtool onto 34b8e921f47709dfca8623bbba1b5b2b67e6d7c8
WARNING: Command 'git rebase 34b8e921f47709dfca8623bbba1b5b2b67e6d7c8' failed:
Auto-merging README.md
CONFLICT (content): Merge conflict in README.md

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/vte
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/vte/vte_0.80.3.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4209710452079961905==--

