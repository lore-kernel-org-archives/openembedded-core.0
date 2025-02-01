Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE2AC0219A
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:20:49 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.42625.1738416048125297131
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=dnivDFhI;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=LjT+sesm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010194c1abc553-9524a82d-8b25-4aaf-8977-87a623cb386f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416047;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=93w8w/4NguxziepizU3vwwqPw/xAaUkgq3c6cefT5nI=;
	b=dnivDFhIjvNBy06VBq5pNCW57fVPFBvJDs7WegUg+zTs6g/pThnUdvIWKZLjy5J8
	hOJee0aAdGTo4hopK8XSiKW+RpehyUbmuEhzkWQNR+NBVdQ4/P42ij4q5IJeeDAbt9K
	q/oAAdDE/CtkDxn91Imw8XnWwhxUgqrF/QQjwQ+w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416047;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=93w8w/4NguxziepizU3vwwqPw/xAaUkgq3c6cefT5nI=;
	b=LjT+sesmRyS34XrZ8qPU5qAYdPsq17Qo9EDdmoS9re0ZC0GMtvj1cg2A7pe41Tza
	uiAWeC5k6kD3dOyMzYq9GDFDYIxVN8Hkce99fnbeM3/yIWjw940fAdJSCRf+/l+k27Q
	+3u+PQlgyEJzwskfv9hSTOVIgXArdvYyU2jwX7uE=
Content-Type: multipart/mixed; boundary="===============8896676107349076861=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libuv: upgrading to 1.50.0 FAILED
Message-ID: <01010194c1abc553-9524a82d-8b25-4aaf-8977-87a623cb386f-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210518

--===============8896676107349076861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libuv* to *1.50.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libuv -V 1.50.0 -S 8fb9cb919489a48880680a56efecff6a7dfb4504
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1874 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:4db68d4ea5818217a4de275d349717369d592cfd"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision 8fb9cb919489a48880680a56efecff6a7dfb4504 was found on multiple branches: 
  uv-fileno-type
  v1.x
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8896676107349076861==--

