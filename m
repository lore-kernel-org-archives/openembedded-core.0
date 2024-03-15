Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187AFC54F20
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:16 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.1273.1710522012186640340
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OGb5wGWE;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=sl9Zv47U;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018e430e98c7-dae32930-e8fd-4839-a036-e2c6c674da80-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522014;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jZe/kWEX/9agnfBq32N/xNDo7pmWcUArs9AAFHCM/To=;
	b=OGb5wGWENCUexOEEG4NqXQu/GkqnJ9rq7U08FY76xXwg7ZXUTyvpoLrmokhmy06G
	vy4l+6JPjWdrkiv16v3UqVY1qZgQuOgQRZnRYM0vz1jhK96dhyQzNvCpehtlESh6hTr
	1yVJxoYQq7RVXgl15rSvfnH5lufDSdwqlA8IWwnU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522014;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jZe/kWEX/9agnfBq32N/xNDo7pmWcUArs9AAFHCM/To=;
	b=sl9Zv47U3wFdsD3Jr7ltr5D31T2ndCtsYqfMqP0AYs6xuh2eu3qq4GPxyugPA9yt
	/cKbx9RwGBkSr8LlCdfGhUUHF/hz3tkC+EUJY0t/sjzC7THuBzngLKpG5QwLMpqjv1M
	6Hx5k6mqoZi22qVHN1POYPmZonMkf0quR9htKgjU=
Content-Type: multipart/mixed; boundary="===============8413826942443754191=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva-utils: upgrading to 2.21.0 FAILED
Message-ID: <0101018e430e98c7-dae32930-e8fd-4839-a036-e2c6c674da80-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197215

--===============8413826942443754191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva-utils* to *2.21.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libva-utils -V 2.21.0 -S c46adc8dff6120cbba3f03781e4d6df054dd8f21
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-ee36658a486e9cf2c453ed45fe3be12c7cbfb5ce"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ee36658a486e9cf2c453ed45fe3be12c7cbfb5ce"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout c46adc8dff6120cbba3f03781e4d6df054dd8f21' failed with exit code 128:
fatal: reference is not a tree: c46adc8dff6120cbba3f03781e4d6df054dd8f21



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8413826942443754191==--

