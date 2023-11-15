Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABE7C5AD4B
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:16 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.14628.1700059030659166669
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PvFXDX9b;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=U5TWw1Z9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018bd36a2e78-f017bcd9-a40c-449e-b100-452d3232d4e1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059033;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VryKQiTNo/CRYGA49jheqkvSqETGUyYN0ekfgz5gZ4o=;
	b=PvFXDX9b9XYFhwlA35Vf51gkVMjAmwXgjCjb9NnnNldLhSN4gqFIkvZ9hDGlboWQ
	XHnkoA08AwFMXhV1GIEs59WyotakCtPYZv+/vbu5Sz9GWUg2Rtz31cDDnwOo0lB3Ci9
	KJNJEovvi8bDZMFgLIaDn1ihK2JIetw19ogiRnxQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059033;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VryKQiTNo/CRYGA49jheqkvSqETGUyYN0ekfgz5gZ4o=;
	b=U5TWw1Z9n0R+p3g+g9SpeauyuDyWd1eGIHAL5+FQ/2R3HQWSSXJKeQx19i6QTiDV
	L8Rzdyc4MQnySLyW9RxaoZLYY0ywUumRs+PmLb1WLNcm1sxcq0uz7Y4n2zImaMH24p0
	xDOCfFlsSLsBqMWTs7ADqSEEFYOOvdojU/8kJdgY=
Content-Type: multipart/mixed; boundary="===============3726732276058954198=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] appstream: upgrading to 1.0.0 FAILED
Message-ID: <0101018bd36a2e78-f017bcd9-a40c-449e-b100-452d3232d4e1-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190711

--===============3726732276058954198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *appstream* to *1.0.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe appstream failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1844 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-63242cf131ca92baa6ec13012e3ced256641574c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:63242cf131ca92baa6ec13012e3ced256641574c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 5 Local 5 Mirrors 0 Missed 0 Current 28 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1844 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (910 cached, 2 parsed). 1844 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-63242cf131ca92baa6ec13012e3ced256641574c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:63242cf131ca92baa6ec13012e3ced256641574c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 6 Local 5 Mirrors 0 Missed 1 Current 22 (83% match, 96% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  25% |#########                           | ETA:  0:00:00
Adding changed files:  50% |##################                  | ETA:  0:00:00
Adding changed files:  75% |###########################         | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.freedesktop.org/software/appstream/releases/AppStream-1.0.0.tar.xz...
INFO: Rebasing devtool onto 40cd58cf9cc28411bb1f62efb10e38933c44c940
WARNING: Command 'git rebase 40cd58cf9cc28411bb1f62efb10e38933c44c940' failed:
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/appstream
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/appstream/appstream_1.0.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3726732276058954198==--

