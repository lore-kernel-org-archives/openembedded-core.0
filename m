Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32144C5DF67
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:28:51 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2594.1787030923104669083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JWb9gf3s;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=zsMmK39e;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a01357e1a9-a65fd52e-5cc7-4345-a13b-ec5b1c9b3c44-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787030922;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=qOL0QHg5iarRD6+RUIiaTSqtfHFAePP6bY3BnY/hooM=;
	b=JWb9gf3splosxx6b1Rg1muRqO9kweZCxg2sgV/seieJMgG/ob+UD2obR6+kGX51c
	dj/ut1eI2nlQy5Kpd9/AYlvS0euONWmQ0B32Nh1ygnfmufhGJ2Q4lZWhLGWA3AikkzA
	ADMld/aLQZAFHy5hlGKcK+3oDc1vY4bbBIOzvNkY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787030922;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=qOL0QHg5iarRD6+RUIiaTSqtfHFAePP6bY3BnY/hooM=;
	b=zsMmK39eRYLzO/pra1ysnJ7caxU0zjEyroDurjOCTquuk6SzpjHPtgsuKBbGuaVn
	kkmCt0PH3pWE+uo3Bmrww66PBJaXrR14QYNmjTKStFVqti/b7P27e26nvGHlHccu+3U
	WK/AzpmpVukhzRWImJ7qTdoxWiZ6BIgR/rM1m5mU=
Content-Type: multipart/mixed; boundary="===============5869645831786804063=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] perlcross: upgrading to 1.6.5 FAILED
Message-ID: <010101a01357e1a9-a65fd52e-5cc7-4345-a13b-ec5b1c9b3c44-000000@us-west-2.amazonses.com>
Date: Tue, 18 Aug 2026 05:28:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.18-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 05:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243644

--===============5869645831786804063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *perlcross* to *1.6.5* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade perlcross -V 1.6.5
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 955 .bb files complete (0 cached, 955 parsed). 1984 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-765c28871034b1bb9720d0a5aabffb957b3c2f64"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:765c28871034b1bb9720d0a5aabffb957b3c2f64"
meta-yocto-bsp       
meta-poky            = "master:30756f716a1f527a74a9e12bad8f6e0e756ed9a4"
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
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/upgrade.py", line 798, in upgrade
    old_licenses = _extract_licenses(srctree_s, (rd.getVar('LIC_FILES_CHKSUM') or ""))
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/upgrade.py", line 535, in _extract_licenses
    with open(os.path.join(srcpath, path), 'rb') as f:
         ~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/perlcross/1.6.4/sources/README.md'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5869645831786804063==--

