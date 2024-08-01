Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3439C52D6F
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:09 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.75487.1722536824370817382
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=HodKMOk6;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=QNYwz6Qb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101910f321e64-7628a601-4624-4f75-a75e-170d4e9c5048-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536828;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oF9736ozH2p/nOstmqIydO2CL6FZMM8upmWzZV0FCXY=;
	b=HodKMOk6zOTa7nNy/RsC09WI7ihMtwv+imywM6LeFP6LQyrOoAKj77Mg1Noux29C
	3YjTSVTT8sJJdyzqCB/pKq/hEfHfVfETCxscwur7z9Vx7uAqeNnSbdiGY9RqZ9MEwZM
	ZFkwokc2UqqNDitdB++NvzcWsE/BHkH4CThodplU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536828;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oF9736ozH2p/nOstmqIydO2CL6FZMM8upmWzZV0FCXY=;
	b=QNYwz6QbrQ6k5PYqhIAzSzrPm3yTKi69Fj54duciSdRPPdaIy8fd4qZKc62Kmeci
	iLzFKBH9Odva3EeGG+ttK0dyqC9+OY98U9z7oiEU7CRAW/4AV0T0xEvqsBtV2dEdnGX
	c+98MfuAiFvCUc39KJWf1sLg0ZXMl07Ae+hdMN6o=
Content-Type: multipart/mixed; boundary="===============2324030188374681562=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinxcontrib-applehelp: upgrading to 2.0.0 FAILED
Message-ID: <010101910f321e64-7628a601-4624-4f75-a75e-170d4e9c5048-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202816

--===============2324030188374681562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-sphinxcontrib-applehelp* to *2.0.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-sphinxcontrib-applehelp -V 2.0.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1883 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-3a44c524fb774bc2ad53ee33d3d7eb5c124f6166"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3a44c524fb774bc2ad53ee33d3d7eb5c124f6166"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1883 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (919 cached, 2 parsed). 1884 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-3a44c524fb774bc2ad53ee33d3d7eb5c124f6166"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3a44c524fb774bc2ad53ee33d3d7eb5c124f6166"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-p4ki70pn: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-lk12ore_/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-lk12ore_/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/s/sphinxcontrib_applehelp/sphinxcontrib_applehelp-2.0.0.tar.gz;downloadfilename=sphinxcontrib_applehelp-2.0.0.tar.gz...
INFO: Rebasing devtool onto 32bfcb8934d2bd63e695a2ca5bf01315cd35ce1f
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/scripts/devtool", line 350, in <module>
    ret = main()
          ^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/scripts/devtool", line 337, in main
    ret = args.func(args, config, basepath, workspace)
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/upgrade.py", line 609, in upgrade
    new_licenses = _extract_licenses(srctree_s, (rd.getVar('LIC_FILES_CHKSUM') or ""))
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/upgrade.py", line 508, in _extract_licenses
    with open(os.path.join(srcpath, path), 'rb') as f:
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: '/home/pokybuild/yocto-worker/auh/build/build/workspace/sources/python3-sphinxcontrib-applehelp/LICENSE'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2324030188374681562==--

