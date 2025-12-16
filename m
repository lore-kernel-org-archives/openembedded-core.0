Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E92D5C0E6
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:26 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17185.1765872136819420817
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=qsejxgQH;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=cgmEbKMh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019b262e72ca-3d34b031-47a6-43b4-8fbb-43e41427f25a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872137;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kEFUb3Li1GxqEAL4ag0vYSKrupyXvvENIkhkU6RK+NI=;
	b=qsejxgQHIZHEt6CTWxzd3ik7IVOfK+6TlWgJOGcofPd8HTpw8K03qUIAsBFBgOS0
	ekF2/qH4rnHKRKdQbgGk5kAicPkfm1o58Zj/Nt94owZzml/Y1sPoH3VIsT3B9iqu6tD
	qV/a3fw0RJ4SIMCR5YYOmvNzbWAUAvu/GOZf1rDo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872137;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kEFUb3Li1GxqEAL4ag0vYSKrupyXvvENIkhkU6RK+NI=;
	b=cgmEbKMhXpEbwFIQNjk/jxT7aqouHORBHXhwFdIRHE1/wOK0uKYvnqkhulS8SnbS
	LWRE1X066G1uKTNJp7iAWFy1QzZ3BQ4YR0bR5u1etgRV5ljZtKnSzJ7kPqed6Th82CI
	bBqMgvBbevj9gjQIGgOKGSPR9jwul2Nbq3ekPDpU=
Content-Type: multipart/mixed; boundary="===============2066782511862255122=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] perlcross: upgrading to 1.6.3 FAILED
Message-ID: <0101019b262e72ca-3d34b031-47a6-43b4-8fbb-43e41427f25a-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227788

--===============2066782511862255122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *perlcross* to *1.6.3* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade perlcross -V 1.6.3
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1950 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-524299e7604f39f21f5c61da35fc5c6893fd7a67"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:524299e7604f39f21f5c61da35fc5c6893fd7a67"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/devtool", line 352, in <module>
    ret = main()
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/devtool", line 338, in main
    ret = args.func(args, config, basepath, workspace)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/upgrade.py", line 605, in upgrade
    old_licenses = _extract_licenses(srctree_s, (rd.getVar('LIC_FILES_CHKSUM') or ""))
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/upgrade.py", line 509, in _extract_licenses
    with open(os.path.join(srcpath, path), 'rb') as f:
         ~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/perlcross/1.6.2/sources/README.md'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2066782511862255122==--

